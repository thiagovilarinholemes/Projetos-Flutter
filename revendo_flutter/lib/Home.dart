
import 'package:flutter/material.dart';
import 'package:revendo_flutter/telas/Fim.dart';
import 'package:revendo_flutter/telas/Inicio.dart';
import 'package:revendo_flutter/telas/Meio.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  int _indiceAtual = 0; // indice do BottomNavigationBar
  List<Widget> telas = [
    Inicio(),
    Meio(),
    Fim(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Revendo Flutter"),
        backgroundColor: Colors.greenAccent,
      ),
      
      body: telas[_indiceAtual],
      bottomNavigationBar: BottomNavigationBar(

        currentIndex: _indiceAtual,
          onTap: (indiceClicado){
            setState(() {
              _indiceAtual = indiceClicado;
              print(_indiceAtual);
            });
          },

        type: BottomNavigationBarType.shifting,

        items: [

          BottomNavigationBarItem( // botão inferior
            backgroundColor: Colors.orange,
            title: Text("Início"),
            icon: Icon(Icons.home),
          ),
          BottomNavigationBarItem( // botão inferior
            backgroundColor: Colors.red,
            title: Text("Meio"),
            icon: Icon(Icons.adjust),
          ),
          BottomNavigationBarItem( // botão inferior
            backgroundColor: Colors.blue,
            title: Text("Fim"),
            icon: Icon(Icons.airline_seat_individual_suite),
          ),

        ],
      ),
    );
  }
}