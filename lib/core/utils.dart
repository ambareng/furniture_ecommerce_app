import 'package:flutter/material.dart';

Future<bool> exitAppDialog({required BuildContext context}) async {
  bool? exitApp = await showDialog(
      context: context,
      builder: ((BuildContext context) {
        return AlertDialog(
          contentPadding: const EdgeInsets.only(top: 20),
          actionsPadding: EdgeInsets.zero,
          content: const Text(
            'Are you sure you want to exit the app?',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 14),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(true);
              },
              child: const Text(
                'YES',
                style: TextStyle(fontSize: 14),
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(false);
              },
              child: const Text(
                'NO',
                style: TextStyle(fontSize: 14),
              ),
            )
          ],
        );
      }));

  return exitApp ?? false;
}
