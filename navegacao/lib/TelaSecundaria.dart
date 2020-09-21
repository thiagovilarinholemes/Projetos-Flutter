import 'package:flutter/material.dart';

class TelaSecundaria extends StatefulWidget {

  // passagem de parametros através do construtor
  String nome;
  TelaSecundaria({this.nome}); // se a variavel for inserida entre {} é opcional

  @override
  _TelaSecundariaState createState() => _TelaSecundariaState();
}

class _TelaSecundariaState extends State<TelaSecundaria> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text("Tela secundaria"),
      ),
      body: Container(
        padding: EdgeInsets.all(32),
        child: Column(
          children: [
            Text("Segunda tela!"),

             RaisedButton( 
              child: Text("Ir para a primeira tela!"),
              padding: EdgeInsets.all(15),
              onPressed: (){
                 Navigator.pop(context, "/");
              },
            ) 
          ],
        ) ,
      ),
    );
  }
}