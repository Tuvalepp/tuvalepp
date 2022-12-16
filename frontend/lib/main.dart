import 'package:flutter/material.dart';
import 'package:tuvalepp/pages/imagedetail.dart';
import 'package:tuvalepp/pages/listallview.dart';
import 'package:tuvalepp/pages/listview.dart';
import 'package:tuvalepp/pages/mapview.dart';
import 'package:tuvalepp/pages/detailview.dart';
import 'package:tuvalepp/pages/rateview.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      initialRoute: '/mapview',
      routes: {
        '/mapview': (context) => const MapViewPage(),
        '/listview': (context) => const ListViewPage(),
        '/detail': (context) => DetailViewPage(id: "detail"),
        '/rate': (context) => const RateViewPage(),
        '/listall': (context) => ListAllPage(
              title: "List All",
            ),
        '/imagedetail': (context) => ImageDetailPage(
              path: "List All",
            ),
      },
      theme: ThemeData(
          appBarTheme: AppBarTheme(
              backgroundColor: Colors.grey.shade500,
              foregroundColor: Colors.black //here you can give the text color
              ),
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
          primarySwatch: Colors.pink,
          fontFamily: "Inter"),
    );
  }
}
