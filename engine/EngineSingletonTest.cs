using Godot;
using System;

public partial class EngineSingletonTest : Node {
  // Called when the node enters the scene tree for the first time.
  public static void Main(string[] args) {
    Console.WriteLine ("Hello, World");
  }

  public override void _Ready() {
    GD.Print("Ran test call!");
    GD.Print("Dependency says:");
    GD.Print(EngineDependency.GetValue());
  }

  // Called every frame. 'delta' is the elapsed time since the previous frame.
  public override void _Process(double delta) {

  }
}
