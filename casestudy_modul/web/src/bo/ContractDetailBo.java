package bo;

import dao.ContractDetailDao;
import dao.ContractDetailIDao;
import model.ContractDetail;

import java.sql.SQLException;
import java.util.List;

public class ContractDetailBo implements ContractDetailIBo {

    ContractDetailIDao contractDetailIDao = new ContractDetailDao();

    @Override
    public List<ContractDetail> selectAllContractDetail() throws SQLException {
        return this.contractDetailIDao.selectAllContractDetail();
    }

    @Override
    public void updateContractDetail(ContractDetail contractDetail) throws SQLException {
        this.contractDetailIDao.updateContractDetail(contractDetail);
    }

    @Override
    public void createContractDetail(ContractDetail contractDetail) throws SQLException {
        this.contractDetailIDao.createContractDetail(contractDetail);
    }

    @Override
    public void deleteContractDetail(int contractDetailId) throws SQLException {
        this.contractDetailIDao.deleteContractDetail(contractDetailId);
    }

    @Override
    public ContractDetail getByContractDetailId(int contractDetailId) throws SQLException {
        return this.contractDetailIDao.getByContractDetailId(contractDetailId);
    }

    @Override
    public List<ContractDetail> getByContractDetailName(int contractId) throws SQLException {
        return this.contractDetailIDao.getByContractDetailName(contractId);
    }
}
