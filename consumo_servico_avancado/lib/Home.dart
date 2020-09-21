import 'package:flutter/material.dart';
import 'package:http/http.dart' as http; // renomeando a biblioteca
import 'dart:convert';

import 'Post.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  String _url = "https://jsonplaceholder.typicode.com";

// ******************************************************************************************************************
// recupera posts
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

  // ******************************************************************************************************************
 // insere post - POST
 _post() async{

  Post post = new Post(120, 1, "Titulo", "Corpo");
  var corpo = json.encode( // passando para json para enviar
    post.toJson()
   );

   http.Response response = await http.post(
     _url + "/posts", // caminho da url para post
      headers: { // cabeçalhos
        "Content-type": "application/json; charset=UTF-8"
      }, 
      body: corpo
    );
    print("resposta: " + response.body); // retorna o body enviado
    print("resposta: " + response.statusCode.toString()); // retorna o status de reposta se deu certo ou ocorreu erro

 }

// *************************************************************************************************************************************
  // atualiza post - PUT
 _put() async{
   
   var corpo = json.encode( // passando para json para enviar
     {
        "userId": 120,
        "id": null,
        "title": "Titulo",
        "body": "Corpo da postagem alterada"
      },
   );

   http.Response response = await http.put(
     _url + "/posts/1", // caminho da url para post
      headers: { // cabeçalhos
        "Content-type": "application/json; charset=UTF-8"
      }, 
      body: corpo
    );
    print("resposta: " + response.body); // retorna o body enviado
    print("resposta: " + response.statusCode.toString()); // retorna o status de reposta se deu certo ou ocorreu erro
 }

//  ******************************************************************************************************************
// PATCH, só atualiza os itens enviados
 _patch() async{
   var corpo = json.encode( // passando para json para enviar
     {
        "body": "Corpo da postagem alterada"
      },
   );

   http.Response response = await http.put(
     _url + "/posts/1", // caminho da url para post
      headers: { // cabeçalhos
        "Content-type": "application/json; charset=UTF-8"
      }, 
      body: corpo
    );
    print("resposta: " + response.body); // retorna o body enviado
    print("resposta: " + response.statusCode.toString()); // retorna o status de reposta se deu certo ou ocorreu erro
 }

 // ******************************************************************************************************************
 // deleta um post - DELETE
 _delete() async{
   var corpo = json.encode( // passando para json para enviar
     {
        "body": "Corpo da postagem alterada"
      },
   );

   http.Response response = await http.delete(
     _url + "/posts/1", // caminho da url para post
      
    );
    print("resposta: " + response.body); // retorna o body enviado
    print("resposta: " + response.statusCode.toString()); // retorna o status de reposta se deu certo ou ocorreu erro
 }
// ******************************************************************************************************************

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Consumo de serviço web"),
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            Row(
              children: [
                
                RaisedButton(
                  child: Text("Salvar"),
                  onPressed: _post
                ),
                RaisedButton(
                  child: Text("Atualizar"),
                  onPressed: _put
                ),
                RaisedButton(
                  child: Text("Remover"),
                  onPressed: _delete
                ),
              ],
            ),

            Expanded(child: FutureBuilder<List<Post>>( // Expanded expande a lista dentro do espaço não utilizado evitando sobreposição
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
            ))

          ],
        ),
      ),
    );
  }
}