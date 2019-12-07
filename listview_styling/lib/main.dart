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
// horizontal listview için

Widget _myListView(BuildContext context){
  return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index){
        return Container(
          margin: const EdgeInsets.symmetric(horizontal: 1.0),
          color: Colors.tealAccent,
          child: Text('$index'),
        );
      });
}

*/


/*
// Icon'lu listview

Widget _myListView(BuildContext context)
{
  return ListView(
    children: <Widget>[
      ListTile(
        leading: Icon(Icons.wb_sunny),
        title: Text('Hello World Flutter dersleri'),
        trailing: Icon(Icons.keyboard_arrow_right),
      ),
      ListTile(
        leading: Icon(Icons.brightness_3),
        title: Text('Hello World Python dersleri'),
        trailing: Icon(Icons.keyboard_arrow_right),
      ),
      ListTile(
        leading: Icon(Icons.star),
        title: Text('Hello World Xamarin dersleri'),
        trailing: Icon(Icons.keyboard_arrow_right),
      ),
      ListTile(
        leading: Icon(Icons.local_florist),
        title: Text('Hello World Linux dersleri'),
        trailing: Icon(Icons.keyboard_arrow_right),
      ),
    ],
  );
}
*/


// resimlerle ListView
Widget _myListView(BuildContext context)
{
    return ListView(
      children: <Widget>[
        ListTile(
          leading: CircleAvatar(
            backgroundImage: AssetImage('images/ay.jpg'),
          ),
          title: Text('Ay Savaşçısı'),
          subtitle: Text('Sailor Moon Animesindeki anakarakter'),
        ),
        ListTile(
          leading: CircleAvatar(
            backgroundImage: AssetImage('images/merkur.jpg'),
          ),
          title: Text('Merkür Savaşçısı'),
            subtitle: Text('Merkür koruyucu')
        ),
        ListTile(
          leading: CircleAvatar(
            backgroundImage: AssetImage('images/mars.jpg'),
          ),
          title: Text('Mars Savaşçısı'),
            subtitle: Text('Mars koruyucusu')
        ),
        ListTile(
          leading: CircleAvatar(
            backgroundImage: AssetImage('images/jupiter.jpg'),
          ),
          title: Text('Jüpiter Savaşçısı'),
            subtitle: Text('Jüpiter koruyucusu')
        ),
        ListTile(
          leading: CircleAvatar(
            backgroundImage: AssetImage('images/venus.jpg'),
          ),
          title: Text('Venüs Savaşçısı'),
            subtitle: Text('Venüs koruyucusu')
        ),
      ],
    );
}





