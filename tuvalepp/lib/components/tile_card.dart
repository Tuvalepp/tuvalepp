import 'package:flutter/material.dart';
import 'package:tuvalepp/pages/detailview.dart';

class TileCard extends StatefulWidget {
  const TileCard({super.key});

  @override
  State<TileCard> createState() => _TileCardState();
}

class _TileCardState extends State<TileCard> {
  bool isFav = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const DetailViewPage(),
          ),
        );
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
              title: const Padding(
                padding: EdgeInsets.only(bottom: 15.0),
                child: Text(
                  "title",
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
                            padding: EdgeInsets.symmetric(
                                vertical: 5, horizontal: 10),
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
