import 'package:flutter/material.dart';
import '../services/assets_manager.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class ChatSreen extends StatefulWidget {
  const ChatSreen({super.key});

  @override
  State<ChatSreen> createState() => _ChatSreenState();
}

class _ChatSreenState extends State<ChatSreen> {
  final bool _isTyping = true;

  late TextEditingController textEditingController;

  @override
  void initState() {
    // TODO: implement initState
    textEditingController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(elevation: 2,
        leading: Padding(
        padding: EdgeInsets.all(8.0),
        child: Image.asset(AssetsManager.openaiLogo),
      ),
      title: Text("Chatbot_Hme"),
      ),
      
      body: SafeArea(
        child: Column(children: [
          Flexible(
            child: ListView.builder(
              itemCount: 6,
              itemBuilder: (context, index){
              return const Text("Bonjour et bienvenue sur notre application");
              }
            ),
          ),
          if (_isTyping) ...[
           const SpinKitFadingCircle(
                color: Color.fromARGB(254, 58, 222, 12),
                size: 18,
              ),
              Row(children: [
               Expanded(
                child: TextField(controller: textEditingController,
                onSubmitted:  (value) async {
                         // await sendMessageFCT(
                           //   modelsProvider: modelsProvider,
                           //   chatProvider: chatProvider);
                        },
                        decoration: const InputDecoration.collapsed(
                            hintText: "How can I help you",
                            hintStyle: TextStyle(color: Color.fromARGB(255, 48, 56, 56))),
                      ), 
                ),
              ],),
            ],
        ],),
        ),
    );
  }
}