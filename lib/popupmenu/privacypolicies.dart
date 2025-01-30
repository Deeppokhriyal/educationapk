import 'package:flutter/material.dart';

class Privacypolicies extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body:ListView(
            children:[ Stack(
                children: [
                  Container(padding: EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/images/blueback.jpg'), // Path to your background image
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                              padding: EdgeInsets.only(top: 25),

                              child: Text('Privacy & Policy',style: TextStyle(fontSize: 38,fontFamily: 'nexaheavy',color: Colors.lightBlueAccent,))),
                          SizedBox(height: 55,),
                          Text('Your privacy is important to us.',style: TextStyle(fontSize: 32,fontFamily: 'nexalight',color: Colors.lightBlueAccent),),
                          SizedBox(height: 20,),
                          Text('The User of this Application (defined below), agrees to be bound by this privacy policy (“Policy”). In the event the terms and conditions of the Policy are not agreeable to the User, the User is requested to refrain from using this Application.',style: TextStyle(fontFamily: 'sans-serif-thin',fontSize: 15,color: Colors.white),),
                          SizedBox(height: 20,),
                          Text('1. COLLECTION OF INFORMATION',style: TextStyle(fontSize: 20,fontFamily: 'sans-serif-light',color: Colors.lightBlueAccent),),
                          SizedBox(height: 10,),
                          Text('-Developer may during the course of the User’s usage of the Application collect the following personal and non-personal information and such other information from the Users for accessing the Application (“Information”), as part of the voluntary registration process, any on-line survey or interaction on the Application or combination thereof, as may be required from time to time. The Information shall be collected in order to conduct operations on the Application. The Application collects or can request the below mentioned Information from the Users:',style: TextStyle(fontFamily: 'sans-serif-thin',fontSize: 15,color: Colors.white),),
                          SizedBox(height: 20,),
                          // Text('1.1 Personal Information: ',style: TextStyle(fontFamily: 'sans-serif-thin',fontSize: 15,color: Colors.white),),
                          // Text('',style: TextStyle(fontSize: 20,fontFamily: 'sans-serif-light',color: Colors.lightBlueAccent),),
                            Text('2. REPRESENTATION AND WARRANTIES',style: TextStyle(fontSize: 20,fontFamily: 'sans-serif-light',color: Colors.lightBlueAccent),),
                          SizedBox(height: 15,),
                          Text('Every User hereby represents and warrants to the Developer that:'
                              '\n\n(a) all Information provided by the User is true, correct, current and updated\n'
                              '(b) all Information provided by the User and the provision of such Information by the User does not in any manner violate any third-party agreement, law, decree, order or judgement\n'
                              '(c) all Information provided by the User does not belong to any third party, and if it does belong to a third party, the User is duly authorized by such Third Party to use, access and disseminate such Information\n'
                              '(d) the officers, directors, contractors or agents of Developer shall not be responsible in any manner whatsoever with regard to the authenticity or veracity of the Information that a User may provide to the Application and\n'
                              '(e) the User shall indemnify and hold harmless Developer and each of its officers, directors, contracts or agents and any third party relying on the Information provided by the User in the event the User is in breach of this Policy.',style: TextStyle(fontFamily: 'sans-serif-thin',fontSize: 15,color: Colors.white),),
                          SizedBox(height: 20,),
                          Text('\nDeveloper represents and warrants to every User that:\n'
                              '(a) it shall not collect the User’s sensitive personal data unless such sensitive personal data is collected for a lawful purpose for which such collection of data is necessary.'
                              '\n(b) it shall not retain any sensitive personal data for longer than such sensitive personal data is required or can be lawfully used.'
                              '\n(c) in the event Developer collects Information directly from the User, Developer shall make reasonable effort to apprise the User of the purpose of such collection of Information, the intended recipient of the Information and the details of the agencies collecting and retaining the Information.'
                              '\n(d) it has in place the security practices and procedures prescribed under the Information Technology (Reasonable Security Practices and Procedures and Sensitive Personal Data or Information) Rules, 2011 (“IT Rules”).',style: TextStyle(fontFamily: 'sans-serif-thin',fontSize: 15,color: Colors.white),),
                          Text('3. PURPOSE AND USE OF INFORMATION',style: TextStyle(fontSize: 20,fontFamily: 'sans-serif-light',color: Colors.lightBlueAccent),),
                          SizedBox(height: 10,),
                          Text('All Information collected/stored by the Application shall be used for:'
                              '\n(a) providing information about new educational products and services to the Users'
                              '\n(b) to continually improve the existing Application and service offerings'
                              '\n(c) to conduct research and surveys'
                              '\n(d) to implement the necessary security practices to ensure that all personal data are protected'
                              '\n(e) to administer the User accounts in normal course of business\n'
                              '(f) to contact the Users in case where fraud, illegal activities or breach of privacy is recorded'
                              '\n(g) to enable the employees of or persons acting on behalf of the Developer to communicate with the User, as and when necessary, in order to provide the services requested by such User'
                              '\n(h) such other purposes that Developer, at its sole discretion, however subject to the principles contained in this Policy, may deem fit.',style: TextStyle(fontFamily: 'sans-serif-thin',fontSize: 15,color: Colors.white),),

                          SizedBox(height: 20,),
                          Text('4. SHARING OF INFORMATION',style: TextStyle(fontSize: 20,fontFamily: 'sans-serif-light',color: Colors.lightBlueAccent),),
                          SizedBox(height: 10,),
                          Text('Every User hereby expressly agrees that Developer may share the Information collected from such User with its affiliates, employees, and such other individuals and institutions located within or outside India from time to time to ensure efficient management of Application traffic, to detect and prevent identity theft and other illegal acts, and to respond to legal, judicial, quasi-judicial law enforcement agencies or in connection with an investigation on matters related to public safety, as required and permitted by law and for such other purposes that the Developer may deem fit from time to time.', style: TextStyle(fontFamily: 'sans-serif-thin',fontSize: 15,color: Colors.white),),
                          SizedBox(height: 20,),
                          Text('5. DATA RETENTION',style: TextStyle(fontSize: 20,fontFamily: 'sans-serif-light',color: Colors.lightBlueAccent),),
                          SizedBox(height: 10,),
                          Text('Developer shall retain Information for as long as is reasonably necessary in relation to the purposes for which this data was collected. In many instances, Developer shall retain Information that is necessary for operation of the Application by the User, which may include maintaining this Information beyond when the User ceases using the Application.'
                              '\n\nHowever, all Information pertaining to chats and student side test attempts shall be retained by Developer for a minimum period of 2 years from date of receipt of such Information, after which such Information, if deemed fit by the Developer, shall be erased from the Developer servers and databases.',
                            style: TextStyle(fontFamily: 'sans-serif-thin',fontSize: 15,color: Colors.white),),
                          SizedBox(height: 20,),
                          Text('6. COOKIES AND THIRD-PARTY APPLICATION LINKS',style: TextStyle(fontSize: 20,fontFamily: 'sans-serif-light',color: Colors.lightBlueAccent),),
                          SizedBox(height: 10,),
                          Text('6.1 The Application sends cookies (small files containing a string of characters) to your computer, thereby uniquely identifying your browser. Cookies are used to track your preferences, help you login faster, and aggregated to determine user trends. This data is used to improve offerings, such as providing more content in areas of greater interest to a majority of users.\n6.2 Most browsers are initially set up to accept cookies, but you can reset your browser to refuse all cookies or to indicate when a cookie is being sent.\n6.3 Disclaimer: Some of the Application features and services may not function properly if your cookies are disabled.\n6.4 The Application may contain links that will redirect the Users to third party websites or applications that may have access to the personal information of the User to which this Policy shall not be applicable. Thereby, every User agrees and acknowledges that accessing third party websites or applications through links provided on the Application will solely be at the Users discretion. Additionally, Developer shall under no circumstance be held liable for breach of privacy by such third-party websites or applications nor shall it be liable for any objectionable content that may be displayed on such third-party websites or applications The Application may contain links to other applications and websites; however, every User agrees and acknowledges that the Application shall not be responsible for the privacy practices of other third-party websites or applications which it does not own, manage or control.',style: TextStyle(fontFamily: 'sans-serif-thin',fontSize: 15,color: Colors.white),),
                          SizedBox(height: 20,),
                          Text('7. PROTECTION OF INFORMATION',style: TextStyle(fontSize: 20,fontFamily: 'sans-serif-light',color: Colors.lightBlueAccent),),
                          SizedBox(height: 10,),
                          Text('7.1 Developer understands and acknowledges the importance of security and protection of the Information provided by and/or collected from the Users. Pursuant to the same, Developer shall make the best efforts to ensure protection of Information by use of such security measures and programs that it may deem fit for the purpose. We shall employ best efforts to protect the Information against any unauthorized, illegal and fraudulent use of such Information by third parties.\n7.2 Notwithstanding anything to the contrary, Developer shall not be held responsible for any loss, damage or misuse of the Information caused to the User, if such loss, damage or misuse is attributable to an event beyond the control of or attributable to Developer or a force majeure event.\n7.3 The Tutor shall use the Information only as authorized and as necessary for the operation of the Application and shall be solely responsible and liable for appropriate storage and dissemination of the Information. The Developer shall not be liable for any unauthorized or illicit use, storage or distribution of Information by the Tutor.\n7.4 Developer shall ensure that the Application shall adopt appropriate encryption and security measures to prevent any hacking of the information of the Users and third parties and shall ensure that the User shall not be required or asked to disclose any Information, which may be prejudicial to the interests of the User. Currently, the content available on the Application is encrypted with AES 256 encryption where the data transfers are secured with HTTPS secured protocols and video content is delivered through HLS protocols.\n7.5 Developer shall use the Information collected from the Users in accordance with applicable laws including but not limited to the IT Act and the rules made thereunder and use the Information only for the purpose for which it was furnished.\n7.6 Developer has appropriate physical, electronic and managerial procedures in relation to the Application. The servers of the Application are accessible only to the authorized personnel and any Information of the User shall be shared with the authorized personnel only on a need-to-know basis to facilitate the services requested by the User. Developer shall endeavor to safeguard the confidentiality of a User’s personally identifiable information, however, the transmissions made by means of the Internet cannot be made absolutely secure by the Application. The User agrees and acknowledges that Developer shall not be liable for disclosure of any information due to errors in transmission or any unauthorized acts of third parties.\n7.7 The User agrees and acknowledges that Developer shall be entitled to share the Information where such sharing is necessary for the lawful performance of the contractual obligations existing between Developer and the User and for such purposes as it may deem fit, however, the disclosure of Information shall be in accordance with this Policy, the IT Act and the rules made thereunder.',style: TextStyle(fontFamily: 'sans-serif-thin',fontSize: 15,color: Colors.white),),
                          SizedBox(height: 20,),
                          Text('8. OPTION TO OPT OUT AND WITHDRAWAL OF INFORMATION',style: TextStyle(fontSize: 20,fontFamily: 'sans-serif-light',color: Colors.lightBlueAccent),),
                          SizedBox(height: 10,),
                          Text('The User has the option of not providing its Information to the Developer. Further, Information provided and/or collected by the Developer may be withdrawn at any time during or pursuant to usage of the Application by a User. Users desirous of withdrawing the Information shall send an email to the grievance officer and request for such withdrawal. The Developer may subsequent to such withdrawal of information, at its sole discretion continue or discontinue the provision of its services to such User.',style: TextStyle(fontFamily: 'sans-serif-thin',fontSize: 15,color: Colors.white),),
                          SizedBox(height: 20,),
                          Text('9. GRIEVANCE REDRESSAL',style: TextStyle(fontSize: 20,fontFamily: 'sans-serif-light',color: Colors.lightBlueAccent),),
                          SizedBox(height: 10,),
                          Text('The User may report violation of breach of privacy, Information or identify theft or grievances in relation to the Information shared, collected, stored or disseminated by Developer in relation to the Application, to the grievance officer. The details of the grievance officer are as below:\nAttn: Mukul Rustagi\nAddress: 1st Floor, Building No, D8, Block D, Sector 3, Noida, Uttar Pradesh 201301\nE-mail Address: support@classplus.co',style: TextStyle(fontFamily: 'sans-serif-thin',fontSize: 15,color: Colors.white),),
                          SizedBox(height: 20,),
                          Text('10. UPDATION OF POLICY',style: TextStyle(fontSize: 20,fontFamily: 'sans-serif-light',color: Colors.lightBlueAccent),),
                          SizedBox(height: 10,),
                          Text('Developer reserves the right to change or update this Policy at any time without notice to the User. Such updates or changes to these Policy shall take effect from the date indicated in the updated Policy. You are advised to review our Policy periodically for any changes.',style: TextStyle(fontFamily: 'sans-serif-thin',fontSize: 15,color: Colors.white),),
                          SizedBox(height: 20,),
                          Text('11. GOVERNING LAW AND JURISDICTION',style: TextStyle(fontSize: 20,fontFamily: 'sans-serif-light',color: Colors.lightBlueAccent),),
                          SizedBox(height: 10,),
                          Text('This Policy is governed and construed in accordance with laws of India. In the event of any dispute arising between the parties with respect to this Policy, the dispute shall be referred to an arbitral tribunal comprising of 3 (three) arbitrators, wherein each party shall appoint one arbitrator and the third arbitrator shall be appointed by the aforesaid two arbitrators; and the arbitration shall be conducted in accordance with the Indian Arbitration and Conciliation Act of 1996. The language of arbitration proceeding shall be English. The seat and venue of arbitration shall be New Delhi, India and the decision of the arbitrator shall be final and binding on the parties. Subject to this arbitration clause for dispute resolution, this Policy shall be subject to the exclusive jurisdiction of courts in New Delhi, India.',style: TextStyle(fontFamily: 'sans-serif-thin',fontSize: 15,color: Colors.white),),
                          SizedBox(height: 20,),
                          Text('12. USE OF THE APPLICATION BY CHILDREN',style: TextStyle(fontSize: 20,fontFamily: 'sans-serif-light',color: Colors.lightBlueAccent),),
                          SizedBox(height: 10,),
                          Text('To register on the Application, you must meet the Age Requirements specified hereinbelow. If you are a ‘Minor’ or ‘Child’, i.e., an individual who does not meet the Age Requirements, then you may not register on the Application, and only your parent can register on your behalf, agree to all Application T&Cs and enable access to you under their guidance and supervision.\n\nWhile some of our services may require collection of a Minor or Child’s personal information, we do not knowingly collect such personal information. In the event a Minor or Child utilizes the Application, it is assumed that he / she has obtained the consent of the parent / legal guardian and such use is made available by the parents or legal guardian.Developer will not be responsible for any consequences that arise as a result of misuse of our Application, that may occur by virtue of any person including a Minor or Child registering on the Application. Developer reserves the right to terminate your subscription and / or refuse to provide you with access to the Application if it is discovered that you do not meet the Age Requirements and the consent to use the Application is not given by your parent / legal guardian. We will also take the necessary steps to remove such information from our servers.\n\nIf you are a parent / legal guardian and you are aware that your child has provided us with personal information without your consent, \nplease contact us at support@teamcelestial.com\nIf your Child faces bullying, abuse or harassment while availing our Services, please contact us at support@teamcelestial.com',style: TextStyle(fontFamily: 'sans-serif-thin',fontSize: 15,color: Colors.white),),

                        ],
                      )
                  )
                ]
            ),]
        )
    );
  }
}
