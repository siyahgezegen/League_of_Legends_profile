// ignore_for_file: non_constant_identifier_names, depend_on_referenced_packages, library_prefixes

import 'package:flutter_dotenv/flutter_dotenv.dart' as DotEnv;

class SharedConstant {
  SharedConstant._();
  static SharedConstant instance = SharedConstant._();

  final String apiKey = "?api_key=${DotEnv.dotenv.env['APIKEY']}";

  final String apiUrlTr = DotEnv.dotenv.env['APIURLTR'].toString();

  String profileIcon({required String iconId}) {
    final profileIconBase = DotEnv.dotenv.env['PROFILEICON'];
    return '${profileIconBase ?? ''}$iconId.png';
  }

  final String pathSummonerData = DotEnv.dotenv.env['SUMMONERDATA'].toString();
  final String pathLeagueData = DotEnv.dotenv.env['LEAGUEDATA'].toString();

  final String summonerIsNotFound = 'Sihirdar Bulunamadı';
  final String waitPlease = "Lütfen Bekleyiniz";
}
