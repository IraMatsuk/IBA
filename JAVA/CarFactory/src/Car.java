public class Car {
    private Wheels wheels;
    private Engine engine;
    private CarBody carBody;

    Car (Wheels wheels, Engine engine, CarBody carBody) {
         this.wheels = wheels;
         this.engine = engine;
         this.carBody = carBody;
    }
     void changeColor(CarBody.Color color) {
        this.carBody.setColor(color);

     }

}
