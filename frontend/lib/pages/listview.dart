import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:tuvalepp/components/filter_button.dart';
import 'package:tuvalepp/components/profile_button.dart';
import 'package:tuvalepp/components/profile_drawer.dart';
import 'package:tuvalepp/components/tile_card.dart';
import 'package:tuvalepp/components/view_switch_button.dart';

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

class ListViewPage extends StatefulWidget {
  const ListViewPage({super.key});

  @override
  State<ListViewPage> createState() => _ListViewPageState();
}

class _ListViewPageState extends State<ListViewPage> {
  final double columnGap = 10;
  late Future<Toilet> futureToilet;

  @override
  void initState() {
    super.initState();
    futureToilet = fetchToilet();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: ProfileDrawer(),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  ProfileButton(
                    pageIndex: 1,
                  ),
                  ViewSwitchButton(
                    pageIndex: 1,
                  ),
                  FilterButton(
                    pageIndex: 1,
                  )
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  "En yakın",
                  style: TextStyle(
                      fontFamily: "Inter",
                      fontSize: 20,
                      fontWeight: FontWeight.w600),
                ),
                TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, "/listall");
                    },
                    child: const Text(
                      "Tümünü gör...",
                      style: TextStyle(fontSize: 12, color: Colors.grey),
                    ))
              ],
            ),
            FutureBuilder<Toilet>(
              future: futureToilet,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return TileCard(title: snapshot.data!.title, rating: snapshot.data!.rating, gender: snapshot.data!.gender);
                } else if (snapshot.hasError) {
                  return Text('${snapshot.error}');
                }
                return const CircularProgressIndicator();
              },
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  "Bölgedeki yüksek puanlı",
                  style: TextStyle(
                      fontFamily: "Inter",
                      fontSize: 20,
                      fontWeight: FontWeight.w600),
                ),
                TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, "/listall");
                    },
                    child: const Text(
                      "Tümünü gör...",
                      style: TextStyle(fontSize: 12, color: Colors.grey),
                    ))
              ],
            ),
            FutureBuilder<Toilet>(
              future: futureToilet,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return TileCard(title: snapshot.data!.title, rating: snapshot.data!.rating, gender: snapshot.data!.gender);
                } else if (snapshot.hasError) {
                  return Text('${snapshot.error}');
                }
                return const CircularProgressIndicator();
              },
            ),
          ],
        ),
      ),
    );
  }
}
