import 'package:flutter/material.dart';
import 'homeBody.dart';
import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart';


class CalendarState extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => Calendar();
}

class Calendar extends State<StatefulWidget>{
  ScrollController _controller;
  var _currentDate;
  @override
 void initState() {
 _controller = ScrollController();
 _controller.addListener(_scrollListener);//the listener for up and down. 
 super.initState();
}
_scrollListener() {
  if (_controller.offset >= _controller.position.maxScrollExtent &&
     !_controller.position.outOfRange) {
   setState(() {//you can do anything here
   });
 }
 if (_controller.offset <= _controller.position.minScrollExtent &&
    !_controller.position.outOfRange) {
   setState(() {//you can do anything here
    });
  }
}
  Widget build(BuildContext context)
  {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.symmetric(horizontal: 16.0),
          child: CalendarCarousel(
            onDayPressed: (DateTime date, List events){
                 this.setState(() => _currentDate = date);
            },
            todayButtonColor: Colors.redAccent,
            weekdayTextStyle: TextStyle(color: Color(0xff777777)),
            weekendTextStyle: TextStyle(
            color: Colors.black,),
          ),
         height: 410.0,
        ),
        Row(
          children:[
        Padding(
        padding:EdgeInsets.symmetric(horizontal:10.0),
        child:Container(
        height:0.5,
        width:135.0,
        color:Color(0xff0500FF),),),
        Container( 
          child: Text('Today ${DateTime.now().day.toString()}', 
          style:TextStyle(fontSize: 20, color: Color(0xff0500FF))),
        ),
        Padding(
          padding:EdgeInsets.symmetric(horizontal:10.0),
          child:Container(
          height:0.5,
          width:135.3,
          color:Color(0xff0500FF),),),
        ],
        ),
        Expanded(
            child: Container(
              margin: const EdgeInsets.only(left: 16.0),
              child: ListView.separated(
              separatorBuilder: (context, index) => Divider(
                color: Colors.transparent,),
              itemCount: 6,
              itemBuilder: (BuildContext context, int index){
                return Tasks(index);
              },
            ),
        ),
        ),
         
        ],
    );
  }
}

class Tasks extends StatelessWidget{
  List<int> color = [0xffcfb845, 0xff077b8a, 0xffF66568, 0xff12a4d9, 0xff6b7b8c, 0xff2F4F4F]; 
  int i;
  Tasks(this.i);
  Widget build(BuildContext context){
    return Row(children: [
      Container(
        width: 7.0,
        height : 40.0,
        decoration: BoxDecoration(
        color: Color(color[i]),),
        ),
      Container(
        margin: EdgeInsets.only(left: 10),
        child: Text("Visit Doctor",
        style: TextStyle(fontFamily:"HappyMonkey", fontSize: 18),),
      ),
      Padding(
        padding: EdgeInsets.only(left: 180),
      child: Container(
        
        child: Text('12:15PM',
        style: TextStyle(color: Color(0xff666666)))
      ),
      ),
   ],
   );
  }
}
