import 'package:cricket_mania/app/module/core/model/base_response.dart';
import 'package:dio/dio.dart';

class MatchScorecardResponse extends BaseResponse {
  Results? results;

  MatchScorecardResponse({this.results});

  MatchScorecardResponse.fromJson(Map<String, dynamic> json) {
    results =
        json['results'] != null ? Results.fromJson(json['results']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (results != null) {
      data['results'] = results!.toJson();
    }
    return data;
  }

  MatchScorecardResponse.responseWithError(
      String message, DioErrorType? errorType) {
    isSuccess = false;
    msg = message;
    errorType = errorType;
  }
}

class Results {
  Fixture? fixture;
  LiveDetails? liveDetails;

  Results({this.fixture, this.liveDetails});

  Results.fromJson(Map<String, dynamic> json) {
    fixture =
        json['fixture'] != null ? Fixture.fromJson(json['fixture']) : null;
    liveDetails = json['live_details'] != null
        ? LiveDetails.fromJson(json['live_details'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (fixture != null) {
      data['fixture'] = fixture!.toJson();
    }
    if (liveDetails != null) {
      data['live_details'] = liveDetails!.toJson();
    }
    return data;
  }
}

class Fixture {
  Away? away;
  List<Dates>? dates;
  String? endDate;
  Away? home;
  int? id;
  String? matchTitle;
  int? seriesId;
  String? startDate;
  String? venue;

  Fixture(
      {this.away,
      this.dates,
      this.endDate,
      this.home,
      this.id,
      this.matchTitle,
      this.seriesId,
      this.startDate,
      this.venue});

  Fixture.fromJson(Map<String, dynamic> json) {
    away = json['away'] != null ? Away.fromJson(json['away']) : null;
    if (json['dates'] != null) {
      dates = <Dates>[];
      json['dates'].forEach((v) {
        dates!.add(Dates.fromJson(v));
      });
    }
    endDate = json['end_date'];
    home = json['home'] != null ? Away.fromJson(json['home']) : null;
    id = json['id'];
    matchTitle = json['match_title'];
    seriesId = json['series_id'];
    startDate = json['start_date'];
    venue = json['venue'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (away != null) {
      data['away'] = away!.toJson();
    }
    if (dates != null) {
      data['dates'] = dates!.map((v) => v.toJson()).toList();
    }
    data['end_date'] = endDate;
    if (home != null) {
      data['home'] = home!.toJson();
    }
    data['id'] = id;
    data['match_title'] = matchTitle;
    data['series_id'] = seriesId;
    data['start_date'] = startDate;
    data['venue'] = venue;
    return data;
  }
}

class Away {
  String? code;
  int? id;
  String? name;

  Away({this.code, this.id, this.name});

  Away.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['code'] = code;
    data['id'] = id;
    data['name'] = name;
    return data;
  }
}

class Dates {
  String? date;
  String? matchSubtitle;

  Dates({this.date, this.matchSubtitle});

  Dates.fromJson(Map<String, dynamic> json) {
    date = json['date'];
    matchSubtitle = json['match_subtitle'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['date'] = date;
    data['match_subtitle'] = matchSubtitle;
    return data;
  }
}

class LiveDetails {
  MatchSummary? matchSummary;
  Officials? officials;
  List<Scorecard>? scorecard;
  Stats? stats;
  String? teamsheets;

  LiveDetails(
      {this.matchSummary,
      this.officials,
      this.scorecard,
      this.stats,
      this.teamsheets});

  LiveDetails.fromJson(Map<String, dynamic> json) {
    matchSummary = json['match_summary'] != null
        ? MatchSummary.fromJson(json['match_summary'])
        : null;
    officials = json['officials'] != null
        ? Officials.fromJson(json['officials'])
        : null;
    if (json['scorecard'] != null) {
      scorecard = <Scorecard>[];
      json['scorecard'].forEach((v) {
        scorecard!.add(Scorecard.fromJson(v));
      });
    }
    stats = json['stats'] != null ? Stats.fromJson(json['stats']) : null;
    teamsheets = json['teamsheets'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (matchSummary != null) {
      data['match_summary'] = matchSummary!.toJson();
    }
    if (officials != null) {
      data['officials'] = officials!.toJson();
    }
    if (scorecard != null) {
      data['scorecard'] = scorecard!.map((v) => v.toJson()).toList();
    }
    if (stats != null) {
      data['stats'] = stats!.toJson();
    }
    data['teamsheets'] = teamsheets;
    return data;
  }
}

class MatchSummary {
  String? awayScores;
  String? homeScores;
  String? inPlay;
  String? result;
  String? status;
  String? toss;

  MatchSummary(
      {this.awayScores,
      this.homeScores,
      this.inPlay,
      this.result,
      this.status,
      this.toss});

  MatchSummary.fromJson(Map<String, dynamic> json) {
    awayScores = json['away_scores'];
    homeScores = json['home_scores'];
    inPlay = json['in_play'];
    result = json['result'];
    status = json['status'];
    toss = json['toss'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['away_scores'] = awayScores;
    data['home_scores'] = homeScores;
    data['in_play'] = inPlay;
    data['result'] = result;
    data['status'] = status;
    data['toss'] = toss;
    return data;
  }
}

class Officials {
  String? referee;
  String? umpire1;
  String? umpire2;
  String? umpireReserve;
  String? umpireTv;

  Officials(
      {this.referee,
      this.umpire1,
      this.umpire2,
      this.umpireReserve,
      this.umpireTv});

  Officials.fromJson(Map<String, dynamic> json) {
    referee = json['referee'];
    umpire1 = json['umpire_1'];
    umpire2 = json['umpire_2'];
    umpireReserve = json['umpire_reserve'];
    umpireTv = json['umpire_tv'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['referee'] = referee;
    data['umpire_1'] = umpire1;
    data['umpire_2'] = umpire2;
    data['umpire_reserve'] = umpireReserve;
    data['umpire_tv'] = umpireTv;
    return data;
  }
}

class Scorecard {
  List<Batting>? batting;
  List<Bowling>? bowling;
  bool? current;
  int? extras;
  String? extrasDetail;
  String? fow;
  int? inningsNumber;
  String? overs;
  int? runs;
  List<StillToBat>? stillToBat;
  String? title;
  String? wickets;

  Scorecard(
      {this.batting,
      this.bowling,
      this.current,
      this.extras,
      this.extrasDetail,
      this.fow,
      this.inningsNumber,
      this.overs,
      this.runs,
      this.stillToBat,
      this.title,
      this.wickets});

  Scorecard.fromJson(Map<String, dynamic> json) {
    if (json['batting'] != null) {
      batting = <Batting>[];
      json['batting'].forEach((v) {
        batting!.add(Batting.fromJson(v));
      });
    }
    if (json['bowling'] != null) {
      bowling = <Bowling>[];
      json['bowling'].forEach((v) {
        bowling!.add(Bowling.fromJson(v));
      });
    }
    current = json['current'];
    extras = json['extras'];
    extrasDetail = json['extras_detail'];
    fow = json['fow'];
    inningsNumber = json['innings_number'];
    overs = json['overs'];
    runs = json['runs'];
    if (json['still_to_bat'] != null) {
      stillToBat = <StillToBat>[];
      json['still_to_bat'].forEach((v) {
        stillToBat!.add(StillToBat.fromJson(v));
      });
    }
    title = json['title'];
    wickets = json['wickets'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (batting != null) {
      data['batting'] = batting!.map((v) => v.toJson()).toList();
    }
    if (bowling != null) {
      data['bowling'] = bowling!.map((v) => v.toJson()).toList();
    }
    data['current'] = current;
    data['extras'] = extras;
    data['extras_detail'] = extrasDetail;
    data['fow'] = fow;
    data['innings_number'] = inningsNumber;
    data['overs'] = overs;
    data['runs'] = runs;
    if (stillToBat != null) {
      data['still_to_bat'] = stillToBat!.map((v) => v.toJson()).toList();
    }
    data['title'] = title;
    data['wickets'] = wickets;
    return data;
  }
}

class Batting {
  int? balls;
  int? batOrder;
  int? fours;
  String? howOut;
  int? id;
  String? minutes;
  int? playerId;
  String? playerName;
  int? runs;
  int? sixes;
  String? strikeRate;

  Batting(
      {this.balls,
      this.batOrder,
      this.fours,
      this.howOut,
      this.id,
      this.minutes,
      this.playerId,
      this.playerName,
      this.runs,
      this.sixes,
      this.strikeRate});

  Batting.fromJson(Map<String, dynamic> json) {
    balls = json['balls'];
    batOrder = json['bat_order'];
    fours = json['fours'];
    howOut = json['how_out'];
    id = json['id'];
    minutes = json['minutes'];
    playerId = json['player_id'];
    playerName = json['player_name'];
    runs = json['runs'];
    sixes = json['sixes'];
    strikeRate = json['strike_rate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['balls'] = balls;
    data['bat_order'] = batOrder;
    data['fours'] = fours;
    data['how_out'] = howOut;
    data['id'] = id;
    data['minutes'] = minutes;
    data['player_id'] = playerId;
    data['player_name'] = playerName;
    data['runs'] = runs;
    data['sixes'] = sixes;
    data['strike_rate'] = strikeRate;
    return data;
  }
}

class Bowling {
  int? dotBalls;
  String? economy;
  String? extras;
  int? fours;
  int? id;
  int? maidens;
  String? overs;
  int? playerId;
  String? playerName;
  int? runsConceded;
  int? sixes;
  int? wickets;

  Bowling(
      {this.dotBalls,
      this.economy,
      this.extras,
      this.fours,
      this.id,
      this.maidens,
      this.overs,
      this.playerId,
      this.playerName,
      this.runsConceded,
      this.sixes,
      this.wickets});

  Bowling.fromJson(Map<String, dynamic> json) {
    dotBalls = json['dot_balls'];
    economy = json['economy'];
    extras = json['extras'];
    fours = json['fours'];
    id = json['id'];
    maidens = json['maidens'];
    overs = json['overs'];
    playerId = json['player_id'];
    playerName = json['player_name'];
    runsConceded = json['runs_conceded'];
    sixes = json['sixes'];
    wickets = json['wickets'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['dot_balls'] = dotBalls;
    data['economy'] = economy;
    data['extras'] = extras;
    data['fours'] = fours;
    data['id'] = id;
    data['maidens'] = maidens;
    data['overs'] = overs;
    data['player_id'] = playerId;
    data['player_name'] = playerName;
    data['runs_conceded'] = runsConceded;
    data['sixes'] = sixes;
    data['wickets'] = wickets;
    return data;
  }
}

class StillToBat {
  int? id;
  int? playerId;
  String? playerName;

  StillToBat({this.id, this.playerId, this.playerName});

  StillToBat.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    playerId = json['player_id'];
    playerName = json['player_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['player_id'] = playerId;
    data['player_name'] = playerName;
    return data;
  }
}

class Stats {
  String? currentRunRate;
  List<Last18Balls>? last18Balls;
  String? lastUpdate;
  String? minRemainingOvers;
  String? partnershipOvers;
  String? partnershipPlayer1;
  int? partnershipPlayer1Balls;
  int? partnershipPlayer1Runs;
  String? partnershipPlayer2;
  int? partnershipPlayer2Balls;
  int? partnershipPlayer2Runs;
  String? partnershipRunRate;
  int? partnershipRuns;

  Stats(
      {this.currentRunRate,
      this.last18Balls,
      this.lastUpdate,
      this.minRemainingOvers,
      this.partnershipOvers,
      this.partnershipPlayer1,
      this.partnershipPlayer1Balls,
      this.partnershipPlayer1Runs,
      this.partnershipPlayer2,
      this.partnershipPlayer2Balls,
      this.partnershipPlayer2Runs,
      this.partnershipRunRate,
      this.partnershipRuns});

  Stats.fromJson(Map<String, dynamic> json) {
    currentRunRate = json['current_run_rate'];
    if (json['last_18_balls'] != null) {
      last18Balls = <Last18Balls>[];
      json['last_18_balls'].forEach((v) {
        last18Balls!.add(Last18Balls.fromJson(v));
      });
    }
    lastUpdate = json['last_update'];
    minRemainingOvers = json['min_remaining_overs'];
    partnershipOvers = json['partnership_overs'];
    partnershipPlayer1 = json['partnership_player_1'];
    partnershipPlayer1Balls = json['partnership_player_1_balls'];
    partnershipPlayer1Runs = json['partnership_player_1_runs'];
    partnershipPlayer2 = json['partnership_player_2'];
    partnershipPlayer2Balls = json['partnership_player_2_balls'];
    partnershipPlayer2Runs = json['partnership_player_2_runs'];
    partnershipRunRate = json['partnership_run_rate'];
    partnershipRuns = json['partnership_runs'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['current_run_rate'] = currentRunRate;
    if (last18Balls != null) {
      data['last_18_balls'] = last18Balls!.map((v) => v.toJson()).toList();
    }
    data['last_update'] = lastUpdate;
    data['min_remaining_overs'] = minRemainingOvers;
    data['partnership_overs'] = partnershipOvers;
    data['partnership_player_1'] = partnershipPlayer1;
    data['partnership_player_1_balls'] = partnershipPlayer1Balls;
    data['partnership_player_1_runs'] = partnershipPlayer1Runs;
    data['partnership_player_2'] = partnershipPlayer2;
    data['partnership_player_2_balls'] = partnershipPlayer2Balls;
    data['partnership_player_2_runs'] = partnershipPlayer2Runs;
    data['partnership_run_rate'] = partnershipRunRate;
    data['partnership_runs'] = partnershipRuns;
    return data;
  }
}

class Last18Balls {
  int? currentOver;
  int? currentOverBall;
  bool? isBoundary;
  bool? isBye;
  bool? isDismissal;
  bool? isLegBye;
  bool? isMaiden;
  bool? isNoBall;
  bool? isOverEnd;
  bool? isWide;
  int? runs;

  Last18Balls(
      {this.currentOver,
      this.currentOverBall,
      this.isBoundary,
      this.isBye,
      this.isDismissal,
      this.isLegBye,
      this.isMaiden,
      this.isNoBall,
      this.isOverEnd,
      this.isWide,
      this.runs});

  Last18Balls.fromJson(Map<String, dynamic> json) {
    currentOver = json['currentOver'];
    currentOverBall = json['currentOverBall'];
    isBoundary = json['isBoundary'];
    isBye = json['isBye'];
    isDismissal = json['isDismissal'];
    isLegBye = json['isLegBye'];
    isMaiden = json['isMaiden'];
    isNoBall = json['isNoBall'];
    isOverEnd = json['isOverEnd'];
    isWide = json['isWide'];
    runs = json['runs'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['currentOver'] = currentOver;
    data['currentOverBall'] = currentOverBall;
    data['isBoundary'] = isBoundary;
    data['isBye'] = isBye;
    data['isDismissal'] = isDismissal;
    data['isLegBye'] = isLegBye;
    data['isMaiden'] = isMaiden;
    data['isNoBall'] = isNoBall;
    data['isOverEnd'] = isOverEnd;
    data['isWide'] = isWide;
    data['runs'] = runs;
    return data;
  }
}
