import 'package:flutter/material.dart';

class BottomFilter extends StatefulWidget {
  const BottomFilter({super.key});

  @override
  State<BottomFilter> createState() => _BottomFilterState();
}

class _BottomFilterState extends State<BottomFilter> {
  final filterOptions = [
    [
      "genderOptions",
      ["Cinsiyet", "Erkek", "Kadın"]
    ],
    [
      "bboOptions",
      ["Bebek Bakım Odası", "Var", "Yok"]
    ],
    [
      "costOptions",
      ["Ücret", "Ücretli", "Ücretsiz"]
    ],
  ];

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
                  children: filterOptions.map((item) {
                    return Column();
                  }).toList(),
                ),
              ),
            ],
          )),
    );
  }
}
