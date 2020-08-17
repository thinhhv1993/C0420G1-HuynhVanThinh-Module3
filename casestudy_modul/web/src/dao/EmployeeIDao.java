package dao;

import model.Customer;
import model.Employee;

import java.sql.SQLException;
import java.util.List;

public interface EmployeeIDao {
    public List<Employee> selectAllEmployee() throws SQLException;

    public void updateEmployee(Employee employee) throws SQLException;

    public void createEmployee(Employee employee) throws SQLException;

    public void deleteEmployee(int employeeId) throws  SQLException;

    public Employee getByEmployeeId(int employeeId) throws SQLException;

    public List<Employee> getEmployeeName(String employeeName) throws SQLException;
}
