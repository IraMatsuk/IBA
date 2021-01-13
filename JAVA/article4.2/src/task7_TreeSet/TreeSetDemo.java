package task7_TreeSet;
import java.math.BigDecimal;
import java.util.TreeSet;

class TreeSetDemo {
    public static void main(String[] args) {
        TreeSet<Employee> treeSet = new TreeSet<Employee>();
        Employee firstEmployee = new Employee("Андреенко Елена Алексеевна", 1101, new BigDecimal(40000));
        Employee secondEmployee = new Employee("Баденкова Оксана Петровна", 102, new BigDecimal(80000));
        Employee thirdEmployee = new Employee("Калаганова Наталья Игоревна", 123, new BigDecimal(150000));
        Employee fourthEmployee = new Employee("Калаганова Юлия Николаевна", 200, new BigDecimal(150000));
        Employee fifthEmployee = new Employee("Калаганова Юлиана Юрьевна", 180, new BigDecimal(150000));
        treeSet.add(firstEmployee);
        treeSet.add(secondEmployee);
        treeSet.add(thirdEmployee);
        treeSet.add(fourthEmployee);
        treeSet.add(fifthEmployee);
        System.out.println("--------------------------------------------");
        for(Employee employee : treeSet) {
            System.out.println("ID сотрудника: " + employee.getID());
            System.out.println("ФИО сотрудника: " + employee.getName());
            System.out.println("Зарплата сотрудника :" + employee.getSalary());
            System.out.println("--------------------------------------------");
        }
    }
}
