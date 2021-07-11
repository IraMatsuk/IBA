package by.matsuk.sfpetclinic.services;

import by.matsuk.sfpetclinic.model.Owner;

import java.util.List;

public interface OwnerService extends CrudService <Owner, Long> {

    List<Owner> findAllByLastNameLike(String lastName);
}