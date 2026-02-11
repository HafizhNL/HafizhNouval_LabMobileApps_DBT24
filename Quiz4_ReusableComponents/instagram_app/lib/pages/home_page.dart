import 'package:flutter/material.dart';
import '../components/posting_card.dart';
import '../components/contact_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,

      body: IndexedStack(
        index: _selectedIndex,
        children: [
          _buildFeed(),        // 0
          _buildPlaceholder("Search Page"), // 1
          _buildContactPage(), // 2 🔥 SEND PAGE
          _buildPlaceholder("Reels Page"),  // 3
          _buildPlaceholder("Profile Page"), // 4
        ],
      ),

      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black,
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.send), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.video_library_outlined), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.person_outline), label: ""),
        ],
      ),
    );
  }

  // ================= FEED =================
  Widget _buildFeed() {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        title: const Text(
          "Instagram",
          style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          // STORY
          SizedBox(
            height: 110,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: stories.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(3),
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          gradient: LinearGradient(
                            colors: [
                              Colors.purple,
                              Colors.orange,
                              Colors.red
                            ],
                          ),
                        ),
                        child: CircleAvatar(
                          radius: 30,
                          backgroundImage:
                              NetworkImage(stories[index]['image']!),
                        ),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        stories[index]['username']!,
                        style: const TextStyle(
                            color: Colors.white, fontSize: 12),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),

          const Divider(color: Colors.grey),

          ...posts.map(
            (post) => PostingCard(
              username: post['username']!,
              userImage: post['userImage']!,
              postImage: post['postImage']!,
              caption: post['caption']!,
            ),
          ),
        ],
      ),
    );
  }

  // ================= CONTACT PAGE =================
  Widget _buildContactPage() {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text(
          "Messages",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: ListView(
        children: const [
          ContactCard(
            name: "Alice",
            message: "Hey, how are you?",
            image: "https://i.pravatar.cc/150?img=10",
            isOnline: true,
          ),
          ContactCard(
            name: "Bob",
            message: "Let's catch up later.",
            image: "https://i.pravatar.cc/150?img=11",
            isOnline: false,
          ),
          ContactCard(
            name: "Charlie",
            message: "Check out this cool photo!",
            image: "https://i.pravatar.cc/150?img=12",
            isOnline: false,
          ),
        ],
      ),
    );
  }

  // ================= PLACEHOLDER =================
  Widget _buildPlaceholder(String text) {
    return Center(
      child: Text(
        text,
        style: const TextStyle(color: Colors.white),
      ),
    );
  }
}

class ChatPage extends StatelessWidget {
  final String name;

  const ChatPage({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    final messages = chatData[name] ?? [];

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          name,
          style: const TextStyle(color: Colors.white),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: messages.length,
              itemBuilder: (context, index) {
                final msg = messages[index];

                return Align(
                  alignment: msg["isMe"]
                      ? Alignment.centerRight
                      : Alignment.centerLeft,
                  child: Container(
                    margin: const EdgeInsets.only(bottom: 10),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 14, vertical: 10),
                    decoration: BoxDecoration(
                      color: msg["isMe"]
                          ? Colors.blue
                          : Colors.grey.shade800,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      msg["text"],
                      style:
                          const TextStyle(color: Colors.white),
                    ),
                  ),
                );
              },
            ),
          ),
          Container(
            padding: const EdgeInsets.all(12),
            child: const TextField(
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                hintText: "Message...",
                hintStyle: TextStyle(color: Colors.grey),
                border: OutlineInputBorder(
                  borderRadius:
                      BorderRadius.all(Radius.circular(30)),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

// ================= DUMMY DATA =================

List<Map<String, String>> stories = [
  {"username": "Your story", "image": "https://i.pravatar.cc/150?img=1"},
  {"username": "bleu.prasmul", "image": "https://i.pravatar.cc/150?img=2"},
  {"username": "mhmd_angga", "image": "https://i.pravatar.cc/150?img=3"},
  {"username": "SFD", "image": "https://i.pravatar.cc/150?img=1"},
  {"username": "Programming", "image": "https://i.pravatar.cc/150?img=2"},
];

List<Map<String, String>> posts = [
  {
    "username": "flutterdev",
    "userImage": "https://i.pravatar.cc/150?img=6",
    "postImage": "https://images.unsplash.com/photo-1507525428034-b723cf961d3e",
    "caption": "Belajar Flutter itu seru 🔥",
  },
  {
    "username": "flutterdev",
    "userImage": "https://i.pravatar.cc/150?img=6",
    "postImage": "https://images.unsplash.com/photo-1507525428034-b723cf961d3e",
    "caption": "Belajar Flutter itu seru 🔥",
  },
];

Map<String, List<Map<String, dynamic>>> chatData = {
  "Alice": [
    {"text": "Hey Hafizh!", "isMe": false},
    {"text": "Hi Alice 👋", "isMe": true},
    {"text": "How are you?", "isMe": false},
  ],
  "Bob": [
    {"text": "Bro nanti futsal?", "isMe": false},
    {"text": "Gas 🔥", "isMe": true},
  ],
  "Charlie": [
    {"text": "Lihat foto ini!", "isMe": false},
    {"text": "Keren banget 😍", "isMe": true},
  ],
};
