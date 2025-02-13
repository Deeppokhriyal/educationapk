import 'package:flutter/material.dart';

class Collegeinfo extends StatelessWidget {
  const Collegeinfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                      Text(
                        'Facilities :',
                        style: TextStyle(
                            fontFamily: 'nexaheavy',
                            fontSize: 30,
                            color: Colors.lightBlueAccent,
                            fontWeight: FontWeight.bold),
                      ),
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
                        'The College has library facility is a hub of knowledge and resources for all students, offering a diverse collection of books, journals, and academic materials to support their learning and research endeavours. With a conducive environment for study and exploration, GP Kashipur Library serves as a vital academic resource centre where students can delve into various subjects, conduct research, and enhance their understanding of different disciplines.',
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
                        'The College has boasts an excellent IT infrastructure facility designed to cater to the technological needs of students. Equipped with'
                        ' modern computing resources, software applications, and high-speed internet connectivity, GP Kashipur IT infrastructure support'
                        'students in their academic pursuits, research projects, and digital learning activities. The state-of-the-art technology available on'
                        'campus enhances the overall learning experience and prepares students for the digital demands of the modern world.',
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
                        'The College has features departmental-based laboratories that provide hands-on learning experiences for students across various'
                        ' disciplines. GP Kashipur laboratories offer practical training, experimentation opportunities, and research facilities to enhance student'
                        'understanding of theoretical concepts and develop their practical skills. By engaging in laboratory work, students can apply classroom'
                        ' knowledge to real-world scenarios, fostering a deeper comprehension of their field of study.',
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
                        'The College has Boys Hostel facility offers comfortable and secure accommodation for male students, creating a conducive living environment within the campus. With well-maintained living spaces, amenities, and a supportive residential community, the GP Kashipur Boys Hostel provides a home away from home for students pursuing their academic goals. GP Kashipur Hostels proximity to academic buildings and campus facilities ensures convenience and accessibility for residents.',
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
                        'The College has Girls Hostel facility provides a safe and welcoming living space for female students, offering a supportive environment that promotes academic success and personal growth. With amenities, security measures, and a sense of community, GP Kashipur Girls Hostel ensures that residents feel at ease and can focus on their studies and extracurricular activities.',
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
                        'The College has sports facilities cater to the physical well-being and recreational needs of all students, providing opportunities for engagement in various sports and fitness activities. Whether indoor or outdoor, GP Kashipur sports amenities offer spaces for students to participate in sports events, practice their skills, and maintain a healthy lifestyle. GP Kashipur encourages students to embrace sportsmanship, teamwork, and physical fitness through its diverse sports programmes and facilities.',
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
                        'The College has Health Centre is equipped with a first aid facility to address the medical needs of students promptly and efficiently. With trained medical staff and essential healthcare resources, GP Kashipur Health Centre ensures the well-being of students by providing immediate assistance in case of injuries, illnesses, or medical emergencies. The availability of medical support on the GP Kashipur campus promotes a safe and healthy environment for students to focus on their academic pursuits with peace of mind.',
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
                        'The College has guest house and waiting room facilities offer a comfortable and welcoming space for visiting faculty members and student family members. Whether for temporary accommodation or waiting purposes, GP Kashipur facilities provide a hospitable environment where guests can relax, unwind, and feel at home during their stay on campus. The guest rooms and waiting areas reflect GP Kashipur\'s commitment to hospitality and inclusivity, ensuring that visitors have a pleasant experience while engaging with the college community.',
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
                        '',
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
                        'The college has Motive of the placement cell is to act as a facilitator to arrange campus visits and coordinate'
                        ' the recruitment process of the prospective employers of graduating students of the college.',
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
    );
  }
}
