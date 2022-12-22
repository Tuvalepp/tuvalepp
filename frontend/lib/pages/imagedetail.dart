import 'package:flutter/material.dart';

class ImageDetailPage extends StatefulWidget {
  ImageDetailPage({super.key, required this.path});

  String path = "";

  @override
  State<ImageDetailPage> createState() => _ImageDetailPageState();
}

class _ImageDetailPageState extends State<ImageDetailPage> {
  @override
  Widget build(BuildContext context) {
    final Map<String, String> arguments =
        ModalRoute.of(context)?.settings?.arguments as Map<String, String>;

    widget.path = arguments["path"]!;

    return Scaffold(
      backgroundColor: Colors.black,
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
      body: Center(
        child: InteractiveViewer(
          panEnabled: false, // Set it to false
          minScale: 0.5,
          maxScale: 2,
          child: Image(
              image: AssetImage(widget.path), alignment: Alignment.center),
        ),
      ),
    );
  }
}
