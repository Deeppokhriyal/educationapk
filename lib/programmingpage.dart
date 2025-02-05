import 'package:flutter/material.dart';
class programmingpage extends StatefulWidget {
  const programmingpage({super.key});

  @override
  State<programmingpage> createState() => _programmingpageState();
}

class _programmingpageState extends State<programmingpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Column(
        children:[ Container(
            padding: EdgeInsets.all(10),
            margin: EdgeInsets.all(17),
            height: 130,
            width: 370,
            decoration:
            BoxDecoration(
              color: Colors.white54, // Background color
              borderRadius: BorderRadius.circular(20),// Rounded corners
              boxShadow: [
                BoxShadow(
                  color: Colors.lightBlueAccent, // Shadow color
                  blurRadius: 8, // Shadow blur radius
                  offset: Offset(0, 6), // Shadow offset
                ),
              ],
            ),
            child: Column(mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(Icons.border_all,size: 45,color: Colors.black),
                    SizedBox(width: 12,),
                    Column(mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Study',style: TextStyle(fontFamily: 'sans-serif-light',fontSize: 22),),
                        Text(' Material',style: TextStyle(fontFamily: 'sans-serif-thin',fontSize: 13),),
                      ],
                    ),
                    SizedBox(width: 162,),
                    Icon(Icons.arrow_forward_ios_outlined,size: 35,color: Colors.black),
                  ],
                ),
              ],
            )
        ),
    ]
      ),
    );
  }
}
