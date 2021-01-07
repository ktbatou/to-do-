import 'package:flutter/cupertino.dart';
import 'homePage.dart';
import 'package:flutter/material.dart';

class SettingState extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => Setting();
}

class Setting extends State<StatefulWidget>{
  bool status = false;
  @override
  Widget build(BuildContext context)
  {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      //mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children:[
          Container(
            child:Align(
              alignment: Alignment.center,
              child :
             Text("Settings",style: 
              TextStyle(fontFamily: 'InterL', fontSize: 25),),
            ),),
            Container(
              margin: const EdgeInsets.only(top: 10.0, left: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
             // margin: const EdgeInsets.only(left: 140, top: 10),
              children:[
                Text("Notifications",style: 
                TextStyle(fontFamily: 'Inter', fontSize: 20),),
                Switch(
                  value: status,
                  onChanged: (value){
                    setState(() {
                      status = value;
                    });
                  },
                ),
            ],),
            ),
            Container(
              child: Divider(color: Colors.black,
              indent: 20,
            endIndent: 20,
              )
            ),
            Container(
              margin: const EdgeInsets.only(bottom: 10.0, top: 10.0, left: 20.0),
              child:  Text("ABOUT",style: 
                TextStyle(fontFamily: 'Inter', fontSize: 20),),
            ),
            ],
    );
  }
}
