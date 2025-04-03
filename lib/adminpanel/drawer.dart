import 'package:educationapk/main.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class MyDrawer extends StatelessWidget {

  final String url = "https://celestial-deepak.vercel.app/";

  void _launchURL() async {
    final Uri uri = Uri.parse("https://celestial-deepak.vercel.app/");

    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      throw 'Could not launch $uri';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            decoration: BoxDecoration(color: Colors.blueGrey),
            accountName: Text("Admin Panel",style: TextStyle(fontFamily: 'nexaheavy',fontSize: 18),),
            accountEmail: Text("gpkashipur@gmail.com",style: TextStyle(fontFamily: 'nexalight',fontSize: 16),),
            currentAccountPicture: CircleAvatar(
              backgroundColor: Colors.transparent,
              child: Icon(Icons.manage_accounts,color: Colors.black,size: 70,),// Admin Profile Image
            ),
          ),
          ListTile(
            leading: Icon(Icons.dashboard),
            title: Text("Developer's",style: TextStyle(fontFamily: 'nexaheavy',fontSize: 18),),
            onTap: _launchURL,
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text("Settings",style: TextStyle(fontFamily: 'nexaheavy',fontSize: 18),),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.logout),
            title: Text("Logout",style: TextStyle(fontFamily: 'nexaheavy',fontSize: 18),),
            onTap: () => logout()
          ),
        ],
      ),
    );
  }
}
