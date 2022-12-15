import 'dart:convert';

import 'package:tuvalepp/pages/detailview.dart';
import 'package:tuvalepp/models/toilet.dart';
import 'package:http/http.dart' as http;

class RemoteService {
  Future<List<Toilet>?> getToilets() async {
    var client = http.Client();
    var uri = Uri.parse("http://10.0.2.2:4000");
    var response = await client.get(uri);
    if (response.statusCode == 200) {
      var json = response.body;
      print(response.body);
      return toiletFromJson(json);
    }
  }

  Future<List<Toilet>?> getToiletsTopRated() async {
    var client = http.Client();
    var uri = Uri.parse("http://10.0.2.2:4000/top-rated");
    var response = await client.get(uri);
    if (response.statusCode == 200) {
      var json = response.body;
      return toiletFromJson(json);
    }
  }

  Future<List<Toilet>?> getClosest(Map<String, String> location) async {
    final response = await http.post(
      Uri.parse('http://10.0.2.2:4000/closest'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'lat': location["lat"].toString(),
        'lon': location["lon"].toString(),
      }),
    );

    if (response.statusCode == 200) {
      var json = response.body;
      return toiletFromJson(json);
    } else {
      throw Exception('Failed.');
    }
  }
}