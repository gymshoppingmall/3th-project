package ga.dgmarket.gymshopping.controller.admin;

import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.multipart.MultipartFile;

import ga.dgmarket.gymshopping.domain.Product;
import ga.dgmarket.gymshopping.model.common.file.FileManager;
import ga.dgmarket.gymshopping.model.service.product.ProductService;
import ga.dgmarket.gymshopping.model.service.topcategory.TopCategoryService;

@Controller
public class ProductController {
	//모든 상품 가져오기
	@Autowired
	private ProductService productService;
	@Autowired
	private TopCategoryService topCategoryService;
	@Autowired
	private FileManager fileManager;
	@GetMapping("/main/productlist")
	public String memberList(Model model, HttpServletRequest request) {
		List productList = productService.selectAll();
		model.addAttribute("productList",productList);
		return "admin/main/productlist";
	}
	@GetMapping("/main/product/regist")
	public String admin_product(Model model, HttpServletRequest request) {
		List topCategoryList = topCategoryService.selectAll();
		model.addAttribute("topCategoryList",topCategoryList);
		return "admin/main/product/regist";
	}
	@PostMapping("/product/regist")
	public String product_regist(Product product, HttpServletRequest request) {
		MultipartFile photo = product.getPhoto();
		ServletContext context = request.getServletContext();
		Long time = System.currentTimeMillis();
		String filename = time+"."+fileManager.getExt(photo.getOriginalFilename());
		fileManager.saveFile(context, photo, "product/img/");
		product.setProduct_img(filename);
		productService.regist(product);
		
		return "redirect:/admin/main/productlist";
	}
}
