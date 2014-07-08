package org.drools.camel.example;

public class Person {

    private String name;
    private int age;
    private boolean canDrink = false;
    private String favoriteCheese;

	public Person() {}

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getAge() {
        return age;
    }

    public void setAge(int age) {
        this.age = age;
    }

    public boolean isCanDrink() {
        return canDrink;
    }

    public void setCanDrink(boolean canDrink) {
        this.canDrink = canDrink;
    }

    public String getFavoriteCheese() {
		return favoriteCheese;
	}

	public void setFavoriteCheese(String favoriteCheese) {
		this.favoriteCheese = favoriteCheese;
	}

    @Override
    public String toString() {
        return "Person{" + "name='" + name + '\'' + ", age=" + age
                + ", canDrink=" + canDrink + ", cheese=" + favoriteCheese + '}';
    }
}