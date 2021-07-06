package by.matsuk.sfpetclinic.services.springdatajpa;

import by.matsuk.sfpetclinic.model.Owner;
import by.matsuk.sfpetclinic.repositories.OwnerRepository;
import by.matsuk.sfpetclinic.repositories.PetRepository;
import by.matsuk.sfpetclinic.repositories.PetTypeRepository;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.junit.jupiter.MockitoExtension;

import java.util.HashSet;
import java.util.Optional;
import java.util.Set;

import static org.junit.jupiter.api.Assertions.*;
import static org.mockito.ArgumentMatchers.any;
import static org.mockito.ArgumentMatchers.anyLong;
import static org.mockito.Mockito.verify;
import static org.mockito.Mockito.when;

@ExtendWith(MockitoExtension.class)
class OwnerJpaServiceTest {

    @Mock
    OwnerRepository ownerRepository;
    @Mock
    PetRepository petRepository;
    @Mock
    PetTypeRepository petTypeRepository;
    @InjectMocks
    OwnerJpaService ownerJpaService;

    private static final String LAST_NAME = "Json";
    Owner returnOwner;

    @BeforeEach
    void setUp() {
        returnOwner = Owner.builder().id(1L).lastName(LAST_NAME).build();
    }

    @Test
    void findAll() {
        Set<Owner> returnOwnerSet = new HashSet<>();
        returnOwnerSet.add(Owner.builder().id(1L).build());
        when(ownerRepository.findAll()).thenReturn(returnOwnerSet);
        Set<Owner> owners = ownerJpaService.findAll();
        assertNotNull(owners);
        assertEquals(1, owners.size());
    }

    @Test
    void findById() {
        when(ownerRepository.findById(anyLong())).thenReturn(Optional.of(returnOwner));
        Owner owner = ownerJpaService.findById(1L);
        assertNotNull(owner);
    }

    @Test
    void findByIdТNotFound() {
        when(ownerRepository.findById(anyLong())).thenReturn(Optional.empty());
        Owner owner = ownerJpaService.findById(1L);
        assertNull(owner);
    }

    @Test
    void save() {
        Owner owner = Owner.builder().id(1L).build();
        when(ownerRepository.save(any())).thenReturn(returnOwner);

        Owner savedOwner = ownerJpaService.save(owner);
        assertNotNull(savedOwner);
        verify(ownerRepository).save(any());
    }

    @Test
    void delete() {
        ownerJpaService.delete(returnOwner);
        verify(ownerRepository).delete(any());
    }

    @Test
    void deleteById() {
        ownerJpaService.deleteById(1L);
        verify(ownerRepository).deleteById(anyLong());
    }

    @Test
    void findByLastName() {
    }
}