import 'dart:io';
import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  Map<String, dynamic> _utimoTarefaRemovida = Map();
  List _listaTarefas = [];
  TextEditingController _controllerTarefa = TextEditingController();

  // ** Recupera o caminho do arquivo **
  Future<File> _getFile() async {
    final diretorio = await getApplicationDocumentsDirectory();
    // Recupera o caminho tanto para o IOS quanto para Android
    // diretorio.path

    // File cria um arquivo no diretorio onde dados é o nome do arquivo. caminho/nome_do_arquivo.json
    return File("${diretorio.path}/dados.json");
  }

  // ** Metodo para salvar o arquivo **
  _salvarArquivo() async {
    var arquivo = await _getFile();

    // converte a variavel _listaTarefas em json
    String dados = json.encode(_listaTarefas);
    // escreve no arquivo
    arquivo.writeAsString(dados);
  }

  // ** Metodo para ler o arquivo **
  _lerArquivo() async {
    try {
      final arquivo = await _getFile();
      return arquivo.readAsString();
    } catch (e) {
      print("Error ao abrir arquivo" + e.toString());
      return null;
    }
  }

  // ** Salvar TAREFA **
  _salvarTarefa() {
    String textoDigitado = _controllerTarefa.text;
    // Criar dados
    Map<String, dynamic> tarefa = Map();
    tarefa["titulo"] = textoDigitado;
    tarefa["realizada"] = false;
    setState(() {
      _listaTarefas.add(tarefa);
    });

    // Como ficará o json
    // [
    //   {
    //     titulo: "Banhar",
    //     realizada: false
    //   }
    // ]

    _salvarArquivo();
    _controllerTarefa.text = "";
  }

  @override
  void initState() {
    super.initState();

    // recupera a lista de tarefas
    _lerArquivo().then((dados) {
      setState(() {
        _listaTarefas = json.decode(dados);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.purple, title: Text("Lista de Tarefas")),

      // ** body **
      body: Column(
        children: [
          // ** Expanded **
          Expanded(
            // ** ListView **
            child: ListView.builder(
                itemCount: _listaTarefas.length,
                itemBuilder: criaLista // Insere o Widget criado abaixo
                ),
          )
        ],
      ),

      // // *** FloatingActionButton ***
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          elevation: 10,
          backgroundColor: Colors.purple,
          onPressed: () {
            // ** showDialog **
            showDialog(
                context: context,
                builder: (conter) {
                  return AlertDialog(
                    title: Text("Adicionar tarefa"),
                    content: TextField(
                      controller: _controllerTarefa,
                      decoration:
                          InputDecoration(labelText: "Digite sua tarefa"),
                      onChanged: (text) {},
                    ),
                    actions: [
                      FlatButton(
                        child: Text("Cancelar"),
                        onPressed: () => Navigator.pop(context),
                      ),
                      FlatButton(
                        child: Text("Salvar"),
                        onPressed: () {
                          _salvarTarefa();
                          Navigator.pop(context);
                        },
                      )
                    ],
                  );
                });
          }),
    );
  }

  // Cria o Widget CheckboxListTile para ser inserido acima
  Widget criaLista(context, indice) {

    //final item = _listaTarefas[indice]["titulo"];

    return Dismissible(
        direction: DismissDirection.endToStart,
        background: Container(
          color: Colors.red,
          padding: EdgeInsets.all(16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Icon(
                Icons.delete,
                color: Colors.white,
              )
            ],
          ),
        ),

        // Removendo item da lista
        onDismissed: (direction) {

          //Recupera a ultima tarefa removida
          _utimoTarefaRemovida = _listaTarefas[indice];

          // Remove item
          _listaTarefas.removeAt(indice);
          _salvarArquivo();

          // Snackbar
          final snackbar = SnackBar(
            backgroundColor: Colors.green, // Cor de fundo
            duration: Duration(seconds: 5),
            content: Text("Tarefa removida!"), // conteudo da snackbar
            action: SnackBarAction(
              label: "Desfazer", 
              onPressed: (){

                // Insere novamente item removido
                setState(() {
                  _listaTarefas.insert(indice, _utimoTarefaRemovida);
                });
                _salvarArquivo();

              }
            ),
          );
          Scaffold.of(context).showSnackBar(snackbar);
        },

        key: Key(DateTime.now().millisecondsSinceEpoch.toString()),

        child: CheckboxListTile(
            title: Text(_listaTarefas[indice]['titulo']),
            value: _listaTarefas[indice]['realizada'],
            onChanged: (valorAlterado) {
              setState(() {
                _listaTarefas[indice]['realizada'] = valorAlterado;
                _salvarArquivo();
              });
            }));
  }
}
