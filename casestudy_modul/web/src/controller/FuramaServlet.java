package controller;

import bo.*;
import model.*;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.Arrays;
import java.util.Collection;
import java.util.Collections;
import java.util.List;

@WebServlet(name = "FuramaServlet", urlPatterns = "/furamas")
public class FuramaServlet extends HttpServlet {

    private ServiceBo serviceBo;
    private CustomerBo customerBo;
    private EmployeeBo employeeBo;
    private ContractIBo contractIBo;
    private  ContractDetailBo contractDetailBo;

    public void init() {
        serviceBo = new ServiceBo();
        customerBo = new CustomerBo();
        employeeBo = new EmployeeBo();
        contractIBo = new ContractBo();
        contractDetailBo = new ContractDetailBo();
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
                case "findService":
                    searchService(request, response);
                    break;
                case "createCustomer":
                    createCustomer(request, response);
                    break;
                case "editCustomer":
                    editCustomer(request, response);
                    break;
                case "findCustomer":
                    searchCustomer(request, response);
                    break;
                case "createEmployee":
                    createEmployee(request, response);
                    break;
                case "editEmployee":
                    editEmployee(request, response);
                    break;
                case "findEmployee":
                    searchEmployee(request, response);
                    break;
                case "createContract":
                    createContract(request, response);
                    break;
                case "editContract":
                    editContract(request, response);
                    break;
                case "findContract":
                    searchContract(request, response);
                    break;
                case "createContractDetail":
                    createContractDetail(request, response);
                    break;
                case "editContractDetail":
                    editContractDetail(request, response);
                    break;
                case "findContractDetail":
                    searchContractDetail(request, response);
                    break;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    private void searchContractDetail(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
        Integer contractId = Integer.parseInt(request.getParameter("contractId"));
        List<ContractDetail> contractDetailList = contractDetailBo.getByContractDetailName(contractId);
        request.setAttribute("contractDetailList", contractDetailList);
        RequestDispatcher dispatcher = request.getRequestDispatcher("contract-detail/list.jsp");
        dispatcher.forward(request, response);
    }

    private void editContractDetail(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
        Integer contractDetailId = Integer.parseInt(request.getParameter("contractDetailId"));
        Integer contractId = Integer.parseInt(request.getParameter("contractId"));
        Integer attachServiceId = Integer.parseInt(request.getParameter("attachServiceId"));
        Integer quantity = Integer.parseInt(request.getParameter("quantity"));
        ContractDetail contractDetail = new ContractDetail(contractDetailId,contractId,attachServiceId,quantity);
        contractDetailBo.updateContractDetail(contractDetail);
        List<ContractDetail> contractDetailList = contractDetailBo.selectAllContractDetail();
        request.setAttribute("contractDetailList", contractDetailList);
        RequestDispatcher dispatcher = request.getRequestDispatcher("contract-detail/list.jsp");
        dispatcher.forward(request, response);
    }

    private void createContractDetail(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
        Integer contractId = Integer.parseInt(request.getParameter("contractId"));
        Integer attachServiceId = Integer.parseInt(request.getParameter("attachServiceId"));
        Integer quantity = Integer.parseInt(request.getParameter("quantity"));
        ContractDetail contractDetail = new ContractDetail(contractId,attachServiceId,quantity);
        contractDetailBo.createContractDetail(contractDetail);
        List<ContractDetail> contractDetailList = contractDetailBo.selectAllContractDetail();
        request.setAttribute("contractDetailList", contractDetailList);
        RequestDispatcher dispatcher = request.getRequestDispatcher("contract-detail/list.jsp");
        dispatcher.forward(request, response);

    }

    private void searchContract(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {
        String contractName = request.getParameter("contractName");
        List<Contract> contractList = contractIBo.getByContractName(contractName);
        request.setAttribute("contractList", contractList);
        RequestDispatcher dispatcher = request.getRequestDispatcher("contract/list.jsp");
        dispatcher.forward(request, response);
    }

    private void editContract(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
        Integer contractId = Integer.parseInt(request.getParameter("contractId"));
        String contractStarDate = request.getParameter("contractStarDate");
        String contractEndDate = request.getParameter("contractEndDate");
        Double contractDeposit = Double.parseDouble(request.getParameter("contractDeposit"));
        Double contractTotalMoney = Double.parseDouble(request.getParameter("contractTotalMoney"));
        Integer employeeId = Integer.parseInt(request.getParameter("employeeId"));
        Integer customerId = Integer.parseInt(request.getParameter("customerId"));
        Integer serviceId = Integer.parseInt(request.getParameter("serviceId"));

        Contract contract = new Contract(contractId, contractStarDate, contractEndDate, contractDeposit, contractTotalMoney
                , employeeId, customerId, serviceId);
        contractIBo.updateContract(contract);
        List<Contract> contractList = contractIBo.selectAllContract();
        request.setAttribute("contractList", contractList);
        RequestDispatcher dispatcher = request.getRequestDispatcher("contract/list.jsp");
        dispatcher.forward(request, response);

    }

    private void createContract(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
        Integer customerId = Integer.parseInt(request.getParameter("customerId"));
        Integer employeeId = Integer.parseInt(request.getParameter("employeeId"));
        Integer serviceId = Integer.parseInt(request.getParameter("serviceId"));
        String contractStarDate = request.getParameter("contractStarDate");
        String contractEndDate = request.getParameter("contractEndDate");
        Double contractDeposit = Double.parseDouble(request.getParameter("contractDeposit"));
        Double contractTotalMoney = Double.parseDouble(request.getParameter("contractTotalMoney"));
        Contract contract = new Contract(contractStarDate, contractEndDate, contractDeposit, contractTotalMoney, employeeId,
                customerId, serviceId);
        contractIBo.createContract(contract);
        List<Contract> contractList = contractIBo.selectAllContract();
        request.setAttribute("contractList", contractList);
        RequestDispatcher dispatcher = request.getRequestDispatcher("contract/list.jsp");
        dispatcher.forward(request, response);
    }

    private void searchEmployee(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {
        String employeeName = request.getParameter("employeeName");
        List<Employee> employeeList = employeeBo.getEmployeeName(employeeName);
        request.setAttribute("employeeList", employeeList);
        RequestDispatcher dispatcher = request.getRequestDispatcher("employee/list.jsp");
        dispatcher.forward(request, response);
    }

    private void editEmployee(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
        Integer employeeId = Integer.parseInt(request.getParameter("employeeId"));
        String employeeName = request.getParameter("employeeName");
        String employeeBirthday = request.getParameter("employeeBirthday");
        String employeeIdCard = request.getParameter("employeeIdCard");
        Double employeeSalary = Double.parseDouble(request.getParameter("employeeSalary"));
        String employeePhone = request.getParameter("employeePhone");
        String employeeEmail = request.getParameter("employeeEmail");
        String employeeAddress = request.getParameter("employeeAddress");
        Integer divisionId = Integer.parseInt(request.getParameter("divisionId"));
        Integer educationDegreeId = Integer.parseInt(request.getParameter("educationDegreeId"));
        Integer positionId = Integer.parseInt(request.getParameter("positionId"));
        Employee employee = new Employee(employeeId, employeeName, employeeBirthday, employeeIdCard, employeeSalary,
                employeePhone, employeeEmail, employeeAddress, divisionId,
                educationDegreeId, positionId);
        employeeBo.updateEmployee(employee);
        List<Employee> employeeList = employeeBo.selectAllEmployee();
        request.setAttribute("employeeList", employeeList);
        RequestDispatcher dispatcher = request.getRequestDispatcher("employee/list.jsp");
        dispatcher.forward(request, response);
    }

    private void createEmployee(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
        String employeeName = request.getParameter("employeeName");
        String employeeBirthday = request.getParameter("employeeBirthday");
        String employeeIdCard = request.getParameter("employeeIdCard");
        Double employeeSalary = Double.parseDouble(request.getParameter("employeeSalary"));
        String employeePhone = request.getParameter("employeePhone");
        String employeeEmail = request.getParameter("employeeEmail");
        String employeeAddress = request.getParameter("employeeAddress");
        Integer divisionId = Integer.parseInt(request.getParameter("divisionId"));
        Integer educationDegreeId = Integer.parseInt(request.getParameter("educationDegreeId"));
        Integer positionId = Integer.parseInt(request.getParameter("positionId"));
        Employee employee = new Employee(employeeName, employeeBirthday, employeeIdCard, employeeSalary,
                employeePhone, employeeEmail, employeeAddress, divisionId,
                educationDegreeId, positionId);
        employeeBo.createEmployee(employee);
        List<Employee> employeeList = employeeBo.selectAllEmployee();
        request.setAttribute("employeeList", employeeList);
        RequestDispatcher dispatcher = request.getRequestDispatcher("employee/list.jsp");
        dispatcher.forward(request, response);
    }

    private void searchCustomer(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {
        String customerName = request.getParameter("customerName");
        List<Customer> customerList = customerBo.getByCustomerName(customerName);
        request.setAttribute("customerList", customerList);
        RequestDispatcher dispatcher = request.getRequestDispatcher("customer/list.jsp");
        dispatcher.forward(request, response);
    }

    private void editCustomer(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
        Integer customerId = Integer.parseInt(request.getParameter("customerId"));
        Integer customerTypeId = Integer.parseInt(request.getParameter("customerTypeId"));
        String customerName = request.getParameter("customerName");
        String customerBirth = request.getParameter("customerBirthday");
        String customerGender = request.getParameter("customerGender");
        String customerIdCard = request.getParameter("customerIdCard");
        String customerPhone = request.getParameter("customerPhone");
        String customerEmail = request.getParameter("customerEmail");
        String customerAddress = request.getParameter("customerAddress");
        Customer customer = new Customer(customerId, customerTypeId, customerName, customerBirth,
                customerGender, customerIdCard, customerPhone, customerEmail, customerAddress);
        customerBo.updateCustomer(customer);
        List<Customer> customerList = customerBo.selectAllCustomer();
        request.setAttribute("customerList", customerList);
        RequestDispatcher dispatcher = request.getRequestDispatcher("customer/list.jsp");
        dispatcher.forward(request, response);
    }

    private void createCustomer(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
        Integer customerTypeId = Integer.parseInt(request.getParameter("customerTypeId"));
        String customerName = request.getParameter("customerName");
        String customerBirth = request.getParameter("customerBirthday");
        String customerGender = request.getParameter("customerGender");
        String customerIdCard = request.getParameter("customerIdCard");
        String customerPhone = request.getParameter("customerPhone");
        String customerEmail = request.getParameter("customerEmail");
        String customerAddress = request.getParameter("customerAddress");
        Customer customer = new Customer(customerTypeId, customerName, customerBirth,
                customerGender, customerIdCard, customerPhone, customerEmail, customerAddress);
        customerBo.createCustomer(customer);
        List<Customer> customerList = customerBo.selectAllCustomer();
        request.setAttribute("customerList", customerList);
        RequestDispatcher dispatcher = request.getRequestDispatcher("customer/list.jsp");
        dispatcher.forward(request, response);
    }

    private void searchService(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
        String serviceName = request.getParameter("serviceName");
        List<Service> serviceList = serviceBo.getByServiceName(serviceName);
        request.setAttribute("serviceList", serviceList);
        RequestDispatcher dispatcher = request.getRequestDispatcher("service/list.jsp");
        dispatcher.forward(request, response);
    }

    private void editService(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
        Integer serviceId = Integer.parseInt(request.getParameter("serviceId"));
        String serviceName = request.getParameter("serviceName");
        Integer serviceArea = Integer.parseInt(request.getParameter("serviceArea"));
        Double serviceCost = Double.parseDouble(request.getParameter("serviceCost"));
        Integer serviceMaxPeople = Integer.parseInt(request.getParameter("serviceMaxPeople"));
        String standardRoom = request.getParameter("standardRoom");
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
        String standardRoom = request.getParameter("standardRoom");
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
                case "listService":
                    listService(request, response);
                    break;
                case "createCustomer":
                    showNewFormCustomer(request, response);
                    break;
                case "editCustomer":
                    showEditFormCustomer(request, response);
                    break;
                case "deleteCustomer":
                    deleteCustomer(request, response);
                    break;
                case "listCustomer":
                    listCustomer(request, response);
                    break;
                case "createEmployee":
                    showNewFormEmployee(request, response);
                    break;
                case "editEmployee":
                    showEditFormEmployee(request, response);
                    break;
                case "deleteEmployee":
                    deleteEmployee(request, response);
                    break;
                case "listEmployee":
                    listEmployee(request, response);
                    break;
                case "createContract":
                    showNewFormContract(request, response);
                    break;
                case "editContract":
                    showEditFormContract(request, response);
                    break;
                case "deleteContract":
                    deleteContract(request, response);
                    break;
                case "listContract":
                    listContract(request, response);
                    break;
                case "createContractDetail":
                    showNewFormContractDetail(request, response);
                    break;
                case "editContractDetail":
                    showEditFormContractDetail(request, response);
                    break;
                case "deleteContractDetail":
                    deleteContractDetail(request, response);
                    break;
                case "listContractDetail":
                    listContractDetail(request, response);
                    break;
                default:
                    home(request, response);
                    break;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    private void listContractDetail(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
        List<ContractDetail> contractDetailList = contractDetailBo.selectAllContractDetail();
        request.setAttribute("contractDetailList", contractDetailList);
        RequestDispatcher dispatcher = request.getRequestDispatcher("contract-detail/list.jsp");
        dispatcher.forward(request, response);
    }

    private void deleteContractDetail(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("contractDetailId"));
        contractDetailBo.deleteContractDetail(id);
        List<ContractDetail> contractDetailList = contractDetailBo.selectAllContractDetail();
        request.setAttribute("contractDetailList", contractDetailList);
        RequestDispatcher dispatcher = request.getRequestDispatcher("contract-detail/list.jsp");
        dispatcher.forward(request, response);
    }

    private void showEditFormContractDetail(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
        List<Contract> contractList = contractIBo.selectAllContract();
        request.setAttribute("contractList", contractList);
        int id = Integer.parseInt(request.getParameter("contractDetailId"));
        ContractDetail existingContractDetail = contractDetailBo.getByContractDetailId(id);
        RequestDispatcher dispatcher = request.getRequestDispatcher("contract-detail/edit.jsp");
        request.setAttribute("contractDetail", existingContractDetail);
        dispatcher.forward(request, response);
    }

    private void showNewFormContractDetail(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {
        List<Contract> contractList = contractIBo.selectAllContract();
        request.setAttribute("contractList", contractList);
        RequestDispatcher dispatcher = request.getRequestDispatcher("contract-detail/create.jsp");
        dispatcher.forward(request, response);
    }

    private void listContract(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {
        List<Contract> contractList = contractIBo.selectAllContract();
        request.setAttribute("contractList", contractList);
        RequestDispatcher dispatcher = request.getRequestDispatcher("contract/list.jsp");
        dispatcher.forward(request, response);
    }



    private void deleteContract(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("contractId"));
        contractIBo.deleteContract(id);
        List<Contract> contractList = contractIBo.selectAllContract();
        request.setAttribute("contractList", contractList);
        RequestDispatcher dispatcher = request.getRequestDispatcher("contract/list.jsp");
        dispatcher.forward(request, response);
    }

    private void showEditFormContract(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
        List<Service> serviceList = serviceBo.selectAllService();
        request.setAttribute("serviceList", serviceList);
        List<Customer> customerList = customerBo.selectAllCustomer();
        request.setAttribute("customerList", customerList);
        List<Employee> employeeList = employeeBo.selectAllEmployee();
        request.setAttribute("employeeList", employeeList);
        int id = Integer.parseInt(request.getParameter("contractId"));
        Contract existingContract = contractIBo.getByContractId(id);
        RequestDispatcher dispatcher = request.getRequestDispatcher("contract/edit.jsp");
        request.setAttribute("contract", existingContract);
        dispatcher.forward(request, response);
    }

    private void showNewFormContract(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {
        List<Service> serviceList = serviceBo.selectAllService();
        request.setAttribute("serviceList", serviceList);
        List<Customer> customerList = customerBo.selectAllCustomer();
        request.setAttribute("customerList", customerList);
        List<Employee> employeeList = employeeBo.selectAllEmployee();
        request.setAttribute("employeeList", employeeList);
        RequestDispatcher dispatcher = request.getRequestDispatcher("contract/create.jsp");
        dispatcher.forward(request, response);
    }

    private void listEmployee(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
        List<Employee> employeeList = employeeBo.selectAllEmployee();
        request.setAttribute("employeeList", employeeList);
        RequestDispatcher dispatcher = request.getRequestDispatcher("employee/list.jsp");
        dispatcher.forward(request, response);
    }

    private void deleteEmployee(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("employeeId"));
        employeeBo.deleteEmployee(id);
        List<Employee> employeeList = employeeBo.selectAllEmployee();
        request.setAttribute("employeeList", employeeList);
        RequestDispatcher dispatcher = request.getRequestDispatcher("employee/list.jsp");
        dispatcher.forward(request, response);
    }

    private void showEditFormEmployee(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("employeeId"));
        Employee existingEmployee = employeeBo.getByEmployeeId(id);
        RequestDispatcher dispatcher = request.getRequestDispatcher("employee/edit.jsp");
        request.setAttribute("employee", existingEmployee);
        dispatcher.forward(request, response);
    }

    private void showNewFormEmployee(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {
        RequestDispatcher dispatcher = request.getRequestDispatcher("employee/create.jsp");
        dispatcher.forward(request, response);
    }


    private void listCustomer(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
        List<Customer> customerList = customerBo.selectAllCustomer();
        request.setAttribute("customerList", customerList);
        RequestDispatcher dispatcher = request.getRequestDispatcher("customer/list.jsp");
        dispatcher.forward(request, response);
    }

    private void deleteCustomer(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("customerId"));
        customerBo.deleteCustomer(id);
        List<Customer> customerList = customerBo.selectAllCustomer();
        request.setAttribute("customerList", customerList);
        RequestDispatcher dispatcher = request.getRequestDispatcher("customer/list.jsp");
        dispatcher.forward(request, response);
    }

    private void showEditFormCustomer(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("customerId"));
        Customer existingCustomer = customerBo.getByCustomerId(id);
        RequestDispatcher dispatcher = request.getRequestDispatcher("customer/edit.jsp");
        request.setAttribute("customer", existingCustomer);
        dispatcher.forward(request, response);
    }

    private void showNewFormCustomer(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {
        RequestDispatcher dispatcher = request.getRequestDispatcher("customer/create.jsp");
        dispatcher.forward(request, response);
    }


    private void listService(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
        List<Service> serviceList = serviceBo.selectAllService();
        request.setAttribute("serviceList", serviceList);
        RequestDispatcher dispatcher = request.getRequestDispatcher("service/list.jsp");
        dispatcher.forward(request, response);
    }

    private void deleteService(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("serviceId"));
        serviceBo.deleteService(id);
        List<Service> serviceList = serviceBo.selectAllService();
        request.setAttribute("serviceList", serviceList);
        RequestDispatcher dispatcher = request.getRequestDispatcher("service/list.jsp");
        dispatcher.forward(request, response);
    }

    private void showEditFormService(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("serviceId"));
        Service existingNote = serviceBo.getByServiceId(id);
        RequestDispatcher dispatcher = request.getRequestDispatcher("service/edit.jsp");
        request.setAttribute("service", existingNote);
        dispatcher.forward(request, response);
    }

    private void showNewFormService(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RequestDispatcher dispatcher = request.getRequestDispatcher("service/create.jsp");
        dispatcher.forward(request, response);
    }

    private void home(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RequestDispatcher dispatcher = request.getRequestDispatcher("index.jsp");
        dispatcher.forward(request, response);
    }
}
