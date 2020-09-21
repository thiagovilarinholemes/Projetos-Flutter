import 'package:flutter/material.dart';

// Classe customizada de pesquisa
class CustomSearchDelegate extends SearchDelegate<String>{

  // Adiciona ações ao search
  @override
  List<Widget> buildActions(BuildContext context) {
      return [
        // Botão de limpar
        IconButton(
          icon: Icon(Icons.clear), 
          onPressed: (){
            query = ""; // Limpa o que foi digitado
          }
        ),
        
      ];
    }
  
    @override
    Widget buildLeading(BuildContext context) {
      // Botão de voltar
      return IconButton(
          icon: Icon(Icons.arrow_back), 
          onPressed: (){
            close(context, ""); // Fecha a tela
          }
        );
        
      
    }

    // Quando o usuário faz uma pesquisa 
    @override
    Widget buildResults(BuildContext context) {
      close(context, query); // query é o texto que o usuário digitou e passa para a tela anterior
      return Container();
    }

    // Sugestões quando o usuário começa a digitar
    @override
    Widget buildSuggestions(BuildContext context) {

      List<String> lista = List();

      if(query.isNotEmpty){

        // Lista de sugestões
        lista = ["Satisfy The Rage", "HVME", "Kina"].where((textoDigitado) => 
            textoDigitado.toLowerCase()
            .startsWith(query.toLowerCase())).toList();

        return ListView.builder(
          itemCount: lista.length,
          itemBuilder: (context, index){
            return ListTile(
              onTap: (){
                // Passa o item selecionado
                close(context, lista[index]);
              },
              // Exibe os itens relacionados com a pesquisa
              title: Text(lista[index]),
            );
          }
        );
      }
      else{
        return Center(
          child: Text("Nenhum item encontrado"),
        );
      }
  }
}