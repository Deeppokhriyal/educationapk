import 'package:educationapk/updateprofile.dart';
import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_typedefs/rx_typedefs.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

class Profilepage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
          children:[
            Stack(
                children:[ Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/blueback.jpg'), // Path to your background image
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Container(
                    padding: EdgeInsets.all(15),
                    child: Column(
                      children: [
                        Stack(
                            children:[Container(
                              padding: EdgeInsets.only(left: 10,top: 25),
                              child: Row(
                                children: [
                                  IconButton(onPressed: (){}, icon: Icon(LineAwesomeIcons.angle_left_solid,size: 30,color: Colors.white,)),
                                  SizedBox(width: 5,),
                                  Text('Profile', style: TextStyle(fontFamily: 'sans-serif-light',letterSpacing: 0.2,color: Colors.white),),
                                ],
                              ),
                            ),
                              Container(
                                padding: EdgeInsets.only(left: 140,top: 100),
                                child: SizedBox(
                                  width: 100, height: 100,
                                  child: ClipRRect(
                                      borderRadius:BorderRadius.circular(100) ,
                                      child: Image(image: AssetImage("assets/images/facebook.png"))),
                                ),
                              ),
                              Positioned(
                                bottom: 0,
                                right: 150,
                                child: Container(
                                  width: 25,
                                  height: 25,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(100),
                                    color: Colors.amber,
                                  ),
                                  child: Icon(LineAwesomeIcons.pencil_alt_solid, size: 18, color: Colors.black),
                                ),
                              )
                            ]
                        ),
                        SizedBox(height: 10),
                        Text('Deep',style: TextStyle(fontFamily: 'sans-serif-light',color: Colors.white,fontSize: 20),),
                        SizedBox(height: 10,),
                        Text('Information Technology',style: TextStyle(fontFamily: 'sans-serif-thin',color: Colors.white),),
                        SizedBox(height: 20,),
                        SizedBox(
                            width: 200,
                            child: ElevatedButton(onPressed: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>UpdateProfilePage()));
                            },
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.lightBlueAccent, side: BorderSide.none, shape:  StadiumBorder()),
                              child: Text("Edit Profile",style: TextStyle(color: Colors.black),),
                            )
                        ),
                        SizedBox(height: 30),
                        Divider(),
                        SizedBox(height: 10,),

                        ProfileMenuWidget(title: "Settings" ,textColor: Colors.white,icon: LineAwesomeIcons.cog_solid,onPress: (){},),
                        ProfileMenuWidget(title: "Billing Details",textColor: Colors.white, icon: LineAwesomeIcons.wallet_solid,onPress: (){},),
                        ProfileMenuWidget(title: "Settings" ,textColor: Colors.white,icon: LineAwesomeIcons.cog_solid,onPress: (){},),
                        ProfileMenuWidget(title: "Billing Details",textColor: Colors.white, icon: LineAwesomeIcons.wallet_solid,onPress: (){},),
                        ProfileMenuWidget(title: "Settings" ,textColor: Colors.white,icon: LineAwesomeIcons.cog_solid,onPress: (){},),
                        ProfileMenuWidget(title: "Billing Details",textColor: Colors.white, icon: LineAwesomeIcons.wallet_solid,onPress: (){},),
                        ProfileMenuWidget(title: "User Management",textColor: Colors.white, icon: LineAwesomeIcons.user_check_solid,onPress: (){},),
                        const Divider(color: Colors.grey,),
                        const SizedBox(height: 10,),
                        ProfileMenuWidget(title: "Information",textColor: Colors.white, icon: LineAwesomeIcons.info_solid,onPress: (){},),
                        ProfileMenuWidget(title: "Logout",icon: LineAwesomeIcons.sign_out_alt_solid,textColor:Colors.red,endIcon: false,
                          onPress: (){},),
                      ],
                    ),
                  ),
                ),
                ]
            ),

          ]        ),
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
    this.fontFamily='sans-serif-light',
  });
  final String title;
  final IconData icon;
  final Callback onPress;
  final bool endIcon;
  final Color? textColor;
  final String fontFamily;


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
      title: Text(title,style: TextStyle(color: Colors.black,fontFamily: 'sans-serif-light').apply(color: textColor),),
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
