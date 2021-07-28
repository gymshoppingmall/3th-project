package ga.dgmarket.gymshopping.model.service.member;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ga.dgmarket.gymshopping.domain.Member;
import ga.dgmarket.gymshopping.exception.DMLException;
import ga.dgmarket.gymshopping.exception.MemberExistException;
import ga.dgmarket.gymshopping.model.repository.member.MemberDAO;

@Service
public class MemberServiceImpl implements MemberService{
	
	@Autowired
	private MemberDAO memberDAO;

	@Override
	public Member login(Member member) throws MemberExistException{
		return memberDAO.login(member);
	}

	@Override
	public void regist(Member member) throws DMLException{
		memberDAO.regist(member);
		
	}

	@Override
	public void update(Member member) throws DMLException{
		memberDAO.update(member);
		
	}

	@Override
	public void delete(Member member) throws DMLException{
		memberDAO.delete(member);
		
	}

	@Override
	public List selectAll() {
		return memberDAO.selectAll();
	}

	@Override
	public Member select(int member_id) {
		return memberDAO.select(member_id);
	}
	
	@Override
	public int countUser() {
		return memberDAO.countUser();
	}

	@Override
	public int idCheck(String memberId){
		return memberDAO.idCheck(memberId);
	}

	
}
