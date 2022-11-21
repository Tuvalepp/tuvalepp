import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:tuvalepp/components/tile_card.dart';
import 'package:tuvalepp/components/view_switch_button.dart';

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
            Marker(
                markerId: MarkerId("poop"),
                position: LatLng(41.045135, 29.034566),
                draggable: false,
                icon: markerIcon,
                onTap: () {
                  showModalBottomSheet(
                      context: context,
                      builder: (BuildContext context) {
                        return Container(
                          color: Colors.white,
                          child: Container(
                              child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: Column(
                                  children: [
                                    SizedBox(
                                      height: 100,
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                            child: const Image(
                                                image: NetworkImage(
                                                    'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg'),
                                                fit: BoxFit.cover),
                                          ),
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(left: 20),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  "Title",
                                                  style: TextStyle(
                                                      fontFamily: "Inter",
                                                      fontSize: 24,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      color: Colors.black),
                                                ),
                                                Row(
                                                  children: [
                                                    const Icon(
                                                      Icons.man,
                                                      size: 30,
                                                      color: Colors.black,
                                                    ),
                                                    const SizedBox(width: 10),
                                                    Container(
                                                      decoration: BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(5),
                                                          color: Colors.pink),
                                                      child: const Padding(
                                                        padding: EdgeInsets
                                                            .symmetric(
                                                                vertical: 5,
                                                                horizontal: 10),
                                                        child: Text(
                                                          "★ 4.2",
                                                          style: TextStyle(
                                                            color: Colors.white,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  children: [
                                                    const Icon(
                                                      Icons.directions_walk,
                                                      size: 20,
                                                    ),
                                                    const Text(
                                                      "12 dk",
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.w500),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    SizedBox(
                                      height: 80,
                                      child: ListView(
                                        scrollDirection: Axis.horizontal,
                                        children: <Widget>[
                                          ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                            child: const Image(
                                                image: NetworkImage(
                                                    'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg'),
                                                height: double.infinity,
                                                fit: BoxFit.cover),
                                          ),
                                          SizedBox(
                                            width: 20,
                                          ),
                                          ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                            child: const Image(
                                                image: NetworkImage(
                                                    'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg'),
                                                height: double.infinity,
                                                fit: BoxFit.cover),
                                          ),
                                          SizedBox(
                                            width: 20,
                                          ),
                                          ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                            child: const Image(
                                                image: NetworkImage(
                                                    'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg'),
                                                height: double.infinity,
                                                fit: BoxFit.cover),
                                          ),
                                          SizedBox(
                                            width: 20,
                                          ),
                                          ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                            child: const Image(
                                                image: NetworkImage(
                                                    'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg'),
                                                height: double.infinity,
                                                fit: BoxFit.cover),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    SizedBox(
                                      width: double.infinity,
                                      height: 75,
                                      child: TextButton(
                                        onPressed: () {
                                          Navigator.pushNamed(
                                              context, "/detail");
                                        },
                                        style: ButtonStyle(
                                          shape: MaterialStateProperty.all<
                                              RoundedRectangleBorder>(
                                            RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                          ),
                                          backgroundColor:
                                              const MaterialStatePropertyAll<
                                                  Color>(Colors.pink),
                                        ),
                                        child: const Text(
                                          "Detaya Git",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.w700,
                                              fontSize: 24),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          )),
                        );
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
