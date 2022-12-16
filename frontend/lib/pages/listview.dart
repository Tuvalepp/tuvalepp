import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:location/location.dart';
import 'package:tuvalepp/components/filter_button.dart';
import 'package:tuvalepp/components/profile_button.dart';
import 'package:tuvalepp/components/profile_drawer.dart';
import 'package:tuvalepp/components/tile_card.dart';
import 'package:tuvalepp/components/view_switch_button.dart';
import 'package:tuvalepp/models/toilet.dart';
import 'package:tuvalepp/services/remote_services.dart';

class ListViewPage extends StatefulWidget {
  const ListViewPage({super.key});

  @override
  State<ListViewPage> createState() => _ListViewPageState();
}

class _ListViewPageState extends State<ListViewPage> {
  final double columnGap = 10;
  List<Toilet>? toiletsTopRated;
  List<Toilet>? toiletsClosest;
  var isLoaded = false;

  late LocationData myLocation;
  Location _location = Location();

  @override
  void initState() {
    super.initState();
    getTopRatedData();
    getClosestData();
  }

  void getTopRatedData() async {
    toiletsTopRated = await RemoteService().getToiletsTopRated();
    if (toiletsTopRated != null) {
      setState(() {
        isLoaded = true;
      });
    }
  }

  void getClosestData() async {
    myLocation = await _location.getLocation();
    toiletsClosest = await RemoteService().getClosest({
      "lat": myLocation.latitude.toString(),
      "lon": myLocation.longitude.toString()
    });
    if (toiletsClosest != null) {
      setState(() {
        isLoaded = true;
      });
    }
  }

  List<Widget> getClosestWidgets() {
    List<Widget> closestWidgets = [];
    if (isLoaded) {
      for (var i = 0; i < 3; i++) {
        closestWidgets.add(
          TileCard(
              id: toiletsClosest![i].id,
              title: toiletsClosest![i].title,
              rating: toiletsClosest![i].rating,
              gender: toiletsClosest![i].gender),
        );
      }
    }
    return closestWidgets;
  }

  List<Widget> getTopRatedWidgets() {
    List<Widget> topRatedWidgets = [];
    if (isLoaded) {
      for (var i = 0; i < 3; i++) {
        topRatedWidgets.add(
          TileCard(
              id: toiletsClosest![i].id,
              title: toiletsTopRated![i].title,
              rating: toiletsTopRated![i].rating,
              gender: toiletsTopRated![i].gender),
        );
      }
    }
    return topRatedWidgets;
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
                      Navigator.of(context).pushNamed("/listall",
                          arguments: {"title": "En yakın tuvaletler"});
                    },
                    child: const Text(
                      "Tümünü gör...",
                      style: TextStyle(fontSize: 12, color: Colors.grey),
                    ))
              ],
            ),
            Visibility(
              visible: isLoaded,
              replacement: Center(child: CircularProgressIndicator()),
              child: Column(
                children: getClosestWidgets(),
              ),
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
                      Navigator.of(context).pushNamed("/listall",
                          arguments: {"title": "Yüksek puanlı tuvaletler"});
                    },
                    child: const Text(
                      "Tümünü gör...",
                      style: TextStyle(fontSize: 12, color: Colors.grey),
                    )),
              ],
            ),
            Visibility(
              visible: isLoaded,
              replacement: Center(child: CircularProgressIndicator()),
              child: Column(
                children: getTopRatedWidgets(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
