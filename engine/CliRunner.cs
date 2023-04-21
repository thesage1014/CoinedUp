using System;

// namespace CoinEngine {
public partial class CliRunner  {
  // Called when the node enters the scene tree for the first time.
  public static void Main(string[] args) {
    Console.WriteLine ("Hello, World");
    Console.WriteLine(EngineDependency.GetValue());
  }

}

// }