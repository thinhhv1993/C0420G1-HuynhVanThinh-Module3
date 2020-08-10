package controller;

import bo.ServiceBo;
import model.Service;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet(name = "FuramaServlet", urlPatterns = "/furamas")
public class FuramaServlet extends HttpServlet {

    private ServiceBo serviceBo;

    public void init() {
        serviceBo = new ServiceBo();
    }


    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        try {
            switch (action) {
                case "createService":
                    createService(request, response);
                    break;
                case "editService":
                    editService(request, response);
                    break;
//                case "find":
//                    searchNote(request, response);
//                    break;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    private void editService(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
        Integer serviceId = Integer.parseInt(request.getParameter("serviceId"));
        String serviceName = request.getParameter("serviceName");
        Integer serviceArea = Integer.parseInt(request.getParameter("serviceArea"));
        Double serviceCost = Double.parseDouble(request.getParameter("serviceCost"));
        Integer serviceMaxPeople = Integer.parseInt(request.getParameter("serviceMaxPeople"));
        String standardRoom = request.getParameter("serviceMaxPeople");
        String descriptionOtherConvenience = request.getParameter("descriptionOtherConvenience");
        Double poolAre = Double.parseDouble(request.getParameter("poolAre"));
        Integer numberOfFloors = Integer.parseInt(request.getParameter("numberOfFloors"));
        Integer rent_type_id = Integer.parseInt(request.getParameter("rent_type_id"));
        Integer service_type_id = Integer.parseInt(request.getParameter("service_type_id"));
        Service service = new Service(serviceId, serviceName, serviceArea, serviceCost,
                serviceMaxPeople, standardRoom, descriptionOtherConvenience,
                poolAre, numberOfFloors, rent_type_id, service_type_id);
        serviceBo.updateService(service);
        List<Service> serviceList = serviceBo.selectAllService();
        request.setAttribute("serviceList", serviceList);
        RequestDispatcher dispatcher = request.getRequestDispatcher("service/list.jsp");
        dispatcher.forward(request, response);
    }

    private void createService(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
        String serviceName = request.getParameter("serviceName");
        Integer serviceArea = Integer.parseInt(request.getParameter("serviceArea"));
        Double serviceCost = Double.parseDouble(request.getParameter("serviceCost"));
        Integer serviceMaxPeople = Integer.parseInt(request.getParameter("serviceMaxPeople"));
        String standardRoom = request.getParameter("serviceMaxPeople");
        String descriptionOtherConvenience = request.getParameter("descriptionOtherConvenience");
        Double poolAre = Double.parseDouble(request.getParameter("poolAre"));
        Integer numberOfFloors = Integer.parseInt(request.getParameter("numberOfFloors"));
        Integer rent_type_id = Integer.parseInt(request.getParameter("rent_type_id"));
        Integer service_type_id = Integer.parseInt(request.getParameter("service_type_id"));
        Service service = new Service(serviceName, serviceArea, serviceCost,
                serviceMaxPeople, standardRoom, descriptionOtherConvenience,
                poolAre, numberOfFloors, rent_type_id, service_type_id);
        serviceBo.createService(service);
        List<Service> serviceList = serviceBo.selectAllService();
        request.setAttribute("serviceList", serviceList);
        RequestDispatcher dispatcher = request.getRequestDispatcher("service/list.jsp");
        dispatcher.forward(request, response);
    }



    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }

        try {
            switch (action) {
                case "createService":
                    showNewFormService(request, response);
                    break;
                case "editService":
                    showEditFormService(request, response);
                    break;
                case "deleteService":
                    deleteService(request, response);
                    break;
                default:
                    listService(request, response);
                    break;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    private void listService(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
        List<Service> serviceList = serviceBo.selectAllService();
        request.setAttribute("serviceList",serviceList);
        RequestDispatcher dispatcher =request.getRequestDispatcher("service/list.jsp");
        dispatcher.forward(request,response);
    }

    private void deleteService(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        serviceBo.deleteService(id);
        List<Service> serviceList = serviceBo.selectAllService();
        request.setAttribute("serviceList", serviceList);
        RequestDispatcher dispatcher = request.getRequestDispatcher("service/list.jsp");
        dispatcher.forward(request, response);
    }

    private void showEditFormService(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        Service existingNote = serviceBo.getByServiceId(id);
        RequestDispatcher dispatcher = request.getRequestDispatcher("service/edit.jsp");
        request.setAttribute("service", existingNote);
        dispatcher.forward(request, response);
    }

    private void showNewFormService(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RequestDispatcher dispatcher = request.getRequestDispatcher("service/create.jsp");
        dispatcher.forward(request, response);
    }
}
