package by.matsuk.sfpetclinic.repositories;

import by.matsuk.sfpetclinic.model.Pet;
import org.springframework.data.repository.CrudRepository;

public interface PetRepository extends CrudRepository<Pet, Long> {
}
