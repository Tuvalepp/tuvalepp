import 'package:flutter/material.dart';

import '../models/toilet.dart';
import '../services/remote_services.dart';

class BottomDetail extends StatefulWidget {
  BottomDetail({super.key, required this.id});

  late var id;

  @override
  State<BottomDetail> createState() => _BottomDetailState();
}

class _BottomDetailState extends State<BottomDetail> {
  Toilet? toilet;
  var isLoaded = false;

  @override
  void initState() {
    super.initState();
    getToilet();
  }

  void getToilet() async {
    var toiletRes = await RemoteService().getToiletWithId(widget.id);
    setState(() {
      toilet = toiletRes;
      isLoaded = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: isLoaded,
      replacement: Center(child: CircularProgressIndicator()),
      child: Container(
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
                              child: Visibility(
                                visible: isLoaded,
                                replacement:
                                    Center(child: CircularProgressIndicator()),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      toilet!.title,
                                      style: TextStyle(
                                          fontFamily: "Inter",
                                          fontSize: 24,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.black),
                                    ),
                                    Row(
                                      children: [
                                        Row(
                                          children: [
                                            if (toilet!.gender == 'M')
                                              Icon(
                                                Icons.man,
                                                size: 30,
                                                color: Colors.black,
                                              )
                                            else if (toilet!.gender == 'F')
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
                                          ],
                                        ),
                                        const SizedBox(width: 10),
                                        Container(
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                              color: Colors.pink),
                                          child: Padding(
                                            padding: EdgeInsets.symmetric(
                                                vertical: 5, horizontal: 10),
                                            child: Text(
                                              '★${toilet!.rating}',
                                              style: TextStyle(
                                                color: Colors.white,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
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
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(
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
      ),
    );
  }
}
