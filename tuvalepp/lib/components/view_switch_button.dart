import 'package:flutter/material.dart';

class ViewSwitchButton extends StatelessWidget {
  const ViewSwitchButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Ink(
            decoration: BoxDecoration(
                color: Colors.grey[50],
                borderRadius: BorderRadius.only(
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
              onPressed: () {},
            ),
          ),
          Ink(
            decoration: BoxDecoration(
                color: Color(0xfff0f0f0),
                borderRadius: BorderRadius.only(
                    topLeft: Radius.zero,
                    topRight: Radius.circular(5),
                    bottomRight: Radius.circular(5),
                    bottomLeft: Radius.zero),
                boxShadow: [
                  BoxShadow(
                    offset: Offset(0, 2),
                    blurRadius: 4,
                    color: Colors.black.withOpacity(0.3),
                  )
                ]),
            child: IconButton(
              icon: Icon(Icons.list),
              onPressed: () {},
            ),
          ),
        ],
      ),
    );
  }
}
