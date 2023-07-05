using System.Data.SqlClient;
using Dapper;

namespace Dapper_API
{

    public class ProductRepository : IProductRepository
    {
        private readonly string _connectionString;

        public ProductRepository(IConfiguration configuration)
        {
            _connectionString = configuration.GetConnectionString("DefaultConnection");
        }

        public async Task<IEnumerable<Product>> GetAll()
        {
            using var connection = new SqlConnection(_connectionString);
            return await connection.QueryAsync<Product>("SELECT * FROM Products");
        }

        public async Task<Product> GetById(int id)
        {
            using var connection = new SqlConnection(_connectionString);
            return await connection.QuerySingleOrDefaultAsync<Product>("SELECT * FROM Products WHERE Id = @Id", new { Id = id });
        }

        public async Task<int> Add(Product product)
        {
            using var connection = new SqlConnection(_connectionString);
            return await connection.ExecuteAsync("INSERT INTO Products (Name, Price) VALUES (@Name, @Price)", product);
        }

        public async Task<int> Update(Product product)
        {
            using var connection = new SqlConnection(_connectionString);
            return await connection.ExecuteAsync("UPDATE Products SET Name = @Name, Price = @Price WHERE Id = @Id", product);
        }

        public async Task<int> Delete(int id)
        {
            using var connection = new SqlConnection(_connectionString);
            return await connection.ExecuteAsync("DELETE FROM Products WHERE Id = @Id", new { Id = id });
        }
    }
}
