import 'package:flutter/material.dart';
import 'package:innoblitz_project/models/userDataModel.dart';
import 'package:innoblitz_project/services/api_services.dart';

class ApiProvider extends ChangeNotifier {
  List<DataModel> _dataList = [];
  List<DataModel> get getDataList => _dataList;

  fetchApiData() async {
    try {
      _dataList = await ApiServices().getData();
    } catch (e) {
      throw Text("Error is $e");
    }
    notifyListeners();
  }
}
