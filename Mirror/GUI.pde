color buttonFill = color(255);
//Average push button
class Button{
    String title;
    float x, y, w, h;
    PImage icon;
    boolean clicked = false;
    ArrayList<Button> DropDown = new ArrayList<Button>();
    boolean dropDown;
    Button(String title, float x, float y, float w, float h){
        this.title = title;
        this.x = x;
        this.y = y;
        this.w = w;
        this.h = h;
    }

    Button(PImage icon, float x, float y, float w, float h){
        this.icon = icon;
        this.x = x;
        this.y = y;
        this.w = w;
        this.h = h;
    }

    boolean isOver(){
        if(mouseX >= x && mouseX <= x + w && mouseY >= y && mouseY <= y + h) return true;
        return false;
    }

    void update(){
      if(isOver()){
        clicked = true;
      }
    }

    void draw(){
        fill(buttonFill, 200);

        if(isOver())fill(buttonFill);

        noStroke();
        rect(x, y, w, h, 5);
        textAlign(CENTER, CENTER);
        textSize(20);
        fill(255);
        text(title, x + w/2, y + h/2);

        if(clicked){
          dropDown = !dropDown;
          clicked = false;
        }

        if(DropDown.size() > 0){
          for(int i =0; i<DropDown.size(); i++){
            DropDown.get(i).draw();
          }
        }
        clicked = false;
    }
}