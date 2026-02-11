import 'package:flutter/material.dart';

class PostingCard extends StatefulWidget {
  final String username;
  final String userImage;
  final String postImage;
  final String caption;

  const PostingCard({
    super.key,
    required this.username,
    required this.userImage,
    required this.postImage,
    required this.caption,
  });

  @override
  State<PostingCard> createState() => _PostingCardState();
}

class _PostingCardState extends State<PostingCard> {
  bool isLiked = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Header
        ListTile(
          leading: CircleAvatar(
            backgroundImage: NetworkImage(widget.userImage),
          ),
          title: Text(
            widget.username,
            style: const TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold),
          ),
          trailing: const Icon(Icons.more_vert, color: Colors.white),
        ),

        // Post Image
        Image.network(widget.postImage),

        const SizedBox(height: 8),

        // Actions
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    isLiked = !isLiked;
                  });
                },
                child: Icon(
                  isLiked ? Icons.favorite : Icons.favorite_border,
                  color: isLiked ? Colors.red : Colors.white,
                ),
              ),
              const SizedBox(width: 15),
              const Icon(Icons.mode_comment_outlined,
                  color: Colors.white),
              const SizedBox(width: 15),
              const Icon(Icons.send_outlined, color: Colors.white),
              const Spacer(),
              const Icon(Icons.bookmark_border, color: Colors.white),
            ],
          ),
        ),

        const SizedBox(height: 8),

        // Caption
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: "${widget.username} ",
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.white),
                ),
                TextSpan(
                  text: widget.caption,
                  style: const TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
        ),

        const SizedBox(height: 20),
      ],
    );
  }
}
