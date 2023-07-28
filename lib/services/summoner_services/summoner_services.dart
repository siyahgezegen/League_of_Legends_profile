// ignore_for_file: unused_local_variable

import 'package:my_lol_profile/constants/shared_constants.dart';
import 'dart:convert' as convert;

import 'package:http/http.dart' as http;
import 'package:my_lol_profile/models/league.dart';
import 'package:my_lol_profile/models/summoner.dart';

class SummonerServices {
  final String url = SharedConstant.instance.apiUrlTr;
  final String apiKey = SharedConstant.instance.apiKey;
  final String pathSummonerData = SharedConstant.instance.pathSummonerData;
  final String pathLeagueData = SharedConstant.instance.pathLeagueData;
  late String summonerName;
  String buildSummonerUrl() {
    if (summonerName.isEmpty) {
      throw Exception('Summoner name cannot be empty');
    }
    return '$url$pathSummonerData$summonerName$apiKey';
  }

  String buildLeagueUrl({required summonerid}) {
    if (summonerName.isEmpty) {
      throw Exception('Summoner name cannot be empty');
    }
    return '$url$pathLeagueData$summonerid$apiKey';
  }

  SummonerServices({required this.summonerName});
  Future<Summoner> getSummoners() async {
    if (summonerName.isEmpty) {
      return Summoner();
    }
    var uri = Uri.parse(buildSummonerUrl());
    var response = await http.get(uri);
    Summoner summoner = Summoner();

    if (response.statusCode == 200) {
      var jsonResponse =
          convert.jsonDecode(response.body) as Map<String, dynamic>;
      Summoner sum = Summoner.fromJson(jsonResponse);
      summoner = sum;
      return summoner;
    } else {
      throw Exception('API request failed');
    }
  }

//League information
  Future<League> fetchLeague() async {
    var summonerId;
    if (summonerName.isEmpty) {
      return League();
    }
    var uri = Uri.parse(buildSummonerUrl());
    var response = await http.get(uri);
    if (response.statusCode == 200) {
      var jsonResponse =
          convert.jsonDecode(response.body) as Map<String, dynamic>;
      summonerId = jsonResponse['id'];
    } else {
      return League();
    }
    uri = Uri.parse(buildLeagueUrl(summonerid: summonerId));
    var responseLeague = await http.get(uri);
    if (responseLeague.statusCode == 200) {
      var responseJson =
          convert.jsonDecode(responseLeague.body) as List<dynamic>;

      League league = League.fromJson(responseJson.first);
      print(summonerId);
      return league;
    }

    return League();
  }
}
