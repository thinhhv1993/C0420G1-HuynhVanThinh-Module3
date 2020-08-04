package model;

public class Product {
    private int id;
    private String name;
    private String country;
    private String species;

    public Product() {
    }

    public Product(int id, String name, String country, String species) {
        this.id = id;
        this.name = name;
        this.country = country;
        this.species = species;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getCountry() {
        return country;
    }

    public void setCountry(String country) {
        this.country = country;
    }

    public String getSpecies() {
        return species;
    }

    public void setSpecies(String species) {
        this.species = species;
    }
}
