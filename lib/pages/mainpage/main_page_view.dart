import 'package:flutter/material.dart';
import 'package:my_lol_profile/pages/mainpage/main_page_view_model.dart';

import '../../widgets/circle_summoner_avatar.dart';

class MainPageView extends MainPageViewModel {
  @override
  Widget build(BuildContext context) {
    const String appAppBarTitle = 'Lol Api';
    return Scaffold(
      appBar: AppBar(
        title: const Text(appAppBarTitle),
      ),
      body: Column(
        children: [
          customTextField,
          Center(
            child: summoner.id == null
                ? Text(dataMessage)
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      getSummonerAvatar(),
                      Text("name = ${summoner.name}"),
                      Text("level = ${summoner.summonerLevel}"),
                      Text(
                          "${league.tier} - ${league.rank} - ${league.leaguePoints}LP"),
                      Text("wins = ${league.wins} -  loses = ${league.losses}"),
                      league.hotStreak == true
                          ? const Text('Hot Streak')
                          : const Text('.'),
                    ],
                  ),
          ),
        ],
      ),
      floatingActionButton: floatAcBtn,
    );
  }

  CircleSummonerAvatar getSummonerAvatar() {
    return CircleSummonerAvatar(
      iconid: summoner.profileIconId.toString(),
    );
  }

  get floatAcBtn => FloatingActionButton(onPressed: () {
        getSummonerData();
        getLeagueData();
      });
  get customTextField => TextField(
        controller: controller,
        onChanged: (value) {
          summonerName = value;
        },
      );
}
