import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TelaCliente extends StatefulWidget {
  @override
  _TelaEmpresaState createState() => _TelaEmpresaState();
}

class _TelaEmpresaState extends State<TelaCliente> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tela Clientes"),
        backgroundColor: Colors.lightGreen[300],
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
                     Image.asset("images/detalhe_cliente.png"),
                     Padding(
                       padding: EdgeInsets.only(left: 10),
                       child: Text(
                         "Clientes",
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
                  child: Image.asset("images/cliente1.png"),                  
                ),
                Text("Empresa de softaware"),

                 Padding(
                  padding: EdgeInsets.only(top: 16),
                  child: Image.asset("images/cliente2.png"),                  
                ),
                Text("Empresa de consultoria")
              ],
            ),
          ),
        ),
      ) 
    );
  }
}  