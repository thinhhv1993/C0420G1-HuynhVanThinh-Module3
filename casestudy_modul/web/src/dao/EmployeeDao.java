package dao;


import model.Employee;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class EmployeeDao implements EmployeeIDao{
    BaseDao baseDao = new BaseDao();

    private static final String SELECT_ALL_EMPLOYEE="{CALL get_employee()}";
    private static final String DELETE_EMPLOYEE="{CALL delete_employee_by_id(?)}";
    private static final String GET_BY_EMPLOYEEID="{CALL get_employee_by_id(?)}";
    private static final String GET_BY_EMPLOYEENAME="{CALL get_employee_by_name(?)}";
    private static final String UPDATE_EMPLOYEE="{CALL update_employee(?,?,?,?,?,?,?,?,?,?,?)}";
    private static final String CREATE_EMPLOYEE="{CALL insert_employee(?,?,?,?,?,?,?,?,?,?)}";

    @Override
    public List<Employee> selectAllEmployee() throws SQLException {
       Employee employee = null;
       List<Employee> employeeList = new ArrayList<>();
        try (Connection connection = baseDao.getConnection();
             CallableStatement callableStatement = connection.prepareCall(SELECT_ALL_EMPLOYEE);) {
            ResultSet resultSet = callableStatement.executeQuery();
            while (resultSet.next()) {
                Integer employeeId = resultSet.getInt("e.employee_id");
                String employeeName = resultSet.getString("e.employee_name");
                String employeeBirth = resultSet.getString("e.employee_birthday");
                String employeeIdCard = resultSet.getString("e.employee_id_card");
                Double employeeSalary = resultSet.getDouble("e.employee_salary");
                String employeePhone = resultSet.getString("e.employee_phone");
                String employeeEmail = resultSet.getString("e.employee_email");
                String employeeAddress = resultSet.getString("e.employee_address");
                String employeePositionName = resultSet.getString("p.position_name");
                String employeeEducationDegreeName = resultSet.getString("ed.education_degree_name");
                String employeeDivisionName = resultSet.getString("d.division_name");

                employee = new Employee(employeeId, employeeName, employeeBirth, employeeIdCard, employeeSalary,
                        employeePhone, employeeEmail, employeeAddress, employeePositionName, employeeEducationDegreeName, employeeDivisionName);
                employeeList.add(employee);
            }
        }catch (SQLException e){
            e.printStackTrace();
        }
        return employeeList;
    }

    @Override
    public void updateEmployee(Employee employee) throws SQLException {
        try (Connection connection = baseDao.getConnection();
             CallableStatement callableStatement = connection.prepareCall(UPDATE_EMPLOYEE);) {
            connection.setAutoCommit(false);
            callableStatement.setInt(1,employee.getEmployeeId());
            callableStatement.setString(2,employee.getEmployeeName());
            callableStatement.setString(3,employee.getEmployeeBirthday());
            callableStatement.setString(4,employee.getEmployeeIdCard());
            callableStatement.setDouble(5, employee.getEmployeeSalary());
            callableStatement.setString(6,employee.getEmployeePhone());
            callableStatement.setString(7,employee.getEmployeeEmail());
            callableStatement.setString(8,employee.getEmployeeAddress());
            callableStatement.setInt(9,employee.getPositionId());
            callableStatement.setInt(10,employee.getDivisionId());
            callableStatement.setInt(11,employee.getEducationDegreeId());
            System.out.println(callableStatement);
            callableStatement.executeUpdate();
            connection.commit();
            connection.setAutoCommit(true);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public void createEmployee(Employee employee) throws SQLException {
        try (Connection connection = baseDao.getConnection();
             CallableStatement callableStatement = connection.prepareCall(CREATE_EMPLOYEE);) {
            connection.setAutoCommit(false);
            callableStatement.setString(1,employee.getEmployeeName());
            callableStatement.setString(2,employee.getEmployeeBirthday());
            callableStatement.setString(3,employee.getEmployeeIdCard());
            callableStatement.setDouble(4, employee.getEmployeeSalary());
            callableStatement.setString(5,employee.getEmployeePhone());
            callableStatement.setString(6,employee.getEmployeeEmail());
            callableStatement.setString(7,employee.getEmployeeAddress());
            callableStatement.setInt(8,employee.getPositionId());
            callableStatement.setInt(9,employee.getDivisionId());
            callableStatement.setInt(10,employee.getEducationDegreeId());
            System.out.println(callableStatement);
            callableStatement.executeUpdate();
            connection.commit();
            connection.setAutoCommit(true);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public void deleteEmployee(int employeeId) throws SQLException {
        try (Connection connection = baseDao.getConnection();
             CallableStatement callableStatement = connection.prepareCall(DELETE_EMPLOYEE);) {
            callableStatement.setInt(1, employeeId);
            System.out.println(callableStatement);
            callableStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public Employee getByEmployeeId(int employeeId) throws SQLException {
        Employee employee = null;
        try (Connection connection = baseDao.getConnection();
             CallableStatement callableStatement = connection.prepareCall(GET_BY_EMPLOYEEID);) {
            callableStatement.setInt(1, employeeId);
            ResultSet resultSet = callableStatement.executeQuery();
            while (resultSet.next()) {
                String employeeName = resultSet.getString("e.employee_name");
                String employeeBirthday = resultSet.getString("e.employee_birthday");
                String employeeIdCard = resultSet.getString("e.employee_id_card");
                Double employeeSalary = resultSet.getDouble("e.employee_salary");
                String employeePhone = resultSet.getString("e.employee_phone");
                String employeeEmail = resultSet.getString("e.employee_email");
                String employeeAddress = resultSet.getString("e.employee_address");
                String divisionName = resultSet.getString("d.division_name");
                String educationDegreeName = resultSet.getString("ed.education_degree_name");
                String positionName = resultSet.getString("p.position_name");
                employee = new Employee(employeeId,employeeName,employeeBirthday,employeeIdCard,employeeSalary,employeePhone,employeeEmail,
                        employeeAddress,divisionName,educationDegreeName,positionName);
            }
        }catch (SQLException e){
            e.printStackTrace();
        }
        return employee;
    }

    @Override
    public List<Employee> getEmployeeName(String employeeName1) throws SQLException {
        Employee employee = null;
        List<Employee> employeeList = new ArrayList<>();
        try (Connection connection = baseDao.getConnection();
             CallableStatement callableStatement = connection.prepareCall(GET_BY_EMPLOYEENAME );) {
            callableStatement.setString(1, employeeName1);
            ResultSet resultSet = callableStatement.executeQuery();
            while (resultSet.next()) {
                Integer employeeId = resultSet.getInt("e.employee_id");
                String employeeName = resultSet.getString("e.employee_name");
                String employeeBirthday = resultSet.getString("e.employee_birthday");
                String employeeIdCard = resultSet.getString("e.employee_id_card");
                Double employeeSalary = resultSet.getDouble("e.employee_salary");
                String employeePhone = resultSet.getString("e.employee_phone");
                String employeeEmail = resultSet.getString("e.employee_email");
                String employeeAddress = resultSet.getString("e.employee_address");
                String divisionName = resultSet.getString("d.division_name");
                String educationDegreeName = resultSet.getString("ed.education_degree_name");
                String positionName = resultSet.getString("p.position_name");
                employee = new Employee(employeeId, employeeName, employeeBirthday, employeeIdCard, employeeSalary, employeePhone, employeeEmail,
                        employeeAddress, divisionName, educationDegreeName, positionName);
                employeeList.add(employee);
            }
        }catch (SQLException e){
            e.printStackTrace();
        }
        return employeeList;
    }
}
