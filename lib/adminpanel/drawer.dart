import 'package:educationapk/main.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
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
            title: Text("Dashboard",style: TextStyle(fontFamily: 'nexaheavy',fontSize: 18),),
            onTap: () {
              Navigator.pushNamed(context, "/adminDashboard");
            },
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
