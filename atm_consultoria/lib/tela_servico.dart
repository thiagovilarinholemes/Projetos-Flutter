import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TelaServico extends StatefulWidget {
  @override
  _TelaEmpresaState createState() => _TelaEmpresaState();
}

class _TelaEmpresaState extends State<TelaServico> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tela Serviços"),
        backgroundColor: Colors.cyan[300],
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
                     Image.asset("images/detalhe_servico.png"),
                     Padding(
                       padding: EdgeInsets.only(left: 10),
                       child: Text(
                         "Nossos Serviços",
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
                    "Consultoria"   
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 16),
                  child: Text(
                    "Desenvolvimento de Software"   
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 16),
                  child: Text(
                    "Manutenção de Computadores"   
                  ),
                )
              ],
            ),
          
          ),
        ),
      )
      
    );
  }
}