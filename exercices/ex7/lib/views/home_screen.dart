import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:ex7/sos_message_dialog.dart';
import 'package:flutter_sms/flutter_sms.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../view_model/dialog_view_model.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    String platform;

    if (kIsWeb) {
      platform = "Web";
    } else if (Platform.isAndroid) {
      platform = "Android";
    } else if (Platform.isIOS) {
      platform = "iOS";
    } else if (Platform.isWindows) {
      platform = "Windows";
    } else if (Platform.isMacOS) {
      platform = "macOS";
    } else if (Platform.isLinux) {
      platform = "Linux";
    } else {
      platform = "Unknown";
    }

    void sms() {
      var viewModel = Provider.of<DialogViewModel>(context, listen: false);
      var recipients = viewModel.getRecipients();
      var message = viewModel.getMessage();

      sendSMS(message: message, recipients: recipients);
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("Tutoriel 7"),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Center(
          child: Column(
            children: [
              FloatingActionButton(
                onPressed: () {
                  sms();
                },
                backgroundColor: Colors.red,
                mini: false,
                heroTag: null,
                shape: const CircleBorder(),
                materialTapTargetSize: MaterialTapTargetSize.padded,
                isExtended: true,
                child: const Icon(
                  Icons.send,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                  onPressed: () => showDialog(
                    context: context,
                    builder: (context) => const SOSMessageDialog(),
                  ),
                  child: const Text("Change SOS message")
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                  onPressed: () => context.go("/recipients"),
                  child: const Text("Manage SOS recipients")
              )
            ],
          ),
        ),
      ),
    );
  }
}