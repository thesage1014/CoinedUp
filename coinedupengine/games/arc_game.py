from enum import Enum


class GameType(Enum):
    VIDEO_GAME = 1
    PRIZE = 2
    PHYSICAL = 3
    PINBALL = 4
    SIMULATOR = 5
    REDEMPTION = 6


class ArcGame:
    """
    Instantiate an arcade cabinet object.
    """

    def __init__(self, dict: dict) -> None:
        self.name = dict["name"]
        self.type = GameType[dict["type"]]
        self.subtype = dict["subtype"]
        self.cost = dict["cost"]
        self.game_length = dict["game_length"]
        self.skill_factor = dict["skill_factor"]
        self.fun_value = dict["fun_value"]
        self.new_challenger_multiplayer = dict["new_challenger_multiplayer"]
        self.high_score_multiplayer = dict["high_score_multiplayer"]
        self.coop_multiplayer = dict["coop_multiplayer"]
        self.crowds_form = dict["crowds_form"]
        self.addiction_chance = dict["addiction_chance"]
        self.redemption_controlled_payout = dict["redemption_controlled_payout"]
        self.procedural_bonuses = dict["procedural_bonuses"]

    def print(self) -> None:
        """
        Print a text description of this game
        """

        print("Name: ", self.name)
        print("Type: ", self.type, self.subtype)
