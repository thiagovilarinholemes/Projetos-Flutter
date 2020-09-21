import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TelaEmpresa extends StatefulWidget {
  @override
  _TelaEmpresaState createState() => _TelaEmpresaState();
}

class _TelaEmpresaState extends State<TelaEmpresa> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tela Empresa"),
        backgroundColor: Colors.orange,
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
                     Image.asset("images/detalhe_empresa.png"),
                     Padding(
                       padding: EdgeInsets.only(left: 10),
                       child: Text(
                         "Sobre nós",
                         style: TextStyle(
                           fontSize: 20,
                           color: Colors.orange
                         ),
                       ),
                      )
                
                  ],
                ),

                Padding(
                  padding: EdgeInsets.only(top: 16),
                  child: Text(
                  "The standard chunk of Lorem Ipsum used "
                  "since the 1500s is reproduced below for "
                  "those interested. Sections 1.10.32 and 1.10.33 from "
                  "de Finibus Bonorum et Malorum"
                  "by Cicero are also reproduced in their exact original form," 
                  "ccompanied by English versions from the 1914 translation by H. Rackham."
                  "The standard chunk of Lorem Ipsum used "
                  "since the 1500s is reproduced below for "
                  "those interested. Sections 1.10.32 and 1.10.33 from "
                  "de Finibus Bonorum et Malorum"
                  "by Cicero are also reproduced in their exact original form," 
                  "ccompanied by English versions from the 1914 translation by H. Rackham."
                  "The standard chunk of Lorem Ipsum used "
                  "since the 1500s is reproduced below for "
                  "those interested. Sections 1.10.32 and 1.10.33 from "
                  "de Finibus Bonorum et Malorum"
                  "by Cicero are also reproduced in their exact original form," 
                  "ccompanied by English versions from the 1914 translation by H. Rackham."
                  "The standard chunk of Lorem Ipsum used "
                  "since the 1500s is reproduced below for "
                  "those interested. Sections 1.10.32 and 1.10.33 from "
                  "de Finibus Bonorum et Malorum"
                  "by Cicero are also reproduced in their exact original form," 
                  "ccompanied by English versions from the 1914 translation by H. Rackham."
                  "The standard chunk of Lorem Ipsum used "
                  "since the 1500s is reproduced below for "
                  "those interested. Sections 1.10.32 and 1.10.33 from "
                  "de Finibus Bonorum et Malorum"
                  "by Cicero are also reproduced in their exact original form," 
                  "ccompanied by English versions from the 1914 translation by H. Rackham."
                  "The standard chunk of Lorem Ipsum used "
                  "since the 1500s is reproduced below for "
                  "those interested. Sections 1.10.32 and 1.10.33 from "
                  "de Finibus Bonorum et Malorum"
                  "by Cicero are also reproduced in their exact original form," 
                  "ccompanied by English versions from the 1914 translation by H. Rackham.",
                  textAlign: TextAlign.justify,
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