import 'package:flutter/material.dart';

class Termscondition extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:ListView(
          children:[ Stack(
      children: [
      Container(padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
      image: DecorationImage(
        image: NetworkImage('https://img.freepik.com/premium-photo/full-frame-shot-blue-wall_1048944-14723266.jpg?uid=R186427419&ga=GA1.1.722819559.1729949704&semt=ais_hybrid'), // Path to your background image
      fit: BoxFit.cover,
    ),
    ),
    child: Column(crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.only(top: 30),
                    child: Text('Terms and Condition\'s',style: TextStyle(fontSize: 30,fontFamily: 'nexaheavy',color: Colors.lightBlueAccent))),
                SizedBox(height: 55,),
                Text('1. Introduction ',style: TextStyle(fontSize: 20,fontFamily: 'sans-serif-light',color: Colors.lightBlueAccent),),
                SizedBox(height: 10,),
                Text('- By accessing or using our Application, you agree to be bound by these Terms and Conditions. If you do not agree with these Terms,the User is requested to refrain from using this Application.',style: TextStyle(fontFamily: 'sans-serif-thin',fontSize: 15,color: Colors.white),),
                SizedBox(height: 20,),
                Text('2. Definitions',style: TextStyle(fontSize: 20,fontFamily: 'sans-serif-light',color: Colors.lightBlueAccent),),
                SizedBox(height: 10,),
                Text('- Service: Refers to the Govt. Polytechnic Kashipur , available at Team Celestial.\n-Company: Refers to Team Celestial, located at India.',style: TextStyle(fontFamily: 'sans-serif-thin',fontSize: 15,color: Colors.white),),
                SizedBox(height: 20,),
                Text('3. Data Collection and Use',style: TextStyle(fontSize: 20,fontFamily: 'sans-serif-light',color: Colors.lightBlueAccent),),
                SizedBox(height: 10,),
                Text('- 3.1 : Data Collected \nWe collect the following data for the purposes of providing and improving our Service:'
                    '\n(Full Name): To ensure proper identification and communication.\nBranch: To tailor content relevant to your academic focus.'
                    '\n(Semester/Year): To provide support appropriate to your academic level.\n(UBTER Roll No): For academic verification and record-keeping.'
                    '\n(Photo): A clear, forward-facing image to maintain an accurate and identifiable profile (maximum size: 10 MB; supported file type: image).'
                    '\n3.2 Profile \nAccuracy Your photo and other data ensure accurate representation and help others easily identify you.\n3.3 Support and Recognition '
                    '\nYour data enables us to offer tailored assistance and acknowledge your academic achievements.\n3.4 Data Security\nWe implement reasonable security measures to protect your data from unauthorized access, alteration, disclosure, or destruction.'
                    '\n3.5 Data Retention\nWe retain your personal data only for as long as necessary to fulfill the purposes outlined in this policy or as required by law.',style: TextStyle(fontFamily: 'sans-serif-thin',fontSize: 15,color: Colors.white),),
                SizedBox(height: 20,),
                Text('4. Use of Service',style: TextStyle(fontSize: 20,fontFamily: 'sans-serif-light',color: Colors.lightBlueAccent),),
                SizedBox(height: 10,),
                Text('-4.1 Acceptable Use\nYour use of the Service must comply with these Terms and applicable laws. You agree to use the Service only for lawful purposes and in accordance with all applicable local, state, national, or international laws.'
                    '\n4.2 Prohibited Activities\nYou must not Use the Service for any unlawful or unauthorized purpose.Engage in any activity that interferes with or disrupts the Service or its servers.Attempt to gain unauthorized access to any part of the Service or other systems or networks connected to the Service.',
                  style: TextStyle(fontFamily: 'sans-serif-thin',fontSize: 15,color: Colors.white),),
                SizedBox(height: 20,),
                Text('5. User Accounts',style: TextStyle(fontSize: 20,fontFamily: 'sans-serif-light',color: Colors.lightBlueAccent),),
                SizedBox(height: 10,),
                Text('-5.1 Account Responsibilities\nIf you create an account on our Service, you are responsible for maintaining the confidentiality of your account information and for all activities that occur under your account.'
                    '\n5.2 Account Termination\nWe may terminate or suspend your account immediately, without prior notice or liability, if you breach these Terms or engage in any fraudulent or illegal activity.'
                    ,style: TextStyle(fontFamily: 'sans-serif-thin',fontSize: 15,color: Colors.white),),
                SizedBox(height: 20,),
                Text('6. Intellectual Property',style: TextStyle(fontSize: 20,fontFamily: 'sans-serif-light',color: Colors.lightBlueAccent),),
                SizedBox(height: 10,),
                Text('-6.1 Ownership\nAll content, trademarks, and other intellectual property rights on the Service are owned by or licensed to the Company. You may not use, copy, modify, or distribute any content from the Service without our express written permission.'
                    '6.2 User-Generated Content\nYou retain ownership of any content you submit to the Service. By submitting content, you grant us a worldwide, non-exclusive, royalty-free license to use, display, and distribute such content in connection with the Service.',style: TextStyle(fontFamily: 'sans-serif-thin',fontSize: 15,color: Colors.white),),
                SizedBox(height: 20,),
                Text('7. Changes to Terms',style: TextStyle(fontSize: 20,fontFamily: 'sans-serif-light',color: Colors.lightBlueAccent),),
                SizedBox(height: 10,),
                Text('-We reserve the right to modify these Terms at any time. Significant changes will be communicated with at least 30 days’ notice. Continued use of the Service after changes indicates acceptance of the revised Terms.',style: TextStyle(fontFamily: 'sans-serif-thin',fontSize: 15,color: Colors.white),),
                SizedBox(height: 20,),
                Text('8. Limitation of Liability',style: TextStyle(fontSize: 20,fontFamily: 'sans-serif-light',color: Colors.lightBlueAccent),),
                SizedBox(height: 10,),
                Text('-To the fullest extent permitted by law, the Company is not liable for any indirect, incidental, special, or consequential damages arising from your use of the Service. Our liability is limited to the amount you paid for using the Service or 100 USD if no payment was made.',style: TextStyle(fontFamily: 'sans-serif-thin',fontSize: 15,color: Colors.white),),
                SizedBox(height: 20,),
                Text('9. Governing Law',style: TextStyle(fontSize: 20,fontFamily: 'sans-serif-light',color: Colors.lightBlueAccent),),
                SizedBox(height: 10,),
                Text('-These Terms are governed by and construed in accordance with the laws of India. Any disputes arising out of or related to these Terms or the use of the Service will be subject to the exclusive jurisdiction of the courts located in Nainital, India.',style: TextStyle(fontFamily: 'sans-serif-thin',fontSize: 15,color: Colors.white),),
                SizedBox(height: 20,),
                Text('10. Important Notes',style: TextStyle(fontSize: 20,fontFamily: 'sans-serif-light',color: Colors.lightBlueAccent),),
                SizedBox(height: 10,),
                Text('-Data Privacy:\nWe are committed to protecting your personal information. We do not share your data with third parties. Your information is used solely for the purposes stated in this policy and is securely stored.Termination: We may terminate or suspend your access to the Service without notice for any violation of these Terms.No Warranty: The Service is provided “AS IS” without any warranties. We do not guarantee that the Service will meet your requirements or be error-free.Severability: If any provision of these Terms is held to be unenforceable or invalid, the remaining provisions will continue in full force and effect.Waiver: The failure to exercise a right or to require performance of an obligation under these Terms shall not affect a party’s ability to exercise such right or require such performance at any time thereafter.',style: TextStyle(fontFamily: 'sans-serif-thin',fontSize: 15,color: Colors.white),),
                SizedBox(height: 20,),
                Text('11. Dispute Resolution',style: TextStyle(fontSize: 20,fontFamily: 'sans-serif-light',color: Colors.lightBlueAccent),),
                SizedBox(height: 10,),
                Text('-If you have any concerns or disputes about the Service, you agree to first try to resolve the dispute informally by contacting the Company.',style: TextStyle(fontFamily: 'sans-serif-thin',fontSize: 15,color: Colors.white),),
                SizedBox(height: 20,),
                Text('12. Translation Interpretation',style: TextStyle(fontSize: 20,fontFamily: 'sans-serif-light',color: Colors.lightBlueAccent),),
                SizedBox(height: 10,),
                Text('-These Terms and Conditions may have been translated if we have made them available to you on our Service. You agree that the original English text shall prevail in the case of a dispute.',style: TextStyle(fontFamily: 'sans-serif-thin',fontSize: 15,color: Colors.white),),
                SizedBox(height: 20,),
                Text('13. Changes to These Terms and Conditions',style: TextStyle(fontSize: 20,fontFamily: 'sans-serif-light',color: Colors.lightBlueAccent),),
                SizedBox(height: 10,),
                Text('-We reserve the right, at our sole discretion, to modify or replace these Terms at any time. If a revision is material we will make reasonable efforts to provide at least 30 days’ notice prior to any new terms taking effect. What constitutes a material change will be determined at our sole discretion.\n\nBy continuing to access or use our Service after those revisions become effective, you agree to be bound by the revised terms. If you do not agree to the new terms, in whole or in part, please stop using the website and the Service.',style: TextStyle(fontFamily: 'sans-serif-thin',fontSize: 15,color: Colors.white),),
                SizedBox(height: 20,),
                Text('14. Contact Information',style: TextStyle(fontSize: 20,fontFamily: 'sans-serif-light',color: Colors.lightBlueAccent),),
                SizedBox(height: 10,),
                Text('-For any questions regarding these Terms and Conditions, please contact us at',style: TextStyle(fontFamily: 'sans-serif-thin',fontSize: 15,color: Colors.white),),
                Text('mail : teamcelestialmail.com',style: TextStyle(fontFamily: 'nexaheavy',fontSize: 18,color: Colors.pink),),
                SizedBox(height: 20,),

              ],
            )
      )
          ]
        ),]
      )
    );
  }
}
