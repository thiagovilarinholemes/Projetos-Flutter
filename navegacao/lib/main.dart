import 'package:flutter/material.dart';

import 'TelaSecundaria.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: TelaPrincipal(),
    initialRoute: "/", // define o main como rota inicial
    routes: { // criando rotas
      "/secundaria": (context) => TelaSecundaria()
    },
  ));
}

class TelaPrincipal extends StatefulWidget {
  @override
  _TelaPrincipalState createState() => _TelaPrincipalState();
}

class _TelaPrincipalState extends State<TelaPrincipal> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: Text("Tela principal"),
      ),
      body: Container(
        padding: EdgeInsets.all(32),
        child: Column(
          children: [
            RaisedButton( 
              child: Text("Ir para a segunda tela!"),
              padding: EdgeInsets.all(15),
              onPressed: (){
                 Navigator.pushNamed(context, "/secundaria"); // acessando a rota declarada acima
              },
            )
          ],
        ) ,
      ),
    );
  }
}