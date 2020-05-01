import 'package:flutter/material.dart';

class StackPage extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Stack(

        children: <Widget>[

          Container(
            color: Colors.cyan[100],
          ),
          
          Align(
            alignment: Alignment.topCenter,
            child: Container(

              height: 200,
              width: 200,

              child: Image.asset("resimler/yaz.jpg"),

            ),
          ),



          Padding(
            padding: const EdgeInsets.only(top: 50.0),
            child: Align(
              alignment: Alignment.topCenter,
              child: Container(

                height: 200,
                width: 200,

                child: Image.asset("resimler/turistik.jpg"),

              ),
            ),
          ),



          Padding(
            padding: const EdgeInsets.only(top: 100.0),
            child: Align(
              alignment: Alignment.topCenter,
              child: Container(

                height: 200,
                width: 200,

                child: Image.asset("resimler/araba.jpg"),

              ),
            ),
          )

          



        ],
        
        
      )
    );
  }


}