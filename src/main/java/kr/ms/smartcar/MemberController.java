package kr.ms.smartcar;

import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.ms.model.MemberDAO;
import kr.ms.model.MemberVO;
import kr.ms.model.PagingVO;

//localhost:8082/smartcar/list.do
@Controller
public class MemberController {
    
    @Autowired
    private MemberDAO memberDAO;
    
    @RequestMapping("/memberList.do")
    public String memberList(PagingVO vo, Model model) {
        int total = memberDAO.countPage();
        if(vo.getNowPage() == 0 && vo.getCntPerPage() == 0) {
            vo.setNowPage(1);
            vo.setCntPerPage(10);
        } else if(vo.getNowPage() == 0) {
            vo.setNowPage(1);
        } else if(vo.getCntPerPage() == 0) {
            vo.setCntPerPage(10);
        }
        
        vo = new PagingVO(total, vo.getCntPage(), vo.getNowPage(), vo.getCntPerPage());
        List<MemberVO> list = memberDAO.memberList(vo);
        model.addAttribute("paging", vo);
        model.addAttribute("list", list);
        return "memberList";
    }
    
    @RequestMapping("/memberForm.do")
    public String insertForm() {
        return "memberForm";
    }
    
    @RequestMapping("/memberInsert.do")
    public String memberInsert(MemberVO vo, Model model) {
        try {
            int cnt = memberDAO.memberInsert(vo);
            model.addAttribute("msg", "회원가입 성공");
        } catch(NullPointerException e) {
            model.addAttribute("msg", "회원가입 실패");
        }
        return "redirect:/";
    }
    
    @RequestMapping("/memberDelete.do")
    public String memberDelete(@RequestParam("msm_no") int msm_no) {
        int cnt = memberDAO.memberDelete(msm_no);
        return "redirect:memberList.do";
    }
    
    @RequestMapping("/memberContent.do")
    public String memberContent(@RequestParam("msm_no") int msm_no, Model model) {
        MemberVO vo = memberDAO.memberContent(msm_no);
        model.addAttribute("vo", vo);
        return "memberContent";
    }
    
    @RequestMapping("/memberUpdate.do")
    public String memberUpdate(MemberVO vo) {
        System.out.println(vo);
        int cnt = memberDAO.memberUpdate(vo);
        return "redirect:memberList.do";
    }
    
    @RequestMapping("/")
    public String main() {
        return "main";
    }
    
    @RequestMapping("/main.do")
    public String mainPage() {
        return "main";
    }
    
    @RequestMapping("/loginForm")
    public String loginForm() {
        return "loginForm";
    }
    
    @RequestMapping("/login.do")
    public String loginOk(MemberVO vo, Model model, HttpSession session) {
        MemberVO vo1 = null;
        try {
            vo1 = memberDAO.loginOk(vo);
            model.addAttribute("vo", vo1);
            session.setAttribute("mem", vo1);
            if(vo1.getMsm_level_no() == 1) {
                session.setAttribute("isAdmin", "true"); //관리자
            }
            model.addAttribute("msg", "로그인성공");
        } catch(NullPointerException e) {
            model.addAttribute("msg", "로그인실패");
        }
        return "redirect:/";
    }
    
    @RequestMapping("/logout.do")
    public String logout(HttpSession session) {
        session.invalidate();
        return "redirect:/";
    }
}
