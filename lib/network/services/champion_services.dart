import 'package:my_lol_profile/constants/shared_constants.dart';
import 'package:my_lol_profile/models/best_champions.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class ChampionServices {
  final String _url = SharedConstant.instance.apiUrlTr;
  final String _apiKey = SharedConstant.instance.apiKey;
  final String _pathSummonerData = SharedConstant.instance.pathSummonerData;
  final String _chapionMasteryData = SharedConstant.instance.chapionMasteryData;
  String summonerName;
  ChampionServices({required this.summonerName});
  String summonerId = '';

  String _builChampUrl() {
    if (summonerId.isEmpty) {
      throw Exception('Summoner name cannot be empty');
    }
    return '$_url$_chapionMasteryData$summonerId/top/$_apiKey';
  }

  String _buildSummonerUrl() {
    if (summonerName.isEmpty) {
      throw Exception('Summoner name cannot be empty');
    }
    return '$_url$_pathSummonerData$summonerName$_apiKey';
  }

  Future<List<BestChampion>> getChampions() async {
    List<BestChampion> chaplist = [];

    var uri = Uri.parse(_buildSummonerUrl());
    var response = await http.get(uri);
    if (response.statusCode == 200) {
      var jsonResponse =
          convert.jsonDecode(response.body) as Map<String, dynamic>;
      //? get summoner id for League info
      summonerId = jsonResponse['id'];
    } else {
      //! empty League
      return chaplist;
    }
    if (summonerId.isEmpty) {
      return chaplist;
    }

    if (summonerId.isEmpty) {
      chaplist;
    }
    uri = Uri.parse(_builChampUrl());
    response = await http.get(uri);
    BestChampion bestChampion = BestChampion();
    if (response.statusCode == 200) {
      var jsonResponse = convert.jsonDecode(response.body) as List<dynamic>;
      for (var i = 0; i < jsonResponse.length; i++) {
        bestChampion = BestChampion.fromJson(jsonResponse[i]);
        chaplist.add(bestChampion);
      }
    }
    return chaplist;
  }
}
