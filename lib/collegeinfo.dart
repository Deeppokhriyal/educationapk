import 'package:flutter/material.dart';

    class Collegeinfo extends StatelessWidget {
    const Collegeinfo({super.key});

    @override
    Widget build(BuildContext context) {
    return Scaffold(
    backgroundColor: Colors.transparent,
    body: ListView(
    children:[ Stack(
    children:[Container(
    decoration: BoxDecoration(
    image: DecorationImage(
    image: NetworkImage('https://img.freepik.com/free-vector/navy-blue-geometrical-patterned-mobile-wallpaper-vector_53876-167963.jpg?ga=GA1.1.1037380694.1733420579&semt=ais_hybrid'), // Path to your background image
    fit: BoxFit.cover
    ),
    ),
    child: Column(
    children:[ Container(
    padding: EdgeInsets.only(top: 10),
    alignment: Alignment.center,
    margin: EdgeInsets.all(10.0),
    height: 200,
    child: Row(
    children: [
    Image.asset('assets/images/cb.png',height: 150,width: 120,),
    SizedBox(width: 2,),
    Text('Government Polytechnic ,\nKashipur ,\nU.S.Nagar Uttarakhand',style:
    TextStyle(fontFamily: 'nexaheavy',fontSize: 18,color: Colors.white),),
    ]
    ),
    ),
    SizedBox(height: 5),
    Container( padding: EdgeInsets.all(20),
    child: Column(crossAxisAlignment: CrossAxisAlignment.start,
    children: [
    Text('About :',style: TextStyle(fontFamily: 'nexaheavy',fontSize: 25,color: Colors.lightBlueAccent),),
    SizedBox(height: 10,),
    Text('Government Polytechnic, Kashipur (GPK) was established in 1975 as one of the most efficient institute in Uttarakhand.'
        ' Associated to Uttarakhand board of technical education Roorkee( UBTER ) . Entrance exam conducted by UBTER every year'
        'through councelling students are selected for G.P.Kashipur. Government Polytechnic Kashipur offers various diploma courses.',
    style: TextStyle(fontFamily: 'nexalight',fontSize: 18,color: Colors.white ),),
    SizedBox(height: 20,),
    Text('Some Specification about G.P.Kashipur:',style: TextStyle(fontFamily: 'nexaheavy',fontSize: 25,color: Colors.lightBlueAccent),),

        Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
                Divider(height: 20,),
                Text('Establish : 1975',style: TextStyle(fontFamily: 'nexalight',color: Colors.white, fontSize: 20),),
                Divider(height: 20,),
                Text('Campus Size :	15 acres',style: TextStyle(fontFamily: 'nexalight',color: Colors.white, fontSize: 20),),
                Divider(height: 20,),
                Text('Faculty Count : 35+',style: TextStyle(fontFamily: 'nexalight',color: Colors.white, fontSize: 20),),
                Divider(height: 20,),
                Text('Student Count : 1250',style: TextStyle(fontFamily: 'nexalight',color: Colors.white, fontSize: 20),),
                Divider(height: 20,),
                Text('Gender : Co-ed',style: TextStyle(fontFamily: 'nexalight',color: Colors.white, fontSize: 20),),
                Divider(height: 20,),
                Text('Institute Type : Affiliated College',style: TextStyle(fontFamily: 'nexalight',color: Colors.white, fontSize: 20),),
                Divider(height: 20,),
                Text('Courses	: 9 Courses',style: TextStyle(fontFamily: 'nexalight',color: Colors.white, fontSize: 20),),
                Divider(height: 20,),
                Text('Approvals	: AICTE, PCI',style: TextStyle(fontFamily: 'nexalight',color: Colors.white, fontSize: 20),),
                Divider(height: 20,),

            ],
        ),
        SizedBox(height: 20,),
        Text('Overview :',style: TextStyle(fontFamily: 'nexaheavy',fontSize: 25,color: Colors.lightBlueAccent),),
        SizedBox(height: 10,),
        Text('Location -',style: TextStyle(fontFamily: 'nexaheavy',fontSize: 18,color: Colors.greenAccent,fontWeight: FontWeight.bold),),
        SizedBox(height: 10,),
        Text('Address: Manpur Rd, Kashipur, Uttarakhand 244713'
            '\nPhone: 05947297200',style: TextStyle(fontFamily: 'nexalight',fontSize: 18,color: Colors.white,fontWeight: FontWeight.bold),),
       SizedBox(height: 20,),

        InteractiveViewer(
            panEnabled: true, // Allows panning
            boundaryMargin: EdgeInsets.all(0),
            minScale: 1.0,
            maxScale: 4.0, // Zoom limit
            child: Image.asset(
                'assets/images/map.png', // Replace with your image URL or Asset
                fit: BoxFit.contain, // Ensures the image fits within the screen
            ),
        ),
    ]
    ),
    ),
    ]
    ),
    ),
    ]
    ),
    ]
    ),
    );
    }
    }
