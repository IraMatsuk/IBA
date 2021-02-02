public class CarFactory {
    public static void main(String[] args) {
        Wheels wheels = new Wheels(4, 16);
        Engine engine = new Engine(Engine.EngineType.DIESEL, 1.5);
        CarBody carBody = new CarBody(CarBody.Color.BLACK, 4);
        Car car = constructCar(wheels, engine, carBody);
        car.changeColor(CarBody.Color.RED);
        System.out.println(wheels.getNumberOfWheels());
        System.out.println(engine.getEngineType());
        System.out.println(carBody.getDoorNumber());
    }

    static Car constructCar(Wheels wheels, Engine engine, CarBody carBody) {
        if (wheels.getNumberOfWheels() != 4 && carBody.getDoorNumber() > 5)  {
            return null;
        }
        return new Car(wheels, engine, carBody);
    }
}
