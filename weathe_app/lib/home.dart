import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:weathe_app/search.dart';
import 'package:weathe_app/main.dart';
import 'package:weathe_app/sidebar.dart';
import 'package:weathe_app/weather.dart';


const IconData cloud = IconData(0xe16f, fontFamily: 'MaterialIcons');
const IconData sunny = IconData(0xf0575, fontFamily: 'MaterialIcons');

late Future<Weather> futureAlbum;

String city='';
   String temp='';
   int humidity=0;
   int pressure=0;
   double wind=0;
   String stateWeather='';

class HomeView extends StatelessWidget{
  HomeView() {
        futureAlbum=fetchCity(Weather.city);
  }

 static Future<Weather> fetchCity(String? city) async {
  final response = await http
      .get(Uri.parse('https://api.openweathermap.org/data/2.5/weather?q='+Weather.city+'&appid=d995edd1114b9a6a9032a96ef25ce613&units=metric'));

  if (response.statusCode == 200) {
    return Weather.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to load album');
  }}
  
  @override
  Widget build(BuildContext context) {
    futureAlbum=fetchCity(Weather.city);
    return 
    Scaffold(
       extendBodyBehindAppBar: true,
      drawer: SideBar(),
        appBar: AppBar(
        title: Text(''),
        actions: [
          IconButton(icon: const Icon(Icons.search),onPressed: (){
            showSearch(context: context, delegate: Search());
          },)
        ],
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),      
      backgroundColor: Colors.black,
      body:
       Container(
         child:Column(children: [backgroundSection, bottomSection])),
      
    );
  }
}

Widget get backgroundSection {
  return Expanded(
    child: Stack(
     children: [
       Container(
         decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/img1.jpg"),
          fit: BoxFit.cover
        )
        ),
       ), topSection()
     ],
    ) ,

  );
}

Widget  topSection() {
   
  return Positioned.fill(
    top: 50,
    child: Column(
      children: [
         FutureBuilder<Weather>(
            future: futureAlbum,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                city=snapshot.data!.name;
                temp=snapshot.data!.temp;
                stateWeather=snapshot.data!.stateWeather;
            return DefaultTextStyle(style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500), 
              child: 
              Column(
                children: [Text(city.toString(), style: TextStyle(color: Colors.white, fontSize: 28, fontWeight: FontWeight.w100)), 
                Padding(padding: EdgeInsets.all(5)),
                 Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children:[
                  Text(temp + "\u00B0",
                  style: TextStyle( fontSize: 68, fontWeight: FontWeight.w900)),
                  Container(
                    padding: EdgeInsets.only(bottom: 20),
                    child: Text('C', style: TextStyle(fontSize: 40))
                  ),
                  ]
                ),
                Text(stateWeather),
                 Padding(padding: EdgeInsets.all(5)),
                ],
              )
                );
              } else if (snapshot.hasError) {
                return Text('${snapshot.error}',style: TextStyle(color: Colors.white, fontSize: 28, fontWeight: FontWeight.w500));
              }
              return const CircularProgressIndicator();
            },
          ),    
        SizedBox(
          height: 60,
        ),
        ],
    ),);
}


Widget get centerSection {
  return Expanded(
    child: Row(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [Text('data')],
    ),
  );
}
Widget get bottomSection {
   DateTime dateToday =new DateTime.now(); 
    var formatter = new DateFormat('dd-MM-yyyy');
    String date = formatter.format(dateToday);  return Container(
    height: 230,
    padding: EdgeInsets.only(left:50, right: 50, top: 40, bottom: 0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,      
      children: [
        Container(
          padding: EdgeInsets.only(bottom: 5),
          decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(color: Colors.grey)
                )
          ),
        child:  Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children:[
            Text(DateFormat('EEEE').format(dateToday).toString() + " / " + date, style: TextStyle(color: Colors.white, fontSize: 18)),
            Padding(padding: EdgeInsets.only(bottom: 5)), 
            FutureBuilder<Weather>(
            future: futureAlbum,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                humidity=snapshot.data!.humidity;
                wind = snapshot.data!.wind;
                pressure=snapshot.data!.pressure;
            return DefaultTextStyle(style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500), 
              child: Column(
                children: [
                  getItemInBottom('Humidity', humidity.toString()+'%', TablerIcons.droplet), 
                  getItemInBottom('Pressure', pressure.toString()+' bar', TablerIcons.clock), 
                  getItemInBottom('Wind', wind.toString()+' km/h', TablerIcons.wind)],)     
                 );
              } else if (snapshot.hasError) {
                return Text('${snapshot.error}',style: TextStyle(color: Colors.white, fontSize: 28, fontWeight: FontWeight.w500));
              }
              return const CircularProgressIndicator();
            },
          ),   
            ],
            )
        )
      ])
  );
}

Widget getItemInBottom(String type, String value, IconData iconData) {
  return DefaultTextStyle(style: TextStyle(color: Colors.grey, fontSize: 15), child: Container(
    margin: EdgeInsets.only(top: 10, bottom: 10),
    child: Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [Text(type), Text(value),Icon(iconData, color: Colors.grey,)
      ]),
  ));
}

Future<http.Response> fetchAlbum() {
  return http.get(Uri.parse('https://jsonplaceholder.typicode.com/albums/1'));
}

