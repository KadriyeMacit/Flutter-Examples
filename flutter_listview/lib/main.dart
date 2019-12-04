import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ListView Example',
      theme: ThemeData(
        primarySwatch: Colors.red
      ),
      home: Scaffold(
        appBar: AppBar(title: Text('ListView Example'),),
        body: BodyLayout(),
      ),
    );
  }
}

class BodyLayout extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
   return _myListView(context);
  }
}

/*
  --------  1. yöntem

Widget _myListView(BuildContext context) {
  return ListView(
    children: ListTile.divideTiles(
      context: context,
      tiles: [
        ListTile(
          title: Text('Hello World Flutter dersleri'),
        ),
        ListTile(
          title: Text('Hello World Python dersleri'),
        ),
        ListTile(
          title: Text('Hello World Xamarin dersleri'),
        ),
        ListTile(
          title: Text('Hello World Linux dersleri'),
        ),
      ],
    ).toList(),
  );
}
 */



/*
-----------------   index'i göstermek için

 Widget _myListView(BuildContext context) {
      return ListView.builder(
        itemBuilder: (context, index) {
          return ListTile(
            title: Text('row $index'),
          );
        },
      );
    }
 */



Widget _myListView(BuildContext context){

  final ulkeler = ['Türkiye', 'Almanya','Polonya','Portekiz','İtalya',
                      'Fransa','Norveç','İsveç','Macaristan','Japonya',
                    'Çin','İngiltere','ABD','Avusturya','Avusturalya', 'Mısır'];

  return ListView.builder(
    itemCount: ulkeler.length,
    itemBuilder: (context, index){
      return ListTile(
        title: Text(ulkeler[index]),
      );
    }
  );
}














