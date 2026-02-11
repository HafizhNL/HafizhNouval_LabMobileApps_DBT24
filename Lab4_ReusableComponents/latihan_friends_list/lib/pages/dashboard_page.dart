import 'package:flutter/material.dart';
import '../components/contact_card.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {

  bool isChatOpen = false;
  String selectedName = "";
  String selectedImage = "";
  bool selectedActive = false;

  /// ================= CHAT DATA PER CONTACT =================
  final Map<String, List<Map<String, dynamic>>> chatData = {
    "Hajeera": [
      {"text": "Hi Hajeera 👋", "isMe": true},
      {"text": "Hello! How are you?", "isMe": false},
      {"text": "I have sent you a package", "isMe": true},
      {"text": "Ok, let me check", "isMe": false},
    ],
    "Riya": [
      {"text": "Hey Riya!", "isMe": true},
      {"text": "See you tomorrow", "isMe": false},
    ],
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF4F6FA),
      body: SafeArea(
        child: isChatOpen ? buildChatScreen() : buildHomeScreen(),
      ),
    );
  }

  /// ================= HOME =================
  Widget buildHomeScreen() {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [

          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(25),
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color(0xff7F00FF),
                  Color(0xffE100FF),
                ],
              ),
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(40),
                topLeft: Radius.circular(40),
              ),
            ),
            child: const Text(
              "Good Morning!",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 28,
                  fontWeight: FontWeight.bold),
            ),
          ),

          const SizedBox(height: 20),

          Expanded(
            child: ListView(
              children: [
                ContactCard(
                  name: "Hajeera",
                  message: "Ok, let me check",
                  time: "9:40am",
                  imageUrl: "https://plus.unsplash.com/premium_photo-1689568126014-06fea9d5d341?fm=jpg&q=60&w=3000&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8cHJvZmlsZXxlbnwwfHwwfHx8MA%3D%3D",
                  isActive: true,
                  onTap: () {
                    setState(() {
                      selectedName = "Hajeera";
                      selectedImage = "https://plus.unsplash.com/premium_photo-1689568126014-06fea9d5d341?fm=jpg&q=60&w=3000&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8cHJvZmlsZXxlbnwwfHwwfHx8MA%3D%3D";
                      selectedActive = true;
                      isChatOpen = true;
                    });
                  },
                ),
                ContactCard(
                  name: "Riya",
                  message: "See you tomorrow",
                  time: "Yesterday",
                  imageUrl: "https://images.ctfassets.net/h6goo9gw1hh6/2sNZtFAWOdP1lmQ33VwRN3/24e953b920a9cd0ff2e1d587742a2472/1-intro-photo-final.jpg?w=1200&h=992&fl=progressive&q=70&fm=jpg",
                  onTap: () {
                    setState(() {
                      selectedName = "Riya";
                      selectedImage = "https://images.ctfassets.net/h6goo9gw1hh6/2sNZtFAWOdP1lmQ33VwRN3/24e953b920a9cd0ff2e1d587742a2472/1-intro-photo-final.jpg?w=1200&h=992&fl=progressive&q=70&fm=jpg";
                      selectedActive = false;
                      isChatOpen = true;
                    });
                  },
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  /// ================= CHAT SCREEN =================
  Widget buildChatScreen() {
    final chats = chatData[selectedName] ?? [];

    return Column(
      children: [

        /// APP BAR
        Container(
          padding: const EdgeInsets.all(15),
          color: Colors.white,
          child: Row(
            children: [
              IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () {
                  setState(() {
                    isChatOpen = false;
                  });
                },
              ),
              CircleAvatar(
                backgroundImage: NetworkImage(selectedImage),
              ),
              const SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(selectedName,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16)),
                  if (selectedActive)
                    const Text("Active now",
                        style: TextStyle(
                            color: Colors.green, fontSize: 12)),
                ],
              )
            ],
          ),
        ),

        /// CHAT BODY (SCROLLABLE)
        Expanded(
          child: ListView.builder(
            padding: const EdgeInsets.all(20),
            itemCount: chats.length,
            itemBuilder: (context, index) {
              return ChatBubble(
                text: chats[index]["text"],
                isMe: chats[index]["isMe"],
              );
            },
          ),
        ),

        Container(
          padding: const EdgeInsets.symmetric(
              horizontal: 15, vertical: 10),
          color: Colors.white,
          child: Row(
            children: [
              Expanded(
                child: TextField(
                  decoration: InputDecoration(
                    hintText: "Type a message",
                    filled: true,
                    fillColor: const Color(0xffF4F6FA),
                    contentPadding:
                        const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 12),
                    border: OutlineInputBorder(
                      borderRadius:
                          BorderRadius.circular(30),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Container(
                padding: const EdgeInsets.all(12),
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(
                    colors: [
                      Color(0xff7F00FF),
                      Color(0xffE100FF),
                    ],
                  ),
                ),
                child: const Icon(
                  Icons.send,
                  color: Colors.white,
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}

class ChatBubble extends StatelessWidget {
  final String text;
  final bool isMe;

  const ChatBubble({
    super.key,
    required this.text,
    required this.isMe,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment:
          isMe ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 6),
        padding: const EdgeInsets.symmetric(
            horizontal: 16, vertical: 12),
        constraints: const BoxConstraints(maxWidth: 250),
        decoration: BoxDecoration(
          color: isMe ? const Color(0xffE100FF) : Colors.grey[300],
          borderRadius: BorderRadius.only(
            topLeft: const Radius.circular(18),
            topRight: const Radius.circular(18),
            bottomLeft:
                Radius.circular(isMe ? 18 : 4),
            bottomRight:
                Radius.circular(isMe ? 4 : 18),
          ),
        ),
        child: Text(
          text,
          style: TextStyle(
            color: isMe ? Colors.white : Colors.black87,
          ),
        ),
      ),
    );
  }
}
