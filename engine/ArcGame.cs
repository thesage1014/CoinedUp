using Godot;

public enum GameType {
  ERROR = 0,
  VIDEO_GAME = 1,
  PRIZE = 2,
  PHYSICAL = 3,
  PINBALL = 4,
  SIMULATOR = 5,
  REDEMPTION = 6,
}

/// Arcade cabinet object
public class ArcGame {
  string name;
  GameType type;
  string subtype;
  int costToPlay;
  int costToPurchase;
  int gameLength;
  float skillFactor;
  int funValue;
  bool newChallengerMultiplayer;
  bool highScoreMultiplayer;
  bool coopMultiplayer;
  bool crowdsForm;
  int addictionPercent;
  bool redemptionControlledPayout;
  string proceduralBonuses;

  public ArcGame(
    string name,
    GameType type,
    string subtype,
    int costToPlay,
    int costToPurchase,
    int gameLength,
    float skillFactor,
    int funValue,
    bool newChallengerMultiplayer,
    bool highScoreMultiplayer,
    bool coopMultiplayer,
    bool crowdsForm,
    int addictionPercent,
    bool redemptionControlledPayout,
    string proceduralBonuses
  ) {
    this.name = name;
    this.type = type;
    this.subtype = subtype;
    this.costToPlay = costToPlay;
    this.costToPurchase = costToPurchase;
    this.gameLength = gameLength;
    this.skillFactor = skillFactor;
    this.funValue = funValue;
    this.newChallengerMultiplayer = newChallengerMultiplayer;
    this.highScoreMultiplayer = highScoreMultiplayer;
    this.coopMultiplayer = coopMultiplayer;
    this.crowdsForm = crowdsForm;
    this.addictionPercent = addictionPercent;
    this.redemptionControlledPayout = redemptionControlledPayout;
    this.proceduralBonuses = proceduralBonuses;
  }

  public string ArcGameSummary() {
    return $"Name: {name}, Genre: {subtype}";
  }
}
