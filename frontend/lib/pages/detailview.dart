import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:tuvalepp/components/review.dart';
import 'package:tuvalepp/pages/listview.dart';
import 'package:tuvalepp/pages/rateview.dart';

class Toilet {
  final String title;
  final double latitude;
  final double longitude;
  final bool babyroom;
  final bool disabled;
  final String gender;
  final double rating;
  final int floor;

  const Toilet({
  required this.title,
  required this.latitude,
  required this.longitude,
  required this.babyroom,
  required this.disabled,
  required this.gender,
  required this.rating,
  required this.floor,
  });

  factory Toilet.fromJson(Map<String, dynamic> json) {
    return Toilet(
      title: json['title'],
      latitude: json['latitude'],
      longitude: json['longitude'],
      babyroom: json['babyroom'],
      disabled: json['disabled'],
      gender: json['gender'],
      rating: json['rating'],
      floor: json['floor'],
    );
  }
}

Future<Toilet> fetchToilet() async {
  final response = await http
      .get(Uri.parse('http://10.0.2.2:4000'));
  if (response.statusCode == 200) {
    return Toilet.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to load data');
  }
}

class DetailViewPage extends StatefulWidget {
  const DetailViewPage({super.key});
  //final id;
  
  @override
  State<DetailViewPage> createState() => _DetailViewPageState();
}

class _DetailViewPageState extends State<DetailViewPage> {
  bool isFav = false;
  late Future<Toilet> futureToilet;

  @override
  void initState() {
    super.initState();
    futureToilet = fetchToilet();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text("Tuvalet Detayı"),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: <Color>[Colors.black, Color.fromARGB(0, 0, 0, 0)]),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Image(
                image: NetworkImage(
                    'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg'),
                height: 300,
                width: double.infinity,
                fit: BoxFit.cover),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text(
                        "Title",
                        style: TextStyle(
                            fontFamily: "Inter",
                            fontSize: 24,
                            fontWeight: FontWeight.w600,
                            color: Colors.black),
                      ),
                      IconButton(
                        padding: EdgeInsets.zero,
                        splashColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        onPressed: () {
                          setState(() {
                            isFav = !isFav;
                          });
                        },
                        icon: isFav
                            ? const Icon(
                                Icons.favorite,
                                color: Colors.pink,
                                size: 32,
                              )
                            : const Icon(
                                Icons.favorite_border,
                                color: Colors.black,
                                size: 32,
                              ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      const Icon(
                        Icons.man,
                        size: 40,
                        color: Colors.black,
                      ),
                      const SizedBox(width: 10),
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Colors.pink),
                        child: const Padding(
                          padding:
                              EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                          child: Text(
                            "★ 4.2",
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      const Icon(
                        Icons.circle,
                        size: 5,
                      ),
                      const SizedBox(width: 10),
                      const Icon(
                        Icons.directions_walk,
                        size: 30,
                      ),
                      const Text(
                        "12 dk",
                        style: TextStyle(fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Address",
                    style: TextStyle(color: Colors.grey.shade600, fontSize: 16),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    height: 120,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 4,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, "/imagedetail");
                          },
                          child: Row(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(8.0),
                                child: const Image(
                                    image: NetworkImage(
                                        'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg'),
                                    height: double.infinity,
                                    fit: BoxFit.cover),
                              ),
                              if (index != 3)
                                SizedBox(
                                  width: 20,
                                )
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    width: double.infinity,
                    height: 75,
                    child: TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, "/rate");
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
                        "Puan Ver",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                            fontSize: 24),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    "En iyi değerlendirmeler",
                    style: TextStyle(
                        fontFamily: "Inter",
                        fontSize: 20,
                        fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Review(),
                  SizedBox(
                    height: 20,
                    child: const Divider(
                      thickness: 1,
                      color: Colors.grey,
                    ),
                  ),
                  Review()
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
