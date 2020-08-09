package dao;

import model.Note;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

public interface INoteDao {

    public List<Note> selectAllNote() throws SQLException;

    public void saveNote(Note note) throws SQLException;
    public void updateNote(Note note) throws SQLException;

    public boolean deleteNote(int id) throws SQLException;
    public  Note  getNoteById(int id) throws  SQLException;

    public void exportFile() throws IOException, ClassNotFoundException, SQLException;
}
