import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:testing_provider_project/breadCrumbProvider.dart';
import 'package:testing_provider_project/homePage.dart';
import 'package:testing_provider_project/newBreadCrumbWidget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      // Bu şekilde provider'ı context'e getirmiş olduk.
      // Bu sayede "ChangeNotifierProvider" 'ın child'ları provider'a ulaşabilmiş oldu.
      create: (_) => BreadCrumbProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          "/": (BuildContext context) => const HomePage(),
          "/add": (BuildContext context) => const NewBreadCrumbWidget(),
        },
        initialRoute: "/",
      ),
    );
  }
}
