// ignore_for_file: prefer_const_constructors

import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:doctor_appointment_ui/chatbot/chatbot_page.dart';
import 'package:doctor_appointment_ui/screens/profile_page.dart';
import 'package:doctor_appointment_ui/utils/utils.dart';
import 'package:doctor_appointment_ui/widgets/mainhomepagegrid.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class MainHomePage extends StatelessWidget {
  const MainHomePage({super.key});

  void signUserOut() {
    FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: const Color.fromRGBO(89, 193, 142, 1),
        color: const Color.fromARGB(224, 0, 128, 255),
        animationCurve: Curves.decelerate,
        index: 1,
        onTap: (index) {
          if (index == 0) {
            signUserOut();
          }

          if (index == 1) {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ChatBotPage(),
                ));
          }

          if (index == 2) {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ProfileScreen(),
                ));
          }
        },
        animationDuration: const Duration(milliseconds: 200),
        items: const [
          Icon(
            Icons.login_outlined,
          ),
          Icon(Icons.adb),
          Icon(Icons.account_circle_outlined),
        ],
      ),
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color.fromRGBO(89, 193, 142, 1),
      appBar: AppBar(
        elevation: 0,
        title: const Padding(
          padding: EdgeInsets.only(left: 20.0),
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
                    builder: (context) => const ProfileScreen(),
                  ));
            },
          )
        ],
      ),
      body: ListView(
        children: const [
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Text('Welcome Back!', style: mainHeading),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: MainHomePageGrid(),
          )
        ],
      ),
    );
  }
}
