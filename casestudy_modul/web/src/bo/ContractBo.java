package bo;

import dao.ContractDao;
import dao.ContractIDao;
import model.Contract;

import java.sql.SQLException;
import java.util.List;

public class ContractBo implements ContractIBo{

    ContractIDao contractIDao = new ContractDao();

    @Override
    public List<Contract> selectAllContract() throws SQLException {
        return this.contractIDao.selectAllContract();
    }

    @Override
    public void updateContract(Contract contract) throws SQLException {
        this.contractIDao.updateContract(contract);
    }

    @Override
    public void createContract(Contract contract) throws SQLException {
        this.contractIDao.createContract(contract);
    }

    @Override
    public void deleteContract(int contractId) throws SQLException {
        this.contractIDao.deleteContract(contractId);
    }

    @Override
    public Contract getByContractId(int contractId) throws SQLException {
        return this.contractIDao.getByContractId(contractId);
    }

    @Override
    public List<Contract> getByContractName(String contractName) throws SQLException {
        return this.contractIDao.getByContractName(contractName);
    }
}
