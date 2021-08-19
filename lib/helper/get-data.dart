import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:bimasakti/helper/server.dart';
import 'package:http/http.dart' as http;

class GetData {
  static Future index() async {
    final response = await http.get(Server.endPoint);
    try {
      List data = [];
      var res = json.decode(response.body);
      for (var i = 2; i < 15; i++) {
        Map tamp = new Map();
        if (i > 12) {
          tamp['ros'] = res["2018-0" + (i - 12).toString()];
          data.add(tamp);
        } else {
          tamp['ros'] = res["2017-0" + i.toString()];
          data.add(tamp);
        }
      }
      return data;
    } on Exception catch (e) {
      print(e);
    }
  }

  static Future saveList({String key, List value}) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setStringList(key, value);
    print('Saved : ' + key + " Value : " + value.toString());
  }

  static Future getList(String key) async {
    final prefs = await SharedPreferences.getInstance();
    List x = prefs.getStringList(key);
    // print(x);
    return x;
  }
}
