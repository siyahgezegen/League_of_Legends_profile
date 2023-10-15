import 'package:flutter/material.dart';
import 'package:my_lol_profile/models/league.dart';
import 'package:my_lol_profile/models/summoner.dart';
import 'package:my_lol_profile/widgets/circle_summoner_avatar.dart';

class SummonerInfoWidget extends StatelessWidget {
  final Summoner summoner;
  final League league;
  final String dataMessage;

  const SummonerInfoWidget(
      {super.key,
      required this.summoner,
      required this.league,
      required this.dataMessage});

  @override
  Widget build(BuildContext context) {
    return summoner.id == null
        ? Text(dataMessage)
        : Card(
            elevation: 20,
            color: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CircleSummonerAvatar(
                      iconid: summoner.profileIconId.toString()),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(summoner.name.toString(), style: textStyle),
                      Text('Lvl:${summoner.summonerLevel.toString()}',
                          style: textStyle),
                      league.tier == null
                          ? const Text('Unranked')
                          : Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "${league.tier} - ${league.rank} - ${league.leaguePoints}",
                                  style: textStyle,
                                ),
                                Text(
                                  "wins: ${league.wins} -  loses: ${league.losses}",
                                  style: textStyle,
                                ),
                                league.hotStreak == true
                                    ? Text('Hot Streak', style: textStyle)
                                    : const Text(''),
                              ],
                            ),
                    ],
                  ),
                ],
              ),
            ),
          );
  }

  TextStyle get textStyle =>
      const TextStyle(color: Colors.black, fontFamily: 'Roboto');
}
