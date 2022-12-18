import 'package:flutter/material.dart';

class Review extends StatefulWidget {
  const Review({super.key, required this.text, required this.rating});

  final String text;
  final String rating;

  @override
  State<Review> createState() => _ReviewState();
}

class _ReviewState extends State<Review> {
  int maxReviewLines = 2;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "(",
              style: TextStyle(fontSize: 16),
            ),
            for (int i = 0; i < int.parse(widget.rating); i++)
              Icon(
                Icons.star_rate,
                color: Color(0xffffb814),
                size: 18,
              ),
            for (int i = 0; i < 5 - int.parse(widget.rating); i++)
              Icon(
                Icons.star_rate_outlined,
                color: Color(0xffffb814),
                size: 18,
              ),
            Text(
              ")",
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
        SizedBox(
          height: 5,
        ),
        Text(
          widget.text,
          style: TextStyle(
            fontSize: 16,
          ),
          maxLines: maxReviewLines,
        ),
        TextButton(
            style: TextButton.styleFrom(
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                minimumSize: Size.zero,
                padding: EdgeInsets.zero,
                alignment: Alignment.centerLeft),
            onPressed: () {
              setState(() {
                maxReviewLines = maxReviewLines == 2 ? 1000 : 2;
              });
            },
            child: Text(
              "Read ${maxReviewLines == 2 ? "More" : "Less"}",
              style: TextStyle(color: Colors.grey),
            ))
      ],
    );
  }
}
