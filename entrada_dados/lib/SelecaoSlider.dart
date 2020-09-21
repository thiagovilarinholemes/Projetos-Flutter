import 'package:flutter/material.dart';


class SelecaoSlider extends StatefulWidget {
  @override
  _SelecaoSliderState createState() => _SelecaoSliderState();
}

class _SelecaoSliderState extends State<SelecaoSlider> {

  double _valor = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Radiobox"),
      ),
      body: Container(
        child: Column(
          children: [
            Padding(padding: EdgeInsets.all(60),),            
            Slider(
              value: _valor, 
              min: 0,
              max: 10,
              label: _valor.toString(), // label ao cliclar
              divisions: 5, // divisões da reta
              activeColor: Colors.redAccent, // cor da barra ativa
              inactiveColor: Colors.purpleAccent, // cor da barra inativa
              onChanged: (double valor){
                setState(() {
                  _valor = valor;
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
                print("Valor: " + _valor.toString());
              }),
          ],
        ),
      ),
    );
  }
}