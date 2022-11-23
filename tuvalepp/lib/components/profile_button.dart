import 'package:flutter/material.dart';

class ProfileButton extends StatelessWidget {
  const ProfileButton({
    super.key,
    required this.pageIndex,
  });

  final int pageIndex;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: pageIndex == 0 ? Colors.white : Colors.transparent,
      elevation: pageIndex == 0 ? 3 : 0,
      child: Icon(
        Icons.person,
        color: Colors.black,
      ),
      onPressed: () {
        Scaffold.of(context).openDrawer();
      },
    );
  }
}
