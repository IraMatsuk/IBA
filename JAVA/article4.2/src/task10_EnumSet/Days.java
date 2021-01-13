package task10_EnumSet;
//Пример №10. Использование коллекции EnumSet

enum Days {
    SUNDAY("воскресенье"), MONDAY("понедельник"),
    TUESDAY("вторник"), WEDNESDAY("среда"), THURSDAY("черверг"),
    FRIDAY("пятница"), SATURDAY("суббота");
    private Days(String name) {
        this.name = name;
    }
    public String getName() {
        return name;
    }
    String name;
}
