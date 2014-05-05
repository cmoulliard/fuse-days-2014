package org.drools.camel.example;

import java.util.Random;

public class PersonHelper {

    private final Random random = new Random();

    public Person createPerson() {
        Person person = new Person();
        if (random.nextBoolean()) {
            person.setName("Old Person");
            person.setAge(21);
        } else {
            person.setName("Young Person");
            person.setAge(18);
        }
        return person;
    }


}
