import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sqflite_project/Screens/HomeScreen.dart';



class AddNoteScreen extends StatefulWidget {
  const AddNoteScreen({Key? key}) : super(key: key);

  @override
  State<AddNoteScreen> createState() => _AddNoteScreenState();
}

class _AddNoteScreenState extends State<AddNoteScreen> {

  final _formKey = GlobalKey<FormState>();
  String _title= "";
  String _priority ="Low";
  String _btntext ="Add note";
  String _titletext ="Add note";

  TextEditingController _dateController = TextEditingController();
  DateTime _date = DateTime.now();
   final DateFormat _dateFormatter = DateFormat("MMM dd YYYY");
  final List <String> _priorites = ["Low", "Medium", "High"];

  _handleDatePicker()async{
    final DateTime? date = await showDatePicker(
        context: context,
        initialDate: _date,
        firstDate: DateTime(2000),
        lastDate: DateTime(2100),
    );
    if (date !=null && date !=_date){
      setState(() {
        _date=date;
      });
      _dateController.text = _dateFormatter.format(date);
    }
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueAccent,
      body: GestureDetector(
        onTap: (){},
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 80, horizontal: 40),

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: (){
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (_)=> HomeScreen(),));

                  },
                  child: Icon(Icons.arrow_back, size: 30, color: Theme.of(context).primaryColor,),
                ),
                SizedBox(height: 20,),
                Text("Add Note",
                  style: TextStyle(
                    fontWeight: FontWeight.normal,
                    fontSize: 40,
                    color: Colors.deepPurple,
                  ),
                ),
                SizedBox(height: 10,),
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      Padding(
                          padding: EdgeInsets.symmetric(vertical: 20),
                        child: TextFormField(
                          style: TextStyle(fontSize: 18),
                          decoration: InputDecoration(
                            labelText: "Title",
                            labelStyle: TextStyle(fontSize: 18),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            )
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 20),
                        child: TextFormField(
                          controller: _dateController,
                          readOnly: true,
                          style: TextStyle(fontSize: 18),
                          onTap: _handleDatePicker,
                          decoration: InputDecoration(
                              labelText: "Date",
                              labelStyle: TextStyle(fontSize: 18),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              )
                          ),
                        ),
                      ),
                      Padding(
                          padding: EdgeInsets.symmetric(vertical: 20),
                        child: DropdownButtonFormField(
                          items: _priorites.map((String priority){

                            return DropdownMenuItem(
                              value: priority,
                                child: Text(
                                    priority,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 18,
                                  ),
                                ),
                            );
                          }).toList(),
                          style: TextStyle(
                            fontSize: 18,

                          ),
                          decoration: InputDecoration(
                            labelText: "Priority",
                            labelStyle: TextStyle(fontSize: 18),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),

                          ),
                          onChanged: (value){
                            setState(() {
                              _priority = value.toString();
                            });
                          },
                          value : _priority,

                        ),
                      ),

                      Container(
                        margin: EdgeInsets.symmetric(vertical: 20),
                        height: 60,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Theme.of(context).primaryColor,
                          borderRadius: BorderRadius.circular(30),

                        ),
                        child: ElevatedButton(
                          child: Text(
                            _btntext,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                            ),
                          ),
                          onPressed: (){},
                        ),
                      ),

                    ],
                  ),
                    ),




              ],
            ),
          ),
        ),
      ),
    );
  }
}
