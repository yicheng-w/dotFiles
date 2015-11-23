import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
import java.util.Arrays;

public class CatchingPokemon {
  // Before submitting, make sure the main method hasn't been changed!
  public static void main(String[] args) throws IOException {
    BufferedReader br = new BufferedReader(new FileReader("CatchingPokemonIN.txt"));

    while (br.ready()) {
      int numPokemon = Integer.parseInt(br.readLine());
      double[][] catchProbability = new double[numPokemon][numPokemon];
      for (int i = 0; i < numPokemon; i++) {
        String[] data = br.readLine().split(" ");
        for (int j = 0; j < numPokemon; j++) {
          catchProbability[i][j] = Double.parseDouble(data[j]);
        }
      }
      System.out.printf("%.3f\n", maxCatchProbability(numPokemon, catchProbability));
    }
    br.close();
  }

  // Fill out the body of this method
  public static double maxCatchProbability(int numPokemon, double[][] catchProbability) {
    return 0.0f;
  }
}
