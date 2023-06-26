import 'package:doctor_appointment_ui/chatbot/message_controller.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class API {
  final String url = "https://akarshanilkumar.pythonanywhere.com/predict";

  Future<String> getPrediction() async {
    var uri = Uri.parse(url);
    var data = {"features": medicalResponse};
    var headers = {'Content-Type': 'application/json'};
    var response = await http.post(
      uri,
      headers: headers,
      body: jsonEncode(data),
    );
    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body);
      String prediction = jsonResponse['prediction'].toString();
      return prediction;
    } else {
      return response.statusCode.toString();
    }
  }
}
