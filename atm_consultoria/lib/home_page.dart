import 'package:atm_consultoria/tela_cliente.dart';
import 'package:atm_consultoria/tela_contato.dart';
import 'package:atm_consultoria/tela_empresa.dart';
import 'package:atm_consultoria/tela_servico.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  void abrirEmpresa(){
    Navigator.push(
     context, 
     MaterialPageRoute(builder: (context) => TelaEmpresa())
    );
  }

  void abrirServico(){
    Navigator.push(
     context, 
     MaterialPageRoute(builder: (context) => TelaServico())
    );
  }

  void abrirCliente(){
    Navigator.push(
     context, 
     MaterialPageRoute(builder: (context) => TelaCliente())
    );
  }

  void abrirContato(){
    Navigator.push(
     context, 
     MaterialPageRoute(builder: (context) => TelaContato())
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [

            Image.asset("images/logo.png"),

            Padding(
              padding: EdgeInsets.only(top: 32),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector( // função para quando clicar
                    onTap: abrirEmpresa,
                    child: Image.asset("images/menu_empresa.png"),
                  ),

                   GestureDetector( // função para quando clicar
                    onTap: abrirServico,
                    child: Image.asset("images/menu_servico.png"),
                  )
                ],
              ),    
            ),        
            
            Padding(
              padding: EdgeInsets.only(top: 32),
              child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector( // função para quando clicar
                    onTap: abrirCliente,
                    child: Image.asset("images/menu_cliente.png"),
                  ),

                   GestureDetector( // função para quando clicar
                    onTap: abrirContato,
                    child: Image.asset("images/menu_contato.png"),
                  )
              ],
            )
            )


          ],      
        ),
      );
  }
}