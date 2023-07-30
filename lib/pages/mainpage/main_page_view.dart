import 'package:flutter/material.dart';
import 'package:my_lol_profile/pages/mainpage/main_page_view_model.dart';
import 'package:my_lol_profile/widgets/champion_image.dart';

import '../../widgets/circle_summoner_avatar.dart';

class MainPageView extends MainPageViewModel {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;

    const String appAppBarTitle = 'League of Lefends Profile';
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
                  : Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Card(
                        elevation: 20,
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0)),
                        // color: const Color.fromARGB(0, 255, 255, 255),
                        child: Padding(
                          padding: const EdgeInsets.all(8),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              getSummonerAvatar(),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(summoner.name.toString(),
                                      style: textStyle),
                                  Text(
                                      'Lvl:${summoner.summonerLevel.toString()}',
                                      style: textStyle),
                                  Text(
                                      "${league.tier} - ${league.rank} - ${league.leaguePoints}",
                                      style: textStyle),
                                  Text(
                                      "wins: ${league.wins} -  loses: ${league.losses}",
                                      style: textStyle),
                                  league.hotStreak == true
                                      ? Text('Hot Streak', style: textStyle)
                                      : const Text(
                                          '',
                                        ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    )),
          const SizedBox(
            height: 30,
          ),
          bestchamplist.isEmpty
              ? const Text('bulunamadı')
              : Expanded(
                  // Expanded buraya taşındı
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      for (int i = 0; i < bestchamplist.length; i++)
                        Card(
                            margin: const EdgeInsets.all(3),
                            child: SizedBox(
                              width: width / (bestchamplist.length + 0.5),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  ChampionImage(
                                      champImagePath: bestchamplist[i]
                                          .championId
                                          .toString()),
                                  Text(
                                      bestchamplist[i].championLevel.toString(),
                                      style: textStyle),
                                  Text(
                                      bestchamplist[i]
                                          .championPoints
                                          .toString(),
                                      style: textStyle),
                                  Text(bestchamplist[i].chestGranted.toString(),
                                      style: textStyle),
                                ],
                              ),
                            )),
                    ],
                  ),
                ),
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
