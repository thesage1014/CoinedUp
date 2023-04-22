using System;
using System.Collections.Generic;
using Godot;
using Microsoft.VisualBasic;
using Microsoft.VisualBasic.FileIO;

public partial class ArcGamesList {
  // static string[] columnHeadings = new string[]{
  //   "name",
  //   "type",
  //   "subtype",
  //   "cost to play",
  //   "cost to purchase",
  //   "game_length",
  //   "skill_factor",
  //   "fun_value",
  //   "new_challenger_multiplayer",
  //   "high_score_multiplayer",
  //   "coop_multiplayer",
  //   "crowds_form",
  //   "addiction_chance",
  //   "redemption_controlled_payout",
  //   "procedural_bonuses"
  // };
  static int numColumnHeadings = 15;

  public static List<ArcGame> Games = new List<ArcGame>{};

  static bool parseSheetBool (string s) {
    if (s == "TRUE") return true;
    return false;
  }

  public static void LoadTemplateGames() {
    string cwd = Microsoft.VisualBasic.FileIO.FileSystem.CurrentDirectory;
    GD.Print();
    using (TextFieldParser parser = new TextFieldParser(System.IO.Path.Combine(
        cwd, "engine", "template_games.csv"
      ))) {
      parser.TextFieldType = FieldType.Delimited;
      parser.SetDelimiters(",");

      int counter = 0;
      while (!parser.EndOfData) {
        counter++;
        GD.Print(counter);
        string[] fields = parser.ReadFields();
        if (counter < 3) continue; // skip first two rows
        //Processing row

        GameType gtype = GameType.ERROR; 
        switch (fields[1]) {
          case "VIDEO_GAME":
          gtype = GameType.VIDEO_GAME;
          break;
          case "PRIZE":
          gtype = GameType.PRIZE;
          break;
          case "PHYSICAL":
          gtype = GameType.PHYSICAL;
          break;
          case "PINBALL":
          gtype = GameType.PINBALL;
          break;
          case "SIMULATOR":
          gtype = GameType.SIMULATOR;
          break;
          case "REDEMPTION":
          gtype = GameType.REDEMPTION;
          break;
        }
        if (gtype == GameType.ERROR) {
          throw new System.Exception("Improper game type supplied for game:" + fields[1]);
        }

        int fieldCounter = 0;
        string name = fields[fieldCounter];
        fieldCounter++;
        fieldCounter++;
        string subtype = fields[fieldCounter];
        fieldCounter++;
        int costToPlay = Int32.Parse(fields[fieldCounter]);
        fieldCounter++;
        int costToPurchase = Int32.Parse(fields[fieldCounter]);
        fieldCounter++;
        int gameLength = Int32.Parse(fields[fieldCounter]);
        fieldCounter++;
        float skillFactor = float.Parse(fields[fieldCounter]);
        fieldCounter++;
        int funValue = 1;
        fieldCounter++;
        bool newChallengerMultiplayer = parseSheetBool(fields[fieldCounter]);
        fieldCounter++;
        bool highScoreMultiplayer = parseSheetBool(fields[fieldCounter]);
        fieldCounter++;
        bool coopMultiplayer = parseSheetBool(fields[fieldCounter]);
        fieldCounter++;
        bool crowdsForm = parseSheetBool(fields[fieldCounter]);
        fieldCounter++;
        int addictionChance = Int32.Parse(fields[fieldCounter]);
        fieldCounter++;
        bool redemptionControlledPayout = parseSheetBool(fields[fieldCounter]);
        fieldCounter++;
        string proceduralBonuses = fields[fieldCounter];

        if (PrototypeMain.DebugPrinting) {
          GD.Print($"Loading {name}, type {gtype}, subtype {subtype}");
          GD.Print($"cost2play {costToPlay}, cost2buy {costToPurchase} game length (m) {gameLength}, skill factor {skillFactor}");
          GD.Print($"funValue {funValue}");
          GD.Print($"new challenger {newChallengerMultiplayer}, high score multi {highScoreMultiplayer}");
          GD.Print($"coopMultiplayer {coopMultiplayer}");
          GD.Print($"crowdsForm {crowdsForm}, addictionChance {addictionChance}");
          GD.Print($"redemption controlled payout {redemptionControlledPayout}");
          GD.Print($"procedural bonuses {proceduralBonuses}");
        }

        ArcGame newGame = new ArcGame(
          name, 
          gtype,
          subtype,
          costToPlay,
          costToPurchase,
          gameLength,
          skillFactor,
          funValue,
          newChallengerMultiplayer,
          highScoreMultiplayer,
          coopMultiplayer,
          crowdsForm,
          addictionChance,
          redemptionControlledPayout,
          proceduralBonuses
        );

        if (PrototypeMain.DebugPrinting) {
          GD.Print(newGame.ArcGameSummary());
        }

        Games.Add(newGame);

      }
    }
  }
}