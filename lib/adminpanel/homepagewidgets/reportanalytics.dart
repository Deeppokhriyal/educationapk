import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class ReportsAnalyticsPage extends StatefulWidget {
  @override
  _ReportsAnalyticsPageState createState() => _ReportsAnalyticsPageState();
}

class _ReportsAnalyticsPageState extends State<ReportsAnalyticsPage> {
  @override
  void initState() {
    super.initState();
    fetchLeaveData();
  }

  Map<String, int> leaveData = {};
  bool _isLoading = true;

  Future<void> fetchLeaveData() async {
    try {
      QuerySnapshot snapshot = await FirebaseFirestore.instance.collection('leave_applications').get();
      Map<String, int> tempData = {};
      for (var doc in snapshot.docs) {
        String branch = doc['branch'];
        tempData[branch] = (tempData[branch] ?? 0) + 1;
      }
      setState(() {
        leaveData = tempData;
        _isLoading = false;
      });
    } catch (e) {
      print("Error fetching leave data: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    String topBranch = '';
    int maxLeaves = 0;
    leaveData.forEach((branch, count) {
      if (count > maxLeaves) {
        maxLeaves = count;
        topBranch = branch;
      }
    });

    return Scaffold(
      appBar: AppBar(
        title: Text("Reports & Analytics", style: TextStyle(fontFamily: 'NexaHeavy', fontSize: 22)),
        backgroundColor: Colors.deepOrangeAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Leave Applications by Branch", style: TextStyle(fontFamily: 'NexaHeavy', fontSize: 20)),
            SizedBox(height: 10),
            Expanded(
              child: _isLoading
                  ? Center(child: SpinKitWave(color: Colors.deepOrangeAccent, size: 30))
                  : PieChart(
                PieChartData(
                  sectionsSpace: 5,
                  centerSpaceRadius: 60,
                  startDegreeOffset: 270,
                  borderData: FlBorderData(show: false),
                  sections: leaveData.entries.map((entry) {
                    return PieChartSectionData(
                      value: entry.value.toDouble(),
                      title: "${entry.key}\n${entry.value}",
                      radius: 90,
                      titleStyle: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                      color: Colors.primaries[leaveData.keys.toList().indexOf(entry.key) % Colors.primaries.length],
                    );
                  }).toList(),
                ),
              ),
            ),
            SizedBox(height: 20),
            Divider(thickness: 2, color: Colors.grey),
            Text(
              "Branch with Most Leave Applications:",
              style: TextStyle(fontFamily: 'NexaHeavy', fontSize: 18, color: Colors.black),
            ),
            Text(
              " $topBranch ($maxLeaves applications)",
              style: TextStyle(fontFamily: 'NexaHeavy', fontSize: 18, color: Colors.red),
            ),
          ],
        ),
      ),
    );
  }
}