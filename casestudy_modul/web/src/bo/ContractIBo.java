package bo;

import dao.ContractIDao;
import model.Contract;

import java.sql.SQLException;
import java.util.List;

public interface ContractIBo {

    public List<Contract> selectAllContract() throws SQLException;

    public void updateContract(Contract contract) throws SQLException;

    public void createContract(Contract contract) throws SQLException;

    public void deleteContract(int contractId) throws  SQLException;

    public Contract getByContractId(int contractId) throws SQLException;

    public List<Contract> getByContractName(String contractName) throws SQLException;
}
