import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

void main() {
  runApp(new MaterialApp(
    title: "Kamera Uygulaması",
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      primarySwatch: Colors.indigo,
    ),

      home: cameraApp(),
  ));
}


class cameraApp extends StatefulWidget {

  _cameraAppState createState() => _cameraAppState();

}


class _cameraAppState extends State<cameraApp>{

  File imageFile;


  _openGallery(BuildContext context) async{
    var picture =  await ImagePicker.pickImage(source: ImageSource.gallery);
    this.setState((){
      imageFile = picture;
    });
    Navigator.of(context).pop();
  }

  _openCamera(BuildContext context) async{
    var picture =  await ImagePicker.pickImage(source: ImageSource.camera);
    this.setState((){
      imageFile = picture;
    });
    Navigator.of(context).pop();
  }

  Future<void> _showChoiseDialog(BuildContext context) {
    return showDialog(context: context, builder: (BuildContext context){
      return AlertDialog(
        title: Text("Birini seçin!"),
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              GestureDetector(
                child: Text("Galeri"),
                onTap: (){
                  _openGallery(context);
                },
              ),

              GestureDetector(
                child: Text("Kamera"),
                onTap: (){
                  _openCamera(context);
                },
              ),

            ],
          ),
        ),
      );
    });
  }


  Widget _decideImageView(){

    if(imageFile == null)
      {
        return Text(
            "Resim seçilmedi"
        );
      }
    else
      {
        return Image.file(imageFile,
        width: 400,
        height: 400,);
      }
  }


  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text("Anasayfa"),
      ),

      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              _decideImageView(),
              RaisedButton(
                color: Colors.pinkAccent,
                onPressed: (){
                  _showChoiseDialog(context);
                },
                child: Text("Resim seçin!"),
              )
            ],
          ),
        ),
      ),
    );
  }



}



