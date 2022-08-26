import 'package:flutter/material.dart';

class lol extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          color: Color.fromARGB(255, 216, 129, 48)
        )
        ),
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
                  
        ),
        body: Column(
          children: <Widget>[
            CircleAvatar(
              radius: 80,
              backgroundImage: AssetImage("images/sushantkumar.jpg"),
            ),

            
            ListTile(
              title: Center(child: Text("Employee", style: TextStyle(fontSize: 20),),) ,
              subtitle: Center(child: Text("ID:12344, Tamil Nadu", style: TextStyle(fontSize: 15)),),
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                RaisedButton(
              onPressed: (){

              },
              child: Text("Complaints filed"),
              ),

              RaisedButton(
              onPressed: (){
              
              },
              child: Text("Pending Files"),
              ),
              ],
            ),

            
          ],
        )
        
        
         ),

    );
  }
}