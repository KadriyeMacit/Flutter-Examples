import 'package:flutter/material.dart';

class ContainerPage extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Column(

        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[




          Container(

            height: 100,
            width: 100,

            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(child: Text("Hello World")),
            ),

            decoration: BoxDecoration(

                color: Colors.yellowAccent,
                border: Border.all(
                    width: 1,
                    color: Colors.black
                ),

                borderRadius: BorderRadius.all(Radius.circular(100))


            ),

          ),

          Container(

              height: 100,
              width: 100,

            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(child: Text("Hello World")),
            ),

            decoration: BoxDecoration(
              color: Colors.cyan,
              border: Border.all(
                width: 5,
                color: Colors.deepOrange
              )
            ),

          ),


        Container(

          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(child: Text("Hello World")),
          ),
        ),

          Container(

          color: Colors.lightGreen,

            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(child: Text("Hello World")),
            ),


          ),


          Container(

            height: 100,
            width: 100,

            color: Colors.purple[200],

            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(child: Text("Hello World")),
            ),

          ),


          Container(

            height: 100,
            width: 100,

            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(child: Text("Hello World")),
            ),

            decoration: BoxDecoration(

                color: Colors.yellowAccent,
                border: Border.all(
                    width: 1,
                    color: Colors.black
                ),

              borderRadius: BorderRadius.all(Radius.circular(30))


            ),

          ),


        ],

      )


    );
  }


}