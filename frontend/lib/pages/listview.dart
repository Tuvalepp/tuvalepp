import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
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
  var isLoaded = false;

  @override
  void initState() {
    super.initState();
    getData();
  }

  void getData() async {
    toiletsTopRated = await RemoteService().getToiletsTopRated();
    if (toiletsTopRated != null) {
      setState(() {
        isLoaded = true;
      });
    }
  }

  List<Widget> getTopRatedWidgets() {
    List<Widget> topRatedWidgets = [];
    for (var i = 0; i < 3; i++) {
      topRatedWidgets.add(
        TileCard(
            title: toiletsTopRated![i].title,
            rating: toiletsTopRated![i].rating,
            gender: toiletsTopRated![i].gender),
      );
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
                      Navigator.pushNamed(context, "/listall");
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
                children: getTopRatedWidgets(),
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
                      Navigator.pushNamed(context, "/listall");
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
