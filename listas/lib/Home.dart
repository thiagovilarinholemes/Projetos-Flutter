import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  List _itens = [];

  void _carregaItem(){

    for(int i=0; i<=10; i++){
      Map<String, dynamic> item = Map();
      item["titulo"] = "Titulo ${i} do item";
      item["descricao"] = "Descricao ${i} do item";
      _itens.add(item);
    }
  }

  @override
  Widget build(BuildContext context) {

    _carregaItem(); // carrega a função na inicialização
    
    return Scaffold(
      appBar: AppBar(
        title: Text("Listas"),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: ListView.builder( // ListView.build
          itemCount: _itens.length, // número de itens a serem exibidos
          itemBuilder: (context, indice) {

            return ListTile( // itens
              title: Text(_itens[indice]["titulo"]), // titulo 
              subtitle: Text(_itens[indice]["descricao"]), // subtitulo
              onTap: (){ // ao clicar
                // print("Item: ${indice} pressionado"); // mostra no log o intem pressionado
                showDialog( // cria uma caixa de mensagem
                  context: context,
                  builder: (context) {
                    return AlertDialog( // caixa de mensagem
                      title: Text(_itens[indice]["titulo"]),
                      titlePadding: EdgeInsets.all(20), // padding do title
                      titleTextStyle: TextStyle( // Estilo de fonte
                        fontSize: 20,
                        color: Colors.orange 
                      ),
                      content: Text(_itens[indice]["descricao"]),
                      // contentPadding: EdgeInsets.all(10), // padding do content
                      // backgroundColor: Colors.purpleAccent, // cor de fundo
                      actions: [ // Lista de widget
                        FlatButton(
                          onPressed: (){
                            print("Sim");
                            Navigator.pop(context); // fecha o alert
                          }, 
                          child: Text("Sim")
                        ),
                        FlatButton(
                          onPressed: (){
                            print("Não");
                            Navigator.pop(context); // fecha o alert
                          }, 
                          child: Text("Não")
                        )
                      ],
                    );
                  },
                );
              },
              // onLongPress: (){ // segurar pressionado

              // },
            );
          }
        )
      )
    );
  }
}