import 'package:adip/components/session.dart';
import 'package:adip/widgets/side_menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:adip/components/session.dart';


import 'package:adip/widgets/category_card.dart';

import 'details.dart';
// homeScreen for the app
class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size; //total height and with of our device
    return Scaffold(
      
      body: Stack(
      
        children: [
          Container(
            height: size.height,
            decoration: const BoxDecoration(
              color: Color.fromARGB(255, 228, 162, 124),
              image: DecorationImage(
                alignment: Alignment.centerLeft,
                image: AssetImage("assets/images/undraw_pilates_gpdb.png"),
              ),
            ),
          
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
             
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Align(
                    alignment: Alignment.topRight,
                    child: InkWell(
                    child: Container(
                      alignment: Alignment.center,
                      height: 52,
                      width: 52,
                      decoration: const BoxDecoration(
                        color: Color(0xFFF2BEA1),
                        shape: BoxShape.circle,
                      ),
                      child: SvgPicture.asset("assets/icons/menu.svg"),
                      
                    ),
                      onTap: () {
                     Navigator.push(context, MaterialPageRoute(builder: (context) => NavDrawer()));
                    } 
                    )
                  ),
                  Text(
                    "Welcome!",
                    style: Theme.of(context).textTheme.headline4?.copyWith(fontWeight: FontWeight.w900),
                  ),
                
                  Expanded(
                    child: GridView.count(
                      crossAxisCount: 2,
                      
                      
                      childAspectRatio: .85,
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 30,
                      children: [
                        CategoryCard(
                          title: "Details",
                          svgSrc: "assets/icons/Hamburger.svg",
                          press: () { 
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) {
                                return const DetailsScreen();
                              }),
                            );
                            },
                        ),
                        
                        CategoryCard(
                          title: "Help",
                          svgSrc: "assets/icons/Meditation.svg",
                          press: () {
                            
                              },
                            
                          
                        ),
                        CategoryCard(
                          title: "FeedBack",
                          svgSrc: "assets/icons/feedback.svg",
                          press: () {
                            
                          },
                        ),
                        CategoryCard(
                          title: "Track My Complaint",
                          svgSrc: "assets/icons/feedback.svg",
                          press: () {
                            
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavDrawer(),
      appBar: AppBar(
        title: Text('Menu'),
      ),
    );
  }
}
