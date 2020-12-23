import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
//import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'dart:math';
import 'calendar.dart';
import 'homeBody.dart';

class App extends StatelessWidget {
   final Future<FirebaseApp> _initialization = Firebase.initializeApp();
   @override
   Widget build(BuildContext context)
   {
     return FutureBuilder(
       future: _initialization,
       builder: (context, snapshot){
         if (snapshot.hasError)
          return Text('something');
          return MyHomePage();
       }
       );
   }
}

class MyApp extends StatelessWidget {
  
  @override
  
  Widget build(BuildContext context) {
    return MaterialApp(
      
      title: 'Welcome to Flutter',
      home: App(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HomePage();
  }

}

class HomePage extends State<StatefulWidget>{

  //var home = Body();
  int length = 1;
  //DateTime.now().minute.toString();
// var hour = DateTime.now().hour.toString();
  
  Widget ChangeBody()
  {
    if (e == 1)
      return Calendar();
    if (e == 0)
     return HomeBody();
    return Container(child:Text("hello"),);
  }

  void changeQuotesLength(int e) {
   // print(hour);
     // print(minute);DateTime.now().hour.toString()== "19" && DateTime.now().minute.toString() == "2"
    if (e == 0)
    setState(() {
      length = 1;
      if (length <= 2)
        length++;  
    },
    );
  }

  @override
  Widget build(BuildContext context)
  {
  return Scaffold(
        appBar: AppBar(
          title: Text('To-do++', style: TextStyle(color: Colors.black, fontFamily: 'HappyMonkey', fontSize: 25),),
           backgroundColor: Colors.transparent,
           elevation: 0,
        ),
        body: ChangeBody(),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: 0,
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
//creat a widget as a method give it paramater (color, quotes , author , date)

class Quotes extends StatelessWidget{
   List<String> date = ['Today', 'Yesterday'];
   List<int> clr = [0xff595DB2, 0xff353544];
    int i;
    String quote;
    String name;
    int colors;
    Quotes({this.colors, this.name, this.quote ,this.i});
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
                    color : Color(colors),
                    borderRadius: BorderRadius.all(Radius.circular(15.0))),
                  height : 300.0,
                  width: 300.0,
                  
                  child :
                  Column(
                   //c crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        padding: const EdgeInsets.only(left:30, top: 40, right :50),
                        child:
                        Text('$quote', style: TextStyle(fontFamily: 'AbhayaLibreSemiBold', fontSize: 28, color: Colors.white)),
                      ),
                      Container(
                        padding: const EdgeInsets.only(left: 150, bottom: 20, right: 0),
                        child:
                      Text('$name',
                        style: 
                            TextStyle(fontFamily: 'Inter', fontSize: 15, color: Colors.white)),
                      ),
                  ]
                  ),
                  )
                ],
              ); 
  }
}
// Future <dynamic> getData() async{
  var data =  FirebaseDatabase.instance.reference().once();
  // return (data);
// } 
class GettingData extends StatelessWidget{
  static List<String> textQuote;
  int ind;
  static int temp;
 // static bool flag ;
 // flag = false;
  GettingData(this.ind);
  var random = new Random();
  static var rand;
  static var flag = 0;
  static int flag1 = 0;
  Widget build(BuildContext context){
   return FutureBuilder(
    future: data,
    builder :(BuildContext context, AsyncSnapshot snapshot)
    {
      if (!snapshot.hasData)
        return Container();
      if (snapshot.hasData)
      {
        if (ind == 0 && flag == 0)
        {
          flag = 1;
          rand = random.nextInt(13);
          temp = rand;
        }
        if (ind == 0)
        {   if (flag1 == 4)
             temp = rand;
            if (flag == 2)
              rand = random.nextInt(13);      
            flag = 2;
            return Quotes(colors:int.parse(snapshot.data.value[rand]['color']), name:snapshot.data.value[rand]['name'] ,quote:snapshot.data.value[rand]['quote'], i:ind);
        } else { 
          flag1 = 4;
          return Quotes(colors:int.parse(snapshot.data.value[temp]['color']), name:snapshot.data.value[temp]['name'] ,quote:snapshot.data.value[temp]['quote'], i:ind);
        }
      }
      return Container();
    },
    );
  }
}