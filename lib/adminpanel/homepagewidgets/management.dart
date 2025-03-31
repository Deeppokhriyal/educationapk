import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class AdminUserManagementPage extends StatefulWidget {
  @override
  _AdminUserManagementPageState createState() =>
      _AdminUserManagementPageState();
}

class _AdminUserManagementPageState extends State<AdminUserManagementPage> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> removeUser(String userId) async {
    await _firestore.collection('users').doc(userId).delete();
    await _auth.currentUser?.delete();
  }

  void _showAddUserDialog() {
    String role = 'student';
    String name = '';
    String email = '';
    String password = '';

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(
            'Add User',
            style: TextStyle(fontFamily: 'NexaHeavy'),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                onChanged: (value) => name = value,
                decoration: InputDecoration(
                  labelText: 'Enter Name',
                  labelStyle: TextStyle(fontFamily: 'NexaLight'),
                ),
              ),
              DropdownButtonFormField(
                value: role,
                items: [
                  DropdownMenuItem(
                    value: 'student',
                    child: Text('Student',
                        style: TextStyle(fontFamily: 'NexaLight')),
                  ),
                  DropdownMenuItem(
                    value: 'teacher',
                    child: Text('Teacher',
                        style: TextStyle(fontFamily: 'NexaLight')),
                  ),
                ],
                onChanged: (value) {
                  setState(() {
                    role = value.toString();
                  });
                },
                decoration: InputDecoration(
                  labelText: 'Select Role',
                  labelStyle: TextStyle(fontFamily: 'NexaLight'),
                ),
              ),
              TextField(
                onChanged: (value) => email = value,
                decoration: InputDecoration(
                  labelText: 'Enter Email',
                  labelStyle: TextStyle(fontFamily: 'NexaLight'),
                ),
              ),
              TextField(
                onChanged: (value) => password = value,
                decoration: InputDecoration(
                  labelText: 'Enter Password',
                  labelStyle: TextStyle(fontFamily: 'NexaLight'),
                ),
                obscureText: true,
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text('Cancel', style: TextStyle(fontFamily: 'NexaLight')),
            ),
            ElevatedButton(
              onPressed: () async {
                try {
                  UserCredential userCredential =
                      await _auth.createUserWithEmailAndPassword(
                    email: email,
                    password: password,
                  );

                  await _firestore
                      .collection('users')
                      .doc(userCredential.user!.uid)
                      .set({
                    'name': name,
                    'role': role,
                    'email': email,
                    'uid': userCredential.user!.uid,
                  });

                  Navigator.pop(context);
                } catch (e) {
                  print('Error: $e');
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                        content: Text('Failed to add user',
                            style: TextStyle(fontFamily: 'NexaLight'))),
                  );
                }
              },
              child: Text('Add', style: TextStyle(fontFamily: 'NexaHeavy')),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
            Text('User Management', style: TextStyle(fontFamily: 'NexaHeavy')),
      ),
      body: Column(
        children: [
          Divider(thickness: 3, color: Colors.black),
          Text('Teachers',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'NexaHeavy')),
          Divider(),
          Expanded(
            child: StreamBuilder(
              stream: _firestore
                  .collection('users')
                  .where('role', isEqualTo: 'teacher')
                  .snapshots(),
              builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                if (!snapshot.hasData) return CircularProgressIndicator();
                return ListView(
                  children: snapshot.data!.docs.map((doc) {
                    return ListTile(
                      title: Text(doc['name'],
                          style: TextStyle(fontFamily: 'NexaHeavy')),
                      subtitle: Text(doc['email'],
                          style: TextStyle(fontFamily: 'NexaLight')),
                      trailing: IconButton(
                        icon: Icon(Icons.delete, color: Colors.red),
                        onPressed: () => removeUser(doc.id),
                      ),
                    );
                  }).toList(),
                );
              },
            ),
          ),
          Divider(thickness: 3, color: Colors.black),
          Text('Students',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'NexaHeavy')),
          Divider(),
          Expanded(
            child: ListView(
              children: [
                ListTile(
                  title: Text('Agriculture',
                      style: TextStyle(fontFamily: 'NexaHeavy')),
                  onTap: () {
                    Get.to(() => AgricultureStudentsPage());
                  },
                ),
                ListTile(
                  title: Text('Computer Science',
                      style: TextStyle(fontFamily: 'NexaHeavy')),
                  onTap: () {
                    Get.to(() => AgricultureStudentsPage());
                  },
                ),
                ListTile(
                  title: Text('Mechanical',
                      style: TextStyle(fontFamily: 'NexaHeavy')),
                  onTap: () {
                    Get.to(() => AgricultureStudentsPage());
                  },
                ),
                ListTile(
                  title:
                      Text('Civil', style: TextStyle(fontFamily: 'NexaHeavy')),
                  onTap: () {
                    Get.to(() => AgricultureStudentsPage());
                  },
                ),
                ListTile(
                  title: Text('Chemical',
                      style: TextStyle(fontFamily: 'NexaHeavy')),
                  onTap: () {
                    Get.to(() => AgricultureStudentsPage());
                  },
                ),
                ListTile(
                  title: Text('Electronics',
                      style: TextStyle(fontFamily: 'NexaHeavy')),
                  onTap: () {
                    Get.to(() => AgricultureStudentsPage());
                  },
                ),
                ListTile(
                  title: Text('Information Technology',
                      style: TextStyle(fontFamily: 'NexaHeavy')),
                  onTap: () {
                    Get.to(() => InfoTechStudentsPage());
                  },
                ),
                ListTile(
                  title: Text('Chemical Paint',
                      style: TextStyle(fontFamily: 'NexaHeavy')),
                  onTap: () {
                    Get.to(() => AgricultureStudentsPage());
                  },
                ),
                ListTile(
                  title: Text('Pharmacy',
                      style: TextStyle(fontFamily: 'NexaHeavy')),
                  onTap: () {
                    Get.to(() => AgricultureStudentsPage());
                  },
                ),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _showAddUserDialog,
        child: Icon(Icons.add),
      ),
    );
  }
}

