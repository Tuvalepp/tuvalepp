import 'package:flutter/material.dart';
import 'package:tuvalepp/components/tile_card.dart';

class ListAllPage extends StatefulWidget {
  const ListAllPage({super.key, required this.title});

  final title;

  @override
  State<ListAllPage> createState() => _ListAllPageState();
}

class _ListAllPageState extends State<ListAllPage> {
  final double columnGap = 10;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Text(
          widget.title.toString(),
        ),
      ),
      body: ListView.separated(
        shrinkWrap: true,
        itemCount: 20,
        itemBuilder: (context, index) {
          return Container(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: TileCard(),
          );
        },
        separatorBuilder: (context, index) => SizedBox(
          height: 10,
        ),
      ),
    );
  }
}
