import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  
  String _preco = "0";

  void _recuperaPreco() async{

    String url = "https://blockchain.info/ticker";

    http.Response response= await http.get(url);
    Map<String, dynamic> retorno = json.decode(response.body);
    setState(() {
      _preco = retorno["BRL"]["buy"].toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(32),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset("images/bitcoin.png"),

              Padding(padding: EdgeInsets.all(20),
                child: Text(
                  "R\$ " + _preco,
                  style: TextStyle(
                    fontSize: 35
                  ),
                ),
              ),

              RaisedButton(
                color: Colors.orange[300],
                child: Text(
                  "Atualizar",
                  style: TextStyle(
                    color: Colors.white
                  ),
                ),
                padding: EdgeInsets.fromLTRB(30, 15, 30, 15),
                onPressed: _recuperaPreco,
              )
            ],
          ),
        ),
      ),
    );
  }
}