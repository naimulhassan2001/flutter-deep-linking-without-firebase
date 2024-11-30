import 'dart:async';

import 'package:app_links/app_links.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uni_links/uni_links.dart';
import 'color_detail_page.dart';

class ColorAppHomePage extends StatefulWidget {
  const ColorAppHomePage({super.key});

  @override
  State<ColorAppHomePage> createState() => _ColorAppHomePageState();
}

class _ColorAppHomePageState extends State<ColorAppHomePage> {
  @override
  void initState() {
    appLink();
    initDeepLinking();
    super.initState();
  }

  late StreamSubscription _sub;
  String _latestLink = 'Unknown';

  // Handle the incoming deep link
  void initDeepLinking() async {
    try {
      // Check if the app was launched with a deep link
      String? initialLink = await getInitialLink();
      print('Initial deep link: $initialLink');

      // Listen for any future deep link navigation
      linkStream.listen((String? link) {
        print('Received deep link: $link');
        _latestLink = link ?? "no Like" ;
        // Handle the deep link here
      });
    } catch (e) {
      print('Error initializing deep link: $e');
    }
  }

  @override
  void dispose() {
    _sub.cancel();
    super.dispose();
  }

  appLink() async {
    print("url : }");
    final appLinks = AppLinks();

    var url = await appLinks.getInitialLink();

    print("url : }");

// Subscribe to all events (initial link and further)
    final sub = appLinks.uriLinkStream.listen((uri) {
      print("url : ${uri}");
      print("applinks: ${uri.path}");

      if (uri.path == "/red") {
        Get.to(const ColorDetailPage(
          color: Colors.red,
        ));
      }
      if (uri.path == "/blue") {
        Get.to(const ColorDetailPage(
          color: Colors.blue,
        ));
      }
    });
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
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ColorDetailPage(
                              color: Colors.red,
                            )));
              },
              style: ElevatedButton.styleFrom(surfaceTintColor: Colors.red),
              child: const Text('Red Screen'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ColorDetailPage(
                              color: Colors.blue,
                            )));
              },
              style: ElevatedButton.styleFrom(surfaceTintColor: Colors.blue),
              child: const Text('Blue Screen'),
            ),
            Center(
              child: Text('Received link: $_latestLink'),
            ),
          ],
        ),
      ),
    );
  }
}
