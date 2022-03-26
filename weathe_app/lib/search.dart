import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:weathe_app/home.dart';
import 'package:weathe_app/main.dart';
import 'package:weathe_app/route/routing_constant.dart';
import 'package:weathe_app/weather.dart';

class Search extends SearchDelegate {
   List<String> searchResults=[
      'Binh Duong',
      'Ha Noi',
      'Nha Trang',
      'Da Lat',
      'Ha Giang',
      'Thu Duc'
    ];

  @override
  Widget? buildLeading(BuildContext context)=>IconButton(
    icon: const Icon(Icons.arrow_back),
    onPressed: ()=>close(context, null),
  );

  @override
  List<Widget> buildActions(BuildContext context)=>[
    IconButton(icon: const Icon(Icons.clear), onPressed: (){
      if (query.isEmpty) {
        close(context, null);
      }
      else {
        query='';
      }
    })
  ];

  @override
  Widget buildResults(BuildContext context) {
    Weather.city=query;
    
    return Center(
    child: Text(
      Weather.city, 
      style: const TextStyle(fontSize: 64, fontWeight: FontWeight.bold),
    ),
  );}

  @override
  Widget buildSuggestions(BuildContext context) {
    final input = query;
    List<String> suggestions = searchResults.where((element){
      final result = element.toLowerCase();
      final input = query.toLowerCase();
      return result.contains(input);
    }).toList();

    return ListView.builder(
      itemCount: suggestions.length,
      itemBuilder: (context, index) {
        final suggestion = suggestions[index];
        return ListTile(
          title: Text(suggestion),
          onTap: (){
            Weather.city=suggestion;
            Navigator.pushNamed(context, HomeViewRoute);
          },
        );
      }
    );
  }
}