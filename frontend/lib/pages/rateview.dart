import 'package:flutter/material.dart';
import 'package:tuvalepp/pages/detailview.dart';
import 'package:tuvalepp/pages/listview.dart';
import 'package:tuvalepp/services/remote_services.dart';
import '../pages/mapview.dart';

class RateViewPage extends StatefulWidget {
  RateViewPage({super.key, required this.id, required this.title});
  var id;
  var title;
  var rating;
  var imageDir;

  @override
  State<RateViewPage> createState() => _RateViewPageState();
}

class _RateViewPageState extends State<RateViewPage> {
  int favLevel = 4;

  double iconSize = 50;
  double iconGap = 10;

  final reviewText = TextEditingController();

  void addReview() {
    RemoteService().addReview({
      "text": reviewText.text,
      "rating": favLevel.toString(),
      "toiletId": widget.id,
    });
  }

  @override
  Widget build(BuildContext context) {
    final Map<String, String> arguments =
        ModalRoute.of(context)?.settings?.arguments as Map<String, String>;

    widget.id = arguments["id"];
    widget.title = arguments["title"];
    widget.rating = arguments["rating"];
    widget.imageDir = arguments["imageDir"];
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border(
                      bottom: BorderSide(width: 1, color: Color(0xffc1c1c1)))),
              child: Padding(
                padding: const EdgeInsets.only(
                    top: 50, bottom: 20, left: 20, right: 20),
                child: Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: Image(
                              image: AssetImage(
                                  "assets/images/${widget.imageDir}/1.jpg"),
                              height: 100,
                              width: 100,
                              fit: BoxFit.cover),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10, left: 20),
                          child: Text(
                            widget.title,
                            style: TextStyle(
                                fontFamily: "Inter",
                                fontSize: 24,
                                fontWeight: FontWeight.w600,
                                color: Colors.black),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Column(
                      children: [
                        Text(
                          "Şimdiki Puan",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w500),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          '★ ${widget.rating}',
                          style: TextStyle(
                              fontSize: 30, fontWeight: FontWeight.w500),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  Text(
                    "Puan Ver",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            favLevel = 1;
                          });
                        },
                        child: favLevel >= 1
                            ? Icon(
                                Icons.star,
                                size: iconSize,
                                color: Color(0xffffb814),
                              )
                            : Icon(
                                Icons.star_border,
                                size: iconSize,
                                color: Colors.black,
                              ),
                      ),
                      SizedBox(
                        width: iconGap,
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            favLevel = 2;
                          });
                        },
                        child: favLevel >= 2
                            ? Icon(
                                Icons.star,
                                size: iconSize,
                                color: Color(0xffffb814),
                              )
                            : Icon(
                                Icons.star_border,
                                size: iconSize,
                                color: Colors.black,
                              ),
                      ),
                      SizedBox(
                        width: iconGap,
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            favLevel = 3;
                          });
                        },
                        child: favLevel >= 3
                            ? Icon(
                                Icons.star,
                                size: iconSize,
                                color: Color(0xffffb814),
                              )
                            : Icon(
                                Icons.star_border,
                                size: iconSize,
                                color: Colors.black,
                              ),
                      ),
                      SizedBox(
                        width: iconGap,
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            favLevel = 4;
                          });
                        },
                        child: favLevel >= 4
                            ? Icon(
                                Icons.star,
                                size: iconSize,
                                color: Color(0xffffb814),
                              )
                            : Icon(
                                Icons.star_border,
                                size: iconSize,
                                color: Colors.black,
                              ),
                      ),
                      SizedBox(
                        width: iconGap,
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            favLevel = 5;
                          });
                        },
                        child: favLevel >= 5
                            ? Icon(
                                Icons.star,
                                size: iconSize,
                                color: Color(0xffffb814),
                              )
                            : Icon(
                                Icons.star_border,
                                size: iconSize,
                                color: Colors.black,
                              ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextField(
                    controller: reviewText,
                    minLines: 6,
                    maxLines: 10,
                    decoration: InputDecoration(
                      filled: true,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15))),
                      labelText: 'How was your experience?',
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    width: double.infinity,
                    height: 75,
                    child: TextButton(
                      onPressed: () {
                        addReview();
                        Navigator.of(context).pop();
                      },
                      style: ButtonStyle(
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                        backgroundColor:
                            const MaterialStatePropertyAll<Color>(Colors.pink),
                      ),
                      child: const Text(
                        "Onayla",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                            fontSize: 24),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    width: double.infinity,
                    height: 75,
                    child: TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      style: ButtonStyle(
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                        backgroundColor:
                            const MaterialStatePropertyAll<Color>(Colors.white),
                      ),
                      child: const Text(
                        "Vazgeç",
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                            fontSize: 24),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
