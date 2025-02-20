import 'package:flutter/material.dart';

class ApplicationsPage extends StatelessWidget {
  const ApplicationsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            padding: EdgeInsets.fromLTRB(20, 40, 20, 0),
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage('https://img.freepik.com/free-vector/abstract-colorful-low-poly-triangle-shapes_361591-4154.jpg?uid=R186427419&ga=GA1.1.722819559.1729949704&semt=ais_hybrid'), // Path to your background image
                  fit: BoxFit.cover
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Application\'s',style: TextStyle(color: Colors.black,fontSize: 30,fontFamily: 'nexalight'),
                ),
                Divider(color: Colors.black,),
                SizedBox(height: 80,),
                Center(
                  child: Column(
                    children: [
                      Container(
                        height: 160,
                        child:
                        Image.network('https://img.icons8.com/?size=128&id=48162&format=png',
                        fit: BoxFit.cover,)
                      
                      ),
                      Text('No Applications Available',style: TextStyle(color: Colors.black,fontSize: 26,fontFamily: 'nexaheavy'),),
                      SizedBox(height: 10),
                      Text(
                        'Currently, there are no applications in the teacher application panel.',textAlign: TextAlign.center,style: TextStyle(color: Colors.black,fontSize: 20,fontFamily: 'nexalight'),

                      ),
                    ],
                  ),
                )

              ],
            ),
          ),
        ],
      )
      
    );
  }
}
