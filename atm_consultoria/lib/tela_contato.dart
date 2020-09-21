import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TelaContato extends StatefulWidget {
  @override
  _TelaEmpresaState createState() => _TelaEmpresaState();
}

class _TelaEmpresaState extends State<TelaContato> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tela Contato"),
        backgroundColor: Colors.green[400],
      ),
      body: SingleChildScrollView( // permite rolar a tela
        child: Container(
          child: Padding(
            padding: EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,

              children: [
                Row(
                  children: [
                     Image.asset("images/detalhe_contato.png"),
                     Padding(
                       padding: EdgeInsets.only(left: 10),
                       child: Text(
                         "Contato",
                         style: TextStyle(
                           fontSize: 20,
                           color: Colors.green[300]
                         ),
                       ),
                      )
                  ],
                ),

                Padding(
                  padding: EdgeInsets.only(top: 16),
                  child: Text(
                    "email: fulano@gmail.com",
                    textAlign: TextAlign.justify,
                   ),
                ),

                Padding(
                  padding: EdgeInsets.only(top: 16),
                  child: Text(
                    "Telefone: 66 55555-7777",
                    textAlign: TextAlign.justify,
                  ),
                ),

                Padding(
                  padding: EdgeInsets.only(top: 16),
                  child: Text(
                    "Endereço: Rua sem beco, AV. sem saída.",
                    textAlign: TextAlign.justify,
                  )
                ),
              ],
            ),
          
          ),
        ),
      )
    );
  }
}