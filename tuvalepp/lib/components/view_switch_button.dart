import 'package:flutter/material.dart';
import 'package:tuvalepp/pages/listview.dart';
import '../pages/mapview.dart';

class ViewSwitchButton extends StatelessWidget {
  const ViewSwitchButton({
    super.key,
    required this.pageIndex,
  });

  final int pageIndex;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const MapViewPage(),
              ),
            );
          },
          style: ElevatedButton.styleFrom(
            elevation: 0,
            backgroundColor: pageIndex == 0 ? Colors.white : Color(0xfff0f0f0),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(5),
                    topRight: Radius.circular(0),
                    bottomRight: Radius.circular(0),
                    bottomLeft: Radius.circular(5))),
          ),
          child: Icon(
            Icons.map_outlined,
            color: Colors.black,
          ),
        ),
        ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const ListViewPage(),
              ),
            );
          },
          style: ElevatedButton.styleFrom(
            elevation: 0,
            backgroundColor: pageIndex == 1 ? Colors.white : Color(0xfff0f0f0),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(0),
                    topRight: Radius.circular(5),
                    bottomRight: Radius.circular(5),
                    bottomLeft: Radius.circular(0))),
          ),
          child: Icon(
            Icons.list,
            color: Colors.black,
          ),
        ),
      ],
    );
  }
}
