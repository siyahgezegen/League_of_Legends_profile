class League {
  String? leagueId;
  String? queueType;
  String? tier;
  String? rank;
  String? summonerId;
  String? summonerName;
  int? leaguePoints;
  int? wins;
  int? losses;
  bool? veteran;
  bool? inactive;
  bool? freshBlood;
  bool? hotStreak;

  League(
      {this.leagueId,
      this.queueType,
      this.tier,
      this.rank,
      this.summonerId,
      this.summonerName,
      this.leaguePoints,
      this.wins,
      this.losses,
      this.veteran,
      this.inactive,
      this.freshBlood,
      this.hotStreak});

  League.fromJson(Map<String, dynamic> json) {
    leagueId = json['leagueId'];
    queueType = json['queueType'];
    tier = json['tier'];
    rank = json['rank'];
    summonerId = json['summonerId'];
    summonerName = json['summonerName'];
    leaguePoints = json['leaguePoints'];
    wins = json['wins'];
    losses = json['losses'];
    veteran = json['veteran'];
    inactive = json['inactive'];
    freshBlood = json['freshBlood'];
    hotStreak = json['hotStreak'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['leagueId'] = leagueId;
    data['queueType'] = queueType;
    data['tier'] = tier;
    data['rank'] = rank;
    data['summonerId'] = summonerId;
    data['summonerName'] = summonerName;
    data['leaguePoints'] = leaguePoints;
    data['wins'] = wins;
    data['losses'] = losses;
    data['veteran'] = veteran;
    data['inactive'] = inactive;
    data['freshBlood'] = freshBlood;
    data['hotStreak'] = hotStreak;
    return data;
  }
}
