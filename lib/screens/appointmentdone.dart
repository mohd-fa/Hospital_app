import 'package:flutter/material.dart';

class AppointmentDone extends StatelessWidget {
  const AppointmentDone({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(87, 193, 142, 1),
      body: const Align(
        alignment: Alignment.center,
        child: SizedBox(
          height: 50,
          child: Text(
            "Your Appointment has been booked!",
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pop(context);
          // Add your onPressed code here!
        },
        backgroundColor: const Color.fromARGB(224, 0, 128, 255),
        child: const Icon(
          Icons.arrow_back_ios_new,
          color: Colors.white,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startTop,
    );
  }
}
