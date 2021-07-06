package by.matsuk.sfpetclinic.services;

import by.matsuk.sfpetclinic.model.Owner;

public interface OwnerService extends CrudService <Owner, Long> {
    Owner findByLastName (String lastName);
}