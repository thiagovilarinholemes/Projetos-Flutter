import 'package:flutter/material.dart';
import 'package:flutter_youtube/flutter_youtube.dart';
import 'package:youtube/Api.dart';
import 'package:youtube/model/Video.dart';

class Inicio extends StatefulWidget {

  String pesquisa;
  Inicio(this.pesquisa);

  // Criação da StatefulWidget
  @override
  _InicioState createState() => _InicioState();
}

class _InicioState extends State<Inicio> {

  // Retorna a lista de videos
  _listarVideos(String retorno){
    Future<List<Video>> videos;
    Api api = Api();
    videos = api.pesquisar(retorno);
    return videos;
  }

  // Fazer configurações iniciais antes de carregar a interface
  @override
  void initState() {
    super.initState();
    print("Chamado 1 metodo - initState");
  }

  // Utilizado para buscar dependencias necessarias para construir a interface
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print("Chamado 2 metodo - didChangeDependencies");
  }

  // Atualiza o metodo, utilizado para salvar dados que o usuario nao salvou
  @override
  void didUpdateWidget(Inicio oldWidget) {
    super.didUpdateWidget(oldWidget);
    print("Chamado 2 metodo - didUpdateWidget");
  }

  // Descarta o metodo
  @override
  void dispose() {
    super.dispose();
    print("Chamado 4 metodo - dispose");
  }

  // Faz a construção da interface
  @override
  Widget build(BuildContext context) {
    
    print("Chamado 3 metodo - build");

     return FutureBuilder<List<Video>>(
       future: _listarVideos(widget.pesquisa),
       builder: (context, snapshot){

         switch(snapshot.connectionState){

           case ConnectionState.none:

           case ConnectionState.waiting:
              return Center(
                  child: CircularProgressIndicator(),
              );
              break;
           case ConnectionState.active:

           case ConnectionState.done:
              // Verifica se há algum error
              if(snapshot.hasData){

                return ListView.separated(
                  itemBuilder: (context, index){

                    // Recuperando a lista de videos
                    List<Video> videos = snapshot.data;
                    Video video = videos[index];

                    // Cria as colunas com o conteudo
                    return GestureDetector(
                      // Exibir o video
                      onTap: (){
                        FlutterYoutube.playYoutubeVideoById(
                          apiKey: CHAVE_YOUTUBE_API, 
                          videoId: video.id,
                          autoPlay: true, // O vídeo inicia automaticamente
                          fullScreen: true, // Modo tela cheia
                        );
                      },
                      child: Column(children: [
                        Container(
                          height: 200,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: NetworkImage(video.imagem),
                              // A imagem ocupa todo o espaçamento do container
                              fit: BoxFit.cover
                            )
                          ),
                        ),
                        ListTile(
                          title: Text(video.titulo),
                          subtitle: Text(video.canal),

                        )
                      ],),
                    );

                  }, 
                  separatorBuilder: (context, index) => Divider(
                    height: 2,
                    color: Colors.grey,
                  ),                 
                );


              }
              else{
                return Center(
                  child: Text("Nenhum dado a ser exibido")
                );
              }
              break;         
         }
       },
     );
  }
}