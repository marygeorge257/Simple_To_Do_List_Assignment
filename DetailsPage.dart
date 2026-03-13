import 'package:flutter/material.dart';
class DetailsPage extends StatelessWidget {
  const DetailsPage({super.key,required this.task,required this.isDone});
   final String? task;
   final bool isDone;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Details",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color: Colors.deepOrange),),
      ),
      body:
      Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,

          children: [
            Text(isDone? "Task Completed":"Task Not Completed",style: TextStyle(fontSize: 25),)
          ],
        ),
      )
    );
  }
}
