import 'package:flutter/material.dart';

void main() => runApp(MyApp());

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
              return Quotes();
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

class Quotes extends StatelessWidget {
  Widget build(BuildContext context){
    return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [ 
                Container(
                  margin: const EdgeInsets.only(bottom: 10.0, top: 10.0, left: 5.0),
                  child :
                  Text("Today's Quote", style: TextStyle(fontFamily: 'AbeeZee', fontSize: 25),),
                  ),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.all(Radius.circular(5.0))),
                  height : 300.0,
                  width: 400.0,
                  )
                ],
              ); 
  }
}