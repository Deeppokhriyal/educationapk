import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_typedefs/rx_typedefs.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

class Profilepage extends StatelessWidget {
  const Profilepage ({super.key});

  @override
  Widget build(BuildContext context) {
    var isDark = MediaQuery.of(context).platformBrightness == Brightness.dark;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: (){}, icon: Icon(LineAwesomeIcons.angle_left_solid)),
        title: Text('Profile', style: TextStyle(fontWeight: FontWeight.normal,letterSpacing: 0.2),),
        actions: [
          IconButton(onPressed: (){}, icon: Icon(isDark? LineAwesomeIcons.sun : LineAwesomeIcons.moon))
        ],
      ),
      body: Stack(
        children:[ Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/blueback.jpg'), // Path to your background image
              fit: BoxFit.cover,
            ),
          ),
          child: SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.all(15),
              child: Column(
                children: [
                  Stack(
                    children:[
                      SizedBox(
                      width: 100, height: 100,
                      child: ClipRRect(
                          borderRadius:BorderRadius.circular(100) ,
                          child: Image(image: AssetImage("assets/images/facebook.png"))),
                    ),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: Container(
                          width: 30,
                          height: 30,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            color: Colors.amber,
                          ),
                          child: Icon(LineAwesomeIcons.pencil_alt_solid, size: 20, color: Colors.black),
                        ),
                      )
                  ]
                  ),
                  SizedBox(height: 10),
                  Text('Name'),
                  Text('Branch'),
                  SizedBox(height: 20,),
                  SizedBox(
                    width: 200,
                    child: ElevatedButton(onPressed: (){},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.amber, side: BorderSide.none, shape:  StadiumBorder()),
                      child: Text("Edit Profile",style: TextStyle(color: Colors.black),),
                        )
                  ),
                  SizedBox(height: 30),
                  Divider(),
                  SizedBox(height: 10,),

                  ProfileMenuWidget(title: "Settings", icon: LineAwesomeIcons.cog_solid,onPress: (){},),
                  ProfileMenuWidget(title: "Billing Details", icon: LineAwesomeIcons.wallet_solid,onPress: (){},),
                  ProfileMenuWidget(title: "User Management", icon: LineAwesomeIcons.user_check_solid,onPress: (){},),
                  const Divider(color: Colors.grey,),
                  const SizedBox(height: 10,),
                  ProfileMenuWidget(title: "Information", icon: LineAwesomeIcons.info_solid,onPress: (){},),
                  ProfileMenuWidget(title: "Logout",
                    icon: LineAwesomeIcons.sign_out_alt_solid,
                    textColor:Colors.red,
                      endIcon: false,
                      onPress: (){},),
                ],
              ),
            ),
          ),
        ),
      ]
      ),
    );
  }
}

class ProfileMenuWidget extends StatelessWidget {
  const ProfileMenuWidget({
    super.key,
    required this.title,
    required this.icon,
    required this.onPress,
    this.endIcon = true,
    this.textColor,
  });
  final String title;
  final IconData icon;
  final Callback onPress;
  final bool endIcon;
  final Color? textColor;


  @override
  Widget build(BuildContext context) {
    var isDark = MediaQuery.of(context).platformBrightness == Brightness.dark;
    var iconColor = isDark? Colors.amber : Colors.lightBlueAccent[100];

    return ListTile(
      onTap: onPress,
      leading: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color: Colors.blueGrey[50],
        ),
        child: Icon(icon,color: iconColor),
      ),
      title: Text(title,style: TextStyle(color: Colors.black).apply(color: textColor),),
      trailing:  endIcon? Container(
          width: 30,
          height: 30,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            color: Colors.blueGrey[50],
          ),
          child: Icon(LineAwesomeIcons.angle_right_solid, size: 18.0, color: Colors.grey),
    ):null,
    );
  }
}
