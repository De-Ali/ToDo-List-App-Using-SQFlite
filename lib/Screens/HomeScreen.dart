import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sqflite_project/Screens/AddNoteScreen.dart';





class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  Widget _buildNote(int index){
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 25),
      child: Column(
        children: [
          ListTile(
            title: Text("Note Title"),
            subtitle: Text("Aug 16 , 2021 -High"),
            trailing: Checkbox(
              onChanged: (value){
                print(value);
              }, value: true,
              activeColor: Theme.of(context).primaryColor,

            ),
          ),
          Divider(height: 5.0,color: Colors.deepPurple,thickness: 2.0,),
        ],
      ),

    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: Colors.blueAccent,
        floatingActionButton: FloatingActionButton(
          backgroundColor: Theme.of(context).primaryColor,
          onPressed: (){
            Navigator.push(context, CupertinoPageRoute(builder: (_)=> AddNoteScreen()));
          },
          child: Icon(Icons.add),
        ),

      body: ListView.builder(
        padding: EdgeInsets.symmetric(vertical: 80.0),
        itemCount: 10,
          itemBuilder: (BuildContext context , int index){
          if(index==0){
            return Padding(
              padding: EdgeInsets.symmetric(vertical: 40, horizontal: 40),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("My Notes",
                    style: TextStyle(
                      fontWeight: FontWeight.normal,
                      fontSize: 40,
                      color: Colors.deepPurple,
                    ),
                  ),
                  SizedBox(height: 10,),
                  Text("0 of 10",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                      color: Colors.deepPurple,
                    ),
                  ),

                ],
              ),
            );

          }
          else {
              return _buildNote(index);
            }
          }

    ),
    );
  }
}
