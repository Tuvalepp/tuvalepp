import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:tuvalepp/components/tile_card.dart';
import 'package:tuvalepp/components/view_switch_button.dart';
import 'package:tuvalepp/components/bottom_detail.dart';

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
      body: Stack(children: <Widget>[
        GoogleMap(
          initialCameraPosition: CameraPosition(
            target: LatLng(41.045135, 29.034566),
            zoom: 14,
          ),
          markers: {
            Marker( // BURAYA DATABASETEN MARKER BİLGİLERİ ÇEKİLİP MARKER 
                markerId: MarkerId("poop"), // WİDGETLARINI ÇEVİRİP VERMEK LAZIM
                position: LatLng(41.045135, 29.034566),
                draggable: false,
                icon: markerIcon,
                onTap: () {
                  showModalBottomSheet(
                      context: context,
                      builder: (BuildContext context) {
                        return BottomDetail();
                      });
                })
          },
        ),
        Padding(
          padding: const EdgeInsets.all(30),
          child: const ViewSwitchButton(
            pageIndex: 0,
          ),
        ),
      ]),
    );
  }
}
