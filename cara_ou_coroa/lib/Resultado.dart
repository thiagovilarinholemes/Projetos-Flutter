import 'package:flutter/material.dart';

class Resultado extends StatefulWidget {

  // criando construtor
  String valor;
  Resultado(this.valor);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Resultado> {

  
  @override
  Widget build(BuildContext context) {

    var caminho;
    if(widget.valor == "cara"){
      caminho = "images/moeda_cara.png";
    }
    else{
      caminho = "images/moeda_coroa.png";
    }
    print(caminho);

    return Scaffold(
      backgroundColor: Color(0xff61bd86),
     
      body: Center(
        
        child: Container(
          
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(caminho),

              GestureDetector(
                onTap: (){
                  Navigator.pop(context); // o Navigator.pop fecha a tela atual e retorna para a tela Home
                },
                child: Image.asset("images/botao_voltar.png"),
              )
            ],
          ),
        ),
      ),
    );
  }
}