import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      theme: ThemeData(
        primarySwatch: Colors.orange,
        accentColor: Colors.orange
      ),

      home: NavigasyonSayfasi()
    );
  }
}

class NavigasyonSayfasi extends StatelessWidget{
  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        title: Text("Navigation Drawer"),
      ),

      body: Center(
        child: Text("Hoş geldin!"),

      ),

      drawer: Drawer(
        child: ListView(

          padding: EdgeInsets.zero,

          children: <Widget>[

            UserAccountsDrawerHeader(

              accountName: Text("Kadriye Macit"),
              accountEmail: Text("kadriyemacit9655@gmail.com"),
              currentAccountPicture: CircleAvatar(
                backgroundImage: AssetImage("images/prof.png"),
              ),

            ),

            ListTile(
              title: Text('Anasayfa'),
              leading: Icon(Icons.home),
              onTap: () {
                Navigator.pop(context);
              },
            ),

            ListTile(
              title: Text('Profilim'),
              onTap: () {
                Navigator.pop(context);
              },
              leading: Icon(Icons.person),
            ),

            ListTile(
              title: Text('Çıkış yap'),
              onTap: () {
                Navigator.pop(context);
              },

              leading: Icon(Icons.remove_circle),
            ),

          ],
        ),
      ),

    );
  }

}