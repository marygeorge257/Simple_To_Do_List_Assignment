import 'package:flutter/material.dart';
import 'Greeting.dart';
class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String name="Guest";
  String entered_name="";
  int i=0;
  void updateName(){
    setState(() {
      if(entered_name.isEmpty){
        name="Guest";
      }
      else{
        name=entered_name;
      }
    });
  }
  void resetName(){
    setState(() {
      name="Guest";
      entered_name="";
      i=0;
    });
  }
  void count(){
    setState(() {
      i++;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Task Manager",
        style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color: Colors.deepOrange),
        ),
      ),
      body:
      Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [

            TextField(
              onChanged: (value){
                entered_name=value;
              },
              decoration:
              InputDecoration(
                  prefixIcon: Icon(Icons.person,size: 25,),
                  labelText: "Enter Your First Name",

                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(9),
                    borderSide: BorderSide(
                      color: Colors.black45,
                      width: 1.5,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(9),
                      borderSide: BorderSide(
                          color: Colors.black45,
                          width: 2
                      )
                  )
              ),
            ),
            SizedBox(height: 30,),
            CircleAvatar(
              backgroundColor: Colors.orange[200],
              radius: 65,
              child:Icon(Icons.person,size:60,color: Colors.white,) ,
            ),
            SizedBox(height: 20,),
            Greeting(name:name),
            SizedBox(height: 10,),
            Text(
              "Welcome to the profile app. Please enter your name above to see the greeting message",
              style: TextStyle(
                color: Colors.grey,
                fontSize: 15,
              ),
            ),
            SizedBox(height: 30,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed:(){
                    updateName();
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.orange,
                  ),
                  child: Text("Update Name",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                ),
                TextButton(
                    onPressed: (){
                      resetName();
                    },
                    child: Text("Reset Name",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                        color: Colors.orange
                      ),
                    )
                )
              ],

            ),
            SizedBox(height: 50,),
            Container(
              padding: EdgeInsets.symmetric(vertical: 12,horizontal: 24),
              decoration: BoxDecoration(
                  color: Colors.orangeAccent[100],
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                      color: Colors.deepOrange
                  )
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "Tap Count $i",
                    style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                      color: Colors.white

                    ),
                  ),
                  Spacer(),

                  IconButton(
                      onPressed: (){
                        count();
                      },
                      icon: Icon(Icons.touch_app,color: Colors.white,),
                  )
                ],
              ),
            )
          ],
        ),


      ),

    );
  }
}
