import 'package:flutter/material.dart';
import 'package:my_lol_profile/constants/shared_constants.dart';
import 'package:my_lol_profile/models/best_champions.dart';
import 'package:my_lol_profile/models/league.dart';
import 'package:my_lol_profile/models/summoner.dart';
import 'package:my_lol_profile/pages/mainpage/main_page.dart';
import 'package:my_lol_profile/network/services/champion_services.dart';
import 'package:my_lol_profile/network/services/league_services.dart';
import 'package:my_lol_profile/network/services/summoner_services.dart';

abstract class MainPageViewModel extends State<MainPage> {
  late TextEditingController controller;
  String dataMessage = '';
  String imagePath = "";

  @override
  void initState() {
    super.initState();
    controller = TextEditingController();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  String summonerName = '';
  Summoner summoner = Summoner();
  League league = League();
  List<BestChampion> bestchamplist = [];

  Future<void> getSummonerData() async {
    try {
      if (summonerName.isEmpty) {
        setState(() {
          summoner = Summoner();
        });
        return;
      }
      Summoner sum =
          await SummonerServices(summonerName: summonerName).getSummoners();
      setState(() {
        summoner = sum;
      });
    } catch (error) {
      setState(() {
        print('error<getSummonerData>: $error');
        summoner = Summoner();
        dataMessage = SharedConstant.instance.summonerIsNotFound;
      });
    }
  }

  Future<void> getBestChampionsData() async {
    try {
      var listofchamp =
          await ChampionServices(summonerName: summonerName).getChampions();
      setState(() {
        bestchamplist = listofchamp;
      });
    } catch (e) {
      print('error<getBestChampionsData> : $e');
    }
  }

  Future<void> getLeagueData() async {
    try {
      if (summonerName.isEmpty) {
        //Burada summoner name yoksa bu işlem yok!
        setState(() {
          league = League();
        });
        return;
      }
      League leg =
          await LeagueServices(summonerName: summonerName).fetchLeague();
      setState(() {
        league = leg;
      });
    } catch (error) {
      print('error<getLeagueData> : $error');
      setState(() {
        league = League();
      });
    }
  }
}
