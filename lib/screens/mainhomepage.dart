import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:doctor_appointment_ui/screens/appoint_screen.dart';
import 'package:doctor_appointment_ui/screens/auth_page.dart';
import 'package:doctor_appointment_ui/screens/home_screen.dart';
import 'package:doctor_appointment_ui/screens/loginPage.dart';
import 'package:doctor_appointment_ui/screens/profile_page.dart';
import 'package:doctor_appointment_ui/utils/utils.dart';
import 'package:doctor_appointment_ui/widgets/mainhomepagegrid.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import '../widgets/mainhomepagegrid.dart';

class MainHomePage extends StatelessWidget {
  void signUserOut() {
    FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Color.fromRGBO(89, 193, 142, 1),
        color: Color.fromARGB(224, 0, 128, 255),
        animationCurve: Curves.decelerate,
        onTap: (index) {
          if (index == 0) {
            signUserOut();
          }

          if (index == 1) {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => HomeScreen(),
                ));
          }

          if (index == 2) {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProfileScreen(),
                ));
          }
        },
        animationDuration: Duration(milliseconds: 200),
        items: [
          Icon(
            Icons.login_outlined,
          ),
          Icon(Icons.adb),
          Icon(Icons.account_circle_outlined),
        ],
      ),
      resizeToAvoidBottomInset: false,
      backgroundColor: Color.fromRGBO(89, 193, 142, 1),
      appBar: AppBar(
        elevation: 0,
        title: new Padding(
          padding: const EdgeInsets.only(left: 20.0),
          child: Text(
            'DR BOT',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 25,
              color: Colors.black,
            ),
          ),
        ),
        actions: <Widget>[
          IconButton(
            icon: const Icon(
              Icons.account_circle_outlined,
              color: Colors.black,
            ),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProfileScreen(),
                  ));
            },
          )
        ],
      ),
      body: ListView(
        children: [
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('Welcome Back!', style: MainHeading),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: MainHomePageGrid(),
          )
        ],
      ),
    );
  }
}
