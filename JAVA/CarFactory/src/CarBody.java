public class CarBody {
    enum Color {
        RED,
        BLACK,
        WHITE
    }

    private Color color;
    private int doorNumber;
    CarBody (Color color, int doorNumber) {
        this.color = color;
        this.doorNumber = doorNumber;
    }

    public int getDoorNumber() {
        return doorNumber;
    }

    public void setColor(Color color) {
        this.color = color;
    }
}
