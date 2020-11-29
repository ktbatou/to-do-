import 'package:flutter/material.dart';
//import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async
{
  await Firebase.initializeApp();
   runApp(MyApp());
}

class MyApp extends StatelessWidget {
  
  @override
  
  Widget build(BuildContext context) {
    return MaterialApp(
      
      title: 'Welcome to Flutter',
      home: Scaffold(
        appBar: AppBar(
          title: Text('To-do++', style: TextStyle(color: Colors.black, fontFamily: 'HappyMonkey', fontSize: 25),),
           backgroundColor: Colors.transparent,
           elevation: 0,
        ),
        body: Container(
          margin: const EdgeInsets.only(left: 16.0),
          child: ListView.builder(
            itemCount: 2,
            itemBuilder: (BuildContext ctxt, int index){
              return Quotes(index);
            },
            )
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>
          [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.calendar_today),
                label: 'Calendar',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.settings),
                label: 'Settings',
              ),
          ],),
      ),
    );
  }
}

//creat a widget as a method give it paramater (color, quotes , author , date)

class Quotes extends StatelessWidget{
   List<String> date = ['Today', 'Yesterday'];
   List<int> clr = [0xff595DB2, 0xff353544];
    int i;
   // var str = ''; 
    Quotes(this.i);
  Widget build(BuildContext context){
   
    return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [ 
                Container(
                  margin: const EdgeInsets.only(bottom: 10.0, top: 10.0, left: 5.0),
                  child :
                  Text("${date[i]}'s Quote", style: TextStyle(fontFamily: 'AbeeZee', fontSize: 25),),
                  ),
                Container(
                  decoration: BoxDecoration(
                    color : Color(clr[i]),
                    borderRadius: BorderRadius.all(Radius.circular(5.0))),
                  height : 350.0,
                  width: 340.0,
                  child :
                    Text('hello world'),
                  )
                ],
              ); 
  }
}
