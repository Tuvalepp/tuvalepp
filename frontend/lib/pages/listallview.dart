import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:tuvalepp/components/tile_card.dart';

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
    throw Exception('Failed to load album');
  }
}

class ListAllPage extends StatefulWidget {
  const ListAllPage({super.key, required this.title});
  final title;

  @override
  State<ListAllPage> createState() => _ListAllPageState();
}

class _ListAllPageState extends State<ListAllPage> {
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
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Text(
          widget.title.toString(),
        ),
      ),
      body: FutureBuilder<Toilet>(
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
    );
  }
}
