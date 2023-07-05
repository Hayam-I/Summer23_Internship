namespace Dapper_API
{
    public interface IProductRepository
    {
        Task<IEnumerable<Product>> GetAll();
        Task<Product> GetById(int id);
        Task<int> Add(Product product);
        Task<int> Update(Product product);
        Task<int> Delete(int id);
    }
}
