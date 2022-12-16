import 'dart:convert';
import 'package:location/location.dart';
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
import 'package:tuvalepp/services/remote_services.dart';

class MapViewPage extends StatefulWidget {
  const MapViewPage({super.key});

  @override
  State<MapViewPage> createState() => MapViewPageState();
}

class MapViewPageState extends State<MapViewPage> {
  BitmapDescriptor markerIcon = BitmapDescriptor.defaultMarker;
  List<Toilet>? locations;
  late LatLng _initialCameraPosition = LatLng(41.045135, 29.034566);
  late GoogleMapController _controller;
  final Location _location = Location();
  late LocationData myLocation;

  @override
  void initState() {
    addCustomIcon();
    super.initState();
    getLocations();
    snapToLocation();
  }

  void snapToLocation() async {
    myLocation = await _location.getLocation();
    setState(() {
      _initialCameraPosition = LatLng(
          myLocation.latitude!.toDouble(), myLocation.longitude!.toDouble());
    });
  }

  void addCustomIcon() {
    BitmapDescriptor.fromAssetImage(
            const ImageConfiguration(), "assets/poop_marker.png")
        .then(
      (icon) {
        setState(() {
          markerIcon = icon;
        });
      },
    );
  }

  void _onMapCreated(GoogleMapController _cntlr) {
    _controller = _cntlr;
    _location.onLocationChanged.listen((l) {
      _controller.animateCamera(
        CameraUpdate.newCameraPosition(
          CameraPosition(target: LatLng(l.latitude!, l.longitude!), zoom: 15),
        ),
      );
    });
  }

  var isLoaded = false;

  void getLocations() async {
    locations = await RemoteService().getToilets();
    if (locations != null) {
      setState(() {
        isLoaded = true;
      });
    }
  }

  Set<Marker> getMarkers() {
    Set<Marker> markers = Set();
    for (var i = 0; i < locations!.length; i++) {
      markers.add(
        Marker(
            markerId: MarkerId(i.toString()),
            position: LatLng(locations![i].latitude, locations![i].longitude),
            draggable: false,
            icon: markerIcon,
            onTap: () {
              showModalBottomSheet(
                  context: context,
                  builder: (BuildContext context) {
                    return BottomDetail(
                      id: locations![i].id,
                    );
                  });
            }),
      );
    }
    return markers;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: ProfileDrawer(),
      body: Stack(children: <Widget>[
        GoogleMap(
          initialCameraPosition: CameraPosition(target: _initialCameraPosition),
          onMapCreated: _onMapCreated,
          myLocationEnabled: true,
          myLocationButtonEnabled: true,
          padding: EdgeInsets.only(top: 150.0),
          markers: getMarkers(),
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
