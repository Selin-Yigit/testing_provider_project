import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:testing_provider_project/breadCrumb.dart';

class BreadCrumbProvider extends ChangeNotifier {
  //BreadCrumb'ların tutulduğu liste.
  final List<BreadCrumb> _items = [];

  //BreadCrumb'ların tutulduğu READONLY liste.
  UnmodifiableListView<BreadCrumb> get items => UnmodifiableListView(_items);

  void Add(BreadCrumb breadCrumb) {
    for (final item in _items) {
      item.Activate();
    }
    _items.add(breadCrumb);
    notifyListeners();
  }

  void Reset() {
    _items.clear();
    notifyListeners();
  }
}
