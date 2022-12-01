import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:tuvalepp/components/tile_card.dart';

class Toilet {
  final int userId;
  final int id;
  final String title;

  const Toilet({
    required this.userId,
    required this.id,
    required this.title,
  });

  factory Toilet.fromJson(Map<String, dynamic> json) {
    return Toilet(
      userId: json['userId'],
      id: json['id'],
      title: json['title'],
    );
  }
}

Future<Toilet> fetchToilet() async {
  final response = await http
      .get(Uri.parse('http://localhost:4000'));

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return Toilet.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
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
            return Text(snapshot.data!.title);
          } else if (snapshot.hasError) {
            return Text('${snapshot.error}');
          }

          // By default, show a loading spinner.
          return const CircularProgressIndicator();
        },
      )
    );
  }
}
