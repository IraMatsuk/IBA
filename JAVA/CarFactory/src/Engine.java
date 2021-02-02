public class Engine {
    enum EngineType {
        DIESEL,
        FUEL,
        ELECTRO,
        GAS
    }
    private double volume;
    private EngineType engineType;

    Engine (EngineType engineType, double volume) {
        this.engineType = engineType;
        this.volume = volume;
    }

    public double getVolume() {
        return volume;
    }

    public EngineType getEngineType() {
        return engineType;
    }
}
