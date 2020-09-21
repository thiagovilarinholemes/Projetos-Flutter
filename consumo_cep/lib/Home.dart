import 'package:flutter/material.dart';
import 'package:http/http.dart' as http; // renomeando a biblioteca
import 'dart:convert';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  
  String _resultado = "Resultado";
  String cep = "";
  TextEditingController _cepController = TextEditingController();

  _recuperarCep() async{ // "async" de comunicação assincrona
    
    String cep = _cepController.text;
    String url = "http://viacep.com.br/ws/${cep}/json/";

    http.Response response; // captura a resposta 
    response = await http.get(url); // "await" aguarda a resposta

    Map<String, dynamic> retorno = json.decode(response.body); // convertendo a resposta json para um objeto
    String logradouro = retorno["logradouro"];
    String bairro = retorno["bairro"];
    String uf = retorno["uf"];
    String cidade = retorno["localidade"];
    String unidade = retorno["unidade"];
    String ibge = retorno["ibge"];
    String gia = retorno["gia"];

    setState(() {
      _resultado = "Resultado: Logradouro ${logradouro}, \nBairro: ${bairro}, \nUF: ${uf}, \nCidade: ${cidade}, \nIBGE: ${ibge}.";
    });

    // print("resposta: " + response.statusCode.toString());
    // print("resposta: " + response.body); // o body por padrão é uma string
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Consumo de serviço Web"),
      ),
      body: SingleChildScrollView(
        child: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: "Digite o CEP"
              ),
              // onChanged: (String texto){ // capturando o cep digitado 1) Maneira
              //   setState(() {
              //     cep = texto;
              //   });
              // },
              onSubmitted: (String texto){ // capturando o cep digitado 2) Maneira
                setState(() {
                  cep = texto;
                });
              },
              controller: _cepController,
              ),
            
            RaisedButton(
              child: Text("Click aqui!!!"),
              onPressed: _recuperarCep
            ),
            Text(_resultado)
          ],
        ),
      ),
      )
    );
  }
}