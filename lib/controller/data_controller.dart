import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DataController extends GetxController{

  final GlobalKey<AnimatedListState> key = GlobalKey<AnimatedListState>();
  List<Map<String, dynamic>> nameList = [];
  final textController = TextEditingController();
	
	void getLocalData() async {
    final pref = await SharedPreferences.getInstance();
    final String? getData = pref.getString('data');
    if (getData != null) {
      List<dynamic> dataTemp = jsonDecode(getData);
      for (int i = dataTemp.length - 1; i >= 0; i--) {
        addDataToNameList(i, dataTemp[i]['name'], dataTemp[i]['isChecked']);
      }
    }
  }

  void addDataToNameList(int id, String name, bool isChecked) {
    nameList.insert(0, {'id': id, 'name': name, 'isChecked': isChecked});
    key.currentState!.insertItem(0, duration: const Duration(milliseconds: 100));
  }

	void setLocalData() async {
    final pref = await SharedPreferences.getInstance();
    String setData = json.encode(nameList);
    pref.setString('data', setData);
  }

	void removeLocalData() async {
    final pref = await SharedPreferences.getInstance();
    pref.remove('data');
  }

  void addNameList() {
    textController.clear();
    nameList.insert(0, {'id': 0, 'name': '', 'isChecked': false});
    key.currentState!
        .insertItem(0, duration: const Duration(milliseconds: 800));
  }

  void removeItem(int index) {
    key.currentState!.removeItem(
      index,
      (_, animation) {
        return SizeTransition(
          sizeFactor: animation,
        );
      },
    );
    nameList.removeAt(index);
    setLocalData();
  }
@override
  void onInit() {
		getLocalData();
    super.onInit();
  }
}