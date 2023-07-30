import 'dart:io';

import 'package:my_lol_profile/constants/shared_constants.dart';
import 'dart:convert' as convert;

import 'package:http/http.dart' as http;
import 'package:my_lol_profile/models/summoner.dart';

class SummonerServices {
  final String url = SharedConstant.instance.apiUrlTr;
  final String apiKey = SharedConstant.instance.apiKey;
  final String pathSummonerData = SharedConstant.instance.pathSummonerData;
  final String pathLeagueData = SharedConstant.instance.pathLeagueData;
  late String summonerName;
  SummonerServices({required this.summonerName});
  String _buildSummonerUrl() {
    if (summonerName.isEmpty) {
      throw Exception('Summoner name cannot be empty');
    }
    return '$url$pathSummonerData$summonerName$apiKey';
  }

  Future<Summoner> getSummoners() async {
    if (summonerName.isEmpty) {
      return Summoner();
    }
    var uri = Uri.parse(_buildSummonerUrl());
    var response = await http.get(uri);
    Summoner summoner = Summoner();

    if (response.statusCode == HttpStatus.ok) {
      var jsonResponse =
          convert.jsonDecode(response.body) as Map<String, dynamic>;
      Summoner sum = Summoner.fromJson(jsonResponse);
      summoner = sum;
      return summoner;
    } else {
      throw Exception('API request failed');
    }
  }
}
