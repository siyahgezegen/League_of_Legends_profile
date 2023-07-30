// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class ChampionImageServices {
  ChampionImageServices._();

  static Future<String?> imagePath({required String champId}) async {
    Map chaplist = {};
    String result = "";
    var url =
        "https://ddragon.leagueoflegends.com/cdn/13.14.1/data/tr_TR/champion.json";
    var response = await http.get(Uri.parse(url));
    var jsonResponse = convert.jsonDecode(response.body);
    chaplist = jsonResponse['data'];
    chaplist.forEach((key, value) {
      if (value["key"] == champId) {
        var path =
            "https://ddragon.leagueoflegends.com/cdn/13.14.1/img/champion/${value["id"]}.png";
        result = path;
      }
    });
    return result;
  }
}
// unutamadım baba
