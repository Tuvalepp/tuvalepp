import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:tuvalepp/components/tile_card.dart';
import 'package:tuvalepp/models/toilet.dart';
import 'package:tuvalepp/services/remote_services.dart';
import 'package:location/location.dart';

class ListAllPage extends StatefulWidget {
  ListAllPage({super.key, required this.title});
  var title;

  @override
  State<ListAllPage> createState() => _ListAllPageState();
}

class _ListAllPageState extends State<ListAllPage> {
  List<Toilet>? toilets;
  var isLoaded = false;

  late LocationData myLocation;
  Location _location = Location();

  final double columnGap = 10;
  late Future<Toilet> futureToilet;

  @override
  void initState() {
    super.initState();
  }

  void getData() async {
    if (widget.title == "En yakın tuvaletler") {
      myLocation = await _location.getLocation();
      toilets = await RemoteService().getClosest({
        "lat": myLocation.latitude.toString(),
        "lon": myLocation.longitude.toString()
      });
    } else if (widget.title == "Yüksek puanlı tuvaletler") {
      toilets = await RemoteService().getToiletsTopRated();
    }

    if (toilets != null) {
      setState(() {
        isLoaded = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final Map<String, String> arguments =
        ModalRoute.of(context)?.settings?.arguments as Map<String, String>;

    widget.title = arguments["title"];
    getData();

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
              id: toilets![index].id,
              title: toilets![index].title,
              rating: toilets![index].rating,
              gender: toilets![index].gender,
              imageDir: toilets![index].imageDir,
            );
          }),
        ),
      ),
    );
  }
}
