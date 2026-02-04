import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    const HomePage(),
    const LilbraryPage(),
    const ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 20, 1, 129),
        title: Row(
          children: [
            Image.asset(
              'assets/Prasmul_logo_01-Putih.png',
              height: 30,
            ),
            const SizedBox(width: 10),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.menu, color: Colors.white),
            onPressed: () {
              _showMenuBottomSheet(context);
            },
          ),
        ],
      ),
      body: _pages[_currentIndex],
    );
  }

  void _showMenuBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: const Color(0xFF2C2C2C),
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(0),
        ),
      ),
      builder: (BuildContext context) {
        return DraggableScrollableSheet(
          initialChildSize: 0.30,
          minChildSize: 0.3,
          maxChildSize: 0.9,
          expand: false,
          builder: (context, scrollController) {
            return Container(
              color: const Color(0xFF2C2C2C),
              child: Column(
                children: [
                  // Fixed header
                  GestureDetector(
                    onVerticalDragUpdate: (details) {
                      // Allow dragging on the header
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      color: const Color(0xFF2C2C2C),
                      child: Center(
                        child: Container(
                          width: 40,
                          height: 4,
                          decoration: BoxDecoration(
                            color: Colors.grey[600],
                            borderRadius: BorderRadius.circular(2),
                          ),
                        ),
                      ),
                    ),
                  ),
                  // Scrollable content
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          _buildMenuItem(context, 'HOME', 0),
                          _buildMenuItem(context, 'LIBRARY', 1),
                          _buildMenuItem(context, 'PROFILE', 2),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }

  Widget _buildMenuItem(BuildContext context, String title, int index) {
    return Container(
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Color(0xFF404040),
            width: 1,
          ),
        ),
      ),
      child: ListTile(
        title: Text(
          title,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w500,
            letterSpacing: 0.5,
          ),
        ),
        onTap: () {
          setState(() {
            _currentIndex = index;
          });
          Navigator.pop(context);
        },
      ),
    );
  }
}

// HOME PAGE
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          // Logo Section
          Container(
            width: double.infinity,
            color: Colors.white,
            padding: const EdgeInsets.symmetric(vertical: 30),
            child: Column(
              children: [
                Image.asset(
                  'assets/logo_upm_biru.png',
                  height: 100,
                ),
                const SizedBox(height: 10),
              ],
            ),
          ),

          const SizedBox(height: 20),

          // Vision Section
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'VISION',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  'A globally recognized School for STEMpreneur Education and Research',
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.black54,
                    height: 1.5,
                  ),
                ),
                const SizedBox(height: 30),

                // Mission Section
                const Text(
                  'MISSION',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  'Provide quality STEM education and research for nurturing the holistic citizen graduates through:',
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.black54,
                    height: 1.5,
                  ),
                ),
                const SizedBox(height: 15),
                _buildMissionPoint(
                  '1. Collaborative learning by enterprising involving interdisciplinary catalytic projects',
                ),
                const SizedBox(height: 10),
                _buildMissionPoint(
                  '2. Innovative and impactful research to the society',
                ),
              ],
            ),
          ),

          const SizedBox(height: 40),

          // Contact Information Section
          Container(
            width: double.infinity,
            color: const Color(0xFF1A1A1A),
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(
                  'assets/logo_upm_biru.png',
                  height: 70,
                  alignment: Alignment.centerLeft,
                ),
                const SizedBox(height: 10),
                const Text(
                  'BSD City Kavling Edutown I.1',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.white,
                    height: 1.6,
                  ),
                ),
                const Text(
                  'Jl. BSD Raya Utama, BSD City 15339',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.white,
                    height: 1.6,
                  ),
                ),
                const Text(
                  'Kabupaten Tangerang, Indonesia',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.white,
                    height: 1.6,
                  ),
                ),
                const SizedBox(height: 15),
                const Text(
                  'Tel. (021) 304-50-500',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const Text(
                  'Hp. (+62) 815116620025',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  'info@prasetiyamulya.ac.id',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMissionPoint(String text) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Text(
            text,
            style: const TextStyle(
              fontSize: 15,
              color: Colors.black54,
              height: 1.5,
            ),
          ),
        ),
      ],
    );
  }
}

// LIBRARY PAGE
class LilbraryPage extends StatelessWidget {
  const LilbraryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Judul
          const Text(
            'Library',
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 20),
          
          // List Buku
          Expanded(
            child: ListView(
              children: [
                _buildBookCard('Mobile Application Development', 'Pak Permata'),
                _buildBookCard('Data Science', 'Pak Stanley'),
                _buildBookCard('Intermediate Database', 'Pak Stanley'),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBookCard(String title, String author) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.grey[300]!),
      ),
      child: Row(
        children: [
          // Icon Buku
          Container(
            width: 50,
            height: 70,
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 0, 34, 255).withOpacity(0.1),
              borderRadius: BorderRadius.circular(5),
            ),
            child: const Icon(
              Icons.book,
              color: Color.fromARGB(255, 0, 34, 255),
              size: 30,
            ),
          ),
          const SizedBox(width: 15),
          
          // Info Buku
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  author,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey[600],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// PROFILE PAGE
class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          const SizedBox(height: 20),
          
          // Foto Profile
          const CircleAvatar(
            radius: 60,
            backgroundColor: Color.fromARGB(255, 0, 34, 255),
            child: Icon(
              Icons.person,
              size: 60,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 20),
          
          // Nama
          const Text(
            'Hafizh Nouval Lafayette',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 5),
          
          // NIM
          Text(
            'NIM: 23502410015',
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey[600],
            ),
          ),
          const SizedBox(height: 30),
          
          // Info List
          _buildInfoItem(Icons.email, '23502410015@student.prasmul.ac.id'),
          _buildInfoItem(Icons.phone, '+62 08118102504'),
          _buildInfoItem(Icons.school, 'DBT24'),
        ],
      ),
    );
  }

  Widget _buildInfoItem(IconData icon, String text) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.grey[300]!),
      ),
      child: Row(
        children: [
          Icon(
            icon,
            color: const Color.fromARGB(255, 0, 34, 255),
            size: 24,
          ),
          const SizedBox(width: 15),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(
                fontSize: 16,
              ),
            ),
          ),
        ],
      ),
    );
  }
}