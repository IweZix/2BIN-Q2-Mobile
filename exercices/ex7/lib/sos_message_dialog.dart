import 'package:ex7/view_model/dialog_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SOSMessageDialog extends StatefulWidget {
  const SOSMessageDialog({super.key});

  @override
  State<SOSMessageDialog> createState() => _SOSMessageDialog();
}

class _SOSMessageDialog extends State<SOSMessageDialog> {
  String message = "I'm having an emergency at @loc, send help!";
  late TextEditingController _textEditingController;

  @override
  void initState() {
    super.initState();
    var viewModel = Provider.of<DialogViewModel>(context, listen: false);
    _textEditingController = TextEditingController(text: viewModel.message);
    _textEditingController.addListener(() {
      message = _textEditingController.text;
    });
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text("Your SOS message"),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("Write your new SOS message. You can fill in your actual location using : @loc"),
          TextField(
            controller: _textEditingController,
            decoration: const InputDecoration(
              labelText: "SOS message",
            ),
          ),
        ],
      ),
      actions: [
        ElevatedButton(
          onPressed: () {
            Provider.of<DialogViewModel>(context, listen: false).setMessage(message);
            Navigator.pop(context);
          },
          child: const Text("Save"),
        ),
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text("Dismiss"),
        ),
      ],
    );
  }
}