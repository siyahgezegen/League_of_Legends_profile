import 'dart:io';

import 'package:my_lol_profile/constants/shared_constants.dart';
import 'dart:convert' as convert;

import 'package:http/http.dart' as http;
import 'package:my_lol_profile/models/summoner.dart';

final class SummonerServices {
  final String _url = SharedConstant.instance.apiUrlTr;
  final String _apiKey = SharedConstant.instance.apiKey;
  final String _pathSummonerData = SharedConstant.instance.pathSummonerData;
  late String summonerName;
  SummonerServices({required this.summonerName});
  String _buildSummonerUrl() {
    if (summonerName.isEmpty) {
      throw Exception('Summoner name cannot be empty');
    }
    return '$_url$_pathSummonerData$summonerName$_apiKey';
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
