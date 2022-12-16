import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:tuvalepp/components/review.dart';
import 'package:tuvalepp/pages/listview.dart';
import 'package:tuvalepp/pages/rateview.dart';
import 'package:tuvalepp/models/toilet.dart';

import '../services/remote_services.dart';

class DetailViewPage extends StatefulWidget {
  DetailViewPage({super.key, required this.id});
  var id;

  @override
  State<DetailViewPage> createState() => _DetailViewPageState();
}

class _DetailViewPageState extends State<DetailViewPage> {
  bool isFav = false;
  bool isLoaded = false;
  Toilet? toilet;

  @override
  void initState() {
    super.initState();
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
    final Map<String, String> arguments =
        ModalRoute.of(context)?.settings?.arguments as Map<String, String>;

    widget.id = arguments["id"];
    getToilet();
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text("Tuvalet Detayı"),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: <Color>[Colors.black, Color.fromARGB(0, 0, 0, 0)]),
          ),
        ),
      ),
      body: Visibility(
        visible: isLoaded,
        replacement: Center(child: CircularProgressIndicator()),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const Image(
                  image: NetworkImage(
                      'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg'),
                  height: 300,
                  width: double.infinity,
                  fit: BoxFit.cover),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          toilet!.title,
                          style: TextStyle(
                              fontFamily: "Inter",
                              fontSize: 24,
                              fontWeight: FontWeight.w600,
                              color: Colors.black),
                        ),
                        IconButton(
                          padding: EdgeInsets.zero,
                          splashColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          onPressed: () {
                            setState(() {
                              isFav = !isFav;
                            });
                          },
                          icon: isFav
                              ? const Icon(
                                  Icons.favorite,
                                  color: Colors.pink,
                                  size: 32,
                                )
                              : const Icon(
                                  Icons.favorite_border,
                                  color: Colors.black,
                                  size: 32,
                                ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 20,
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
                              borderRadius: BorderRadius.circular(5),
                              color: Colors.pink),
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: 5, horizontal: 10),
                            child: Text(
                              '★ ${toilet!.rating}',
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
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Address",
                      style:
                          TextStyle(color: Colors.grey.shade600, fontSize: 16),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      height: 120,
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
                    const SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      width: double.infinity,
                      height: 75,
                      child: TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, "/rate");
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
                          "Puan Ver",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w700,
                              fontSize: 24),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      "En iyi değerlendirmeler",
                      style: TextStyle(
                          fontFamily: "Inter",
                          fontSize: 20,
                          fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Review(),
                    SizedBox(
                      height: 20,
                      child: const Divider(
                        thickness: 1,
                        color: Colors.grey,
                      ),
                    ),
                    Review()
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
