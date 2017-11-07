// the text to speech class
import java.io.IOException;
int voiceSpeed = 190;

static class TextToSpeech extends Object {

  // male voices
  static final String ALEX = "Alex";
  static final String FRED = "Fred";

  // female voices
  static final String VICTORIA = "Victoria";
  

  // this sends the "say" command to the terminal with the appropriate args
  static void say(String script, String voice, int speed) {
    try {
      Runtime.getRuntime().exec(new String[] {"say", "-v", voice, "[[rate " + speed + "]]" + script});
    }
    catch (IOException e) {
      System.err.println("IOException");
    }
  }

  // Overload the say method so we can call it with fewer arguments and basic defaults
   static void say(String script, int speed) {
    // 200 seems like a resonable default speed
    say(script,FRED,speed);
  }

}
