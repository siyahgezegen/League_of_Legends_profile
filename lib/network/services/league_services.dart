// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:my_lol_profile/constants/shared_constants.dart';
import 'package:my_lol_profile/models/league.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class LeagueServices {
  final String url = SharedConstant.instance.apiUrlTr;
  final String apiKey = SharedConstant.instance.apiKey;
  final String pathLeagueData = SharedConstant.instance.pathLeagueData;
  final String pathSummonerData = SharedConstant.instance.pathSummonerData;
  late String summonerName;
  LeagueServices({required this.summonerName});

  String _buildLeagueUrl({required summonerid}) {
    if (summonerName.isEmpty) {
      throw Exception('Summoner name cannot be empty');
    }
    return '$url$pathLeagueData$summonerid$apiKey';
  }

  String _buildSummonerUrl() {
    if (summonerName.isEmpty) {
      throw Exception('Summoner name cannot be empty');
    }
    return '$url$pathSummonerData$summonerName$apiKey';
  }

  Future<League> fetchLeague() async {
    //?Summoner Name
    if (summonerName.isEmpty) {
      return League();
    }
    var summonerId = '';
    var uri = Uri.parse(_buildSummonerUrl());
    var response = await http.get(uri);
    if (response.statusCode == 200) {
      var jsonResponse =
          convert.jsonDecode(response.body) as Map<String, dynamic>;
      //? get summoner id for League info
      summonerId = jsonResponse['id'];
    } else {
      //! empty League
      return League();
    }
    if (summonerId.isEmpty) {
      return League();
    }

    //! League İnfo Path
    uri = Uri.parse(_buildLeagueUrl(summonerid: summonerId));
    var responseLeague = await http.get(uri);
    if (responseLeague.statusCode == 200) {
      var jsonResponse =
          convert.jsonDecode(responseLeague.body) as List<dynamic>;
      League league = League.fromJson(jsonResponse.first);
      return league;
    }

    return League();
  }
}
