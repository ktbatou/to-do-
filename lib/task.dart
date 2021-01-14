import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/semantics.dart';

class TaskState extends StatefulWidget{
  var dayy;
  TaskState(this.dayy);
  @override 
  State<StatefulWidget> createState() => Task(dayy);
}

class Task extends State<StatefulWidget>{
  @override 
  var dayy;
  List<String> months = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"];
  Task(this.dayy);
  Widget build(BuildContext context)
  {
    return Scaffold(
      appBar: AppBar(
       // margin: const EdgeInsets.only(right: 100.0),
          title: Text('${dayy.day.toString()}, ${months[dayy.month - 1]}',
           style: TextStyle(color: Colors.black, fontFamily: 'Inter', fontSize: 25),),
           backgroundColor: Colors.transparent,
           elevation: 50,
        ),
      //color: Colors.white,
      body: Column(
      children: [
      Container(
        margin: EdgeInsets.only(left: 20, top: 20),
        child: Text('To Do', style: TextStyle(fontSize:25, color: Colors.grey, )), 
      ),
      Padding(
          padding:EdgeInsets.symmetric(horizontal:10.0),
          child:Container(
          height:0.5,
          width:400.3,
          color:Colors.grey,),),  
      ],
      ),
    );
  }
}