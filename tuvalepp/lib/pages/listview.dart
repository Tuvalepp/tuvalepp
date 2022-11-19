import 'package:flutter/material.dart';
import 'package:tuvalepp/components/tile_card.dart';
import 'package:tuvalepp/components/view_switch_button.dart';

class ListViewPage extends StatelessWidget {
  const ListViewPage({super.key});

  final double columnGap = 10;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(30),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const ViewSwitchButton(),
              const SizedBox(height: 20),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
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
                crossAxisAlignment: CrossAxisAlignment.start,
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
      ),
    );
  }
}
