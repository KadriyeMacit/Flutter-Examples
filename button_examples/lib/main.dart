import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.orange, accentColor: Colors.green),
      home: new Scaffold(
        appBar: AppBar(
          title: Text(
            "Flutter denemelerim",
            style: TextStyle(fontSize: 20.0, color: Colors.white),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            debugPrint("Butona tıklanıldı.");
          },
          child: Icon(
            Icons.extension,
          ),
        ),
        body: Container(
          margin: EdgeInsets.symmetric(horizontal: 50),
          child: Column(

            children: <Widget>[
            Text(
            "Buton türleri",
            style: TextStyle(fontSize: 20, color: Colors.black),
          ),
          Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              RaisedButton(
                child: Text("Kadriye Macit"),
                color: Colors.purple,
                onPressed: () => debugPrint("Mor butona bastınız!"),
              ),

              RaisedButton(
                child: Text("Hello World'de Flutter dersleri"),
                elevation: 12,
                textColor: Colors.yellow,
                color: Colors.blue,
                onPressed: () {
                  debugPrint("Mavi butona bastınız!");
                  debugPrint("Çok fonksiyon kullanılıyor!");
                },
              ),

              RaisedButton(
                child: Text("Hızla devam ediyor!"),
                elevation: 12,
                textColor: Colors.black,
                color: Colors.green,
                onPressed: uzunMethod,
              ),

              IconButton(
                icon: Icon(
                    Icons.android,
                    size:32
                ),
                onPressed: (){},
              ),

              FlatButton(
                onPressed: (){},
                child: Text(
                  "Flat Button",
                  style: TextStyle(fontSize: 24),
                ),
              ),

            ],
          ),
        ]),
        )
        ),
      )
  );
}

void uzunMethod(){
  debugPrint("Dışardan geldim");
}