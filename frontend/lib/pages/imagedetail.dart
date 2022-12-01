import 'package:flutter/material.dart';

class ImageDetailPage extends StatelessWidget {
  ImageDetailPage({super.key, required this.path});

  String path = "";

  @override
  Widget build(BuildContext context) {
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
              image: NetworkImage(
                  'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg'),
              alignment: Alignment.center),
        ),
      ),
    );
  }
}
