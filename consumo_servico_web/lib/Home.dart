import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

import 'Post.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
 
 String _url = "https://jsonplaceholder.typicode.com";

 Future<List<Post>> _recuperarPostagem() async{

  http.Response response = await http.get(_url + "/posts");
  var dados = jsonDecode(response.body);
  
  List<Post> postagem = List();
  for(var post in dados){
    Post p = Post(post["userId"], post["id"], post["title"], post["body"]);
    postagem.add(p);
  }
  return postagem;
 }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Consumo de serviço web"),
      ),
      body:FutureBuilder<List<Post>>(
          future: _recuperarPostagem(),
          builder: (context, snapshot){ // snapshot para o estado

            switch(snapshot.connectionState){ // snapshot.connectionState passo o estado de conexão
              case ConnectionState.none: // caso a conexão seja null
              case ConnectionState.waiting: // aguardando a conexão
                return Center(child: CircularProgressIndicator()); // exibe uma barra de progresso
                break;
              case ConnectionState.active: 
              case ConnectionState.done: // caso desconectado
                if(snapshot.hasError){ // verifica se houve erro 
                  print("Erro ao carregar a lista");
                }
                else{
                print("Lista: carregou!!!");
                return ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (context, index){

                    List<Post> lista = snapshot.data;
                    Post post = lista[index]; // captura o index do item clicado

                    return ListTile(
                      title: Text(post.title == null ? "Carregando" : post.title ),
                      subtitle: Text(post.id.toString()),
                    );
                  },
                );
                }
                break;
            }
        },
    ),
      );
  }
}