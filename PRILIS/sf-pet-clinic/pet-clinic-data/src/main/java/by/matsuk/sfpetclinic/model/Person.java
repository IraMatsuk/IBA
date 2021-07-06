package by.matsuk.sfpetclinic.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.Column;
import javax.persistence.MappedSuperclass;

/*@Data
@MappedSuperclass
public class Person extends BaseEntity{
    @Column(name="first_name")
    private String firstName;
    @Column(name="last_name")
    private String lastName;
}*/
@Data
@NoArgsConstructor
@AllArgsConstructor
@MappedSuperclass
public class Person extends BaseEntity{
    public Person(Long id, String firstName, String lastName) {
        super(id);
        this.firstName = firstName;
        this.lastName = lastName;
    }
    @Column(name="first_name")
    private String firstName;
    @Column(name="last_name")
    private String lastName;
}