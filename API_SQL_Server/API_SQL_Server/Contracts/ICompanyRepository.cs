using API_SQL_Server.data_transfer_object;
using API_SQL_Server.Entities;

namespace API_SQL_Server.Contracts
{
    public interface ICompanyRepository
    {
        public Task<IEnumerable<Company>> GetCompanies();
        public Task<Company> GetCompany(int id);
        public Task<Company> CreateCompany(CompanyForCreationDto company);
        public Task UpdateCompany(int id, CompanyForUpdateDto company);
        public Task DeleteCompany(int id);
        public Task<Company> GetCompanyByEmployeeId(int id);
        public Task<Company> GetCompanyEmployeesMultipleResults(int id);
        public Task<List<Company>> GetCompaniesEmployeesMultipleMapping();

    }
}


