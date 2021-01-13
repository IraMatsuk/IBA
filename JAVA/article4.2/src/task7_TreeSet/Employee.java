package task7_TreeSet;
//Пример №7. Демонстрация применения коллекции TreeSet и собственной реализации метода compareTo
import java.math.BigDecimal;

class Employee implements Comparable<Employee> {
    private String name;
    private int ID;
    private BigDecimal salary;
    public Employee(String name, int ID, BigDecimal salary) {
        this.name = name;
        this.ID = ID;
        this.salary = salary;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getID() {
        return ID;
    }

    public void setID(int ID) {
        this.ID = ID;
    }

    public BigDecimal getSalary() {
        return salary;
    }

    public void setSalary(BigDecimal salary) {
        this.salary = salary;
    }
    @Override
    public String toString() {
        return "Имя сотрудника=" + name + ", ID=" + ID + ", зарплата=" + salary + "";
    }

   //This method has logic to arrange the employee objects in ascending order based on the ID.
    @Override
    public int compareTo(Employee employee) {
        System.out.print("Был вызван метод compareTo для сортировки сотрудников по возрастанию по ID, ");
        System.out.println("this.getID()= " + this.getID() + ", employee.getID()=" + employee.getID());
        if(this.getID() < employee.getID()) {
            return -1;
        } else if (this.getID() > employee.getID()) {
            return 1;
        } else return 0;
    }
}
