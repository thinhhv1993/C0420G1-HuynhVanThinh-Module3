package dao;

import model.Contract;
import model.Customer;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ContractDao implements ContractIDao{

    BaseDao baseDao = new BaseDao();

    private static final String SELECT_ALL_CONTRACT="{CALL get_contract()}";
    private static final String DELETE_CONTRACT="{CALL delete_contract_by_id(?)}";
    private static final String GET_BY_CONTRACTID="{CALL get_contract_by_id(?)}";
    private static final String GET_BY_CONTRACTNAME="{CALL get_contract_by_name(?)}";
    private static final String UPDATE_CONTRACT="{CALL update_contract(?,?,?,?,?,?,?,?)}";
    private static final String CREATE_CONTRACT="{CALL insert_contract(?,?,?,?,?,?,?)}";

    @Override
    public List<Contract> selectAllContract() throws SQLException {
        Contract contract = null;
        List<Contract> contractList = new ArrayList<>();
        try (Connection connection = baseDao.getConnection();
             CallableStatement callableStatement = connection.prepareCall(SELECT_ALL_CONTRACT);) {
            ResultSet resultSet = callableStatement.executeQuery();
            while (resultSet.next()) {
                Integer contractId = resultSet.getInt("c.contract_id");
                String contractStarDate = resultSet.getString("c.contract_start_date");
                String contractEndDate = resultSet.getString("c.contract_end_date");
                Double contractDeposit = resultSet.getDouble("c.contract_deposit");
                Double contractTotalMoney = resultSet.getDouble("c.contract_total_money");
                String employeeName = resultSet.getString("e.employee_name");
                String customerName = resultSet.getString("ct.customer_name");
                String serviceName = resultSet.getString("s.service_name");

                contract = new Contract(contractId, contractStarDate, contractEndDate, contractDeposit
                        , contractTotalMoney, employeeName, customerName, serviceName);
                contractList.add(contract);
            }
        }catch (SQLException e){
            e.printStackTrace();
        }
        return contractList;
    }

    @Override
    public void updateContract(Contract contract) throws SQLException {
        try (Connection connection = baseDao.getConnection();
             CallableStatement callableStatement = connection.prepareCall(UPDATE_CONTRACT);) {
            connection.setAutoCommit(false);
            callableStatement.setInt(1,contract.getContractId());
            callableStatement.setString(2,contract.getContractStarDate());
            callableStatement.setString(3,contract.getContractEndDate());
            callableStatement.setDouble(4,contract.getContractDeposit());
            callableStatement.setDouble(5,contract.getContractTotalMoney());
            callableStatement.setInt(6,contract.getEmployeeId());
            callableStatement.setInt(7,contract.getCustomerId());
            callableStatement.setInt(8,contract.getServiceId());
            System.out.println(callableStatement);
            callableStatement.executeUpdate();
            connection.commit();
            connection.setAutoCommit(true);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public void createContract(Contract contract) throws SQLException {
        try (Connection connection = baseDao.getConnection();
             CallableStatement callableStatement = connection.prepareCall(CREATE_CONTRACT);) {
            connection.setAutoCommit(false);
            callableStatement.setString(1,contract.getContractStarDate());
            callableStatement.setString(2,contract.getContractEndDate());
            callableStatement.setDouble(3,contract.getContractDeposit());
            callableStatement.setDouble(4,contract.getContractTotalMoney());
            callableStatement.setInt(5,contract.getEmployeeId());
            callableStatement.setInt(6,contract.getCustomerId());
            callableStatement.setInt(7,contract.getServiceId());
            System.out.println(callableStatement);
            callableStatement.executeUpdate();
            connection.commit();
            connection.setAutoCommit(true);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public void deleteContract(int contractId) throws SQLException {
        try (Connection connection = baseDao.getConnection();
             CallableStatement callableStatement = connection.prepareCall(DELETE_CONTRACT);) {
            callableStatement.setInt(1, contractId);
            System.out.println(callableStatement);
            callableStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public Contract getByContractId(int contractId) throws SQLException {
        Contract contract = null;
        try (Connection connection = baseDao.getConnection();
             CallableStatement callableStatement = connection.prepareCall(GET_BY_CONTRACTID);) {
            callableStatement.setInt(1, contractId);
            ResultSet resultSet = callableStatement.executeQuery();
            while (resultSet.next()) {
                String contractStarDate = resultSet.getString("c.contract_start_date");
                String contractEndDate = resultSet.getString("c.contract_end_date");
                Double contractDeposit = resultSet.getDouble("c.contract_deposit");
                Double contractTotalMoney = resultSet.getDouble("c.contract_total_money");
                String employeeName = resultSet.getString("e.employee_name");
                String customerName = resultSet.getString("ct.customer_name");
                String serviceName = resultSet.getString("s.service_name");

                contract = new Contract(contractId, contractStarDate, contractEndDate, contractDeposit, contractTotalMoney
                        , employeeName, customerName, serviceName);
            }
        }catch (SQLException e){
            e.printStackTrace();
        }
        return contract;
    }

    @Override
    public List<Contract> getByContractName(String contractName1) throws SQLException {
        Contract contract = null;
        List<Contract> contractList = new ArrayList<>();
        try (Connection connection = baseDao.getConnection();
             CallableStatement callableStatement = connection.prepareCall(GET_BY_CONTRACTNAME);) {
            callableStatement.setString(1, contractName1);
            ResultSet resultSet = callableStatement.executeQuery();
            while (resultSet.next()) {
                Integer contractId = resultSet.getInt("c.contract_id");
                String contractStarDate = resultSet.getString("c.contract_start_date");
                String contractEndDate = resultSet.getString("c.contract_end_date");
                Double contractDeposit = resultSet.getDouble("c.contract_deposit");
                Double contractTotalMoney = resultSet.getDouble("c.contract_total_money");
                String employeeName = resultSet.getString("e.employee_name");
                String customerName = resultSet.getString("ct.customer_name");
                String serviceName = resultSet.getString("s.service_name");

                contract = new Contract(contractId, contractStarDate, contractEndDate, contractDeposit, contractTotalMoney
                        , employeeName, customerName, serviceName);

                contractList.add(contract);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return contractList;
    }
}
