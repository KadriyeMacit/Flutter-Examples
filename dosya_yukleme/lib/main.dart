import 'dart:io';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return Dosya_yukleme();
  }
}

class Dosya_yukleme extends State<MyApp>{

  final Firestore _firestore = Firestore.instance;

  File _secilenResim;



  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      debugShowCheckedModeBanner: false,

      home: Scaffold(
        appBar: AppBar(
          title: Text("Dosya yükleme işlemleri"),
          backgroundColor: Colors.green[200],
        ),


        body: Center(
          child: Column(

            children: <Widget>[
              RaisedButton(
                  child: Text("Galeriden resim yükle",
                    style: TextStyle(color: Colors.white),),
                  color: Colors.purple,
                  onPressed: galeridenyukleme
              ),

              RaisedButton(
                  child: Text("Kameradan resim yükle",
                    style: TextStyle(color: Colors.white),),
                  color: Colors.orange,
                  onPressed: kameradanyukleme
              ),


              Expanded(
                  child: _secilenResim == null ?
                  Text("Resim yok") : Image.file(_secilenResim)
              ),



            ],
          ),
        ),

      ),
    );
  }


  void galeridenyukleme() async {
    
    var resim = await ImagePicker.pickImage(source: ImageSource.gallery);

    setState(() //arayüze de yansıması için setState
    {
      _secilenResim = resim;
    });


    StorageReference ref = FirebaseStorage.instance
        .ref()
        .child("user")
        .child("kadriye")
        .child("profil.png");
    StorageUploadTask uploadTask = ref.putFile(_secilenResim);

    var url = await (await uploadTask.onComplete).ref.getDownloadURL();
    debugPrint("upload edilen resmin urlsi : " + url);

  }

  void kameradanyukleme() async {

    var resim = await ImagePicker.pickImage(source: ImageSource.camera);

    setState(() {
      _secilenResim = resim;
    });

    StorageReference ref = FirebaseStorage.instance
        .ref()
        .child("user")
        .child("macit")
        .child("profil.png");
    StorageUploadTask uploadTask = ref.putFile(_secilenResim);

    var url = await (await uploadTask.onComplete).ref.getDownloadURL();
    debugPrint("upload edilen resmin urlsi : " + url);
  }

  }