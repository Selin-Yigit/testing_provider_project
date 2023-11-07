import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:testing_provider_project/breadCrumb.dart';

class BreadCrumbWidget extends StatelessWidget {
  final UnmodifiableListView<BreadCrumb> breadCrumb;
  const BreadCrumbWidget({super.key, required this.breadCrumb});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: breadCrumb.map(
        (breadCrumb) {
          return Text(
            breadCrumb.title,
            style: TextStyle(
                color: breadCrumb.isActive
                    ? Colors.indigoAccent.shade400
                    : Colors.black),
          );
        },
      ).toList(),
    );
  }
}
