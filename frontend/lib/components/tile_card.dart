import 'dart:ffi';
import 'package:flutter/material.dart';
import 'package:tuvalepp/pages/detailview.dart';

class TileCard extends StatefulWidget {
  const TileCard({
    super.key,
    required this.id,
    required this.title,
    required this.rating,
    required this.gender,
  });

  final String id;
  final String title;
  final double rating;
  final String gender;

  @override
  State<TileCard> createState() => _TileCardState();
}

class _TileCardState extends State<TileCard> {
  bool isFav = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context)
            .pushNamed("/detail", arguments: {"id": widget.id});
      },
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: SizedBox(
          height: 100,
          child: Center(
            child: ListTile(
              leading: const Icon(Icons.image),
              title: Padding(
                padding: EdgeInsets.only(bottom: 15.0),
                child: Text(
                  widget.title,
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.w400),
                ),
              ),
              subtitle: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    child: Row(
                      children: [
                        if (widget.gender == 'M')
                          Icon(
                            Icons.man,
                            size: 30,
                            color: Colors.black,
                          )
                        else if (widget.gender == 'F')
                          Icon(
                            Icons.woman,
                            size: 30,
                            color: Colors.black,
                          )
                        else
                          Row(
                            children: const [
                              Icon(
                                Icons.man,
                                size: 30,
                                color: Colors.black,
                              ),
                              Icon(
                                Icons.woman,
                                size: 30,
                                color: Colors.black,
                              )
                            ],
                          ),
                        const SizedBox(width: 10),
                        Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: Colors.pink),
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: 5, horizontal: 10),
                            child: Text(
                              widget.rating.toString(),
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      setState(() {
                        isFav = !isFav;
                      });
                    },
                    icon: isFav
                        ? const Icon(
                            Icons.favorite,
                            color: Colors.pink,
                          )
                        : const Icon(
                            Icons.favorite_border,
                            color: Colors.black,
                          ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
