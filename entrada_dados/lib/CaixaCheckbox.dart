import 'package:flutter/material.dart';

class CaixaCheckbox extends StatefulWidget {
  @override
  _CaixaCheckboxState createState() => _CaixaCheckboxState();
}

class _CaixaCheckboxState extends State<CaixaCheckbox> {
  bool _estadoBra = false;
  bool _estadoMex = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Caixa Checkbox"),
      ),
      body: Container(
        child: Column(
          children: [
            // Padding(
            //   padding: EdgeInsets.all(16)
            // ),
            // primeira opção de checkbox
            // Text("Comida brasileira"),
            // Checkbox(
            //   value: _estado, // valor inicial
            //   onChanged: (bool valor){
            //     // print('O valor é:' + valor.toString());
            //     setState(() { 
            //       _estado = valor; // alternança de estado true/false
            //     });
            //   }
            // )

            // segunda opção de checkbox
            CheckboxListTile(
              title:  Text("Comida brasileira"), // titulo
              subtitle: Text("Feijoada"),  // subtitulo abaixo do titulo
              // activeColor: Colors.red, // cor quando estiver marcado
              // selected: true, // o texto fica de acordo com a cor quando selecionado
              secondary: Icon(Icons.add_box), // insere um icone
              value: _estadoBra, 
              onChanged: (bool valor){
                 setState(() { 
                  _estadoBra = valor; // alternança de estado true/false
                });
              }
            ),

            CheckboxListTile(
              title:  Text("Comida mexicana"), // titulo
              subtitle: Text("Tripa de boi"),  // subtitulo abaixo do titulo
              // activeColor: Colors.red, // cor quando estiver marcado
              // selected: true, // o texto fica de acordo com a cor quando selecionado
              secondary: Icon(Icons.add_box), // insere um icone
              value: _estadoMex, 
              onChanged: (bool valor){
                 setState(() { 
                  _estadoMex = valor; // alternança de estado true/false
                });
              }
            ),

            RaisedButton(
              child: Text(
                "Salvar",
                style: TextStyle(
                  fontSize: 20
                ),  
              ),              
              onPressed: (){
                print(
                  "Comida brasileira: " + _estadoBra.toString() + '\n' +
                  "Comida mexicana: " + _estadoMex.toString()
                );              
              }),

              Text("Comida brasileira: " + _estadoBra.toString()),
              Text("Comida mexicana: " + _estadoMex.toString()),


          ],
        ),
      )
    );
  }
}