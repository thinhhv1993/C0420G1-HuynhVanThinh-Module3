package model;

public class NoteType {
    protected  int id;
    protected String name;
    protected String description;

    public NoteType(int id, String name, String description) {
        this.id = id;
        this.name = name;
        this.description = description;
    }

    public NoteType() {
    }

    public NoteType(String name) {
            this.name = name;
    }

    public int getId() {
        return id;
    }

    @Override
    public String toString() {
        return
                "name type='" + name
               ;
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

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }
}
