package by.matsuk.sfpetclinic.services.springdatajpa;

import by.matsuk.sfpetclinic.model.PetType;
import by.matsuk.sfpetclinic.repositories.PetTypeRepository;
import by.matsuk.sfpetclinic.services.PetTypeService;
import org.springframework.context.annotation.Profile;
import org.springframework.stereotype.Service;

import java.util.HashSet;
import java.util.Set;

@Service
@Profile("springdatajpa")
public class PetTypeJpaService implements PetTypeService {
    private final PetTypeRepository petTypeRepository;
    public PetTypeJpaService(PetTypeRepository petTypeRepository) {
        this.petTypeRepository = petTypeRepository;
    }
    @Override
    public Set<PetType> findAll() {
        Set<PetType> petTypes = new HashSet<>();
        petTypeRepository.findAll().forEach(petTypes::add);
        return petTypes;
    }
    @Override
    public PetType findById(Long aLong) {
        return petTypeRepository.findById(aLong).orElse(null);
    }
    @Override
    public PetType save(PetType object) {
        return petTypeRepository.save(object);
    }
    @Override
    public void delete(PetType object) {
        petTypeRepository.delete(object);
    }
    @Override
    public void deleteById(Long aLong) {
        petTypeRepository.deleteById(aLong);
    }
}