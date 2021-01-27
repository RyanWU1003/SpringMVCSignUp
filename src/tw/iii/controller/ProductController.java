package tw.iii.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import tw.iii.model.Product;
import tw.iii.model.ProductDao;

@Controller
public class ProductController {
	@Autowired
	private ProductDao pdao;
	
	@RequestMapping(path="/getAllProduct",method = RequestMethod.GET)
	public String allProductPage(Model m) {
		List<Product> list=pdao.findAll();
		m.addAttribute("productList",list);
		return "productPage";
	}
	
	@RequestMapping(path="/getProductDetail",method = RequestMethod.GET)
	public String productDetail(@RequestParam(name="id")int id, Model m) {
		Product product =pdao.getById(id);
		m.addAttribute("product",product);
		return "ProductDetail";
	}
	
	// 動物分類查詢
	@RequestMapping(path = "/selectSpecies", method = RequestMethod.POST)
	public String selectspecies(@RequestParam(name = "species") String classf, Model m) {
		m.addAttribute("selection", "selectSpecies");
		m.addAttribute("productList", pdao.selectspecies(classf));
		m.addAttribute("count", String.valueOf(pdao.countspecies(classf)));
		return "product";
	}
	// 品牌查詢
	@RequestMapping(path = "/selectBrand", method = RequestMethod.POST)
	public String selectbrand(@RequestParam(name = "brand") String classf, Model m) {
		m.addAttribute("selection", "selectBrand");
		m.addAttribute("productList", pdao.selectbrand(classf));
		m.addAttribute("count", String.valueOf(pdao.countbrand(classf)));
		return "product";
	}
	

}
