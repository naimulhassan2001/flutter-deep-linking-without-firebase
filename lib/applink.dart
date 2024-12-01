import 'package:app_links/app_links.dart';
import 'package:deep_linking_flutter/pages/details.dart';
import 'package:deep_linking_flutter/pages/profile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

String appUrl = '';
String path = '';

appLinks() async {
  final uri = AppLinks();
  var url = await uri.getInitialLink();
  path = url?.path ?? " ";
  appUrl = url.toString();

  print("url");
  print(url);
  if (path == "/details") {
    Get.to(() => const Details());
  }

  if (path == "/profile") {
    Get.to(() => const Profile());
  }
  print(path);
  print(url.runtimeType);

  return url;
}
