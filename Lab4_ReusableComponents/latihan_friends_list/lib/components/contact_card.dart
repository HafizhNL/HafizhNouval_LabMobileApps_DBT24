import 'package:flutter/material.dart';

class ContactCard extends StatelessWidget {
  final String name;
  final String message;
  final String time;
  final String imageUrl;
  final bool isActive;
  final VoidCallback onTap;

  const ContactCard({
    super.key,
    required this.name,
    required this.message,
    required this.time,
    required this.imageUrl,
    required this.onTap,
    this.isActive = false,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 8),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          children: [
            Stack(
              children: [
                CircleAvatar(
                  radius: 28,
                  backgroundImage: NetworkImage(imageUrl),
                ),
                if (isActive)
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                      width: 14,
                      height: 14,
                      decoration: BoxDecoration(
                        color: Colors.green,
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.white, width: 2),
                      ),
                    ),
                  )
              ],
            ),
            const SizedBox(width: 14),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(name,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 16)),
                  const SizedBox(height: 4),
                  Text(message,
                      style: TextStyle(color: Colors.grey[600])),
                ],
              ),
            ),
            Text(time,
                style: TextStyle(color: Colors.grey[500], fontSize: 12))
          ],
        ),
      ),
    );
  }
}
