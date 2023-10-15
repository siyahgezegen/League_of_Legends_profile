import 'package:flutter/material.dart';
import 'package:my_lol_profile/models/best_champions.dart';

import '../../../widgets/champion_image.dart';

class BestChampionsWidget extends StatelessWidget {
  final List<BestChampion> bestchamplist;

  const BestChampionsWidget({super.key, required this.bestchamplist});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;

    return bestchamplist.isEmpty
        ? const Text('bulunamadı')
        : Expanded(
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
                              champImagePath:
                                  bestchamplist[i].championId.toString()),
                          Text(bestchamplist[i].championLevel.toString(),
                              style: textStyle),
                          Text(bestchamplist[i].championPoints.toString(),
                              style: textStyle),
                          Text(bestchamplist[i].chestGranted.toString(),
                              style: textStyle),
                        ],
                      ),
                    ),
                  ),
              ],
            ),
          );
  }

  TextStyle get textStyle =>
      const TextStyle(color: Colors.black, fontFamily: 'Roboto');
}
