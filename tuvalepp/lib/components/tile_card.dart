import 'package:flutter/material.dart';

class TileCard extends StatelessWidget {
  const TileCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: SizedBox(
        height: 100,
        child: Center(
          child: ListTile(
            leading: const Icon(Icons.image),
            title: const Padding(
              padding: EdgeInsets.only(bottom: 15.0),
              child: Text(
                "title",
                style:
                    TextStyle(color: Colors.black, fontWeight: FontWeight.w400),
              ),
            ),
            subtitle: Row(
              children: [
                const Icon(
                  Icons.man,
                  size: 30,
                  color: Colors.black,
                ),
                const SizedBox(width: 10),
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Colors.pink),
                  child: const Padding(
                    padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                    child: Text(
                      "★ 4.2",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                const Icon(
                  Icons.circle,
                  size: 5,
                ),
                const SizedBox(width: 10),
                const Icon(
                  Icons.directions_walk,
                  size: 30,
                ),
                const Text(
                  "12 dk",
                  style: TextStyle(fontWeight: FontWeight.w500),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
