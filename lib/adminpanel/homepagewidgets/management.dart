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

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  String role = 'student';
  String branch = 'IT'; // Default Branch

  Future<void> removeUser(String userId) async {
    await _firestore.collection('users').doc(userId).delete();
  }

  void _showAddUserDialog() {
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
                controller: nameController,
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
                    child: Text('Student', style: TextStyle(fontFamily: 'NexaLight')),
                  ),
                  DropdownMenuItem(
                    value: 'teacher',
                    child: Text('Teacher', style: TextStyle(fontFamily: 'NexaLight')),
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
              DropdownButtonFormField(
                value: branch,
                items: [
                  'IT', 'AGRICULTURE', 'CHEMICAL', 'PAINT', 'CIVIL',
                  'CSE', 'ELEX', 'MECH', 'PHARMACY'
                ].map((branch) {
                  return DropdownMenuItem(
                    value: branch,
                    child: Text(branch, style: TextStyle(fontFamily: 'NexaLight')),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    branch = value.toString();
                  });
                },
                decoration: InputDecoration(
                  labelText: 'Select Branch',
                  labelStyle: TextStyle(fontFamily: 'NexaLight'),
                ),
              ),
              TextField(
                controller: emailController,
                decoration: InputDecoration(
                  labelText: 'Enter Email',
                  labelStyle: TextStyle(fontFamily: 'NexaLight'),
                ),
              ),
              TextField(
                controller: passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Enter Password',
                  labelStyle: TextStyle(fontFamily: 'NexaLight'),
                ),
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
                String name = nameController.text.trim();
                String email = emailController.text.trim();
                String password = passwordController.text.trim();

                if (name.isEmpty || email.isEmpty || password.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Please fill all fields')),
                  );
                  return;
                }

                try {
                  UserCredential userCredential =
                  await _auth.createUserWithEmailAndPassword(
                    email: email,
                    password: password,
                  );

                  await _firestore.collection('users')
                      .doc(userCredential.user!.uid)
                      .set({
                    'name': name,
                    'role': role,
                    'branch': branch,
                    'email': email,
                    'uid': userCredential.user!.uid,
                  });

                  Navigator.pop(context);
                } catch (e) {
                  print('Error: $e');
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Failed to add user')),
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
        title: Text('User Management', style: TextStyle(fontFamily: 'NexaHeavy')),
      ),
      body: Column(
        children: [
          Divider(thickness: 3, color: Colors.black),
          Text('Teachers', style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold, fontFamily: 'NexaHeavy')),
          Divider(),
          Expanded(
            child: StreamBuilder(
              stream: _firestore.collection('users').where('role', isEqualTo: 'teacher').snapshots(),
              builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                if (!snapshot.hasData) return CircularProgressIndicator();
                return ListView(
                  children: snapshot.data!.docs.map((doc) {
                    return ListTile(
                      title: Text(doc['name'], style: TextStyle(fontFamily: 'NexaHeavy')),
                      subtitle: Text(doc['email'], style: TextStyle(fontFamily: 'NexaLight')),
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
                  fontSize: 23,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'NexaHeavy')),
          Divider(),
          Expanded(
            child: ListView(
              children: [
                ListTile(
                  title: Text('Agriculture',
                      style: TextStyle(fontSize: 19,fontFamily: 'NexaHeavy')),
                  onTap: () {
                    Get.to(() => AgricultureStudentsPage());
                  },
                ),
                ListTile(
                  title: Text('Computer Science',
                      style: TextStyle(fontSize: 19,fontFamily: 'NexaHeavy')),
                  onTap: () {
                    Get.to(() => ComputerscienceStudentsPage());
                  },
                ),
                ListTile(
                  title: Text('Mechanical',
                      style: TextStyle(fontSize: 19,fontFamily: 'NexaHeavy')),
                  onTap: () {
                    Get.to(() => MechanicalStudentsPage());
                  },
                ),
                ListTile(
                  title:
                  Text('Civil', style: TextStyle(fontSize: 19,fontFamily: 'NexaHeavy')),
                  onTap: () {
                    Get.to(() => CivilStudentsPage());
                  },
                ),
                ListTile(
                  title: Text('Chemical',
                      style: TextStyle(fontSize: 19,fontFamily: 'NexaHeavy')),
                  onTap: () {
                    Get.to(() => ChemicalStudentsPage());
                  },
                ),
                ListTile(
                  title: Text('Electronics',
                      style: TextStyle(fontSize: 19,fontFamily: 'NexaHeavy')),
                  onTap: () {
                    Get.to(() => ElectronicsStudentsPage());
                  },
                ),
                ListTile(
                  title: Text('Information Technology',
                      style: TextStyle(fontSize: 19,fontFamily: 'NexaHeavy')),
                  onTap: () {
                    Get.to(() => InfoTechStudentsPage());
                  },
                ),
                ListTile(
                  title: Text('Chemical Paint',
                      style: TextStyle(fontSize: 19,fontFamily: 'NexaHeavy')),
                  onTap: () {
                    Get.to(() => PaintStudentsPage());
                  },
                ),
                ListTile(
                  title: Text('Pharmacy',
                      style: TextStyle(fontSize: 19,fontFamily: 'NexaHeavy')),
                  onTap: () {
                    Get.to(() => PharmacyStudentsPage());
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

  Future<void> removeUser(String userId) async {
    await _firestore.collection('users').doc(userId).delete();
  }

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
                  .where('branch', isEqualTo: 'AGRICULTURE')
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
                        trailing: IconButton(
                          icon: Icon(Icons.delete, color: Colors.red),
                          onPressed: () => removeUser(doc.id),
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


class PharmacyStudentsPage extends StatelessWidget {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> removeUser(String userId) async {
    await _firestore.collection('users').doc(userId).delete();
  }

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
                  .where('branch', isEqualTo: 'PHARMACY')
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
                        trailing: IconButton(
                          icon: Icon(Icons.delete, color: Colors.red),
                          onPressed: () => removeUser(doc.id),
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


class MechanicalStudentsPage extends StatelessWidget {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> removeUser(String userId) async {
    await _firestore.collection('users').doc(userId).delete();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mechanical Students',
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
                  .where('branch', isEqualTo: 'MECH')
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
                        trailing: IconButton(
                          icon: Icon(Icons.delete, color: Colors.red),
                          onPressed: () => removeUser(doc.id),
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


class ComputerscienceStudentsPage extends StatelessWidget {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> removeUser(String userId) async {
    await _firestore.collection('users').doc(userId).delete();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Computer Science Students',
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
                  .where('branch', isEqualTo: 'CSE')
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
                        trailing: IconButton(
                          icon: Icon(Icons.delete, color: Colors.red),
                          onPressed: () => removeUser(doc.id),
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


class InfoTechStudentsPage extends StatelessWidget {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> removeUser(String userId) async {
    await _firestore.collection('users').doc(userId).delete();
  }

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
                        trailing: IconButton(
                          icon: Icon(Icons.delete, color: Colors.red),
                          onPressed: () => removeUser(doc.id),
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


class PaintStudentsPage extends StatelessWidget {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> removeUser(String userId) async {
    await _firestore.collection('users').doc(userId).delete();
  }

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
                  .where('branch', isEqualTo: 'PAINT')
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
                        trailing: IconButton(
                          icon: Icon(Icons.delete, color: Colors.red),
                          onPressed: () => removeUser(doc.id),
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


class ChemicalStudentsPage extends StatelessWidget {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> removeUser(String userId) async {
    await _firestore.collection('users').doc(userId).delete();
  }

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
                  .where('branch', isEqualTo: 'CHEMICAL')
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
                        trailing: IconButton(
                          icon: Icon(Icons.delete, color: Colors.red),
                          onPressed: () => removeUser(doc.id),
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


class ElectronicsStudentsPage extends StatelessWidget {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> removeUser(String userId) async {
    await _firestore.collection('users').doc(userId).delete();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Electonics Students',
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
                  .where('branch', isEqualTo: 'ELEX')
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
                        trailing: IconButton(
                          icon: Icon(Icons.delete, color: Colors.red),
                          onPressed: () => removeUser(doc.id),
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


class CivilStudentsPage extends StatelessWidget {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> removeUser(String userId) async {
    await _firestore.collection('users').doc(userId).delete();
  }

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
                  .where('branch', isEqualTo: 'CIVIL')
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
                        trailing: IconButton(
                          icon: Icon(Icons.delete, color: Colors.red),
                          onPressed: () => removeUser(doc.id),
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
