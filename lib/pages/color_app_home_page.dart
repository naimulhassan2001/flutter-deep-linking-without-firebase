import 'package:deep_linking_flutter/pages/details.dart';
import 'package:deep_linking_flutter/pages/profile.dart';
import 'package:flutter/material.dart';
import '../applink.dart';
import 'color_detail_page.dart';

class ColorAppHomePage extends StatefulWidget {
  const ColorAppHomePage({super.key});

  @override
  State<ColorAppHomePage> createState() => _ColorAppHomePageState();
}

class _ColorAppHomePageState extends State<ColorAppHomePage> {
  @override
  void initState() {
    appLinks();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const Profile()));
              },
              style: ElevatedButton.styleFrom(surfaceTintColor: Colors.red),
              child: const Text('Profile Screen'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const Details()));
              },
              style: ElevatedButton.styleFrom(surfaceTintColor: Colors.blue),
              child: const Text('Details Screen'),
            ),
          ],
        ),
      ),
    );
  }
}
