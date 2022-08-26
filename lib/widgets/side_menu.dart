import 'package:adip/Screens/Welcome/welcome_screen.dart';
import 'package:adip/Screens/Login/details.dart';
import 'package:adip/widgets/call.dart';
import 'package:flutter/material.dart';

// ignore_for_file: prefer_const_constructors
class NavDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Text(
              'Menu',
              style: TextStyle(color: Colors.white, fontSize: 25),
            ),
            decoration: BoxDecoration(
                color: Color.fromARGB(255, 233, 187, 114),
                image: DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage('assets/images/cover.jpg'))),
          ),
          Card(
            child: InkWell(
              splashColor: Colors.orange,
              onTap: (){},
             child:  ListTile(
             leading: Icon(Icons.exit_to_app),
             title: Text('Logout'),

             
         
          ),
            ),
          ),
          Card(
            child: InkWell(
              splashColor: Colors.orange,
              onTap: () => {Navigator.push(context, MaterialPageRoute(builder: (context) => Call()),)},

              
             child:  ListTile(
             leading: Icon(Icons.exit_to_app),
             title: Text('Call'),
             ),
            ),
          ),
        ],
      ),
    );
  }
}
