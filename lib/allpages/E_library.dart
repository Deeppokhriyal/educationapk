import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ELibrary extends StatefulWidget {
  @override
  _ELibraryState createState() => _ELibraryState();
}

class _ELibraryState extends State<ELibrary> {
  final List<Map<String, String>> libraryData = [
    {
      "SN": "1",
      "Branch": "ELEX,CIVIL,CSE,MECH,IT",
      "Username": "ukpolycoll@wtbooks.org",
      "Password": "Wtuk@1poly",
      "Books": "1361",
      "URL": "https://ebooks.wtbooks.org/"
    },
    {
      "SN": "2",
      "Branch": "PHARMACY,ELEX,CSE,IT,MECH,CIVIL",
      "Username": "polytechnicuttarakhand@theinfolibrary.com",
      "Password": "Polyuk@1Info",
      "Books": "624",
      "URL": "https://theinfolibrary.com/"
    },
    {
      "SN": "3",
      "Branch": "CSE,IT,ELEX",
      "Username": "pnupolcollege@bhashaprakashan.com",
      "Password": "1Bb@pnupc",
      "Books": "75",
      "URL": "https://bhashaprakashan.com/"
    },
    {
      "SN": "4",
      "Branch": "CHEM,ELEX,CSE,IT,PHARMACY,CIVIL,MECH",
      "Username": "upndl",
      "Password": "Bibliotex@2406",
      "Books": "713",
      "URL": "https://www.bibliotex.com/"
    },
    {
      "SN": "5",
      "Branch": "MATHS,CHEMISTRY,CIVIL,ENGLISH,PHARMACY,PHYSICS",
      "Username": "Polykashipur",
      "Password": "Kashipur@321",
      "Books": "20",
      "URL": "https://ebooks.schandgroup.com/home"
    },
    {
      "SN": "6",
      "Branch": "MATHS",
      "Username": "UPND",
      "Password": "upnd@123",
      "Books": "2",
      "URL": "https://eduport-global.com/"
    }
  ];

  Map<String, bool> expandedState = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("E-Library", style: TextStyle(fontFamily: 'NexaHeavy',fontSize: 25)),
        backgroundColor: Colors.blueAccent,
      ),
      body: ListView.builder(
        itemCount: libraryData.length,
        itemBuilder: (context, index) {
          var data = libraryData[index];
          return Card(
            margin: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            elevation: 5,
            child: Column(
              children: [
                ListTile(
                  title: Text(
                    "${data["SN"]!}. ${data["Branch"]!}",
                    style: TextStyle(fontSize: 21, fontFamily: 'NexaHeavy'),
                  ),
                  trailing: IconButton(
                    icon: Icon(
                      expandedState[data["SN"]] == true
                          ? Icons.expand_less
                          : Icons.expand_more,
                      color: Colors.blue,
                    ),
                    onPressed: () {
                      setState(() {
                        expandedState[data["SN"]!] =
                        !(expandedState[data["SN"]] ?? false);
                      });
                    },
                  ),
                ),
                if (expandedState[data["SN"]] == true) ...[
                  Divider(color: Colors.grey),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        infoRow("Username", data["Username"]!),
                        infoRow("Password", data["Password"]!),
                        infoRow("Books", data["Books"]!),
                        GestureDetector(
                          onTap: () => launchUrl(Uri.parse(data["URL"]!)),
                          child: Text(
                            "URL: ${data["URL"]!}",
                            style: TextStyle(
                                fontSize: 19,
                                color: Colors.blue,
                                decoration: TextDecoration.underline,
                                fontFamily: 'Nexaheavy'),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ],
            ),
          );
        },
      ),
    );
  }

  Widget infoRow(String title, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "$title:",
            style: TextStyle(fontSize: 18, fontFamily: 'NexaHeavy', color: Colors.black87),
          ),
          Expanded(
            child: Text(
              value,
              style: TextStyle(fontSize: 18, fontFamily: 'NexaLight', color: Colors.black54),
            ),
          ),
        ],
      ),
    );
  }
}
