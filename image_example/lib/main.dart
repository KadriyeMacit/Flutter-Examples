import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
        primarySwatch: Colors.deepOrange, //appbar rengi
        accentColor: Colors.green //buton vs. renkleri
    ),
    home: new Scaffold(
    appBar: AppBar(
    title: Text(
    "Flutter denemelerim",
    style: TextStyle(fontSize: 20.0, color: Colors.white),
  ),
  ),
  floatingActionButton: FloatingActionButton(
  onPressed: () {},
  child: Icon(
  Icons.extension,
  ),
  ),

  body: Column(children: <Widget>[
    Text(
  "Image Türleri",
  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
  ),


  IntrinsicHeight(
  child: Row(
  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  children: <Widget>[

    Expanded(
  child: Container(
  color: Colors.blue[100],
  child: Column(
  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  children: <Widget>[
    Text("Hello World"),
    Image.asset("dosyalar/images/ikizler.png")
  ],
  ),
  ),
  ),

    Expanded(
      child: Container(
        color: Colors.pink[200],
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Text("Network"),
            Image.network("https://miro.medium.com/max/375/1*EH0VB2ljcBAu7XXWd732Fw.jpeg")
          ],
        ),
      ),
    ),


    Expanded(
      child: Container(
        color: Colors.pink[200],
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Text("Profil"),
      CircleAvatar(
        radius: 30,
        backgroundColor: Colors.purple[300],
        backgroundImage: NetworkImage("https://miro.medium.com/max/375/1*EH0VB2ljcBAu7XXWd732Fw.jpeg"),

    )

  ],
  ),
  )

    )]

  )

  )

  ])
  )
  ));

}