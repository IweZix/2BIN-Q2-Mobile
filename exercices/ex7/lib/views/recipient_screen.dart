import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../view_model/dialog_view_model.dart';

class RecipientsScreen extends StatefulWidget {
  const RecipientsScreen({super.key});

  @override
  State<RecipientsScreen> createState() => _RecipientsScreenState();
}

class _RecipientsScreenState extends State<RecipientsScreen> {
  List<String> list = [];
  final controllerRecipient = TextEditingController();

  List<String> fetchRecipients() {
    var viewModel = Provider.of<DialogViewModel>(context, listen: false);
    return viewModel.getRecipients();
  }

  void addRecipient(String recipient) {
    Provider.of<DialogViewModel>(context, listen: false).addRecipient(recipient);
    setState(() {
      list.add(recipient);
    });
  }

  void removeRecipient(String recipient) {
    Provider.of<DialogViewModel>(context, listen: false).removeRecipient(recipient);
    setState(() {
      list.remove(recipient);
    });
  }

  @override
  Widget build(BuildContext context) {
    var recipients = fetchRecipients();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Manage SOS recipients"),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Center(
          child: Column(
            children: [
              const SizedBox(height: 16),
              Expanded(
                child: ListView.builder(
                  itemCount: recipients.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(recipients[index]),
                      trailing: IconButton(
                        icon: const Icon(Icons.delete),
                        onPressed: () {
                          removeRecipient(recipients[index]);
                        },
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: controllerRecipient,
                decoration: const InputDecoration(
                  labelText: "Recipient",
                ),
                onFieldSubmitted: (value) {
                  Provider.of<DialogViewModel>(context, listen: false).addRecipient(value);
                },
              ),
              ElevatedButton(
                  onPressed: () {
                    addRecipient(controllerRecipient.text);
                    controllerRecipient.clear();
                  },
                  child: const Text("Add recipient")
              )
            ],
          ),
        ),
      ),
    );
  }
}
