class BestChampion {
  String? puuid;
  int? championId;
  int? championLevel;
  int? championPoints;
  int? lastPlayTime;
  int? championPointsSinceLastLevel;
  int? championPointsUntilNextLevel;
  bool? chestGranted;
  int? tokensEarned;
  String? summonerId;

  BestChampion({
    this.puuid,
    this.championId,
    this.championLevel,
    this.championPoints,
    this.lastPlayTime,
    this.championPointsSinceLastLevel,
    this.championPointsUntilNextLevel,
    this.chestGranted,
    this.tokensEarned,
    this.summonerId,
  });

  BestChampion.fromJson(Map<String, dynamic> json) {
    puuid = json['puuid'];
    championId = json['championId'];
    championLevel = json['championLevel'];
    championPoints = json['championPoints'];
    lastPlayTime = json['lastPlayTime'];
    championPointsSinceLastLevel = json['championPointsSinceLastLevel'];
    championPointsUntilNextLevel = json['championPointsUntilNextLevel'];
    chestGranted = json['chestGranted'];
    tokensEarned = json['tokensEarned'];
    summonerId = json['summonerId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['puuid'] = puuid;
    data['championId'] = championId;
    data['championLevel'] = championLevel;
    data['championPoints'] = championPoints;
    data['lastPlayTime'] = lastPlayTime;
    data['championPointsSinceLastLevel'] = championPointsSinceLastLevel;
    data['championPointsUntilNextLevel'] = championPointsUntilNextLevel;
    data['chestGranted'] = chestGranted;
    data['tokensEarned'] = tokensEarned;
    data['summonerId'] = summonerId;
    return data;
  }
}
