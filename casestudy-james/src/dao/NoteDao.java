package dao;

import model.Note;

import java.io.*;
import java.nio.charset.StandardCharsets;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class NoteDao implements INoteDao {
    private String jdbcURL = "jdbc:mysql://localhost:3306/i_notes ?useSSL=false";
    private String jdbcUsername = "root";
    private String jdbcPassword = "123123";

    private static final String UPDATE_NOTE = "{CALL update_note(?,?,?,?)}";
    private static final String GET_NOTE_BY_ID = "{CALL get_note_by_id(?)}";
    private static final String SAVE_NOTE = "{CALL insert_note(?,?,?)}";
    private static final String SELECT_ALL_NOTE = "{CALL get_note()}";
    private static final String DELETE_NOTE_BY_ID = "{CALL delete_note_by_id(?)}";

    protected Connection getConnection() {
        Connection connection = null;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            connection = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        return connection;
    }


    @Override
    public List<Note> selectAllNote() throws SQLException {
        Note note = null;
        List<Note> list = new ArrayList<>();
        try (Connection connection = getConnection();
             CallableStatement callableStatement = connection.prepareCall(SELECT_ALL_NOTE);) {
            ResultSet rs = callableStatement.executeQuery();
            while (rs.next()) {
                Integer id = rs.getInt("id");
                String title = rs.getString("title");
                String content = rs.getString("content");
                String name = rs.getString("name");
                note = new Note(id, title, content, name);
                list.add(note);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    @Override
    public void saveNote(Note note) throws SQLException {
        try (Connection connection = getConnection();
             CallableStatement callableStatement = connection.prepareCall(SAVE_NOTE);) {
            connection.setAutoCommit(false);
            callableStatement.setString(1, note.getTitle());
            callableStatement.setString(2, note.getContent());
            callableStatement.setInt(3, note.getType_id());
            System.out.println(callableStatement);
            callableStatement.executeUpdate();
            connection.commit();
            connection.setAutoCommit(true);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public void updateNote(Note note) throws SQLException {
        try (Connection connection = getConnection();
             CallableStatement callableStatement = connection.prepareCall(UPDATE_NOTE);) {
            connection.setAutoCommit(false);
            callableStatement.setInt(1, note.getId());
            callableStatement.setString(2, note.getTitle());
            callableStatement.setString(3, note.getContent());
            callableStatement.setInt(4, note.getType_id());
            System.out.println(callableStatement);
            callableStatement.executeUpdate();
            connection.commit();
            connection.setAutoCommit(true);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public boolean deleteNote(int id) throws SQLException {
        try (Connection connection = getConnection();
             CallableStatement callableStatement = connection.prepareCall(DELETE_NOTE_BY_ID);) {
            callableStatement.setInt(1, id);
            System.out.println(callableStatement);
            callableStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return true;
    }

    @Override
    public Note getNoteById(int id) throws SQLException {
        Note note = null;
        try (Connection connection = getConnection();
             CallableStatement callableStatement = connection.prepareCall(GET_NOTE_BY_ID);) {
            callableStatement.setInt(1, id);
            ResultSet rs = callableStatement.executeQuery();
            while (rs.next()) {
                String title = rs.getString("title");
                String content = rs.getString("content");
                Integer type_id = rs.getInt("type_id");
                note = new Note(id, title, content, type_id);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return note;
    }

    @Override
    public void exportFile() throws IOException, ClassNotFoundException, SQLException {
        File dir = new File("C:\\Users\\Admin\\Desktop");
        dir.mkdir();
        BufferedWriter out = new BufferedWriter
                (new OutputStreamWriter(new FileOutputStream("C:\\Users\\Admin\\Desktop\\keywork.txt"), StandardCharsets.UTF_8));
        out.write("");
        List<Note> list = new ArrayList<>();
        for (Note note : this.selectAllNote()) {
            list.add(note);
        }
        out.write("{" + '\n' + "\"Note\" :  \n" + list.toString() + '\n' + "  " + '\n' + "}");
        out.close();
    }
}
