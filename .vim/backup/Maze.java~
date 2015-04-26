import java.util.*;
import java.io.*;

public class Maze {
    private char[][] board;
    private int myX;
    private int myY;
    
    private final char road = '#';
    private final char wall = ' ';
    private final char me = '@';
    private final char exit = '$';
    private final char visited = '.';
    private final char start = '+';
    private final char path = '=';

    private final int maxX;
    private final int maxY;

    private int exitX;
    private int exitY;

    private int startX;
    private int startY;

    private PriorityQueue<Position> frontier = new PriorityQueue<Position>();

    public Maze(String filename, int newMaxX, int newMaxY) {
        maxX = newMaxX;
        maxY = newMaxY;
        board = new char[maxX + 2][maxY + 2];
        for (int i = 0 ; i < maxX ; i++) {
            board[i][0] = wall;
        }

        try {
            Scanner sc = new Scanner(new File(filename));
            int j = 1;

            while (sc.hasNext()) {
                String line = sc.nextLine();

                board[0][j] = wall;
                board[maxX + 1][j] = wall;
                for (int i = 1 ; i < maxX + 1; i++) {
                    board[i][j] = line.charAt(i - 1);
                    if (board[i][j] == start) {
                        myX = i;
                        myY = j;

                        startX = myX;
                        startY = myY;
                    }

                    if (board[i][j] == exit) {
                        exitX = i;
                        exitY = j;
                    }
                }

                j++;
            }
        }
        catch(Exception e) {}
        for (int i = 0 ; i < maxX ; i++) {
            board[i][maxY + 1] = wall;
        }
        frontier.add(new Position(myX, myY, board[myX][myY], null, manhattanDist(myX, myY)));
    }

    public Maze(char[][] myBoard) {
        maxY = myBoard[0].length;
        maxX = myBoard.length;
        board = new char[maxX + 2][maxY + 2];
        for (int i = 0 ; i < maxX ; i++) {
            board[i][0] = wall;
        }
        for (int i = 1 ; i < maxX + 1 ; i++) {
            board[i][0] = board[i][maxY + 1] = wall;
            for (int j = 1 ; j < maxY + 1 ; j++) {
                board[i][j] = myBoard[i - 1][j - 1];
                if (board[i][j] == start) {
                    startX = myX = i;
                    startY = myY = j;
                }
                if (board[i][j] == exit) {
                    exitX = i;
                    exitY = j;
                }
            }
        }
        frontier.add(new Position(myX, myY, board[myX][myY], null, manhattanDist(myX, myY)));
    }

    public String toString() {
        String s = "\033\143";
        for (int y = 0 ; y < maxY + 2; y++) {
            for (int x = 0 ; x < maxX + 2 ; x++) {
                //System.out.printf("(%d, %d)", x, y);
                s = s + board[x][y];
            }

            s = s + "\n";
        }
        return s;
    }

    public int manhattanDist(int thisX, int thisY) {
        return Math.abs(thisX - exitX) + Math.abs(thisY - exitY);
    }

    public void solve() {
        while (!frontier.isEmpty()) {
            /*System.out.println(this);/*
            try {
                Thread.sleep(20);
            }
            catch (Exception e) {}
*/
            Position current = frontier.poll();
            myX = current.getX();
            myY = current.getY();
            int currentCost = current.getCost();
            char currentChar = current.getStuff();
            if (currentChar == exit) {
                int stepCount = 1;
                for (Position newPos = current.getPrevious() ; newPos != null ; newPos = newPos.getPrevious()) {
                    board[newPos.getX()][newPos.getY()] = path;
                    stepCount++;
                    System.out.println(this);
/*                    try {
                        Thread.sleep(20);
                    } catch (Exception e) {}*/
                }

                board[startX][startY] = start;

                System.out.println(this);
                System.out.println(stepCount);
                System.exit(0);
            }

            if (currentChar == road || currentChar == start) {
                board[myX][myY] = visited;
                if (board[myX + 1][myY] != visited && board[myX + 1][myY] != wall){
                    frontier.add(new Position(myX + 1, myY, board[myX + 1][myY], current, manhattanDist(myX + 1, myY) + currentCost));
                }

                if (board[myX - 1][myY] != visited && board[myX - 1][myY] != wall){
                    frontier.add(new Position(myX - 1, myY, board[myX - 1][myY], current, manhattanDist(myX - 1, myY) + currentCost));
                }

                if (board[myX][myY + 1] != visited && board[myX][myY + 1] != wall){
                    frontier.add(new Position(myX, myY + 1, board[myX][myY + 1], current, manhattanDist(myX, myY + 1) + currentCost));
                }
            
                if (board[myX][myY - 1] != visited && board[myX][myY - 1] != wall){
                    frontier.add(new Position(myX, myY - 1, board[myX][myY - 1], current, manhattanDist(myX, myY - 1) + currentCost));
                }
            }
        }

        System.out.println(this);
    }

    public static void main(String[] args) {
        if (args[0].equals("-c")) {
            MazeGen generator = new MazeGen(Integer.parseInt(args[1]), Integer.parseInt(args[2]));
            generator.generate();
            Maze maze1 = new Maze(generator.getBoard());
            System.out.println(maze1);
            maze1.solve();
        }
        else if (args[0].equals("-f")) {
            Maze maze1 = new Maze(args[1], Integer.parseInt(args[2]), Integer.parseInt(args[3]));
            maze1.solve();
        }
    }
/*
    public static void main(String[] args) {
        Maze maze1 = new Maze(args[0], Integer.parseInt(args[1]), Integer.parseInt(args[2]));
        maze1.solve();
    }
*/
}
