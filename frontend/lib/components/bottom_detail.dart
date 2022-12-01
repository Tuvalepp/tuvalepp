import 'package:flutter/material.dart';

class BottomDetail extends StatefulWidget {
  const BottomDetail({super.key});

  @override
  State<BottomDetail> createState() => _BottomDetailState();
}

// BUNA PARAMETRE KOYMAK LAZIM
// DATABASEDEN MARKER BİLGİSİNİ ÇEKİP BUNA VERECEK

class _BottomDetailState extends State<BottomDetail> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      child: Container(
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: const Radius.circular(16.0),
                  topRight: const Radius.circular(16.0))),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    SizedBox(
                      height: 100,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(8.0),
                            child: const Image(
                                image: NetworkImage(
                                    'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg'),
                                fit: BoxFit.cover),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Title",
                                  style: TextStyle(
                                      fontFamily: "Inter",
                                      fontSize: 24,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.black),
                                ),
                                Row(
                                  children: [
                                    const Icon(
                                      Icons.man,
                                      size: 30,
                                      color: Colors.black,
                                    ),
                                    const SizedBox(width: 10),
                                    Container(
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(5),
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
                                  ],
                                ),
                                Row(
                                  children: [
                                    const Icon(
                                      Icons.directions_walk,
                                      size: 20,
                                    ),
                                    const Text(
                                      "12 dk",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      height: 80,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: 4,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(context, "/imagedetail");
                            },
                            child: Row(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(8.0),
                                  child: const Image(
                                      image: NetworkImage(
                                          'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg'),
                                      height: double.infinity,
                                      fit: BoxFit.cover),
                                ),
                                if (index != 3)
                                  SizedBox(
                                    width: 20,
                                  )
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      width: double.infinity,
                      height: 75,
                      child: TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, "/detail");
                        },
                        style: ButtonStyle(
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                          ),
                          backgroundColor:
                              const MaterialStatePropertyAll<Color>(
                                  Colors.pink),
                        ),
                        child: const Text(
                          "Detaya Git",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w700,
                              fontSize: 24),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          )),
    );
  }
}
