import 'package:app_links/app_links.dart';
import 'package:deep_linking_flutter/pages/color_app_home_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'applink.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  DeepLinkService().initDeepLinking();
  final uri = AppLinks(); // AppLinks is singleton
  var url = await uri.getInitialLink();
  print("url : ${url}");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Deep Linking Flutter',
      home: ColorAppHomePage(),
    );
  }
}
