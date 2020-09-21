import 'package:flutter/material.dart';

class SelecaoSwitch extends StatefulWidget {
  @override
  _SelecaoSwitchState createState() => _SelecaoSwitchState();
}

class _SelecaoSwitchState extends State<SelecaoSwitch> {

  bool _estado = true; // valor inicial
  bool _config = false; // valor inicial


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Switch"),
      ),
      body: Container(
        child: Column(
          children: [

            // primeira opção - aceita Row
            // Switch(
            //   value: _estado, 
            //   onChanged: (bool valor){
            //     setState(() {
            //       _estado = valor;
            //       print("O estado é: " + _estado.toString());
            //     });
            //   }
            // ),
            // Text("Receber notificação?"),

            // segunda opção - não aceita Row
            SwitchListTile(
              title: Text("Receber notificação?"),
              value: _estado, 
              onChanged: (bool valor){
                setState(() {
                  _estado = valor;
                  print("O estado é notificações: " + _estado.toString());
                });
              }
            ),

            SwitchListTile(
              title: Text("Carregar imagens automaticamente?"),
              value: _config, 
              onChanged: (bool valor){
                setState(() {
                  _config = valor;
                  print("O estado é imagens: " + _config.toString());
                });
              }
            ),
          ],
        ),
      ),
      
    );
  }
}