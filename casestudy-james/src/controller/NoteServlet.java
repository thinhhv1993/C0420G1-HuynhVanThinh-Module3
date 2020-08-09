package controller;

import bo.NoteBo;
import model.Note;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;


@WebServlet(name = "NoteServlet", urlPatterns = "/notes")
public class NoteServlet extends javax.servlet.http.HttpServlet{
    private NoteBo noteBo;

    public void init() {
        noteBo = new NoteBo();
    }

    ;

    protected void doPost(javax.servlet.http.HttpServletRequest request, javax.servlet.http.HttpServletResponse response) throws javax.servlet.ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }try {
            switch (action) {
                case "create":
                    inserNote(request, response);
                    break;
                case "edit":
                    updateUser(request, response);
                    break;
                case "find":
                    searchNote(request, response);
                    break;

            }
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }
    }

    private void updateUser(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException, ClassNotFoundException {
        int id =Integer.parseInt(request.getParameter("id"));
        String title = request.getParameter("title");
        String content = request.getParameter("content");
        int type_id = Integer.parseInt(request.getParameter("type_id"));
        Note note = new Note(id,title,content,type_id);
        noteBo.updateNote(note);
        List<Note> noteList = noteBo.selectAllNote();
        request.setAttribute("noteList", noteList);
        RequestDispatcher dispatcher = request.getRequestDispatcher("note/list.jsp");
        dispatcher.forward(request,response);
    }

    private void searchNote(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
        String title = request.getParameter("title");
        List<Note> noteList = this.noteBo.findNoteByTitle(title);
        request.setAttribute("findNoteByTitle", noteList);
        RequestDispatcher dispatcher = request.getRequestDispatcher("note/view.jsp");
        dispatcher.forward(request, response);
    }

    private void inserNote(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException, ClassNotFoundException {
        String title =request.getParameter("title");
        String content = request.getParameter("content");
        int type_id = Integer.parseInt(request.getParameter("type_id"));
        Note note = new Note(title,content,type_id);
        noteBo.saveNote(note);
        List<Note> noteList = noteBo.selectAllNote();
        request.setAttribute("noteList", noteList);
        RequestDispatcher dispatcher = request.getRequestDispatcher("note/list.jsp");
        dispatcher.forward(request, response);
    }



    protected void doGet(javax.servlet.http.HttpServletRequest request, javax.servlet.http.HttpServletResponse response) throws javax.servlet.ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }

        try {
            switch (action) {
                case "create":
                    showNewForm(request, response);
                    break;
                case "edit":
                    showEditForm(request, response);
                    break;
                case "delete":
                    deleteNote(request, response);
                    break;
                default:
                    listNote(request, response);
                    break;
            }
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }
    }

    private void listNote(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException, ClassNotFoundException {
        List<Note> noteList = noteBo.selectAllNote();
        request.setAttribute("noteList",noteList);
        RequestDispatcher dispatcher =request.getRequestDispatcher("note/list.jsp");
        dispatcher.forward(request,response);
    }

    private void deleteNote(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException, ClassNotFoundException {
        int id = Integer.parseInt(request.getParameter("id"));
        noteBo.deleteNote(id);
        List<Note> noteList = noteBo.selectAllNote();
        request.setAttribute("noteList", noteList);
        RequestDispatcher dispatcher = request.getRequestDispatcher("note/list.jsp");
        dispatcher.forward(request, response);
    }

    private void showEditForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException, ClassNotFoundException {
        int id = Integer.parseInt(request.getParameter("id"));
        Note existingNote = noteBo.getNoteById(id);
        RequestDispatcher dispatcher = request.getRequestDispatcher("note/edit.jsp");
        request.setAttribute("note", existingNote);
        dispatcher.forward(request, response);
    }

    private void showNewForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RequestDispatcher dispatcher = request.getRequestDispatcher("note/create.jsp");
        dispatcher.forward(request, response);
    }
}
