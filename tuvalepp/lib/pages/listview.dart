import 'package:flutter/material.dart';
import 'package:tuvalepp/components/filter_button.dart';
import 'package:tuvalepp/components/profile_button.dart';
import 'package:tuvalepp/components/profile_drawer.dart';
import 'package:tuvalepp/components/tile_card.dart';
import 'package:tuvalepp/components/view_switch_button.dart';

class ListViewPage extends StatelessWidget {
  const ListViewPage({super.key});

  final double columnGap = 10;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: ProfileDrawer(),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  ProfileButton(
                    pageIndex: 1,
                  ),
                  ViewSwitchButton(
                    pageIndex: 1,
                  ),
                  FilterButton(
                    pageIndex: 1,
                  )
                ],
              ),
            ),
            const SizedBox(height: 10),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  "En yakın",
                  style: TextStyle(
                      fontFamily: "Inter",
                      fontSize: 20,
                      fontWeight: FontWeight.w600),
                ),
                TextButton(
                    onPressed: () {},
                    child: const Text(
                      "Tümünü gör...",
                      style: TextStyle(fontSize: 12, color: Colors.grey),
                    ))
              ],
            ),
            TileCard(),
            SizedBox(height: columnGap),
            TileCard(),
            SizedBox(height: columnGap),
            TileCard(),
            SizedBox(height: 20),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  "Bölgedeki yüksek puanlı",
                  style: TextStyle(
                      fontFamily: "Inter",
                      fontSize: 20,
                      fontWeight: FontWeight.w600),
                ),
                TextButton(
                    onPressed: () {},
                    child: const Text(
                      "Tümünü gör...",
                      style: TextStyle(fontSize: 12, color: Colors.grey),
                    ))
              ],
            ),
            SizedBox(height: columnGap),
            TileCard(),
            SizedBox(height: columnGap),
            TileCard(),
            SizedBox(height: columnGap),
            TileCard(),
          ],
        ),
      ),
    );
  }
}
