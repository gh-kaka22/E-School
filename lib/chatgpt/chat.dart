import 'package:chat_gpt_sdk/chat_gpt_sdk.dart';
import 'package:e_school/chatgpt/message_model.dart';
import 'package:e_school/shared/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:intl/intl.dart';

class ChatPage extends StatefulWidget {


  const ChatPage({
    super.key,

  });

  @override
  State<StatefulWidget> createState() {
    return _ChatPageState();
  }
}

class _ChatPageState extends State<ChatPage> {
  late final OpenAI _openAI;
  late bool _isLoading;

  final TextEditingController _textController = TextEditingController();
  late List<ChatMessage> _messages;

  @override
  void initState() {
    _messages = [];
    _isLoading = false;

    /// Initialize ChatGPT SDK
    _openAI = OpenAI.instance.build(
      token: dotenv.env['OPENAI_API_KEY'],
      baseOption: HttpSetup(
        receiveTimeout: const Duration(seconds: 30),
      ),
    );

    // telling gpt what to say at start and who is he
    _handleInitialMessage(
      'You are a student assistant. Please send a super short intro message. Your name is Echo.',
    );
    super.initState();
  }

  Future<void> _handleInitialMessage(String character) async {
    setState(() {
      _isLoading = true;
    });

    final request = ChatCompleteText(
      messages: [
        Map.of({"role": "assistant", "content": character})
      ],
      maxToken: 200,
      model: kChatGptTurbo0301Model,
    );

    final response = await _openAI.onChatCompletion(request: request);
    ChatMessage message = ChatMessage(
      text: response!.choices.first.message.content.trim().replaceAll('"', ''),
      isMine: false,
      timestamp: DateTime.now(),
    );

    setState(() {
      _messages.insert(0, message);
      _isLoading = false;
    });
  }

  Future<void> _handleSubmit(String text) async {
    setState(() {
      _isLoading = true;
    });
    _textController.clear();

    //  user sent message
    ChatMessage prompt = ChatMessage(
      text: text,
      isMine: true,
      timestamp: DateTime.now(),
    );

    setState(() {
      _messages.insert(0, prompt);
    });

    //  ChatGPT request and response
    final request = ChatCompleteText(
      messages: [
        Map.of({"role": "user", "content": text})
      ],
      maxToken: 200,
      model: kChatGptTurbo0301Model,
    );
    final response = await _openAI.onChatCompletion(request: request);

    //  user received message
    ChatMessage message = ChatMessage(
      text: response!.choices.first.message.content.trim(),
      isMine: false,
      timestamp: DateTime.now(),
    );

    setState(() {
      _messages.insert(0, message);
      _isLoading = false;
    });
  }

  Widget _buildChatList() {
    return Flexible(
      child: ListView.builder(
        padding: const EdgeInsets.all(8.0),
        reverse: true,
        itemCount: _messages.length,
        itemBuilder: (_, int index) {
          ChatMessage message = _messages[index];
          return _buildChatBubble(message);
        },
      ),
    );
  }

  Widget _buildChatBubble(ChatMessage message) {
    final isMine = message.isMine;
    final dateFormat = DateFormat('MMM d, yyyy');
    final timeFormat = DateFormat('h:mm a');

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10.0),
      child: Row(
        mainAxisAlignment:
            isMine ? MainAxisAlignment.end : MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Flexible(
            child: Container(
              margin: isMine
                  ? const EdgeInsets.only(left: 100)
                  : const EdgeInsets.only(right: 100),
              decoration: BoxDecoration(
                color: isMine ? kDarkBlue3Color : Colors.grey[300],
                borderRadius: BorderRadius.only(
                  topLeft: const Radius.circular(12.0),
                  topRight: const Radius.circular(12.0),
                  bottomLeft: isMine
                      ? const Radius.circular(12.0)
                      : const Radius.circular(0.0),
                  bottomRight: isMine
                      ? const Radius.circular(0.0)
                      : const Radius.circular(12.0),
                ),
              ),
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 10,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      !isMine
                          ? CircleAvatar(
                        backgroundColor: kWhiteColor.withOpacity(0.1),
                              child: ClipOval(
                                  child: Image.asset(
                                      'assets/images/robot_teacher_s.jpg')),
                            )
                          : CircleAvatar(
                        backgroundColor: kDarkBlue3Color,
                        child: ClipOval(
                            child: Image.asset(
                                'assets/icons/graduating-student-b.png')),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        isMine ? 'You' : '@Echo_Bot',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: isMine ? Colors.white : Colors.black,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Text(
                    message.text,
                    style: TextStyle(
                      color: isMine ? Colors.white : Colors.black,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    '${dateFormat.format(message.timestamp)} at ${timeFormat.format(message.timestamp)}',
                    style: TextStyle(
                      color: isMine ? Colors.white : Colors.black87,
                      fontSize: 8,
                    ),
                  ),
                  const SizedBox(height: 4),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildChatComposer() {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 8,
        vertical: 12,
      ),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: _textController,
              decoration: InputDecoration.collapsed(
                hintText: 'Type a message',
                enabled: !_isLoading,
              ),
              /// when user presses done
              onSubmitted: _isLoading ? null : _handleSubmit,
            ),
          ),
          IconButton(
            icon: const Icon(Icons.send),
            ///  when user presses the send icon
            onPressed: _isLoading
                ? null
                : () => _handleSubmit(
                      _textController.text,
                    ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: double.infinity,
        leading: Row(
          children: [
            SizedBox(
              width: 20,
            ),
            GestureDetector(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: const Icon(
                Icons.arrow_back,
                color: Colors.white,
              ),
            ),
            Center(
                child: Container(
                    width: 100,
                    height: 100,
                    child: Image.asset('assets/images/robot.png'))),
            Text(
              'AI Teacher',
              style: TextStyle(fontSize: 22),
            )
          ],
        ),
        title: Center(
            child: Container(
                width: 100,
                height: 100,
                child: Image.asset('assets/images/robot.png'))),
        backgroundColor: kChatBar,
        elevation: 0,
      ),
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/background2.png'),
                    fit: BoxFit.fill)),
          ),

          Column(
            children: [
              _buildChatList(),
              const Divider(height: 1.0),
              Container(
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                ),
                child: _buildChatComposer(),
              ),
            ],
          ),
          if (_isLoading)
            Center(
              child: Container(
                margin: const EdgeInsets.all(20),
                child: const CircularProgressIndicator(color: Colors.teal,),
              ),
            ),
        ],
      ),
    );
  }
}
