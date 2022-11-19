import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:tuvalepp/pages/listview.dart';

import '../pages/mapview.dart';

class ViewSwitchButton extends StatelessWidget {
  const ViewSwitchButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Ink(
          decoration: BoxDecoration(
              color: Colors.grey[50],
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(5),
                topRight: Radius.zero,
                bottomRight: Radius.zero,
                bottomLeft: Radius.circular(5),
              ),
              boxShadow: [
                BoxShadow(
                  offset: Offset(0, 2),
                  blurRadius: 4,
                  color: Colors.black.withOpacity(0.3),
                )
              ]),
          child: IconButton(
            icon: Icon(Icons.map_outlined),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const MapViewPage(),
                ),
              );
            },
          ),
        ),
        Ink(
          decoration: BoxDecoration(
              color: const Color(0xfff0f0f0),
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.zero,
                  topRight: Radius.circular(5),
                  bottomRight: Radius.circular(5),
                  bottomLeft: Radius.zero),
              boxShadow: [
                BoxShadow(
                  offset: const Offset(0, 2),
                  blurRadius: 4,
                  color: Colors.black.withOpacity(0.3),
                )
              ]),
          child: IconButton(
            icon: Icon(Icons.list),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ListViewPage(),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
