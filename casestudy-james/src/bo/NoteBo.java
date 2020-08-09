package bo;

import dao.INoteDao;
import dao.NoteDao;
import model.Note;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class NoteBo implements INoteBo {
        INoteDao iNoteDao = new NoteDao();

    public List<Note> findNoteByTitle(String title) throws SQLException {
        List<Note> noteList = new ArrayList<>();
        for (Note note: iNoteDao.selectAllNote()) {
            if(note.getTitle().contains(title))
                noteList.add(note);
        }
        return noteList;
    }

    @Override
    public List<Note> selectAllNote() throws SQLException, IOException, ClassNotFoundException {
        this.exportFile();
        return this.iNoteDao.selectAllNote();
    }

    @Override
    public void saveNote(Note note) throws SQLException, IOException, ClassNotFoundException {
        this.exportFile();
            this.iNoteDao.saveNote(note);
    }

    @Override
    public boolean deleteNote(int id) throws SQLException, IOException, ClassNotFoundException {
        this.exportFile();
        return this.iNoteDao.deleteNote(id);
    }

    @Override
    public void updateNote(Note note) throws SQLException, IOException, ClassNotFoundException {
        this.exportFile();
        this.iNoteDao.updateNote(note);
    }

    @Override
    public Note getNoteById(int id) throws SQLException, IOException, ClassNotFoundException {
        this.exportFile();
        return this.iNoteDao.getNoteById(id);
    }

    @Override
    public void exportFile() throws IOException, ClassNotFoundException, SQLException {
        this.iNoteDao.exportFile();
    }
}
