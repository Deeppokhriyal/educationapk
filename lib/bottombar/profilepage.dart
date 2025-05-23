 import 'dart:convert';
import 'dart:io';
import 'package:animate_do/animate_do.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:educationapk/bottombar/updateprofile.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../main.dart';

class ProfilePage extends StatefulWidget {
  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final FirebaseAuth auth = FirebaseAuth.instance;
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  bool _isLoading = true;
  String name = "";
  String StudentProfile = "";
  String email = "";
  String phone = "";
  String github = "";
  String instagram = "";
  String location = "";

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    fetchUserData(); // Fetch data whenever dependencies change (i.e., page is navigated to)
    getStudentProfile();
  }

  void refreshStudentProfile() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      StudentProfile = prefs.getString('StudentProfile') ?? "";
    });
  }

  void getStudentProfile() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? storedImage = prefs.getString('StudentProfile');

    if (storedImage != null && storedImage.isNotEmpty) {
      setState(() {
        StudentProfile = storedImage;
      });
    }
  }



  Future<void> fetchUserData() async {
    setState(() => _isLoading = true);
    try {
      User? user = auth.currentUser;
      if (user == null) {
        print("User not logged in");
        return;
      }
      print("Fetching data for User ID: ${user.uid}");

      DocumentSnapshot userData =
          await firestore.collection("users").doc(user.uid).get();

      if (userData.exists) {
        print("User Data: ${userData.data()}");

        setState(() {
          name = userData["name"] ?? "";
          email = userData["email"] ?? "";
          phone = userData["phone"] ?? "";
          github = userData["github"] ?? "";
          instagram = userData["instagram"] ?? "";
          location = userData["location"] ?? "";
          StudentProfile = userData["StudentProfile"] ?? "";
          _isLoading = false; // Data load hone ke baad loader band karo
        });

        SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setString('StudentProfile', StudentProfile);

      } else {
        print("Document does not exist");
        setState(() => _isLoading = false);
      }
    } catch (e) {
      print("Error while fetching user data: $e");
      setState(() => _isLoading = false);
    }
  }

  void showEditDialog(String title, String field, String currentValue) {
    TextEditingController controller =
        TextEditingController(text: currentValue);
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Colors.purple[100],
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(40), // Border Radius 40
          ),
          title: Text("Edit $title", style: TextStyle(fontFamily: 'nexaheavy')),
          content: TextField(
              controller: controller,
              style: TextStyle(fontFamily: 'nexalight')),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text("Cancel",
                  style: TextStyle(
                      fontFamily: 'nexalight',
                      fontSize: 16,
                      color: Colors.black)),
            ),
            ElevatedButton(
              onPressed: () async {
                User? user = auth.currentUser;
                if (user != null) {
                  await firestore.collection("users").doc(user.uid).update({
                    field: controller.text,
                  });
                  setState(() {
                    if (field == "name") name = controller.text;
                    if (field == "email") email = controller.text;
                    if (field == "phone") phone = controller.text;
                    if (field == "github") github = controller.text;
                    if (field == "instagram") instagram = controller.text;
                    if (field == "location") location = controller.text;
                  });
                }
                Navigator.pop(context);
              },
              child: Text("Save",
                  style: TextStyle(
                      fontFamily: 'nexalight',
                      fontSize: 16,
                      color: Colors.black)),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: _isLoading
          ? Center(
              child: SpinKitCubeGrid(
                color: Colors.purple, // Customize color
                size: 50.0, // Adjust size
              ),
            )
          : ListView(
              children: [
                Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                        colors: [
                          Colors.deepPurple,
                          Colors.purple,
                          Colors.pinkAccent,
                          Colors.pink
                        ],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      )),
                      child: SlideInUp(
                        duration: Duration(milliseconds: 400),
                        child: Column(
                          children: [
                            Container(
                              padding: EdgeInsets.all(15),
                              child:
                              Column(
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      CircleAvatar(
                                        radius: 50,
                                        backgroundColor: Colors.transparent, // Remove background color
                                        child: StudentProfile.isEmpty
                                            ? SpinKitRipple(color: Colors.black, size: 50.0) // Ripple Loader
                                            : ClipOval(
                                          child: StudentProfile.startsWith("http")
                                              ? Image.network(
                                            StudentProfile,
                                            fit: BoxFit.cover,
                                            width: 100,
                                            height: 100,
                                            loadingBuilder: (context, child, loadingProgress) {
                                              if (loadingProgress == null) return child;
                                              return SpinKitRipple(color: Colors.purple, size: 50.0);
                                            },
                                          )
                                              : Image.memory(
                                            base64Decode(StudentProfile),
                                            fit: BoxFit.cover,
                                            width: 100,
                                            height: 100,
                                          ),
                                        ),
                                      ),

                                    ],
                                  ),
                                  SizedBox(height: 10),
                                  Text(name,
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 23,
                                          fontFamily: 'nexalight')),
                                  SizedBox(height: 10),
                                  ElevatedButton(
                                    onPressed: () async {
                                      await Get.to(() => UpdateProfilePage());
                                      fetchUserData(); // Reload data when returning
                                    },
                                    child: Text("Edit Profile",
                                        style: TextStyle(
                                            fontFamily: 'nexaheavy',
                                            fontSize: 16,
                                            color: Colors.black)),
                                  ),
                                  Divider(color: Colors.grey, height: 35),
                                  SlideInLeft(
                                    duration: Duration(milliseconds: 300),
                                    child: Text(
                                      'Personal Information',
                                      style: TextStyle(
                                          fontFamily: 'nexaheavy',
                                          color: Colors.white,
                                          fontSize: 25),
                                    ),
                                  ),
                                  SizedBox(width: 10),
                                  SlideInRight(
                                    duration: Duration(milliseconds: 300),
                                    child: Column(
                                      children: [
                                        ProfileMenuWidget(
                                            title: "Email",
                                            icon: Icons.mail,
                                            value: email,
                                            onPress: () => showEditDialog(
                                                "Email", "email", email)),
                                        ProfileMenuWidget(
                                            title: "Phone",
                                            icon: Icons.phone,
                                            value: phone,
                                            onPress: () => showEditDialog(
                                                "Phone", "phone", phone)),
                                        ProfileMenuWidget(
                                            title: "GitHub",
                                            icon: LineAwesomeIcons.github,
                                            value: github,
                                            onPress: () => showEditDialog(
                                                "GitHub", "github", github)),
                                        ProfileMenuWidget(
                                            title: "Instagram",
                                            icon: LineAwesomeIcons.instagram,
                                            value: instagram,
                                            onPress: () => showEditDialog(
                                                "Instagram",
                                                "instagram",
                                                instagram)),
                                        ProfileMenuWidget(
                                            title: "Location",
                                            icon: Icons.location_city,
                                            value: location,
                                            onPress: () => showEditDialog(
                                                "Location",
                                                "location",
                                                location)),
                                      ],
                                    ),
                                  ),
                                  Divider(color: Colors.grey, height: 35),
                                  SlideInLeft(
                                    duration: Duration(milliseconds: 400),
                                    child: Text(
                                      'Utilities',
                                      style: TextStyle(
                                          fontFamily: 'nexaheavy',
                                          color: Colors.white,
                                          fontSize: 25),
                                    ),
                                  ),
                                  SizedBox(width: 10),
                                  SlideInRight(
                                    duration: Duration(milliseconds: 400),
                                    child: Container(
                                      padding: EdgeInsets.all(15),
                                      child: Column(
                                        children: [
                                          GestureDetector(
                                            onTap: () {
                                              Get.to(() => BugReport());
                                            },
                                            child: Row(
                                              children: [
                                                Icon(
                                                    LineAwesomeIcons
                                                        .user_check_solid,
                                                    color: Colors.black,
                                                    size: 30),
                                                SizedBox(width: 15),
                                                Text('Bug Report',
                                                    style: TextStyle(
                                                        fontFamily: 'nexaheavy',
                                                        fontSize: 17,
                                                        color: Colors.white)),
                                              ],
                                            ),
                                          ),
                                          SizedBox(height: 30),
                                          GestureDetector(
                                            onTap: () {
                                              Get.to(() => AskHelpDesk());
                                            },
                                            child: Row(
                                              children: [
                                                Icon(
                                                    LineAwesomeIcons.info_solid,
                                                    color: Colors.black,
                                                    size: 30),
                                                SizedBox(width: 15),
                                                Text('Ask Help Desk',
                                                    style: TextStyle(
                                                        fontFamily: 'nexaheavy',
                                                        fontSize: 17,
                                                        color: Colors.white)),
                                              ],
                                            ),
                                          ),
                                          SizedBox(height: 30),
                                          GestureDetector(
                                            onTap: () {
                                              logout();
                                            },
                                            child: Row(
                                              children: [
                                                Icon(Icons.logout,
                                                    color: Colors.black,
                                                    size: 30),
                                                SizedBox(width: 15),
                                                Text('Logout',
                                                    style: TextStyle(
                                                        fontFamily: 'nexaheavy',
                                                        fontSize: 17,
                                                        color: Colors.white)),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
    );
  }
}

// ProfileMenuWidget  ProfileMenuWidget  ProfileMenuWidget  ProfileMenuWidget  ProfileMenuWidget  ProfileMenuWidget  ProfileMenuWidget

class ProfileMenuWidget extends StatelessWidget {
  final String title;
  final String value;
  final IconData icon;
  final VoidCallback onPress;
  final Color? textColor;

  ProfileMenuWidget({
    required this.title,
    required this.value,
    required this.icon,
    required this.onPress,
    this.textColor = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onPress,
      leading: Icon(
        icon,
        color: Colors.black,
        size: 30,
      ),
      title: Text(title,
          style: TextStyle(
              color: textColor, fontFamily: 'nexaheavy', fontSize: 17)),
      subtitle: Text(value,
          style: TextStyle(
              color: Colors.white, fontFamily: 'nexalight', fontSize: 15)),
      trailing: Icon(Icons.edit, color: Colors.white),
    );
  }
}

// BugReport  BugReport  BugReport  BugReport  BugReport  BugReport  BugReport  BugReport   BugReport  BugReport  BugReport


class BugReport extends StatefulWidget {
  const BugReport({super.key});

  @override
  State<BugReport> createState() => _BugReportState();
}

class _BugReportState extends State<BugReport> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  File? _image;

  Future<void> _pickImage() async {
    final pickedFile =
    await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

  Future<void> _submitReport() async {
    if (_titleController.text.isEmpty || _descriptionController.text.isEmpty) {
      showAwesomeSnackBarUp(context, "Please fill in all fields",false);
      return;
    }
    try {
      await FirebaseFirestore.instance.collection('bug_reports').add({
        'title': _titleController.text,
        'description': _descriptionController.text,
        'timestamp': FieldValue.serverTimestamp(),
      });

      showAwesomeSnackBarUp(context, "Bug report submitted successfully!", true);

      _titleController.clear();
      _descriptionController.clear();
      setState(() {
        _image = null;
      });
    }catch (e) {
      showAwesomeSnackBarUp(context,"Failed to submit bug report",false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          backgroundColor: Colors.indigo,
          title: const Text("Report a Bug",
              style: TextStyle(fontFamily: 'nexaheavy', fontSize: 24))),
      body: SlideInUp(
        duration: Duration(milliseconds: 600),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextField(
                controller: _titleController,
                decoration: const InputDecoration(
                  labelText: "Bug Title*",
                  labelStyle: TextStyle(
                      fontFamily: 'nexalight',
                      color: Colors.indigo,
                      fontSize: 20),
                ),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: _descriptionController,
                decoration: const InputDecoration(
                    labelText: "Bug Description*",
                    labelStyle: TextStyle(
                        fontFamily: 'nexalight',
                        color: Colors.indigo,
                        fontSize: 20)),
                maxLines: 4,
              ),
              const SizedBox(height: 40),
              _image != null
                  ? Image.file(_image!, height: 100)
                  : ElevatedButton(
                  onPressed: _pickImage,
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.all(14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    backgroundColor: Colors.indigo,
                    foregroundColor: Colors.white,
                    elevation: 6,
                  ),
                  child: Text("Attach Screenshot",
                      style: TextStyle(
                          fontFamily: 'nexaheavy',
                          color: Colors.white,
                          fontSize: 17))),
              const Spacer(),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _submitReport,
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    backgroundColor: Colors.indigo,
                    foregroundColor: Colors.white,
                    elevation: 5,
                  ),
                  child: const Text("Submit",
                      style: TextStyle(
                          fontFamily: 'nexaheavy',
                          color: Colors.white,
                          fontSize: 19)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


// // AskHelpDesk  AskHelpDesk  AskHelpDesk  AskHelpDesk  AskHelpDesk  AskHelpDesk  AskHelpDesk  AskHelpDesk  AskHelpDesk  AskHelpDesk


class AskHelpDesk extends StatefulWidget {
  const AskHelpDesk({super.key});

  @override
  State<AskHelpDesk> createState() => _AskHelpDeskState();
}

class _AskHelpDeskState extends State<AskHelpDesk> {
  final TextEditingController _queryController = TextEditingController();



  Future<void> _submitQuery() async {
    if (_queryController.text.isEmpty) {
      showAwesomeSnackBar(context,"Please enter your query",false);
      return;
    }
    try {
      await FirebaseFirestore.instance.collection('help_desk_queries').add({
        'query': _queryController.text,
        'timestamp': FieldValue.serverTimestamp(),
        'reply': "", // Initially no reply
      });

      showAwesomeSnackBar(context, "Your query has been submitted!", true);
      _queryController.clear();
    }catch(e){
      showAwesomeSnackBar(context, "Query not submitted", false);
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          "Ask Help Desk",
          style: TextStyle(
              fontFamily: 'NexaHeavy', fontSize: 24, color: Colors.white),
        ),
        backgroundColor: Colors.indigo,
        centerTitle: true,
        elevation: 10,
        shadowColor: Colors.black45,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Need Assistance?",
                  style: TextStyle(
                      fontFamily: 'NexaHeavy',
                      fontSize: 22,
                      color: Colors.black),
                ),
                const SizedBox(height: 10),
                const Text(
                  "Describe your issue or question below:",
                  style: TextStyle(
                      fontFamily: 'NexaLight',
                      fontSize: 16,
                      color: Colors.black),
                ),
                const SizedBox(height: 25),
                TextField(
                  controller: _queryController,
                  decoration: InputDecoration(
                    hintText: "Type your query here...",
                    hintStyle: TextStyle(fontFamily: 'nexalight'),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(23)),
                  ),
                  maxLines: 3,
                ),
                const SizedBox(height: 25),
                ElevatedButton(
                  onPressed: _submitQuery,
                  child: const Text(
                    "Submit Query",
                    style: TextStyle(fontFamily: 'nexaheavy', fontSize: 19),
                  ),
                ),
              ],
            ),
          ),
          const Divider(),
          SizedBox(
            height: 5,
          ),
          const Text(
            "All Previous Queries",
            style: TextStyle(
                fontFamily: 'NexaHeavy', fontSize: 20, color: Colors.black),
          ),
          SizedBox(
            height: 8,
          ),
          Expanded(
            child: StreamBuilder(
              stream: FirebaseFirestore.instance
                  .collection('help_desk_queries')
                  .snapshots(),
              builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                if (!snapshot.hasData) {
                  return SpinningLineLoader();
                }

                return ListView(
                  children: snapshot.data!.docs.map((doc) {
                    return Card(
                      margin: const EdgeInsets.all(8),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Q: ${doc['query']}",
                              style: const TextStyle(
                                  fontFamily: 'NexaHeavy', fontSize: 16),
                            ),
                            const SizedBox(height: 5),
                            Text(
                              "A: ${doc['reply'].isNotEmpty ? doc['reply'] : 'No reply yet'}",
                              style: const TextStyle(
                                  fontFamily: 'NexaLight',
                                  fontSize: 14,
                                  color: Colors.black54),
                            ),
                          ],
                        ),
                      ),
                    );
                  }).toList(),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class SpinningLineLoader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SpinKitSpinningLines(
        color: Colors.indigo, // Customize the color
        size: 50.0, // Adjust the size
        lineWidth: 3.0, // Adjust the line width
      ),
    );
  }
}
