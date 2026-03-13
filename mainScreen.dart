import 'package:flutter/material.dart';
import 'package:simple_to_do_app/widgets/TaskPage.dart';
import 'ProfilePage.dart';
import 'Homepage.dart';

class mainScreen extends StatefulWidget {
  const mainScreen({super.key});

  @override
  State<mainScreen> createState() => _mainScreenState();
}

class _mainScreenState extends State<mainScreen> {
  int currentIndex=0;
  List pages=[
    Homepage(),
    TaskPage(),
     ProfilePage()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     body: pages[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
          onTap: (Index){
          setState(() {
            currentIndex=Index;
          });
          },
          items: [
            BottomNavigationBarItem(icon:Icon (Icons.home_filled),label: "Home"),
            BottomNavigationBarItem(icon:Icon (Icons.add),label: "Add"),
            BottomNavigationBarItem(icon:Icon (Icons.person),label: "Profile"),


          ]
      ),
    );
  }
}
