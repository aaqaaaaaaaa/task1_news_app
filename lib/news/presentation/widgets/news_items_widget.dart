import 'package:flutter/material.dart';

import '../../../news_comments/presentation/pages/comments_page.dart';

class NewsItemsWidget extends StatelessWidget {
  const NewsItemsWidget({
    Key? key,
    required this.title,
    required this.body,
    this.id,
  }) : super(key: key);
  final String? title;
  final int? id;
  final String? body;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => CommentsPage(
                  commentId: id ?? 1,
                  title: title ?? '',
                  description: body ?? ''),
            ));
      },
      child: Container(
        padding: const EdgeInsets.all(15),
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
            borderRadius: BorderRadius.circular(10)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '$title',
              style: const TextStyle(fontSize: 16, color: Colors.white),
            ),
            const SizedBox(height: 20),
            Text(
              '$body',
              style: const TextStyle(fontSize: 14, color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
