package bo;

import model.Note;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

public interface INoteBo {

    public List<Note> selectAllNote() throws SQLException, IOException, ClassNotFoundException;

    public void saveNote(Note note) throws SQLException, IOException, ClassNotFoundException;

    public boolean deleteNote(int id) throws SQLException, IOException, ClassNotFoundException;

    public void updateNote(Note note) throws SQLException, IOException, ClassNotFoundException;

    public  Note  getNoteById(int id) throws SQLException, IOException, ClassNotFoundException;
    public void exportFile() throws IOException, ClassNotFoundException, SQLException;
}
