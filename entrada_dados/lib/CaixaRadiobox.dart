import 'package:flutter/material.dart';

class CaixaRadiobox extends StatefulWidget {
  @override
  _CaixaRadioboxState createState() => _CaixaRadioboxState();
}

class _CaixaRadioboxState extends State<CaixaRadiobox> {

  String _escolha = "M"; // captura a escolha dos Radio

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Radiobox"),
      ),
      body: Container(
        child: Column(
          children: [
            
            // primeira opção de Radio - permite Row
            // Text("Masculino"),
            // Radio(
            //   value: "M", // pode ser o booleano, string, number...
            //   groupValue: _escolha, // define o valor selecionado dentro do Radio, caso o value seja string o groupValue tem que ser uma string e assim por diante
            //   onChanged: (String escolha){
            //     setState(() {
            //       _escolha = escolha; // para marcar a opção
            //     });
            //     print("Escolha: " + escolha);
            //   }
            // ),
            // Text("Feminino"),
            // Radio(
            //   value: "F", // pode ser o booleano, string, number...
            //   groupValue: _escolha, // define o valor selecionado dentro do Radio, caso o value seja string o groupValue tem que ser uma string e assim por diante 
            //   onChanged: (String escolha){
            //     setState(() {
            //       _escolha = escolha; // para marcar a opção
            //     });
            //     print("Escolha: " + escolha);

            //   }
            // ),

            // segunda opção de Radio - não permite Row
            RadioListTile(
              title: Text("Masculino"),
              value: "M", // pode ser o booleano, string, number...
              groupValue: _escolha, // define o valor selecionado dentro do Radio, caso o value seja string o groupValue tem que ser uma string e assim por diante
              onChanged: (String escolha){
                setState(() {
                  _escolha = escolha; // para marcar a opção
                });
              }
            ),
             RadioListTile(
              title: Text("Feminino"),
              value: "F", // pode ser o booleano, string, number...
              groupValue: _escolha, // define o valor selecionado dentro do Radio, caso o value seja string o groupValue tem que ser uma string e assim por diante
              onChanged: (String escolha){
                setState(() {
                  _escolha = escolha; // para marcar a opção
                });
              }
            ),

            Text("Sexo: " +_escolha),

            RaisedButton(
              child: Text(
                "Salvar",
                style: TextStyle(
                  fontSize: 20
                ),  
              ),              
              onPressed: (){
                print(
                  "Sexo: " + _escolha.toString()
                );              
              }),
          ],
        ),
      ),
    );
  }
}