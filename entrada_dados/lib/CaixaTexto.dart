import 'package:flutter/material.dart';

class CaixaTexto extends StatefulWidget {
  @override
  _CampoTextoState createState() => _CampoTextoState();
}

class _CampoTextoState extends State<CaixaTexto> {

  TextEditingController _textEditingController = TextEditingController(); // captura o texto digitado

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Entrada de dados"),
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(32),
            child: TextField(
              //text, number, emailAddress, datetime
              keyboardType: TextInputType.number, // tipo de texto
              decoration: InputDecoration(
                labelText: "Digite um valor"
              ),
              //enabled: false,
              //maxLength: 2, // limite de caracters
              //maxLengthEnforced: false, // habilita de pode ultrapassar o limite de caracters
              style: TextStyle(
                fontSize: 50,
                color: Colors.green
              ),
              //obscureText: true,
              /*
              onChanged: (String texto){ // captura ao digitar
                print("valor digitado:" +  texto);
              },*/
              onSubmitted: (String texto){ // captura ao precionar o botão
                print("valor digitado:" +  texto);
              },
              controller: _textEditingController, // instanciando o controlador

            ),
          ),
          RaisedButton(
            child: Text("Salvar"),
            color: Colors.lightGreen,
            onPressed: (){
              print("valor digitado:" +  _textEditingController.text ); // imprime no console
            },
          )
        ],
      ),
    );
  }
}
