package by.matsuk.sfpetclinic.services.springdatajpa;

import by.matsuk.sfpetclinic.model.Vet;
import by.matsuk.sfpetclinic.repositories.VetRepository;
import by.matsuk.sfpetclinic.services.VetService;
import org.springframework.context.annotation.Profile;
import org.springframework.stereotype.Service;

import java.util.HashSet;
import java.util.Set;

@Service
@Profile("springdatajpa")
public class VetJpaService implements VetService {
    private final VetRepository vetRepository;
    public VetJpaService(VetRepository vetRepository) {
        this.vetRepository = vetRepository;
    }
    @Override
    public Set<Vet> findAll() {
        Set<Vet> vets = new HashSet<>();
        vetRepository.findAll().forEach(vets::add);
        return vets;
    }
    @Override
    public Vet findById(Long aLong) {
        return vetRepository.findById(aLong).orElse(null);
    }
    @Override
    public Vet save(Vet object) {
        return vetRepository.save(object);
    }
    @Override
    public void delete(Vet object) {
        vetRepository.delete(object);
    }
    @Override
    public void deleteById(Long aLong) {
        vetRepository.deleteById(aLong);
    }
}
