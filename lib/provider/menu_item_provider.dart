import 'package:flutter/material.dart';


class MenuItemProvider extends ChangeNotifier {
String status = 'task';

void changeStatus(String nameItem) {
status = nameItem;
notifyListeners();
}

String get newStatus => status;
}