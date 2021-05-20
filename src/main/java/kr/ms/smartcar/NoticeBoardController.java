package kr.ms.smartcar;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.ms.model.NoticeBoardDAO;
import kr.ms.model.NoticeBoardVO;
import kr.ms.model.PagingVO;

@Controller
public class NoticeBoardController {

	@Autowired
	private NoticeBoardDAO noticeboardDAO;

	@RequestMapping("/boardList.do")
	public String noticeBoardList(PagingVO vo, Model model) {
        int total = noticeboardDAO.noticeCountPage();
        if(vo.getNowPage() == 0 && vo.getCntPerPage() == 0) {
            vo.setNowPage(1);
            vo.setCntPerPage(10);
        } else if(vo.getNowPage() == 0) {
            vo.setNowPage(1);
        } else if(vo.getCntPerPage() == 0) {
            vo.setCntPerPage(10);
        }
        vo = new PagingVO(total, vo.getCntPage(), vo.getNowPage(), vo.getCntPerPage());
		List<NoticeBoardVO> list = noticeboardDAO.noticeBoardList(vo);
		model.addAttribute("paging", vo);
		model.addAttribute("list", list);
		return "noticeBoardList";
	}
		@RequestMapping("/boardForm.do")
	public String noticeBoardInsertForm(Model model) {
		return "noticeBoardForm";
	}
	@RequestMapping("/boardInsert.do")
	public String noticeBoardInsert(NoticeBoardVO vo) {
		int cnt = noticeboardDAO.noticeBoardInsert(vo);
		return "redirect:boardList.do";
	}
	@RequestMapping("/boardContent.do")
	public String noticeBoardContent(@RequestParam("msnb_no") int msnb_no, Model model) {
		NoticeBoardVO vo = noticeboardDAO.noticeBoardContent(msnb_no);
		model.addAttribute("vo", vo);
		model.addAttribute("msnb_no", msnb_no);
		
		//조회수 올려주는 부분을 추가
		noticeboardDAO.boardHit(msnb_no);
		//model.addAttribute("cnt", cnt);
		//model.addAttribute("msnb_no", msnb_no);
		return "noticeBoardContent";
	}
	@RequestMapping("/boardUpdate.do")
	public String noticeBoardUpate(NoticeBoardVO vo) {
		int cnt = noticeboardDAO.noticeBoardUpdate(vo);
		return "redirect:boardList.do";
	}
	@RequestMapping("/boardDelete.do")
	public String noticeBoardDelete(@RequestParam("msnb_no") int msnb_no){
		int cnt = noticeboardDAO.noticeBoardDelete(msnb_no);
		return "redirect:boardList.do";
	}

}
