import 'message_tile.dart';

List<MessageTile> chatMessages = [];
bool canUserSendMessage = true;
bool sessionStarted = false;
int i = 0;
List<List<int>> medicalResponse = [];
Map<String, int> expectedResponses = {"yes": 1, "no": 0};
List<String> medicalQuestions = [
  '1. weight loss ?',
  '2. nausea ?',
  '3. back pain ?',
  '4. yellowing of eyes ?',
  '5. neck pain ?',
  '6. swollen extremeties ?',
  '7. hip joint pain ?',
  '8. movement stiffness ?',
  '9. unsteadiness ?',
  '10. loss of smell ?',
  '11. internal itching ?',
  '12. muscle pain ?',
  '13. belly pain ?',
  '14. abnormal menstruation ?',
  '15. dischromic patches ?',
  '16. polyuria ?',
  '17. rusty sputum ?',
  '18. lack of concentration ?',
  '19. fluid overload ?',
  '20. blood in sputum ?',
  '21. prominent veins on calf ?',
  '22. silver like dusting ?'
];

class MessageController {
  MessageController() {
    if (chatMessages.isEmpty) {
      chatMessages.insert(
          0,
          MessageTile(
              message:
                  "To start the session send START\nand to stop send STOP.",
              messenger: "CHAT BOT"));
    }
    //
    if (i == medicalQuestions.length) {
      i = 0;
      medicalResponse.clear();
    }
  }

  String addUserMessage(String message) {
    chatMessages.insert(0, MessageTile(message: message, messenger: "ME"));
    canUserSendMessage = false;
    if (!sessionStarted) {
      if (message.toLowerCase() == "start") {
        sessionStarted = true;
        return "Session Started.\nPlease answer the following questions\nwith yes or no.\n\n${medicalQuestions[0]}";
      } else if (message.toLowerCase() == "stop") {
        return "No active session.";
      } else {
        return "To start the session send START\nand to stop send STOP.";
      }
    } else {
      if (message.toLowerCase() == "start") {
        sessionStarted = true;
        return "A session is already active.";
      } else if (message.toLowerCase() == "stop") {
        sessionStarted = false;
        canUserSendMessage = false;
        return "Session Stopped."; //reset the tree
      } else if (expectedResponses.containsKey(message.toLowerCase())) {
        medicalResponse.add([expectedResponses[message]!]);
        if (i >= medicalQuestions.length-1) {
          i = 0;
          sessionStarted = false;
          return "Predicting...";
        }
        i++;
        return medicalQuestions[i];
        //feed it to the decison tree//fetch the reply and add it to messages list
      } else {
        return "Invalid response.";
      }
    }
  }
}

addBotMessage(String message) {
  chatMessages.insert(0, MessageTile(message: message, messenger: "CHAT BOT"));
  canUserSendMessage = true;
}
