import 'package:flutter/material.dart';

class Review extends StatefulWidget {
  const Review({super.key});

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
            CircleAvatar(
              radius: 10,
              backgroundImage: NetworkImage(
                  'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg'),
            ),
            SizedBox(
              width: 5,
            ),
            Text(
              "jericho98",
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(
              width: 5,
            ),
            Text(
              "(",
              style: TextStyle(fontSize: 16),
            ),
            for (int i = 0; i < 3; i++)
              Icon(
                Icons.star_rate,
                color: Color(0xffffb814),
                size: 18,
              ),
            for (int i = 0; i < 2; i++)
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
          "title",
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 5,
        ),
        Text(
          "tuvalette en çok önem verdiğim şey temizliktir, ve bu tuvalet temiz adamım.tuvalette en çok önem verdiğim şey temizliktir, ve bu tuvalet temiz adamım",
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
