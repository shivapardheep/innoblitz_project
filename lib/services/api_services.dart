import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:innoblitz_project/constants/api.dart';
import 'package:innoblitz_project/models/userDataModel.dart';

class ApiServices {
  List<DataModel> dataList = [];
  Future<List<DataModel>> getData() async {
    Uri url = Uri.parse(ApiConstants.usersApi);
    http.Response response = await http.get(url);
    if (response.statusCode == 200) {
      dataList.clear();
      List decode = jsonDecode(response.body);
      for (var element in decode) {
        dataList.add(DataModel.fromJson(element));
      }
      return dataList;
    } else {
      return dataList;
    }
  }
}
