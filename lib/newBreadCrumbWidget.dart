import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:testing_provider_project/breadCrumb.dart';
import 'package:testing_provider_project/breadCrumbProvider.dart';

class NewBreadCrumbWidget extends StatefulWidget {
  const NewBreadCrumbWidget({super.key});

  @override
  State<NewBreadCrumbWidget> createState() => _NewBreadCrumbWidgetState();
}

class _NewBreadCrumbWidgetState extends State<NewBreadCrumbWidget> {
  late final TextEditingController _breadCrumbController;

  @override
  void initState() {
    _breadCrumbController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _breadCrumbController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "New Bread Crumb Widget",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.indigoAccent.shade400,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: TextField(
              controller: _breadCrumbController,
              decoration: const InputDecoration(
                hintText: "Enter new bread crumb",
              ),
            ),
          ),
          TextButton(
            onPressed: () {
              final text = _breadCrumbController.text;
              if (text.isNotEmpty) {
                final breadCrumb = BreadCrumb(name: text, isActive: false);
                context.read<BreadCrumbProvider>().Add(breadCrumb);
                Navigator.of(context).pop();
              }
            },
            style: ButtonStyle(
              backgroundColor:
                  MaterialStatePropertyAll(Colors.indigoAccent.shade400),
            ),
            child: const Text(
              "Add",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
