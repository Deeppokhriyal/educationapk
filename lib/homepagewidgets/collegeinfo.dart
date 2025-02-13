import 'package:flutter/material.dart';

class Collegeinfo extends StatelessWidget {
  const Collegeinfo({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        dividerTheme: DividerThemeData(
          color: Colors.greenAccent,  // Change the divider color globally
          thickness: 2,       // Set the thickness
          space: 20,          // Space before and after the divider
        ),
      ),
      home: Scaffold(
        backgroundColor: Colors.transparent,
        body: ListView(children: [
          Stack(children: [
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(
                        'https://img.freepik.com/free-photo/abstract-gradient-neon-lights_23-2149279124.jpg?uid=R186427419&ga=GA1.1.722819559.1729949704&semt=ais_authors_boost'), // Path to your background image
                    fit: BoxFit.cover),
              ),
              child: Column(children: [
                Container(
                  padding: EdgeInsets.only(top: 10),
                  alignment: Alignment.center,
                  margin: EdgeInsets.all(10.0),
                  height: 200,
                  child: Row(children: [
                    Image.asset(
                      'assets/images/cb.png',
                      height: 150,
                      width: 120,
                    ),
                    SizedBox(
                      width: 2,
                    ),
                    Text(
                      'Government Polytechnic ,\nKashipur ,\nU.S.Nagar Uttarakhand',
                      style: TextStyle(
                          fontFamily: 'nexaheavy',
                          fontSize: 18,
                          color: Colors.white),
                    ),
                  ]),
                ),
                SizedBox(height: 5),
                Container(
                  padding: EdgeInsets.all(20),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'About :',
                          style: TextStyle(
                              fontFamily: 'nexaheavy',
                              fontSize: 25,
                              color: Colors.lightBlueAccent),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Government Polytechnic, Kashipur (GPK) was established in 1975 as one of the most efficient institute in Uttarakhand.'
                          ' Associated to Uttarakhand board of technical education Roorkee( UBTER ) . Entrance exam conducted by UBTER every year'
                          'through councelling students are selected for G.P.Kashipur. Government Polytechnic Kashipur offers various diploma courses.',
                          style: TextStyle(
                              fontFamily: 'nexalight',
                              fontSize: 18,
                              color: Colors.white),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          'Some Specification about G.P.Kashipur:',
                          style: TextStyle(
                              fontFamily: 'nexaheavy',
                              fontSize: 25,
                              color: Colors.lightBlueAccent),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Divider(
                              height: 20,
                            ),
                            Text(
                              'Establish : 1975',
                              style: TextStyle(
                                  fontFamily: 'nexalight',
                                  color: Colors.white,
                                  fontSize: 20),
                            ),
                            Divider(
                              height: 20,
                            ),
                            Text(
                              'Campus Size :	15 acres',
                              style: TextStyle(
                                  fontFamily: 'nexalight',
                                  color: Colors.white,
                                  fontSize: 20),
                            ),
                            Divider(
                              height: 20,
                            ),
                            Text(
                              'Faculty Count : 35+',
                              style: TextStyle(
                                  fontFamily: 'nexalight',
                                  color: Colors.white,
                                  fontSize: 20),
                            ),
                            Divider(
                              height: 20,
                            ),
                            Text(
                              'Student Count : 1250+',
                              style: TextStyle(
                                  fontFamily: 'nexalight',
                                  color: Colors.white,
                                  fontSize: 20),
                            ),
                            Divider(
                              height: 20,
                            ),
                            Text(
                              'Gender : Co-ed',
                              style: TextStyle(
                                  fontFamily: 'nexalight',
                                  color: Colors.white,
                                  fontSize: 20),
                            ),
                            Divider(
                              height: 20,
                            ),
                            Text(
                              'Institute Type : Affiliated College',
                              style: TextStyle(
                                  fontFamily: 'nexalight',
                                  color: Colors.white,
                                  fontSize: 20),
                            ),
                            Divider(
                              height: 20,
                            ),
                            Text(
                              'Courses	: 9 Courses',
                              style: TextStyle(
                                  fontFamily: 'nexalight',
                                  color: Colors.white,
                                  fontSize: 20),
                            ),
                            Divider(
                              height: 20,
                            ),
                            Text(
                              'Approvals	: AICTE, PCI',
                              style: TextStyle(
                                  fontFamily: 'nexalight',
                                  color: Colors.white,
                                  fontSize: 20),
                            ),
                            Divider(
                              height: 20,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          'Overview :',
                          style: TextStyle(
                              fontFamily: 'nexaheavy',
                              fontSize: 25,
                              color: Colors.lightBlueAccent),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Location -',
                          style: TextStyle(
                              fontFamily: 'nexaheavy',
                              fontSize: 18,
                              color: Colors.greenAccent,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Address: Manpur Rd, Kashipur, Uttarakhand 244713'
                          '\nPhone: 05947297200',
                          style: TextStyle(
                              fontFamily: 'nexalight',
                              fontSize: 18,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          'Govt. Polytechnic Kashipur Have 2 Major Gate\'s',
                          style: TextStyle(
                            fontFamily: 'nexaheavy',
                            fontSize: 14,
                            color: Colors.greenAccent,
                          ),
                        ),
                        Text(
                          '1st Gate is from Manpur road.',
                          style: TextStyle(
                            fontFamily: 'nexalight',
                            fontSize: 14,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          'And 2nd Gate is from Albert memorial school road.',
                          style: TextStyle(
                            fontFamily: 'nexalight',
                            fontSize: 14,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        InteractiveViewer(
                          panEnabled: true, // Allows panning
                          boundaryMargin: EdgeInsets.all(0),
                          minScale: 1.0,
                          maxScale: 4.0, // Zoom limit
                          child: Image.asset(
                            'assets/images/map.png', // Replace with your image URL or Asset
                            fit: BoxFit
                                .contain, // Ensures the image fits within the screen
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Divider(height: 10,),
                        Text(
                          'Facilities :',
                          style: TextStyle(
                              fontFamily: 'nexaheavy',
                              fontSize: 30,
                              color: Colors.lightBlueAccent,
                              fontWeight: FontWeight.bold),
                        ),
                        Divider(height: 10,),

                        SizedBox(
                          height: 20,
                        ),

                        Text(
                          'Digital Library -',
                          style: TextStyle(
                              fontFamily: 'nexaheavy',
                              fontSize: 20,
                              color: Colors.greenAccent,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          'Our college digital library is a comprehensive online resource designed to support students, faculty, and researchers in their academic pursuits. It provides access to a vast collection of e-books, research papers, journals, and multimedia resources across various disciplines.',
                          style: TextStyle(
                            fontFamily: 'nexalight',
                            fontSize: 12,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          'E-books & Journals:',
                          style: TextStyle(
                            fontFamily: 'nexaheavy',
                            fontSize: 12,
                            color: Colors.yellow,
                          ),
                        ),
                        Text(
                          'Thousands of digital books and academic journals available for study and research.',
                          style: TextStyle(
                            fontFamily: 'nexalight',
                            fontSize: 12,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          'Remote Access:',
                          style: TextStyle(
                            fontFamily: 'nexaheavy',
                            fontSize: 12,
                            color: Colors.yellow,
                          ),
                        ),
                        Text(
                          'Students and faculty can log in from anywhere using their college credentials.',
                          style: TextStyle(
                            fontFamily: 'nexalight',
                            fontSize: 12,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          'Multimedia Resources: ',
                          style: TextStyle(
                            fontFamily: 'nexaheavy',
                            fontSize: 12,
                            color: Colors.yellow,
                          ),
                        ),
                        Text(
                          'Educational videos, lectures, and presentations for enhanced learning.',
                          style: TextStyle(
                            fontFamily: 'nexalight',
                            fontSize: 12,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          'Digital Archives: ',
                          style: TextStyle(
                            fontFamily: 'nexaheavy',
                            fontSize: 12,
                            color: Colors.yellow,
                          ),
                        ),
                        Text(
                          'Historical records, theses, and dissertations for reference.',
                          style: TextStyle(
                            fontFamily: 'nexalight',
                            fontSize: 12,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          'Online Catalog:',
                          style: TextStyle(
                            fontFamily: 'nexaheavy',
                            fontSize: 12,
                            color: Colors.yellow,
                          ),
                        ),
                        Text(
                          'A user-friendly interface to search for digital materials quickly.',
                          style: TextStyle(
                            fontFamily: 'nexalight',
                            fontSize: 12,
                            color: Colors.white,
                          ),
                        ),


                        SizedBox(
                          height: 10,
                        ),
                        Divider(height: 20,),
                        Text(
                          'I.T Infrastructure -',
                          style: TextStyle(
                              fontFamily: 'nexaheavy',
                              fontSize: 20,
                              color: Colors.greenAccent,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          'Our college is equipped with a robust and advanced IT infrastructure to support academic learning, research, and administrative activities. The IT facilities ensure seamless digital connectivity, secure data management, and modern technological resources for students and faculty.',
                          style: TextStyle(
                            fontFamily: 'nexalight',
                            fontSize: 12,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          'High-Speed Internet & Networking:',
                          style: TextStyle(
                            fontFamily: 'nexaheavy',
                            fontSize: 12,
                            color: Colors.yellow,
                          ),
                        ),
                        Text(
                          'Campus-wide Wi-Fi connectivity with high-speed internet access.'
                          '\nSecure LAN and WAN networks for smooth communication.',
                          style: TextStyle(
                            fontFamily: 'nexalight',
                            fontSize: 12,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          'Computer Labs & Hardware Facilities:',
                          style: TextStyle(
                            fontFamily: 'nexaheavy',
                            fontSize: 12,
                            color: Colors.yellow,
                          ),
                        ),
                        Text(
                          'State-of-the-art computer labs with modern hardware and high-performance systems.'
                          '\nDedicated labs for programming, networking, and software development.',
                          style: TextStyle(
                            fontFamily: 'nexalight',
                            fontSize: 12,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          'Smart Classrooms & E-Learning:',
                          style: TextStyle(
                            fontFamily: 'nexaheavy',
                            fontSize: 12,
                            color: Colors.yellow,
                          ),
                        ),
                        Text(
                          'Interactive smart boards and projectors for digital teaching.'
                          '\nVirtual labs and simulation tools for practical learning.',
                          style: TextStyle(
                            fontFamily: 'nexalight',
                            fontSize: 12,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          'Digital Library & Research Facilities:',
                          style: TextStyle(
                            fontFamily: 'nexaheavy',
                            fontSize: 12,
                            color: Colors.yellow,
                          ),
                        ),
                        Text(
                          'Access to e-books, journals, and online research databases.'
                          '\nRemote login for students and faculty to access digital resources from anywhere.',
                          style: TextStyle(
                            fontFamily: 'nexalight',
                            fontSize: 12,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          'Future Expansion Plans:',
                          style: TextStyle(
                            fontFamily: 'nexaheavy',
                            fontSize: 12,
                            color: Colors.orange,
                          ),
                        ),
                        Text(
                          'Implementation of AI and IoT-based smart campus solutions.'
                          '\nEnhanced cloud computing and virtualization for remote learning.',
                          style: TextStyle(
                            fontFamily: 'nexalight',
                            fontSize: 12,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Divider(height: 20,),

                        Text(
                          'Laboratories -',
                          style: TextStyle(
                              fontFamily: 'nexaheavy',
                              fontSize: 20,
                              color: Colors.greenAccent,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          'Our college is equipped with state-of-the-art laboratories that provide hands-on practical experience to students, fostering innovation, research, and skill development. These well-maintained labs are designed to meet academic and industrial standards, ensuring students gain practical knowledge in their respective fields.',
                          style: TextStyle(
                            fontFamily: 'nexalight',
                            fontSize: 12,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          'Modern Equipment & Instruments:',
                          style: TextStyle(
                            fontFamily: 'nexaheavy',
                            fontSize: 12,
                            color: Colors.yellow,
                          ),
                        ),
                        Text(
                          'Advanced tools, machinery, and software for real-world applications.',
                          style: TextStyle(
                            fontFamily: 'nexalight',
                            fontSize: 12,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          'Safety & Security Measures: ',
                          style: TextStyle(
                            fontFamily: 'nexaheavy',
                            fontSize: 12,
                            color: Colors.yellow,
                          ),
                        ),
                        Text(
                          'Well-ventilated labs with fire safety, emergency protocols, and protective gear.',
                          style: TextStyle(
                            fontFamily: 'nexalight',
                            fontSize: 12,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          'Expert Faculty & Lab Assistants:',
                          style: TextStyle(
                            fontFamily: 'nexaheavy',
                            fontSize: 12,
                            color: Colors.yellow,
                          ),
                        ),
                        Text(
                          'Experienced instructors to guide students in experiments and research.',
                          style: TextStyle(
                            fontFamily: 'nexalight',
                            fontSize: 12,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          'Research & Innovation Support:',
                          style: TextStyle(
                            fontFamily: 'nexaheavy',
                            fontSize: 12,
                            color: Colors.yellow,
                          ),
                        ),
                        Text(
                          'Facilities for student projects, research, and industry collaborations.',
                          style: TextStyle(
                            fontFamily: 'nexalight',
                            fontSize: 12,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Divider(height: 20,),

                        Text(
                          'Boys Hostel -',
                          style: TextStyle(
                              fontFamily: 'nexaheavy',
                              fontSize: 20,
                              color: Colors.greenAccent,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          'The College has Boys Hostel facility offers comfortable and secure accommodation for male students, creating a conducive living environment within the campus. With well-maintained living spaces, amenities, and a supportive residential community.',
                          style: TextStyle(
                            fontFamily: 'nexalight',
                            fontSize: 12,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          'Hostel Facilities & Accommodation:',
                          style: TextStyle(
                            fontFamily: 'nexaheavy',
                            fontSize: 12,
                            color: Colors.yellow,
                          ),
                        ),
                        Text(
                          'Hostel 1 -',
                          style: TextStyle(
                            fontFamily: 'nexaheavy',
                            fontSize: 12,
                            color: Colors.orange,
                          ),
                        ),
                        Text(
                          'Total Rooms: 30',
                          style: TextStyle(
                            fontFamily: 'nexalight',
                            fontSize: 12,
                            color: Colors.orange,
                          ),
                        ),
                        Text(
                          'Occupancy: 3 students per room'
                          '\nTotal Residents: 60 students (approx.)',
                          style: TextStyle(
                            fontFamily: 'nexalight',
                            fontSize: 12,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          'Hostel 2 -',
                          style: TextStyle(
                            fontFamily: 'nexaheavy',
                            fontSize: 12,
                            color: Colors.orange,
                          ),
                        ),
                        Text(
                          'Total Rooms: 13',
                          style: TextStyle(
                            fontFamily: 'nexalight',
                            fontSize: 12,
                            color: Colors.orange,
                          ),
                        ),
                        Text(
                          'Occupancy: 4 students per room'
                          '\nTotal Residents: 50 students (approx.)',
                          style: TextStyle(
                            fontFamily: 'nexalight',
                            fontSize: 12,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          'Total Strength: Around 120+ students across both hostels.',
                          style: TextStyle(
                            fontFamily: 'nexaheavy',
                            fontSize: 14,
                            color: Colors.lightBlueAccent,
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          'Amenities & Features:',
                          style: TextStyle(
                            fontFamily: 'nexaheavy',
                            fontSize: 12,
                            color: Colors.yellow,
                          ),
                        ),
                        Text(
                          'Wi-Fi Connectivity: Available in the hostel with a daily usage limit of 24MB per student.'
                          '\nMess Facility: Provides nutritious meals at scheduled timings.'
    '\nCommon Areas: Study rooms, recreational spaces, and TV lounges.'
    '\nSecurity & Supervision: 24/7 security and hostel wardens for student safety.'
    '\nHygiene & Maintenance: Regular cleaning and maintenance of rooms and common areas.',
                          style: TextStyle(
                            fontFamily: 'nexalight',
                            fontSize: 12,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          'Mess Timings:',
                          style: TextStyle(
                            fontFamily: 'nexaheavy',
                            fontSize: 12,
                            color: Colors.yellow,
                          ),
                        ),
                        Text(
                          'Breakfast: 8:15 AM'
                          '\nLunch: 1:00 PM'
                              '\nDinner: 8:00 PM',
                          style: TextStyle(
                            fontFamily: 'nexalight',
                            fontSize: 12,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Divider(height: 20,),

                        Text(
                          'Girls Hostel -',
                          style: TextStyle(
                              fontFamily: 'nexaheavy',
                              fontSize: 20,
                              color: Colors.greenAccent,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          'Our college provides a well-facilitated Girl\'s Hostel to ensure a safe, comfortable, and supportive living environment for students. The hostel is designed to provide a home-like atmosphere with all essential amenities, fostering academic focus and personal well-being.',
                          style: TextStyle(
                            fontFamily: 'nexalight',
                            fontSize: 12,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          'Hostel Facilities & Accommodation:',
                          style: TextStyle(
                            fontFamily: 'nexaheavy',
                            fontSize: 12,
                            color: Colors.yellow,
                          ),
                        ),
                        Text(
                          'Hostel 1 -',
                          style: TextStyle(
                            fontFamily: 'nexaheavy',
                            fontSize: 12,
                            color: Colors.orange,
                          ),
                        ),
                        Text(
                          'Total Rooms: 30',
                          style: TextStyle(
                            fontFamily: 'nexalight',
                            fontSize: 12,
                            color: Colors.orange,
                          ),
                        ),
                        Text(
                          'Occupancy: 3 students per room'
                              '\nTotal Residents: 60 students (approx.)',
                          style: TextStyle(
                            fontFamily: 'nexalight',
                            fontSize: 12,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          'Amenities & Features:',
                          style: TextStyle(
                            fontFamily: 'nexaheavy',
                            fontSize: 12,
                            color: Colors.yellow,
                          ),
                        ),
                        Text(
                          'Wi-Fi Connectivity: Available in the hostel with a daily usage limit of 24MB per student.'
                              '\nMess Facility: Provides nutritious meals at scheduled timings.'
                              '\nCommon Areas: Study rooms, recreational spaces, and TV lounges.'
                              '\nSecurity & Supervision: 24/7 security and hostel wardens for student safety.'
                              '\nHygiene & Maintenance: Regular cleaning and maintenance of rooms and common areas.',
                          style: TextStyle(
                            fontFamily: 'nexalight',
                            fontSize: 12,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          'Mess Timings:',
                          style: TextStyle(
                            fontFamily: 'nexaheavy',
                            fontSize: 12,
                            color: Colors.yellow,
                          ),
                        ),
                        Text(
                          'Breakfast: 8:15 AM'
                              '\nLunch: 1:00 PM'
                              '\nDinner: 8:00 PM',
                          style: TextStyle(
                            fontFamily: 'nexalight',
                            fontSize: 12,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Divider(height: 20,),

                        Text(
                          'Sports -',
                          style: TextStyle(
                              fontFamily: 'nexaheavy',
                              fontSize: 20,
                              color: Colors.greenAccent,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          'Our college provides excellent sports infrastructure to encourage students to participate in various athletic and recreational activities. With a focus on fitness, teamwork, and sportsmanship, we offer facilities for both indoor and outdoor sports, ensuring a well-rounded development of our students.',
                          style: TextStyle(
                            fontFamily: 'nexalight',
                            fontSize: 12,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          'Indoor Sports:',
                          style: TextStyle(
                            fontFamily: 'nexaheavy',
                            fontSize: 12,
                            color: Colors.yellow,
                          ),
                        ),
                        Text(
                          'Badminton Court: Indoor courts with proper flooring and lighting for smooth gameplay.'
                          '\nTable Tennis Hall: Well-furnished hall with multiple tables for practice and tournaments.',
                          style: TextStyle(
                            fontFamily: 'nexalight',
                            fontSize: 12,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          'Outdoor Sports:',
                          style: TextStyle(
                            fontFamily: 'nexaheavy',
                            fontSize: 12,
                            color: Colors.yellow,
                          ),
                        ),
                        Text(
                          'Cricket Ground: A well-maintained field for professional and recreational matches.'
    '\nRace Track: A dedicated running track for sprinters and long-distance runners.'
    '\nBasketball Court: Standard-sized court for competitive and practice games.'
    '\nVolleyball Court: High-quality court for both professional and friendly matches.'
    '\nAthletics Ground: Designed for track and field events, promoting physical fitness.',
                          style: TextStyle(
                            fontFamily: 'nexalight',
                            fontSize: 12,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),

                        Divider(height: 20,),

                        Text(
                          'Medical/Hospital -',
                          style: TextStyle(
                              fontFamily: 'nexaheavy',
                              fontSize: 20,
                              color: Colors.greenAccent,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          'Our college is committed to ensuring the health and well-being of students, faculty, and staff by providing comprehensive medical facilities on campus. With a focus on preventive care, first aid, and medical support, our facilities are well-equipped to handle basic healthcare needs and emergencies.',
                          style: TextStyle(
                            fontFamily: 'nexalight',
                            fontSize: 12,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          'Medical Facilities Available:',
                          style: TextStyle(
                            fontFamily: 'nexaheavy',
                            fontSize: 12,
                            color: Colors.yellow,
                          ),
                        ),
                        Text(
                          'On-Campus Medical Room: Equipped with first aid, basic medications, and emergency care.'
    '\nQualified Medical Staff: Experienced doctors and nurses available for consultation.'
    '\nEmergency Care & First Aid: Quick medical response for minor injuries or sudden health issues.'
    '\nTie-Up with Hospitals: In case of serious medical conditions, students are referred to nearby hospitals.',
                          style: TextStyle(
                            fontFamily: 'nexalight',
                            fontSize: 12,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          'Integration with Pharmacy Branch:',
                          style: TextStyle(
                            fontFamily: 'nexaheavy',
                            fontSize: 12,
                            color: Colors.yellow,
                          ),
                        ),
                        Text(
                          'Student Involvement in Medical Services: Pharmacy students gain hands-on experience in dispensing medicines and assisting in health awareness programs.'
                          '\nOn-Campus Pharmacy Store: Availability of essential medicines and healthcare supplies.'
    '\nResearch & Development: Encouraging pharmacy students to work on medical innovations and drug formulations.'
    '\nWorkshops & Training: Special sessions on first aid, pharmacology, and healthcare management for students.',
                          style: TextStyle(
                            fontFamily: 'nexalight',
                            fontSize: 12,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),

                        Divider(height: 20,),

                        Text(
                          'Guest Room/Waiting Room -',
                          style: TextStyle(
                              fontFamily: 'nexaheavy',
                              fontSize: 20,
                              color: Colors.greenAccent,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          'Our college provides comfortable and well-maintained Guest Room and Waiting Room facilities to accommodate visitors, parents, and guests. These spaces are designed to offer a welcoming environment with essential amenities.',
                          style: TextStyle(
                            fontFamily: 'nexalight',
                            fontSize: 12,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(height: 5,),
                        Text(
                          'Guest Room Facilities:',
                          style: TextStyle(
                            fontFamily: 'nexaheavy',
                            fontSize: 12,
                            color: Colors.yellow,
                          ),
                        ),
                        Text(
                          'Well-Furnished Rooms: Equipped with beds, chairs, and basic necessities for a comfortable stay.'
                        '\nAir-Conditioned & Non-AC Options: Rooms designed to suit different preferences.'
                        '\nClean & Hygienic Environment: Regular housekeeping and maintenance for a pleasant stay.'
    '\nAttached Washrooms: Well-maintained restrooms for convenience.',
                          style: TextStyle(
                            fontFamily: 'nexalight',
                            fontSize: 12,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          'Waiting Room Facilities:',
                          style: TextStyle(
                            fontFamily: 'nexaheavy',
                            fontSize: 12,
                            color: Colors.yellow,
                          ),
                        ),
                        Text(
                          'Spacious & Comfortable Seating: Designed for visitors, parents, and students waiting for appointments.'
    '\nAiry & Well-Lit Area: A relaxed ambiance with proper ventilation.'
    '\nReading Materials & Information Boards: Availability of newspapers, magazines, and college brochures.'
                              '\nDrinking Water & Basic Refreshments: Ensuring a hospitable experience for guests.',
                          style: TextStyle(
                            fontFamily: 'nexalight',
                            fontSize: 12,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Divider(height: 20,),

                        Text(
                          'Digital Classes -',
                          style: TextStyle(
                              fontFamily: 'nexaheavy',
                              fontSize: 20,
                              color: Colors.greenAccent,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          'Our college is equipped with modern digital classrooms to enhance the learning experience through advanced technology. These classrooms provide an interactive and engaging environment that supports both theoretical and practical education.',
                          style: TextStyle(
                            fontFamily: 'nexalight',
                            fontSize: 12,
                            color: Colors.white,
                          ),
                        ),

                        Text(
                          'Key Features of Digital Classrooms:',
                          style: TextStyle(
                            fontFamily: 'nexaheavy',
                            fontSize: 12,
                            color: Colors.yellow,
                          ),
                        ),
                        Text(
                          'Smart Boards & Projectors: High-resolution displays for better visualization of concepts.'
    '\nMultimedia Learning: Integration of videos, animations, and presentations for an interactive approach.'
    '\nHigh-Speed Internet Connectivity: Ensures seamless access to online resources and live sessions.'
                              '\nE-Learning Platforms: Access to recorded lectures, digital study materials, and virtual labs.',
                          style: TextStyle(
                            fontFamily: 'nexalight',
                            fontSize: 12,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Divider(height: 20,),

                        Text(
                          'Training and Placement Cell -',
                          style: TextStyle(
                              fontFamily: 'nexaheavy',
                              fontSize: 20,
                              color: Colors.greenAccent,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          'Our college has a dedicated Training & Placement Cell that plays a vital role in bridging the gap between students and career opportunities. The cell is committed to providing job placements, internships, and industry exposure to help students achieve professional success.',
                          style: TextStyle(
                            fontFamily: 'nexalight',
                            fontSize: 12,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Key Responsibilities of the Placement Cell:',
                          style: TextStyle(
                            fontFamily: 'nexaheavy',
                            fontSize: 12,
                            color: Colors.yellow,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Student Enrollment in Placement Group: All students are added to the official placement group, where they receive real-time updates on job openings, company visits, and recruitment drives.'
    '\nCompany Information & Updates: Regular notifications about job opportunities, campus drives, and internship programs from reputed companies.'
    '\nPlacement Website Registration: Each student is provided with a unique ID on the college placement portal, where they can track company visits, apply for jobs, and upload their resumes.'
                              '\nSkill Development & Training: Organizing aptitude tests, technical sessions, mock interviews, and soft skills training to enhance student employability.',
                          style: TextStyle(
                            fontFamily: 'nexalight',
                            fontSize: 12,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                      ]),
                ),
              ]),
            ),
          ]),
        ]),
      ),
    );
  }
}
