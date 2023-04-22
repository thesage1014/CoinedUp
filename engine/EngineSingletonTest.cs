using Godot;

public partial class EngineSingletonTest : Node {
  public static bool DebugPrinting = true;
  // Called when the node enters the scene tree for the first time.
  public override void _Ready() {
    GD.Print("Ran test call!");
    GD.Print("Dependency says:");
    ArcGamesList.LoadTemplateGames();
    GD.Print(ArcGamesList.Games[0].ArcGameSummary());
    GD.Print(ArcGamesList.Games[1].ArcGameSummary());
  }

  // Called every frame. 'delta' is the elapsed time since the previous frame.
  public override void _Process(double delta) {

  }
}
