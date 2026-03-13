import 'package:flutter/material.dart';
import 'package:simple_to_do_app/widgets/Homepage.dart';
class TaskPage extends StatefulWidget {
  const TaskPage({super.key});

  @override
  State<TaskPage> createState() => _TaskPageState();
}
class TaskInfo{
  static final  List<String> tasks=[];
  static final List<bool> isDone=[];
}

class _TaskPageState extends State<TaskPage> {
final TextEditingController controller=TextEditingController();
void addTask(){
  String text =controller.text;
  if(text.isEmpty)
    return;
    TaskInfo.tasks.add(text);
    TaskInfo.isDone.add(false);
     controller.clear();
  ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
          backgroundColor: Colors.lightBlue,
          content: Text("Task Added!",
        style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),


  )));
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        centerTitle: true,
       title: Text("Add Your Task",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color: Colors.deepOrange),),
      ),
      body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        TextField(
          controller: controller,
          decoration: InputDecoration(
            labelText: "Title",
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(
                color: Colors.black,
               width: 1.5
              ),
            ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.black,
                  width: 2
                ),
                borderRadius: BorderRadius.circular(10)
              )
          ),
        ),
        SizedBox(height: 15,),
        ElevatedButton(
          onPressed:(){
            addTask();
          },

          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.orange,
          ),
          child: Text("Add",
            style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold
            ),
          ),
        ),
      ],
    )
    );
  }
}

