package by.matsuk.sfpetclinic.services.springdatajpa;

import by.matsuk.sfpetclinic.model.Speciality;
import by.matsuk.sfpetclinic.repositories.SpecialityRepository;
import by.matsuk.sfpetclinic.services.SpecialityService;
import org.springframework.context.annotation.Profile;
import org.springframework.stereotype.Service;

import java.util.HashSet;
import java.util.Set;

@Service
@Profile("springdatajpa")
public class SpecialityJpaService implements SpecialityService {
    private final SpecialityRepository specialtyRepository;
    public SpecialityJpaService(SpecialityRepository specialtyRepository) {
        this.specialtyRepository = specialtyRepository;
    }
    @Override
    public Set<Speciality> findAll() {
        Set<Speciality> specialities = new HashSet<>();
        specialtyRepository.findAll().forEach(specialities::add);
        return specialities;
    }
    @Override
    public Speciality findById(Long aLong) {
        return specialtyRepository.findById(aLong).orElse(null);
    }
    @Override
    public Speciality save(Speciality object) {
        return specialtyRepository.save(object);
    }
    @Override
    public void delete(Speciality object) {
        specialtyRepository.delete(object);
    }
    @Override
    public void deleteById(Long aLong) {
        specialtyRepository.deleteById(aLong);
    }
}