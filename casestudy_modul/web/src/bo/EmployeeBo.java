package bo;

import dao.EmployeeDao;
import dao.EmployeeIDao;
import model.Employee;

import java.sql.SQLException;
import java.util.List;

public class EmployeeBo implements EmployeeIBo{

    EmployeeIDao employeeIDao = new EmployeeDao();

    @Override
    public List<Employee> selectAllEmployee() throws SQLException {
        return this.employeeIDao.selectAllEmployee();
    }

    @Override
    public void updateEmployee(Employee employee) throws SQLException {
        this.employeeIDao.updateEmployee(employee);
    }

    @Override
    public void createEmployee(Employee employee) throws SQLException {
        this.employeeIDao.createEmployee(employee);
    }

    @Override
    public void deleteEmployee(int employeeId) throws SQLException {
        this.employeeIDao.deleteEmployee(employeeId);
    }

    @Override
    public Employee getByEmployeeId(int employeeId) throws SQLException {
     return this.employeeIDao.getByEmployeeId(employeeId);
    }

    @Override
    public List<Employee> getEmployeeName(String employeeName) throws SQLException {
        return this.employeeIDao.getEmployeeName(employeeName);
    }
}
