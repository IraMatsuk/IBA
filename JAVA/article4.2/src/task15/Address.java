package task15;

class Address {
    private String name;
    private String street;
    private String city;
    private String code;

    public Address(String name, String street, String city, String code) {
        this.name = name;
        this.street = street;
        this.city = city;
        this.code = code;
    }
    public String toString() {
        return name + "\n" + street + "\n" + city + " " + code;
    }
}
