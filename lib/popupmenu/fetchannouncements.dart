import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:shimmer/shimmer.dart';

class AnnouncementListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black12,
      appBar: AppBar(
        title: Text(
          "Announcements",
          style: GoogleFonts.bebasNeue(fontSize: 24, letterSpacing: 1.2, color: Colors.white),
        ),
        backgroundColor: Colors.blueGrey.shade800,
        elevation: 8,
        shadowColor: Colors.blueGrey,
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection('announcements')
            .orderBy('timestamp', descending: true)
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return _buildShimmerEffect(); // Show shimmer while loading
          }

          if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return Center(
              child: Text(
                "No Announcements Yet",
                style: GoogleFonts.poppins(fontSize: 18, color: Colors.white70),
              ),
            );
          }

          var announcements = snapshot.data!.docs;

          return ListView.builder(
            padding: EdgeInsets.all(16),
            itemCount: announcements.length,
            itemBuilder: (context, index) {
              var announcement = announcements[index];
              String message = announcement['announcement'];
              Timestamp timestamp = announcement['timestamp'] ?? Timestamp.now();
              String time = DateFormat('dd MMM yyyy, hh:mm a').format(timestamp.toDate());

              return Card(
                color: Colors.blueGrey.shade900,
                elevation: 5,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                margin: EdgeInsets.only(bottom: 12),
                child: ListTile(
                  contentPadding: EdgeInsets.all(16),
                  title: Text(
                    message,
                    style: GoogleFonts.poppins(fontSize: 16, color: Colors.white),
                  ),
                  subtitle: Text(
                    time,
                    style: GoogleFonts.poppins(fontSize: 14, color: Colors.white60),
                  ),
                  leading: Icon(Icons.campaign, color: Colors.deepPurpleAccent, size: 28),
                ),
              );
            },
          );
        },
      ),
    );
  }

  /// 🔥 Shimmer Loading Effect
  Widget _buildShimmerEffect() {
    return ListView.builder(
      padding: EdgeInsets.all(16),
      itemCount: 6,
      itemBuilder: (context, index) {
        return Shimmer.fromColors(
          baseColor: Colors.grey.shade800,
          highlightColor: Colors.grey.shade600,
          child: Container(
            height: 80,
            margin: EdgeInsets.only(bottom: 12),
            decoration: BoxDecoration(
              color: Colors.blueGrey.shade900,
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        );
      },
    );
  }
}
