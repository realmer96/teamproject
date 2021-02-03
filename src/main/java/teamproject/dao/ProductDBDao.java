package teamproject.dao;

import java.util.List;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import teamproject.dto.ProdimageDB;
import teamproject.dto.ProductDB;

@Repository
public class ProductDBDao {
	private static final Logger logger = LoggerFactory.getLogger(ProductDBDao.class);

	@Resource
	private SqlSessionTemplate sst;
	
	public int insertProduct(ProductDB product) {
		int rows = sst.insert("product.insertProduct", product);
		return rows;
	}

	public ProductDB getSelfByPk(long productCode) {
		ProductDB self = sst.selectOne("product.selectByPk", productCode);
		return self;
	}

	public String getUpCategoryByLowCategory(ProductDB product) {
		String upcategory = sst.selectOne("lowcategory.selectlistEngByEng", product);
		return upcategory;
	}

	public void setProductInfo(ProductDB product) {
		
	}
	

	public ProductDB getProductByPd(long productCode) {
		ProductDB product = sst.selectOne("product.selectByPk", productCode);
		return product;
	}

	public List<ProductDB> getProductsByLowCategory(String lowcategoryeng) {
		return sst.selectList("product.selectListByLowCategory", lowcategoryeng);
	}

	public List<ProductDB> getEveryProductByUp(String upcategoryeng) {
		return sst.selectList("product.selectAllByUp", upcategoryeng);
	}

}
