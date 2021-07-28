package ga.dgmarket.gymshopping.model.service.usedproduct;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.multipart.MultipartFile;

import ga.dgmarket.gymshopping.domain.Member;
import ga.dgmarket.gymshopping.domain.UsedFavorites;
import ga.dgmarket.gymshopping.domain.UsedProduct;
import ga.dgmarket.gymshopping.domain.UsedProductExtend;
import ga.dgmarket.gymshopping.domain.UsedProductImg;
import ga.dgmarket.gymshopping.domain.UsedTag;
import ga.dgmarket.gymshopping.exception.DMLException;
import ga.dgmarket.gymshopping.exception.UploadException;
import ga.dgmarket.gymshopping.model.common.file.FileManager;
import ga.dgmarket.gymshopping.model.repository.usedproduct.MybatisUsedTagDAO;
import ga.dgmarket.gymshopping.model.repository.usedproduct.UsedProductDAO;
import ga.dgmarket.gymshopping.model.repository.usedproduct.UsedProductImgDAO;

@Service
public class UsedProductServiceImpl implements UsedProductService{

	@Autowired
	private UsedProductDAO usedProductDAO;
	@Autowired
	private UsedProductImgDAO usedProductImgDAO;
	@Autowired
	private MybatisUsedTagDAO mybatisUsedTagDAO;
	@Autowired
	private FileManager fileManager;

	//중고거래 상품을 등록. 상품만을 등록 외에도 사진, Tag도 insert 해야됨 
	//매개변수 1[usedProduct].중고상품 정보가 담겨있는 usedProduct 객체
	//매개변수 2[context].파일의 경로를 가져올 수 있는 context
	//매개변수 3[multipartFiles].등록할 이미지들이 담겨있는 객체를 담은 List
	//매개변수 4[tags].등록할 tag들이 담겨있는 List
	//from.성일
	public void regist(HttpServletRequest request, UsedProduct usedProduct) throws DMLException, UploadException{
		
		//상품을 먼저 insert 상품을 넣으면서 생기는 id를 리턴 받고 그 값을 이용해 img와, tag들 DB에 넣기
		ServletContext context = request.getServletContext();
		UsedProduct result = usedProductDAO.insert(usedProduct);
		System.out.println("used_product_id : "+result.getUsed_product_id());
		
		//이미지 배열에 담아서 돌리기
		List<MultipartFile> multipartFiles = new ArrayList<MultipartFile>();
		MultipartFile mainImg = usedProduct.getMainImg();
		MultipartFile subImg = usedProduct.getSubImg();
		if(mainImg.getOriginalFilename() != null && mainImg.getOriginalFilename() != "") multipartFiles.add(mainImg);
		if(subImg.getOriginalFilename() != null && subImg.getOriginalFilename() != "") multipartFiles.add(subImg);
		
		for(int i = 0; i < multipartFiles.size(); i++) {
			MultipartFile multipartFile = multipartFiles.get(i);
			String filename = fileManager.saveFile(context, multipartFile, "used/product/img"); //여기서 새로 저장될 파일명을 반환하고 그 파일명을 디비에 넣어야 함
			UsedProductImg usedProductImg = new UsedProductImg(); //VO 채워 넣기
			usedProductImg.setUsed_product_id(result.getUsed_product_id());
			usedProductImg.setUsed_img(filename);
			usedProductImg.setUsed_img_index(i);
			
			usedProductImgDAO.insert(usedProductImg); //디비에 넣기
		}
		//태그 디비에 넣기
		String tag = usedProduct.getTag();
		String[] tags = tag.split(",");
		for(String obj : tags) {
			UsedTag usedTag = new UsedTag();
			usedTag.setUsed_product_id(result.getUsed_product_id());
			usedTag.setTag_name(obj);
			mybatisUsedTagDAO.insert(usedTag);
		}
		System.out.println("등록 완료");
	}
	
	//메인 화면에 보여줄 상품들을 조회하기
	//세션에 있는 member_id을 통해 조회할 예정
	public List selectAll(HttpServletRequest request) {
		HttpSession session = request.getSession();
		//임의로 값 넣기===========================================
		Member member = new Member();
		member.setMember_id(5);
		member.setUser_id("used_test");
		member.setPassword("1234");
		member.setName("성일");
		member.setStorename("성일샵");

		session.setAttribute("member", member);
		//임의로 값 넣기===========================================

		Member mem = (Member)session.getAttribute("member");
		System.out.println(mem+"member는");
		
		return usedProductDAO.selectAll(mem.getMember_id());
	}	
	
	//상품의 상세보기 요청을 했을 때
	//used_product+storename+favorites_id+tag 꺼내오기
	//product_img 가져오기
	// 가져오기
	//favorites[count] 가져오기
	@Override
	public Map getDetail(HttpServletRequest request, int used_product_id) {
		UsedProductExtend productExtend = new UsedProductExtend();
		Member member = (Member)request.getSession().getAttribute("member");
		
		productExtend.setMember_id(member.getMember_id());
		productExtend.setUsed_product_id(used_product_id);
		
		//맵에 담을 애들
		UsedProductExtend usedProductExtend = usedProductDAO.getDetail(productExtend); //상품정보+찜 정보 가져오기
		UsedFavorites usedFavorites =usedProductDAO.getFavoritesCount(used_product_id); //찜 갯수가져오기
		List<UsedProductImg> imgList = usedProductImgDAO.getProductImg(used_product_id);//이미지 가져오기
		List<UsedTag> tagList = usedProductDAO.getProductTag(used_product_id);//태그 가져오기
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("usedProductExtend", usedProductExtend);
		map.put("usedFavorites", usedFavorites);
		map.put("imgList", imgList);
		map.put("tagList", tagList);
		
		return map;
	}
}














