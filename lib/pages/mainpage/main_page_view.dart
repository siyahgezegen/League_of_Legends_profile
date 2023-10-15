import 'package:flutter/material.dart';
import 'package:my_lol_profile/pages/mainpage/main_page_view_model.dart';
import 'package:my_lol_profile/pages/mainpage/mainpagewidgets/best_champ.dart';
import 'package:my_lol_profile/pages/mainpage/mainpagewidgets/summoner_info.dart';

import '../../widgets/circle_summoner_avatar.dart';

class MainPageView extends MainPageViewModel {
  @override
  Widget build(BuildContext context) {
    const String appAppBarTitle = 'League of Lefends Profile';
    return Scaffold(
      appBar: AppBar(
        title: const Text(appAppBarTitle),
      ),
      body: Column(
        children: [
          customTextField,
          Center(
            child: SummonerInfoWidget(
                summoner: summoner, league: league, dataMessage: dataMessage),
          ),
          const SizedBox(height: 30),
          BestChampionsWidget(bestchamplist: bestchamplist),
        ],
      ),
      floatingActionButton: floatAcBtn,
    );
  }

  TextStyle get textStyle =>
      const TextStyle(color: Colors.black, fontFamily: 'Roboto');

  CircleSummonerAvatar getSummonerAvatar() {
    return CircleSummonerAvatar(
      iconid: summoner.profileIconId.toString(),
    );
  }

  get floatAcBtn => FloatingActionButton(
      child: const Text('Summoner!'),
      onPressed: () {
        getSummonerData();
        getLeagueData();
        getBestChampionsData();
      });
  get customTextField => Padding(
        padding: const EdgeInsets.all(16.0),
        child: TextField(
          controller: controller,
          decoration: const InputDecoration(
            labelText: 'Summoner Name',
            border: OutlineInputBorder(),
          ),
          onChanged: (value) {
            summonerName = value;
          },
        ),
      );
}
