import 'package:url_launcher/url_launcher.dart';

class DocumentOpener {
  static Future<void> openPdf(String? url) async {
    if (url == null || url.isEmpty) {
      throw 'Document URL not available';
    }

    final uri = Uri.parse(url);

    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      throw 'Could not open document';
    }
  }
}
