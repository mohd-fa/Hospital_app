import 'package:doctor_appointment_ui/chatbot/api.dart';
import 'package:doctor_appointment_ui/chatbot/message_controller.dart';
import 'package:doctor_appointment_ui/screens/colors.dart';
import 'package:flutter/material.dart';

import 'custom_scroll.dart';

class ChatBotPage extends StatefulWidget {
  const ChatBotPage({super.key});
  @override
  State<ChatBotPage> createState() => _ChatBotPageState();
}

class _ChatBotPageState extends State<ChatBotPage> {
  final TextEditingController _controller = TextEditingController();
  final MessageController _messageController = MessageController();
  final API _api = API();
  // ignore: prefer_final_fields
  double _opactiy = 0;
  // ignore: prefer_final_fields
  double _height = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 1,
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            icon: const Icon(Icons.arrow_back_ios_new_rounded),
            onPressed: () async{
          
              Navigator.pop(context);
            },
          ),
        ],
        flexibleSpace: SafeArea(
          child: Row(
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 12),
                child: Center(
                  child: CircleAvatar(
                    maxRadius: 18,
                    child: Icon(Icons.adb),
                  ),
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    "Chat Bot ",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                      height: 1,
                    ),
                  ),
                  AnimatedContainer(
                    duration: const Duration(milliseconds: 600),
                    height: _height,
                    child: AnimatedOpacity(
                      duration: const Duration(milliseconds: 100),
                      opacity: _opactiy,
                      child: const Text(
                        "typing... ",
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 13,
                            height: 1,
                            color: Colors.black87),
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
        backgroundColor: pColor,
      ),
      body: Column(
        children: [
          Expanded(
            child: ScrollConfiguration(
              behavior: MyBehavior(),
              child: ListView.builder(
                itemCount: chatMessages.length,
                reverse: true,
                itemBuilder: (context, index) {
                  return Align(
                      alignment: Alignment.bottomCenter,
                      child: chatMessages[index]);
                },
              ),
            ),
          ),
          const Divider(
            color: Colors.black12,
            thickness: 1,
            height: 1,
          ),
          Container(
            padding: const EdgeInsets.only(left: 10, bottom: 10, top: 10),
            margin: const EdgeInsets.only(left: 8, right: 8, bottom: 5, top: 5),
            height: 60,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.black12,
              borderRadius: BorderRadius.circular(28),
            ),
            child: Row(
              children: [
                const SizedBox(
                  width: 15,
                ),
                Expanded(
                  child: TextField(
                    controller: _controller,
                    cursorColor: pColor,
                    textInputAction: TextInputAction.none,
                    decoration: const InputDecoration(
                        hintText: "message...",
                        hintStyle: TextStyle(color: Colors.black54),
                        border: InputBorder.none),
                  ),
                ),
                const SizedBox(
                  width: 15,
                ),
                IconButton(
                  splashRadius: 0.1,
                  icon: const Icon(
                    Icons.send_rounded,
                    color: Colors.black,
                    size: 20,
                  ),
                  onPressed: () async {
                    if (!canUserSendMessage) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text("wait for response!"),
                          duration: Duration(milliseconds: 900),
                          backgroundColor: Colors.black38,
                          elevation: 0,
                        ),
                      );
                      return;
                    }
                    if (_controller.text.trim() == "") return;
                    String? botMessage;
                    setState(
                      () {
                        botMessage = _messageController
                            .addUserMessage(_controller.text.trim());
                        _opactiy = 1;
                        _height = 15;
                      },
                    );
                    _controller.clear();

                    await Future.delayed(
                        Duration(milliseconds: botMessage!.length * 35 + 250));
                    setState(
                      () {
                        _opactiy = 0;
                        _height = 0;
                        addBotMessage(botMessage!);
                      },
                    );
                    
                    if (botMessage == "Predicting...") {
                      canUserSendMessage = false;
                      botMessage = await _api.getPrediction();
                      await Future.delayed(Duration(
                          milliseconds: botMessage!.length * 35 + 250));
                      setState(
                        () {
                          _opactiy = 0;
                          _height = 0;
                          addBotMessage("${botMessage!}\n\nSession Ended.");
                        },
                      );
                    }
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
