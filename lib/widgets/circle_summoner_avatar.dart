import 'package:flutter/material.dart';

import '../constants/shared_constants.dart';

class CircleSummonerAvatar extends StatelessWidget {
  const CircleSummonerAvatar({required this.iconid, super.key});
  final String iconid;
  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 80,
      backgroundImage: NetworkImage(
        SharedConstant.instance.profileIcon(iconId: iconid.toString()),
      ),
    );
  }
}
