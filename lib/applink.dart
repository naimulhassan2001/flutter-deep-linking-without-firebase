import 'package:uni_links/uni_links.dart';

class DeepLinkService {
  // Method to initialize deep link handling
  void initDeepLinking() async {
    // Check for deep link when the app is first opened
    try {
      // This will check if the app was opened via a deep link
      String? initialLink = await getInitialLink();
      if (initialLink != null) {
        _handleDeepLink(initialLink);
      }

      // Listen for any deep links that happen while the app is in the foreground
      linkStream.listen((String? link) {
        if (link != null) {
          _handleDeepLink(link);
        }
      });
    } catch (e) {
      print('Error initializing deep link: $e');
    }
  }

  // Method to handle deep links
  void _handleDeepLink(String link) {
    print('Deep link received: $link');
    // Perform actions based on the deep link URL here
  }
}
