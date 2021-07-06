package by.matsuk.sfpetclinic.repositories;

import by.matsuk.sfpetclinic.model.PetType;
import org.springframework.data.repository.CrudRepository;

public interface PetTypeRepository extends CrudRepository<PetType, Long> {
}
