package model;

public class Note extends NoteType {
    private  int id;
    private String title;
    private String content;
    private  int type_id;

    public Note(int id, String title, String content, int type_id) {
        this.id = id;
        this.title = title;
        this.content = content;
        this.type_id = type_id;
    }

    public Note() {
    }

    public Note(String title, String content, int type_id) {
        this.title = title;
        this.content = content;
        this.type_id = type_id;
    }

    public Note(int id, String name, String description, int id1, String title, String content, int type_id) {
        super(id, name, description);
        this.id = id1;
        this.title = title;
        this.content = content;
        this.type_id = type_id;
    }

    public Note(int id, String title, String content, String name) {
        super(name);
        this.id = id;
        this.title = title;
        this.content = content;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public int getType_id() {
        return type_id;
    }

    public void setType_id(int type_id) {
        this.type_id = type_id;
    }


    @Override
    public String toString() {
        return " id : " + id + '\n' +
                " title : " + title + '\n' +
                " content : " + content + '\n' +
                " type : " + this.name  + '\n' + '\n'
                ;
    }
}
