import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:tuvalepp/components/tile_card.dart';
import 'package:tuvalepp/models/toilet.dart';
import 'package:tuvalepp/services/remote_services.dart';

class ListAllPage extends StatefulWidget {
  const ListAllPage({super.key, required this.title});
  final title;

  @override
  State<ListAllPage> createState() => _ListAllPageState();
}

class _ListAllPageState extends State<ListAllPage> {
  List<Toilet>? toilets;
  var isLoaded = false;

  final double columnGap = 10;
  late Future<Toilet> futureToilet;

  @override
  void initState() {
    super.initState();
    getData();
  }

  void getData() async {
    toilets = await RemoteService().getToiletsTopRated();
    if (toilets != null) {
      setState(() {
        isLoaded = true;
      });
    }
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
      body: Visibility(
        visible: isLoaded,
        replacement: Center(child: CircularProgressIndicator()),
        child: ListView.builder(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          itemCount: toilets?.length,
          itemBuilder: ((context, index) {
            return TileCard(
                title: toilets![index].title,
                rating: toilets![index].rating,
                gender: toilets![index].gender);
          }),
        ),
      ),
    );
  }
}
