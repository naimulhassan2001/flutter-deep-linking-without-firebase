import 'package:deep_linking_flutter/applink.dart';
import 'package:deep_linking_flutter/pages/color_app_home_page.dart';
import 'package:deep_linking_flutter/pages/color_detail_page.dart';
import 'package:deep_linking_flutter/pages/details.dart';
import 'package:deep_linking_flutter/pages/profile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Deep Linking Flutter',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const ColorAppHomePage(),
    );
  }
}
