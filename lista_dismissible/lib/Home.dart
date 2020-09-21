import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  List _lista = ["Thiago", "Carina", "Spack", "Susan"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Lista Dismissible")
      ),

      body: Container(
        child: Column(children: [

          Expanded(child: ListView.builder(
            itemCount: _lista.length,
            itemBuilder: (context, indice){
              
              final item = _lista[indice];
              return Dismissible(
                // direction: DismissDirection.startToEnd, // Define a direcao, por padrão é startToEnd
                background: Container( // background principal
                  color: Colors.green,
                  padding: EdgeInsets.all(16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start, // Define a posição do icone no inicio do container
                    children: [
                      Icon(
                        Icons.edit,
                        color: Colors.white,
                      )
                    ],
                  ),
                ),
                secondaryBackground: Container( // background principal
                  color: Colors.red,
                  padding: EdgeInsets.all(16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end, // Define a posição do icone no fim do container
                    children: [
                      Icon(
                        Icons.delete,
                        color: Colors.white,
                      )
                    ],
                  ),
                ),
                onDismissed: (direction){

                  // Para criar uma ação
                  if(direction == DismissDirection.startToEnd){
                    print("direção: startToEnd");
                  }else if(direction == DismissDirection.endToStart){
                    print("direção: endToStart");
                  }

                },
                key: Key(item), 
                child: ListTile(
                  title: Text(item),
                )
              );
            }
            
            ),          
          )
        ],),
      ),
      
    );
  }
}