// Student Branches  Student Branches  Student Branches  Student Branches  Student Branches  Student Branches  Student Branches

class AgricultureStudentsPage extends StatelessWidget {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Agriculture Students',
            style: TextStyle(fontFamily: 'NexaHeavy')),
      ),
      body: Column(
        children: [
          Divider(thickness: 3, color: Colors.black),
          Expanded(
            child: StreamBuilder(
              stream: _firestore
                  .collection('users')
                  .where('role', isEqualTo: 'student')
                  .where('branch', isEqualTo: 'Agriculture')
                  .snapshots(),
              builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                }
                if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                  return Center(
                    child: Text(
                      'No students found.',
                      style: TextStyle(fontFamily: 'NexaLight', fontSize: 16),
                    ),
                  );
                }
                return ListView(
                  children: snapshot.data!.docs.map((doc) {
                    return Card(
                      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      child: ListTile(
                        leading: CircleAvatar(
                          backgroundColor: Colors.green.shade200,
                          child: Icon(Icons.person, color: Colors.white),
                        ),
                        title: Text(doc['name'],
                            style: TextStyle(fontFamily: 'NexaHeavy')),
                        subtitle: Text(doc['email'],
                            style: TextStyle(fontFamily: 'NexaLight')),
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

class PharmacyStudentsPage extends StatelessWidget {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pharmacy Students',
            style: TextStyle(fontFamily: 'NexaHeavy')),
      ),
      body: Column(
        children: [
          Divider(thickness: 3, color: Colors.black),
          Expanded(
            child: StreamBuilder(
              stream: _firestore
                  .collection('users')
                  .where('role', isEqualTo: 'student')
                  .where('branch', isEqualTo: 'Agriculture')
                  .snapshots(),
              builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                }
                if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                  return Center(
                    child: Text(
                      'No students found.',
                      style: TextStyle(fontFamily: 'NexaLight', fontSize: 16),
                    ),
                  );
                }
                return ListView(
                  children: snapshot.data!.docs.map((doc) {
                    return Card(
                      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      child: ListTile(
                        leading: CircleAvatar(
                          backgroundColor: Colors.green.shade200,
                          child: Icon(Icons.person, color: Colors.white),
                        ),
                        title: Text(doc['name'],
                            style: TextStyle(fontFamily: 'NexaHeavy')),
                        subtitle: Text(doc['email'],
                            style: TextStyle(fontFamily: 'NexaLight')),
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

class MechnicalStudentsPage extends StatelessWidget {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mechnical Students',
            style: TextStyle(fontFamily: 'NexaHeavy')),
      ),
      body: Column(
        children: [
          Divider(thickness: 3, color: Colors.black),
          Expanded(
            child: StreamBuilder(
              stream: _firestore
                  .collection('users')
                  .where('role', isEqualTo: 'student')
                  .where('branch', isEqualTo: 'Agriculture')
                  .snapshots(),
              builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                }
                if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                  return Center(
                    child: Text(
                      'No students found.',
                      style: TextStyle(fontFamily: 'NexaLight', fontSize: 16),
                    ),
                  );
                }
                return ListView(
                  children: snapshot.data!.docs.map((doc) {
                    return Card(
                      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      child: ListTile(
                        leading: CircleAvatar(
                          backgroundColor: Colors.green.shade200,
                          child: Icon(Icons.person, color: Colors.white),
                        ),
                        title: Text(doc['name'],
                            style: TextStyle(fontFamily: 'NexaHeavy')),
                        subtitle: Text(doc['email'],
                            style: TextStyle(fontFamily: 'NexaLight')),
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

class ComputerscienceStudentsPage extends StatelessWidget {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Computerscience Students',
            style: TextStyle(fontFamily: 'NexaHeavy')),
      ),
      body: Column(
        children: [
          Divider(thickness: 3, color: Colors.black),
          Expanded(
            child: StreamBuilder(
              stream: _firestore
                  .collection('users')
                  .where('role', isEqualTo: 'student')
                  .where('branch', isEqualTo: 'Agriculture')
                  .snapshots(),
              builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                }
                if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                  return Center(
                    child: Text(
                      'No students found.',
                      style: TextStyle(fontFamily: 'NexaLight', fontSize: 16),
                    ),
                  );
                }
                return ListView(
                  children: snapshot.data!.docs.map((doc) {
                    return Card(
                      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      child: ListTile(
                        leading: CircleAvatar(
                          backgroundColor: Colors.green.shade200,
                          child: Icon(Icons.person, color: Colors.white),
                        ),
                        title: Text(doc['name'],
                            style: TextStyle(fontFamily: 'NexaHeavy')),
                        subtitle: Text(doc['email'],
                            style: TextStyle(fontFamily: 'NexaLight')),
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

class InfoTechStudentsPage extends StatelessWidget {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Information Tech. Students',
            style: TextStyle(fontFamily: 'NexaHeavy')),
      ),
      body: Column(
        children: [
          Divider(thickness: 3, color: Colors.black),
          Expanded(
            child: StreamBuilder(
              stream: _firestore
                  .collection('users')
                  .where('role', isEqualTo: 'student')
                  .where('branch', isEqualTo: 'IT')
                  .snapshots(),
              builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                }
                if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                  return Center(
                    child: Text(
                      'No students found.',
                      style: TextStyle(fontFamily: 'NexaLight', fontSize: 16),
                    ),
                  );
                }
                return ListView(
                  children: snapshot.data!.docs.map((doc) {
                    return Card(
                      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      child: ListTile(
                        leading: CircleAvatar(
                          backgroundColor: Colors.green.shade200,
                          child: Icon(Icons.person, color: Colors.white),
                        ),
                        title: Text(doc['name'],
                            style: TextStyle(fontFamily: 'NexaHeavy')),
                        subtitle: Text(doc['email'],
                            style: TextStyle(fontFamily: 'NexaLight')),
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

class PaintStudentsPage extends StatelessWidget {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chemical Paint Students',
            style: TextStyle(fontFamily: 'NexaHeavy')),
      ),
      body: Column(
        children: [
          Divider(thickness: 3, color: Colors.black),
          Expanded(
            child: StreamBuilder(
              stream: _firestore
                  .collection('users')
                  .where('role', isEqualTo: 'student')
                  .where('branch', isEqualTo: 'Agriculture')
                  .snapshots(),
              builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                }
                if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                  return Center(
                    child: Text(
                      'No students found.',
                      style: TextStyle(fontFamily: 'NexaLight', fontSize: 16),
                    ),
                  );
                }
                return ListView(
                  children: snapshot.data!.docs.map((doc) {
                    return Card(
                      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      child: ListTile(
                        leading: CircleAvatar(
                          backgroundColor: Colors.green.shade200,
                          child: Icon(Icons.person, color: Colors.white),
                        ),
                        title: Text(doc['name'],
                            style: TextStyle(fontFamily: 'NexaHeavy')),
                        subtitle: Text(doc['email'],
                            style: TextStyle(fontFamily: 'NexaLight')),
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

class ChemicalStudentsPage extends StatelessWidget {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chemical Engg. Students',
            style: TextStyle(fontFamily: 'NexaHeavy')),
      ),
      body: Column(
        children: [
          Divider(thickness: 3, color: Colors.black),
          Expanded(
            child: StreamBuilder(
              stream: _firestore
                  .collection('users')
                  .where('role', isEqualTo: 'student')
                  .where('branch', isEqualTo: 'Agriculture')
                  .snapshots(),
              builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                }
                if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                  return Center(
                    child: Text(
                      'No students found.',
                      style: TextStyle(fontFamily: 'NexaLight', fontSize: 16),
                    ),
                  );
                }
                return ListView(
                  children: snapshot.data!.docs.map((doc) {
                    return Card(
                      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      child: ListTile(
                        leading: CircleAvatar(
                          backgroundColor: Colors.green.shade200,
                          child: Icon(Icons.person, color: Colors.white),
                        ),
                        title: Text(doc['name'],
                            style: TextStyle(fontFamily: 'NexaHeavy')),
                        subtitle: Text(doc['email'],
                            style: TextStyle(fontFamily: 'NexaLight')),
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

class ElectronicsStudentsPage extends StatelessWidget {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Electronics Students',
            style: TextStyle(fontFamily: 'NexaHeavy')),
      ),
      body: Column(
        children: [
          Divider(thickness: 3, color: Colors.black),
          Expanded(
            child: StreamBuilder(
              stream: _firestore
                  .collection('users')
                  .where('role', isEqualTo: 'student')
                  .where('branch', isEqualTo: 'Agriculture')
                  .snapshots(),
              builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                }
                if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                  return Center(
                    child: Text(
                      'No students found.',
                      style: TextStyle(fontFamily: 'NexaLight', fontSize: 16),
                    ),
                  );
                }
                return ListView(
                  children: snapshot.data!.docs.map((doc) {
                    return Card(
                      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      child: ListTile(
                        leading: CircleAvatar(
                          backgroundColor: Colors.green.shade200,
                          child: Icon(Icons.person, color: Colors.white),
                        ),
                        title: Text(doc['name'],
                            style: TextStyle(fontFamily: 'NexaHeavy')),
                        subtitle: Text(doc['email'],
                            style: TextStyle(fontFamily: 'NexaLight')),
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

class CivilStudentsPage extends StatelessWidget {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Civil Students',
            style: TextStyle(fontFamily: 'NexaHeavy')),
      ),
      body: Column(
        children: [
          Divider(thickness: 3, color: Colors.black),
          Expanded(
            child: StreamBuilder(
              stream: _firestore
                  .collection('users')
                  .where('role', isEqualTo: 'student')
                  .where('branch', isEqualTo: 'Agriculture')
                  .snapshots(),
              builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                }
                if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                  return Center(
                    child: Text(
                      'No students found.',
                      style: TextStyle(fontFamily: 'NexaLight', fontSize: 16),
                    ),
                  );
                }
                return ListView(
                  children: snapshot.data!.docs.map((doc) {
                    return Card(
                      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      child: ListTile(
                        leading: CircleAvatar(
                          backgroundColor: Colors.green.shade200,
                          child: Icon(Icons.person, color: Colors.white),
                        ),
                        title: Text(doc['name'],
                            style: TextStyle(fontFamily: 'NexaHeavy')),
                        subtitle: Text(doc['email'],
                            style: TextStyle(fontFamily: 'NexaLight')),
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
