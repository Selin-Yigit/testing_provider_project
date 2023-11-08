import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:testing_provider_project/breadCrumbProvider.dart';
import 'package:testing_provider_project/breadCrumbWidget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigoAccent.shade400,
      ),
      body: Column(
        children: [
          Consumer<BreadCrumbProvider>(
            builder: (context, value, child) {
              return BreadCrumbWidget(
                breadCrumb: value.items,
              );
            },
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Center(
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all(Colors.indigoAccent.shade400),
                ),
                onPressed: () {
                  Navigator.of(context).pushNamed("/add");
                },
                child: const Text('Add new bread crumb !!'),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Center(
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all(Colors.indigoAccent.shade400),
                ),
                onPressed: () {
                  // Burada provider ile "one-way" iletişim kurarak reset fonksiyonunu çağırdık.
                  // read fonksiyonu genelde provider'dan bir şey yapmasını istediğimizde kullanılır. Örneğin fonksiyonu getirmek.
                  // callback'ler içinde kuallnılması önerilir. Örneğin burada olduğu gibi bir butonun onPressed'inde.
                  context.read<BreadCrumbProvider>().Reset();
                },
                child: const Text('Reset !!'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
