package com.hb.command;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hb.mybatis.Dao;
import com.hb.mybatis.NoticeVO;
import com.hb.mybatis.Paging;

public class NoticeListCommand implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		Paging pvo = new Paging();
		Dao dao = new Dao();
		
		String cPage = request.getParameter("cPage");
		if(cPage=="") cPage="1";
		if(cPage != null){
			pvo.setNowPage(Integer.parseInt(cPage));
		}
		
		pvo.setTotalRecord(dao.noticeTotalCount());
		pvo.setTotalPage();
		
		pvo.setBegin((pvo.getNowPage()-1)*pvo.getNumPerPage()+1);
		pvo.setEnd((pvo.getBegin()-1)+pvo.getNumPerPage());
		
		Map<String, Integer> map = new HashMap<>();
		
		map.put("begin", pvo.getBegin());
		map.put("end", pvo.getEnd());
				
		List<NoticeVO> list = dao.getNoticeList(map);
		request.setAttribute("a_noticeList", list);
				
		pvo.setBeginPage(((int)(pvo.getNowPage()-1)/pvo.getPagePerBlock())*pvo.getPagePerBlock()+1);
		pvo.setEndPage(pvo.getBeginPage() + pvo.getPagePerBlock()-1);
		
		if(pvo.getEndPage()>pvo.getTotalPage()){
			pvo.setEndPage(pvo.getTotalPage());
		}
		
		request.setAttribute("pvo", pvo);
		request.setAttribute("cPage", cPage);
		
		return "board/noticelist.jsp";
	}
	
}
