import 'package:flutter/cupertino.dart';
import 'homePage.dart';
import 'package:flutter/material.dart';

class BodyState extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => HomeBody();
}

class HomeBody extends State<StatefulWidget>{
  @override
 // HomeBody createState() => HomeBody();
  Widget build(BuildContext context)
  {
    return Container(
          margin: const EdgeInsets.only(left: 16.0),
          child: ListView.builder(
            itemCount: 2,
            itemBuilder: (BuildContext context, int index){
              return GettingData(index);
            },
            )
        );
  }
}