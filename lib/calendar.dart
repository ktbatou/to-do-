import 'package:flutter/material.dart';
import 'homePage.dart';

class Calendar extends State<StatefulWidget>{
  int length = 1;
  //DateTime.now().minute.toString();
// var hour = DateTime.now().hour.toString();
  

  void changeQuotesLength(int e) {
   // print(hour);
     // print(minute);DateTime.now().hour.toString()== "19" && DateTime.now().minute.toString() == "2"
    if (e == 0)
    setState(() {
      length = 1;
      if (length <=  2)
        length++;  
    },
    );
    else if (e == 1)
     // Calendar();
     
  }
  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
        appBar: AppBar(
          title: Text('To-do++', style: TextStyle(color: Colors.black, fontFamily: 'HappyMonkey', fontSize: 25),),
           backgroundColor: Colors.transparent,
           elevation: 1,
        ),
        body: Container(
          margin: const EdgeInsets.only(left: 16.0),
            color: Colors.black,
            ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: 1,
          onTap: (e) => changeQuotesLength(e),
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
      );
}
}
