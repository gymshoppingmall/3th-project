--상품의 메인에서 상품과 찜 여부 등을 조회하는 쿼리문
select member_id, p.used_product_id as used_product_id, p.used_product_name as used_product_name, 
p.used_product_price as used_product_price, used_img,
(select member_id from used_favorites f 
where p.used_product_id=f.used_product_id and f.member_id=#{member_id}) as favorites_member, (select used_favorites_id from used_favorites f 
where p.used_product_id=f.used_product_id and f.member_id=#{member_id}) as used_favorites_id
from used_product p, used_product_img i
where p.used_product_id=i.used_product_id and i.used_img_index=0
order by p.used_product_id desc;

--스토어에서 찜상품 미리보기 이미지 조회
select f.used_product_id as used_product_id, used_img 
from used_product_img i, used_favorites f 
where i.used_product_id=f.used_product_id and f.member_id=#{member_id};