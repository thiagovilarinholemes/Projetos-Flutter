import 'package:flutter/material.dart';
import 'CustomSearchDelegate.dart';
import 'telas/Bibliotecas.dart';
import 'telas/EmAlta.dart';
import 'telas/Inicio.dart';
import 'telas/Inscricoes.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  String _pesquisa = "";

  int _indiceAtual = 0; // indice do BottomNavigationBar
  

  @override
  Widget build(BuildContext context) {

    List<Widget> telas = [
      Inicio(_pesquisa),
      EmAlta(),
      Inscricoes(),
      Bibliotecas(),
    ];


    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData( // define a cor dos icones
          color: Colors.grey,
          // opacity: 1 // transparência
        ),
        title: Image.asset( // em title podemos colocar qualquer widget
          "images/youtube.png",
          width: 98,
          height: 22,
        ),
        actions: [ // botões de ações


           IconButton( // botão de ação
            icon: Icon(Icons.search), 
            onPressed: () async{

              //Item de pesquisa, pega o que foi digitado no campo de texto
              String retorno = await showSearch(
                context: context, 
                delegate: CustomSearchDelegate()
              );
              setState(() {
                _pesquisa = retorno;
              });
            }
          ),


          // IconButton( // botão de ação
          //   icon: Icon(Icons.videocam), 
          //   onPressed: (){
          //     print("Video Cam");
          //   }
          // ),
         
          // IconButton( // botão de ação
          //   icon: Icon(Icons.account_circle), 
          //   onPressed: (){
          //     print("Login");
          //   }
          // )
        ],
      ),
      
      body: Container(
        padding: EdgeInsets.all(16),
        child: telas[_indiceAtual],
      ),
      bottomNavigationBar: BottomNavigationBar( // navegação inferior

      // selecionando o item do BottomNavigationBar
      currentIndex: _indiceAtual,
      onTap: (indiceClicado){
        setState(() {
          _indiceAtual = indiceClicado;
        });
      },

      // type: BottomNavigationBarType.shifting, // fixed aplica uma cor de fundo fixa ignorando a cor no icone, shifting aplica a cor na barra
      type: BottomNavigationBarType.fixed, // só pode utilizar um tipo, caso utilize o fixed habilitamos o fixedColor para definir a cor do botão
        fixedColor: Colors.red, // define a cor do icon com BottomNavigationBarType.fixed
        items: [ // lista de botões 
          BottomNavigationBarItem( // botão inferior
            // backgroundColor: Colors.orange,
            title: Text("Início"),
            icon: Icon(Icons.home),
          ),
          BottomNavigationBarItem( // botão inferior
            // backgroundColor: Colors.red,
            title: Text("Em alta"),
            icon: Icon(Icons.whatshot),
          ),
          BottomNavigationBarItem( // botão inferior
            // backgroundColor: Colors.blue,
            title: Text("Inscrições"),
            icon: Icon(Icons.subscriptions),
          ),
          BottomNavigationBarItem( // botão inferior
            // backgroundColor: Colors.green,
            title: Text("Bibliotecas"),
            icon: Icon(Icons.folder),
          ),
        ]), 
    );
  }
}