import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class UrlLauncher {
  static Future<void> launchTheUrl(BuildContext context, String _url) async {
      try {
        if (!await launchUrl(Uri.parse(_url),
            mode: LaunchMode.inAppWebView)) {
          throw 'Could not launch $_url';
        }
      } catch (err) {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text('Alerta'),
            content:
                const Text('O Link está quebrado, alerte o desenvolvedor!'),
            actions: [
              TextButton(
                onPressed: () {
                  if (Navigator.of(context).canPop()) {
                    Navigator.pop(context);
                  }
                },
                child: const Text('Ok'),
              )
            ],
          ),
        );
      }
    }
}