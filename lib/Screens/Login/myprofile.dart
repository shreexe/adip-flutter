import 'package:flutter/material.dart';

class App extends StatelessWidget {
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
              title: Center(child: Text("Jasvi", style: TextStyle(fontSize: 20),),) ,
              subtitle: Center(child: Text("KMC,Chennai,June 2019", style: TextStyle(fontSize: 15)),),
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                RaisedButton(
              onPressed: (){

              },
              child: Text("Your reports"),
              ),

              RaisedButton(
              onPressed: (){
              
              },
              child: Text("Your complaints"),
              ),
              ],
            ),

              ListTile(
                title: Text("About", style: TextStyle(fontSize: 20)),
                subtitle: Text("")
              )
          ],
        )
        
        
         ),

    );
  }
}