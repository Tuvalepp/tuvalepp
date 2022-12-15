import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:tuvalepp/components/filter_button.dart';
import 'package:tuvalepp/components/profile_button.dart';
import 'package:tuvalepp/components/profile_drawer.dart';
import 'package:tuvalepp/components/tile_card.dart';
import 'package:tuvalepp/components/view_switch_button.dart';
import 'package:tuvalepp/components/bottom_detail.dart';
import 'package:tuvalepp/models/toilet.dart';

class MapViewPage extends StatefulWidget {
  const MapViewPage({super.key});

  @override
  State<MapViewPage> createState() => MapViewPageState();
}

class MapViewPageState extends State<MapViewPage> {
  BitmapDescriptor markerIcon = BitmapDescriptor.defaultMarker;

  @override
  void initState() {
    // addCustomIcon();
    super.initState();
  }

/*  void addCustomIcon() {
    BitmapDescriptor.fromAssetImage(
            const ImageConfiguration(), "assets/poop_marker.png")
        .then(
      (icon) {
        setState(() {
          markerIcon = icon;
        });
      },
    );
  } */

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: ProfileDrawer(),
      body: Stack(children: <Widget>[
        GoogleMap(
          initialCameraPosition: CameraPosition(
            target: LatLng(41.045135, 29.034566),
            zoom: 13,
          ),
          markers: {
            Marker(
                markerId: MarkerId("köprü"),
                position: LatLng(41.045135, 29.034566),
                draggable: false,
                icon: markerIcon,
                onTap: () {
                  showModalBottomSheet(
                      backgroundColor: Colors.transparent,
                      context: context,
                      builder: (BuildContext context) {
                        return BottomDetail();
                      });
                }),
            Marker(
                markerId: MarkerId("taksim"),
                position: LatLng(41.037025, 28.985210),
                draggable: false,
                icon: markerIcon,
                onTap: () {
                  showModalBottomSheet(
                      backgroundColor: Colors.transparent,
                      context: context,
                      builder: (BuildContext context) {
                        return BottomDetail();
                      });
                }),
            Marker(
                markerId: MarkerId("vefa"),
                position: LatLng(41.014573, 28.958547),
                draggable: false,
                icon: markerIcon,
                onTap: () {
                  showModalBottomSheet(
                      backgroundColor: Colors.transparent,
                      context: context,
                      builder: (BuildContext context) {
                        return BottomDetail();
                      });
                }),
          },
        ),
        Padding(
          padding: const EdgeInsets.only(top: 40, left: 20, right: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              ProfileButton(
                pageIndex: 0,
              ),
              ViewSwitchButton(
                pageIndex: 0,
              ),
              FilterButton(
                pageIndex: 0,
              )
            ],
          ),
        ),
      ]),
    );
  }
}
