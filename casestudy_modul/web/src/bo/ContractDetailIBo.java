package bo;

import model.ContractDetail;

import java.sql.SQLException;
import java.util.List;

public interface ContractDetailIBo {
    public List<ContractDetail> selectAllContractDetail() throws SQLException;

    public void updateContractDetail(ContractDetail contractDetail) throws SQLException;

    public void createContractDetail(ContractDetail contractDetail) throws SQLException;

    public void deleteContractDetail(int contractDetailId) throws  SQLException;

    public ContractDetail getByContractDetailId(int contractDetailId) throws SQLException;

    public List<ContractDetail> getByContractDetailName(int contractId) throws SQLException;
}
