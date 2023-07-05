//using Dapper_API;
//using Microsoft.AspNetCore.Mvc;

//[ApiController]
//[Route("api/[controller]")]
//public class ProductsController : ControllerBase
//{
//    private readonly IProductRepository _productRepository;

//    public ProductsController(IProductRepository productRepository)
//    {
//        _productRepository = productRepository;
//    }

//    [HttpGet]
//    public async Task<ActionResult<IEnumerable<Product>>> Get()
//    {
//        var products = await _productRepository.GetAll();
//        return Ok(products);
//    }

//    [HttpGet("{id}")]
//    public async Task<ActionResult<Product>> Get(int id)
//    {
//        var product = await _productRepository.GetById(id);
//        if (product == null)
//        {
//            return NotFound();
//        }
//        return Ok(product);
//    }

//    [HttpPost]
//    public async Task<ActionResult<Product>> Post([FromBody] Product product)
//    {
//        var id = await _productRepository.Add(product);
//        product.Id = id;
//        return CreatedAtAction(nameof(Get), new { id = product.Id }, product);
//    }

//    [HttpPut("{id}")]
//    public async Task<ActionResult<Product>> Put(int id, [FromBody] Product product)
//    {
//        if (id != product.Id)
//        {
//            return BadRequest();
//        }
//        await _productRepository.Update(product);
//        return NoContent();
//    }

//    [HttpDelete("{id}")]
//    public async Task<ActionResult<Product>> Delete(int id)
//    {
//        var product = await _productRepository.GetById(id);
//        if (product == null)
//        {
//            return NotFound();
//        }
//        await _productRepository.Delete(id);
//        return Ok(product);
//    }
//}


using Dapper_API;
using Microsoft.AspNetCore.Mvc;

[ApiController]
[Route("api/[controller]")]
public class ProductsController : ControllerBase
{
    private readonly IProductRepository productRepository;

    public ProductsController(IProductRepository productRepository)
    {
        this.productRepository = productRepository;
    }

    [HttpGet]
    public async Task<IEnumerable<Product>> GetAll()
    {
        return await productRepository.GetAll();
    }

    [HttpGet("{id}")]
    public async Task<ActionResult<Product>> GetById(int id)
    {
        var product = await productRepository.GetById(id);
        if (product == null)
        {
            return NotFound();
        }
        return product;
    }

    [HttpPost]
    public async Task<ActionResult<Product>> Create(Product product)
    {
        await productRepository.Add(product);
        return CreatedAtAction(nameof(GetById), new { id = product.Id }, product);
    }

    [HttpPut("{id}")]
    public async Task<IActionResult> Update(int id, Product product)
    {
        if (id != product.Id)
        {
            return BadRequest();
        }

        await productRepository.Update(product);

        return NoContent();
    }

    [HttpDelete("{id}")]
    public async Task<IActionResult> Delete(int id)
    {
        await productRepository.Delete(id);
        return NoContent();
    }
}

