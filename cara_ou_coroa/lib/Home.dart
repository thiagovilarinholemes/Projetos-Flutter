import 'dart:math';

import 'package:cara_ou_coroa/Resultado.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  void _exibirResultado(){

    var itens = ["cara", "coroa"];
    var numero = Random().nextInt(itens.length);
    var resultado = itens[numero];

    Navigator.push( // o push abri uma nova tela em cima da outra o "pop" fecha a primeira tela e abre a segunda
      context, // já declarado em Widget build(BuildContext context) {...
      MaterialPageRoute(
        builder: (context) => Resultado(resultado)
      )
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff61bd86),
     
      body: Center(
        
        child: Container(
          
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset("images/logo.png"),

              GestureDetector(
                onTap: _exibirResultado,
                child: Image.asset("images/botao_jogar.png"),
              )
            ],
          ),
        ),
      ),
    );
  }
}