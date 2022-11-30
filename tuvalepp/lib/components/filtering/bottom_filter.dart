import 'package:flutter/material.dart';
import 'package:tuvalepp/components/filtering/attribute_button.dart';

class BottomFilter extends StatefulWidget {
  BottomFilter({super.key});

  final filters = [
    [
      ["Cinsiyet"],
      ["Erkek", "Kadın", "Ortak"]
    ],
    [
      ["Ücret"],
      ["Ücretli", "Ücretsiz"]
    ],
    [
      ["Bebek Bakım Odası"],
      ["Var", "Yok"]
    ]
  ];

  @override
  State<BottomFilter> createState() => _BottomFilterState();
}

class _BottomFilterState extends State<BottomFilter> {
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
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "Filtrele",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              SizedBox(
                width: double.infinity,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: widget.filters.map(
                      (e) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              e[0][0].toString(),
                              style: TextStyle(fontSize: 20),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Wrap(
                              spacing: 20,
                              children: e[1].map(
                                (val) {
                                  return AttributeButton(
                                    name: val.toString(),
                                  );
                                },
                              ).toList(),
                            ),
                            SizedBox(
                              height: 20,
                            )
                          ],
                        );
                      },
                    ).toList()),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
