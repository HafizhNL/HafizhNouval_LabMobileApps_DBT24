import 'package:flutter/material.dart';
import '../pages/home_page.dart';

class ContactCard extends StatelessWidget {
  final String name;
  final String message;
  final String image;
  final bool isOnline;

  const ContactCard({
    super.key,
    required this.name,
    required this.message,
    required this.image,
    required this.isOnline,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ChatPage(name: name)),
        );
      },
      leading: Stack(
        children: [
          CircleAvatar(radius: 28, backgroundImage: NetworkImage(image)),
          if (isOnline)
            Positioned(
              bottom: 0,
              right: 0,
              child: Container(
                height: 14,
                width: 14,
                decoration: BoxDecoration(
                  color: Colors.green,
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.black, width: 2),
                ),
              ),
            ),
        ],
      ),
      title: Text(
        name,
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
      subtitle: Text(message, style: const TextStyle(color: Colors.grey)),
      trailing: const Icon(Icons.camera_alt_outlined, color: Colors.white),
    );
  }
}
