using Godot;

/**
 * "Main()" method for 2d prototype
 * Loads all classes in order
 */
public partial class PrototypeMain : Node {
  // If true, lots of debug logs will print
  public static bool DebugPrinting = false;

  // Called when the node enters the scene tree for the first time.
  public override void _Ready() {
    ArcGamesList.LoadTemplateGames();
  }

}
