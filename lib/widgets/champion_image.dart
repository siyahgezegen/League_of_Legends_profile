import 'package:flutter/material.dart';
import 'package:my_lol_profile/network/services/champion_image_services.dart';

class ChampionImage extends StatefulWidget {
  const ChampionImage({required this.champImagePath, Key? key})
      : super(key: key);
  final String champImagePath;

  @override
  State<ChampionImage> createState() => _ChampionImageState();
}

class _ChampionImageState extends State<ChampionImage> {
  var defaultImage =
      "https://ddragon.leagueoflegends.com/cdn/13.14.1/img/champion/Ezreal.png";

  Future<String?> getImage(String champId) async {
    try {
      var imagePath = await ChampionImageServices.imagePath(champId: champId);
      return imagePath;
    } catch (e) {
      return defaultImage;
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<String?>(
      future: getImage(widget.champImagePath),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (snapshot.hasError || snapshot.data == null) {
          return Image.network(defaultImage);
        } else {
          return Image.network(snapshot.data!);
        }
      },
    );
  }
}
