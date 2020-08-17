package dao;


import model.ContractDetail;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ContractDetailDao implements ContractDetailIDao {

    BaseDao baseDao = new BaseDao();

    private static final String SELECT_ALL_CONTRACT_DETAIL = "{CALL get_contract_detail()}";
    private static final String DELETE_CONTRACT_DETAIL = "{CALL delete_contract_detail_by_id(?)}";
    private static final String GET_BY_CONTRACT_DETAIL_ID = "{CALL get_contract_detail_by_id(?)}";
    private static final String GET_BY_CONTRACT_DETAIL_NAME = "{CALL get_contract_detail_by_name(?)}";
    private static final String UPDATE_CONTRACT_DETAIL = "{CALL update_contract_detail(?,?,?,?)}";
    private static final String CREATE_CONTRACT_DETAIL = "{CALL insert_contract_detail(?,?,?)}";


    @Override
    public List<ContractDetail> selectAllContractDetail() throws SQLException {
        ContractDetail contractDetail = null;
        List<ContractDetail> contractDetailList = new ArrayList<>();
        try (Connection connection = baseDao.getConnection();
             CallableStatement callableStatement = connection.prepareCall(SELECT_ALL_CONTRACT_DETAIL);) {
            ResultSet resultSet = callableStatement.executeQuery();
            while (resultSet.next()) {
                Integer contractDetailId = resultSet.getInt("cd.contract_detail_id");
                Integer contractId = resultSet.getInt("cd.contract_id");
                String attachServiceName = resultSet.getString("a.attach_service_name");
                Integer quantity = resultSet.getInt("cd.quatity");

                contractDetail = new ContractDetail(contractDetailId, contractId, attachServiceName, quantity);

                contractDetailList.add(contractDetail);
            }
        }catch (SQLException e){
            e.printStackTrace();
        }
        return contractDetailList;
    }

    @Override
    public void updateContractDetail(ContractDetail contractDetail) throws SQLException {
        try (Connection connection = baseDao.getConnection();
             CallableStatement callableStatement = connection.prepareCall(UPDATE_CONTRACT_DETAIL);) {
            connection.setAutoCommit(false);
            callableStatement.setInt(1,contractDetail.getContractDetailId());
            callableStatement.setInt(2,contractDetail.getContractId());
            callableStatement.setInt(3,contractDetail.getAttachServiceId());
            callableStatement.setInt(4,contractDetail.getQuantity());
            System.out.println(callableStatement);
            callableStatement.executeUpdate();
            connection.commit();
            connection.setAutoCommit(true);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public void createContractDetail(ContractDetail contractDetail) throws SQLException {
        try (Connection connection = baseDao.getConnection();
             CallableStatement callableStatement = connection.prepareCall(CREATE_CONTRACT_DETAIL);) {
            connection.setAutoCommit(false);
            callableStatement.setInt(1,contractDetail.getContractId());
            callableStatement.setInt(2,contractDetail.getAttachServiceId());
            callableStatement.setInt(3,contractDetail.getQuantity());
            System.out.println(callableStatement);
            callableStatement.executeUpdate();
            connection.commit();
            connection.setAutoCommit(true);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public void deleteContractDetail(int contractDetailId) throws SQLException {
        try (Connection connection = baseDao.getConnection();
             CallableStatement callableStatement = connection.prepareCall(DELETE_CONTRACT_DETAIL);) {
            callableStatement.setInt(1, contractDetailId);
            System.out.println(callableStatement);
            callableStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public ContractDetail getByContractDetailId(int contractDetailId) throws SQLException {
        ContractDetail contractDetail = null;
        try (Connection connection = baseDao.getConnection();
             CallableStatement callableStatement = connection.prepareCall(GET_BY_CONTRACT_DETAIL_ID);) {
            callableStatement.setInt(1, contractDetailId);
            ResultSet resultSet = callableStatement.executeQuery();
            while (resultSet.next()) {
                Integer contractId = resultSet.getInt("cd.contract_id");
                String attachServiceName = resultSet.getString("a.attach_service_name");
                Integer quantity = resultSet.getInt("cd.quatity");
                contractDetail = new ContractDetail(contractDetailId, contractId, attachServiceName, quantity);
            }
        }catch (SQLException e){
            e.printStackTrace();
        }
        return contractDetail;
    }

    @Override
    public List<ContractDetail> getByContractDetailName(int contractId) throws SQLException {
        ContractDetail contractDetail = null;
        List<ContractDetail> contractDetailList = new ArrayList<>();
        try (Connection connection = baseDao.getConnection();
             CallableStatement callableStatement = connection.prepareCall(GET_BY_CONTRACT_DETAIL_NAME)) {
            callableStatement.setInt(1, contractId);
            ResultSet resultSet = callableStatement.executeQuery();
            while (resultSet.next()) {
                Integer contractDetailId = resultSet.getInt("cd.contract_detail_id");
                String attachServiceName = resultSet.getString("a.attach_service_name");
                Integer quantity = resultSet.getInt("cd.quatity");
                contractDetail = new ContractDetail(contractDetailId, contractId, attachServiceName, quantity);
                contractDetailList.add(contractDetail);
            }
        }catch (SQLException e){
            e.printStackTrace();
        }
        return contractDetailList;
    }
}
