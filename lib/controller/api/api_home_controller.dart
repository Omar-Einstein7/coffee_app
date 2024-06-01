import 'dart:convert';
import 'package:coffee_app/model/newmodel.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class ApiHomeController extends GetxController {
  RxList item = <Newmodel>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchdata();
  }

  Future<List<Newmodel>> fetchdata() async {
    final response = await http
        .get(Uri.parse("https://jsonplaceholder.typicode.com/photos"));

    if (response.statusCode == 200) {
      var jsonData = json.decode(response.body) as List;
      item.value = jsonData.map((post) => Newmodel.fromJson(post)).toList();
      return json.decode(response.body);
    } else {
      throw Exception(response.statusCode);
    }
  }
}
