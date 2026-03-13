import 'package:flutter/material.dart';
import 'TaskPage.dart';
import 'DetailsPage.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 40, left: 16, right: 16),
      child: Column(
        children: [
          Text(
            "My Tasks",
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 30,
                color: Colors.deepOrange),
          ),
          SizedBox(height: 20),
          Expanded(
            child: TaskInfo.tasks.isEmpty
                ? Center(
              child: Text(
                "No Tasks Yet",
                style: TextStyle(fontSize: 25),
              ),
            )
                : ListView.builder(
              itemCount: TaskInfo.tasks.length,
              itemBuilder: (context, index) {
                return Card(
                  margin: EdgeInsets.symmetric(vertical: 5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CheckboxListTile(
                        value: TaskInfo.isDone[index],
                        title: Text(
                          TaskInfo.tasks[index],
                          style: TextStyle(fontSize: 20),
                        ),
                        onChanged: (bool? value) {
                          setState(() {
                            TaskInfo.isDone[index] = value ?? false;
                          });
                        },
                      ),
                      Padding(padding: EdgeInsets.all(16),
                      child: TextButton(onPressed:(){
                        Navigator.push(context, MaterialPageRoute(
                            builder: (context){
                              return DetailsPage(
                                  task: TaskInfo.tasks[index],
                                  isDone: TaskInfo.isDone[index]
                              );
                            }

                        ));
                      }
                          , child: Text("Details",style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold),)),
                      )
                    ],
                  )
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}