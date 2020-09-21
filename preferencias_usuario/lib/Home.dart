import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  // Controle do Input 
  TextEditingController _controllerCampo = TextEditingController();
  
  String _textoSalvo = "Nada Salvo!";

  // Metodo para salvar as preferencias
  _salvar() async{

    String valorDigitado = _controllerCampo.text;

    // Cria uma instancia de SharedPreferences 
    final prefs = await SharedPreferences.getInstance();
    // Salva os dados, onde nome é a chave e valorDigitado é o valor que o usuario digitou no input
    await prefs.setString("nome", valorDigitado);
    // print(valorDigitado);
  }

  _recuperar() async{

    // Cria uma instancia de SharedPreferences 
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      // Recupera os dados, onde nome é a chave, caso não haja dados retornará a mensagem "Sem valor salvo!!!"
      _textoSalvo = prefs.getString("nome") ?? "Sem valor salvo!!!";
    });
  }

  _remover() async{
    // Cria uma instancia de SharedPreferences 
    final prefs = await SharedPreferences.getInstance();
    // Remove as preferencias
    prefs.remove("nome");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Manipulação de preferencias")
      ),

      body: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [

            Text(
              _textoSalvo,
              style: TextStyle(
                fontSize: 20
              ),  
            ),

            TextField(
              style: TextStyle(
                color: Colors.blue
              ),
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                labelText: "Digite um valor"
              ),
              controller: _controllerCampo,
            ),

            Row(
              children: [

                RaisedButton( 
                  color: Colors.blue, 
                  textColor: Colors.white, 
                  padding: EdgeInsets.all(15),         
                  onPressed: _salvar, 
                  child: Text("Salvar")
                ),

                FlatButton(   
                  color: Colors.blue, 
                  textColor: Colors.white, 
                  padding: EdgeInsets.all(15),             
                  onPressed: _recuperar, 
                  child: Text("Recuperar")
                ),

                FlatButton(   
                  color: Colors.blue, 
                  textColor: Colors.white, 
                  padding: EdgeInsets.all(15),             
                  onPressed: _remover, 
                  child: Text("Remover")
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}