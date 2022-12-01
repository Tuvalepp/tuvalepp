import 'package:flutter/material.dart';

class ProfileDrawer extends StatelessWidget {
  const ProfileDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          SizedBox(
            height: 120,
            child: DrawerHeader(
              decoration: BoxDecoration(color: Colors.pink),
              child: SizedBox(
                child: Row(
                  children: const [
                    CircleAvatar(
                      radius: 32,
                      backgroundColor: Colors.white,
                      child: CircleAvatar(
                        radius: 30,
                        backgroundImage: NetworkImage(
                            'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg'),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Flexible(
                      child: Text(
                        "Onur Saltani",
                        style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 24,
                            color: Colors.white),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          ListTile(
            title: const Text('Falan filan hesabı'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
