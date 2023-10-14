import java.util.Scanner;

/**
 * 
 * When target = 'c', the expected output:
 * We found 3 character c in the String.
 * 
 * When target = 'z', the expected output:
 * Not Found.
 */
// Count the target of character in a String.
public class JavaQuest5 {

  
  public static void main(String[] args) {
    
    Scanner input = new Scanner(System.in);

    do {
      String str = "Welcome to the coding bootcamp."; // You should not change this line
      System.out.print("input a char: ");
      char target = input.next().charAt(0); // Update this target to test the logic
      int count = 0;
      // Use a loop to count the target of character in a String.
      for (int i = 0; i < str.length(); i++) {
        if (target == str.charAt(i)) {
          // System.out.println(str.charAt(i));
          count++;
        }
      }

      // if found, print "We found 3 character c in the String."
      // if not found, print "Not Found."
      if (count > 0)
        System.out.println("We found " + count + " character " + target + " in the String.");
      else
        System.out.println("Not Found.");

        System.out.println();

    } while (true);
  }
}
