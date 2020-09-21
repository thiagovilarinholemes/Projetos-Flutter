import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("FloatingActionButton")
      ),

      // BODY
      body: Text("data"),

      // FLOATINGACTIONBUTTON
      // localização do botão startFloat | centerFloat | endFloat | centerTop e outros locais
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      // floatingActionButton: FloatingActionButton(
      floatingActionButton: FloatingActionButton.extended(

        icon: Icon(Icons.shopping_cart),
        label: Text("Adicionar"),
        shape: BeveledRectangleBorder( // Modifica as bordas do retangulo
          borderRadius: BorderRadius.circular(20)
        ),
        backgroundColor: Colors.purple,
        foregroundColor: Colors.white, // cor do icone
        elevation: 6, // elevação do botão
        // mini: true, // tamanho minimo
        onPressed: (){
          print("Botão precionado");
        }
      ),

      // Botão na parte inferior
      bottomNavigationBar: BottomAppBar(
        color: Colors.purpleAccent,
        // shape: CircularNotchedRectangle(), // Deixa o botão flutuante contornado
        child: Row(
          children: [
            IconButton(
              icon: Icon(Icons.menu), 
              onPressed: null
            )
          ],
        ),
      ),
    );
  }
}