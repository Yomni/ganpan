package org.sync.ganpan.model.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.sync.ganpan.model.dao.MemberDAO;
import org.sync.ganpan.model.dao.OrganizationDAO;
import org.sync.ganpan.model.dao.WorkDAO;
import org.sync.ganpan.model.vo.InvitationMngVO;
import org.sync.ganpan.model.vo.ListVO;
import org.sync.ganpan.model.vo.OrganizationVO;
import org.sync.ganpan.model.vo.PagingBean;
import org.sync.ganpan.model.vo.SignBoardVO;

/**
 * Group의 Business layer를 위한 ServiceClass
 * @author JYM
 *
 */
@Service
public class OrganizationServiceImpl implements OrganizationService {
	@Resource
	private OrganizationDAO organizationDAO;
	@Resource
	private MemberDAO memberDAO;
	@Resource
	private WorkDAO workDAO;

	@Override
	public int getJoinedSignBoardCount(String nickName) {
		return organizationDAO.getJoinedSignBoardCount(nickName);
	}

	@Override
	public List<OrganizationVO> getOrganizationSignBoardList(String nickName) {
		return organizationDAO.getOrganizationSignBoardList(nickName);
	}

	@Override
	@Transactional
	public ListVO<OrganizationVO> getOrganizationSignBoardList(String nickName, String pageNo) {
		PagingBean pb=null;
		int totalCount = organizationDAO.getJoinedSignBoardCount(nickName);
		if(pageNo==null)
			pb=new PagingBean(totalCount);
		else
			pb=new PagingBean(totalCount,Integer.parseInt(pageNo));
		Map<String,Object> map=new HashMap<String, Object>();
		map.put("nickName", nickName);
		map.put("getStartRowNumber", pb.getStartRowNumber());
		map.put("getEndRowNumber", pb.getEndRowNumber());
		List<OrganizationVO> list = organizationDAO.getOrganizationSignBoardList(map);
		return new ListVO<OrganizationVO>(list, pb);
	}

	@Override
	public void cancelInvitation(InvitationMngVO ivo) {
		organizationDAO.cancelInvitation(ivo);
	}

	@Override
	public void inviteWorker(InvitationMngVO ivo) {
		organizationDAO.inviteWorker(ivo);
	}

	/**
	 *  완료 by dhKim,민서
	 */
	@Override
	public List<OrganizationVO> getOrganizationList(SignBoardVO svo) {
		return organizationDAO.getOrganizationList(svo);
	}
	
	@Override
	@Transactional
	public ListVO<OrganizationVO> getOrganizationList(SignBoardVO svo, String pageNo) {
		PagingBean pb=null;
		int joinMemberTotalCount = organizationDAO.getTotalJoinMemberCount(svo);
		if(pageNo==null)
			pb=new PagingBean(joinMemberTotalCount);
		else
			pb=new PagingBean(joinMemberTotalCount,Integer.parseInt(pageNo));
		Map<String,Object> map=new HashMap<String, Object>();
		map.put("getStartRowNumber", pb.getStartRowNumber());
		map.put("getEndRowNumber", pb.getEndRowNumber());
		map.put("signBoardName", svo.getSignBoardName());
		map.put("bossNickName", svo.getBossMemberVO().getNickName());
		List<OrganizationVO> list=organizationDAO.getOrganizationList(map);
		return new ListVO<OrganizationVO>(list,pb);
	}
	

	@Override
	public String getNickNameByEmail(String id) {
		return organizationDAO.getNickNameByEmail(id);
	}

	@Override
	@Transactional
	public void banish(OrganizationVO ovo) {
		// work table에서 worker_nickName -> null로 update
		workDAO.updateWorkerToNull(ovo);

		// Organization worker_nickName을 삭제
		organizationDAO.deleteWorker(ovo);
	}

	@Override
	public List<HashMap<String, String>> sendInvitationList(SignBoardVO svo) {
		return organizationDAO.sendInvitationList(svo);
	}
	
	@Override
	public ListVO<HashMap<String, String>> sendInvitationList(SignBoardVO svo, String pageNo) {
		PagingBean pb=null;
		int TotalsendInvitationCount = organizationDAO.getTotalSendInvitationCount(svo);
		if(pageNo==null) // 페이지넘버 없이 들어왔을 시 PagingBean 초기값으로 생성한다
			pb=new PagingBean(TotalsendInvitationCount);
		else // 페이지 넘버가 함께 들어왔을 시 함께 생성자에 넣어 생성한다
			pb=new PagingBean(TotalsendInvitationCount,Integer.parseInt(pageNo));
		Map<String,Object> map=new HashMap<String, Object>();
		// 맵으로 pb에 있는 함수들을 이용해 값들을 organization.xml까지 넘겨준다
		map.put("getStartRowNumber", pb.getStartRowNumber());
		map.put("getEndRowNumber", pb.getEndRowNumber());
		map.put("signBoardName", svo.getSignBoardName());
		map.put("bossNickName", svo.getBossMemberVO().getNickName());
		List<HashMap<String, String>> list=organizationDAO.sendInvitationList(map);
		return new ListVO<HashMap<String, String>>(list,pb);
	}

	@Override
	public void leaveOrganization(OrganizationVO ovo) {
		organizationDAO.leaveOrganization(ovo);
	}

	@Override
	public String groupCheck(String id, String signBoardName, String bossNickName) {
		if(id.contains("@")==true){
			id=organizationDAO.getNickNameByEmail(id);
		}
		OrganizationVO ovo=new OrganizationVO(id,signBoardName,bossNickName);
		int nickNameCount = memberDAO.nickNameCheck(ovo.getWorkerMemberVO().getNickName());
		int groupCheck = organizationDAO.groupCheck(ovo);
		int workerSignBoardNameCheck = organizationDAO.workerSignBoardNameCheck(ovo);
		int inviteCheck = organizationDAO.inviteCheck(ovo);
		if( nickNameCount == 0){
			return "idfail";
		}else if(id.equals(bossNickName)){ // 그룹장 별명과 입력받은 아이디가 같을 때
			return "groupbossfail";
		}else if(inviteCheck == 1){ //이미 초대된 회원을 초대 했을 경우
			return "alreadyinvitefail";
		}else if(groupCheck == 0){ // 그룹에 속한 회원이 없을 때
			return "groupfail";
		}else if(workerSignBoardNameCheck == 1){ // 그룹원 중에 해당 칸반 이름과 동일한 칸반을 가지고 있을 때
			return "workersignboardfail";
		}
		return "ok";
	}

	@Override
	public boolean isInvitedOrganization(String nickName) {
		int countInvitation = organizationDAO.getInvitedCountByNickName(nickName);
		if(countInvitation != 0) {
			return true;
		}
		return false; // 초대 현황이 0인 경우
	}
}
