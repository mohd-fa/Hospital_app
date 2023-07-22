import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';

class Ambulance extends StatelessWidget {
  const Ambulance({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: ElevatedButton(
            style: const ButtonStyle(fixedSize: MaterialStatePropertyAll(Size(100, 50))),
        onPressed: () {
          FlutterPhoneDirectCaller.callNumber('+919497495050');
        },
        child: const Text('call'),
      )),
    );
  }
}
