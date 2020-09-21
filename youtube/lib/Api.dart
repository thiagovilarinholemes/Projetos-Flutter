import 'package:http/http.dart' as http;
import 'dart:convert';

import 'model/Video.dart';

const CHAVE_YOUTUBE_API = "AIzaSyChzwhBgKzFuCoroXFm3cK3oAF2sTtivfk"; 
const ID_CANAL = "UCrRpYEytIHGyDgNWO6VbHlQ";
const URL_BASE = "https://www.googleapis.com/youtube/v3/";

class Api{

  // Metodo de pesquisa no Youtube
  Future<List<Video>> pesquisar(String pesquisa) async{
    http.Response response = await http.get(
      URL_BASE + "search"
        "?part=snippet"
        "&type=video" // Tipo video
        "&maxResults=20" // Número máximo de resultados
        "&order=date" // Ordem de data
        "&key=$CHAVE_YOUTUBE_API"
        "&channelId=$ID_CANAL" // Busca em um canal especifica, se retirado pesquisa em todo Youtube
        "&q=$pesquisa" // Palavra a ser buscada
    );

    // Verifica se a busca foi bem sucedida e retorna a lista
    if(response.statusCode == 200){

      // Imprime o resultado da pesquisa
      // print("Resultado: " + response.body);

      // Converte o objeto json response.body para Map
      Map<String, dynamic> dadosJson = json.decode( response.body );
      // Imprime os dados do video 0 do json dadosJson
      // print(dadosJson["items"][0]["id"]["videoId"].toString());

      // Percorrendo a lista de dadosJson
      // for(var video in dadosJson["items"]){
      //   print("Resultado: " + video.toString());
      // }

      // Outra maneira de percorrer a lista de dadosJson - Videos e converter para List<Video>
      List<Video> videos = dadosJson["items"].map<Video>(
        (map){
          return Video.fromJson( map );
        }
      ).toList();

      // Imprime a lista acima
      // for(var video in videos){
      //   print(video.titulo);
      // }

      return videos;
    }
    else{}
  }
}


