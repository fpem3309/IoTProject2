package kr.ms.smartcar;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.ms.model.MemberVO;
import kr.ms.model.ServChoiceDAO;
import kr.ms.model.ServChoiceVO;

@Controller
public class ReservController {

    @Autowired
    private ServChoiceDAO servchoiceDAO;

    @RequestMapping("/resvPage.do")
    public String resvPage(Model model, HttpSession session) {
        try {
            MemberVO memberVO = (MemberVO) session.getAttribute("mem");
            List<ServChoiceVO> list = servchoiceDAO.servChoiceList(memberVO.getMsm_no()); // 회원고유번호 월권
            List<ServChoiceVO> list2 = servchoiceDAO.servChoiceList2(memberVO.getMsm_no());
            model.addAttribute("list", list);
            model.addAttribute("list2", list2);
        } catch (Exception e) {
            e.printStackTrace();
         }
        return "resvPage";
    }

    @RequestMapping("/parkOpen.do")
    //msm_no, msp_no, msr_no, msp_type
    public String parkOpen(ServChoiceVO vo, Model model) {
        vo.toString();
        try {
            int cnt = servchoiceDAO.parkOpen(vo);
        } catch (Exception e) {
            e.printStackTrace();
         }
        return "redirect:resvPage.do";
    }

    //
    @RequestMapping("/parkClose.do")
    public String parkClose(ServChoiceVO vo, Model model) {
        try {
            int cnt = servchoiceDAO.parkClose(vo);
        } catch (Exception e) {
            e.printStackTrace();
         }
        return "redirect:resvPage.do";
    }
    
    @RequestMapping("/resvPageManager.do")
    public String resvPageManager(Model model, HttpSession session) {
        try {
            MemberVO memberVO = (MemberVO) session.getAttribute("mem");
            List<ServChoiceVO> list3 = servchoiceDAO.servChoiceList3(memberVO.getMsm_no()); //회원고유번호 월권
            List<ServChoiceVO> list4 = servchoiceDAO.servChoiceList4(memberVO.getMsm_no());
            model.addAttribute("list3",list3);
            model.addAttribute("list4",list4);
        } catch (Exception e) {
            e.printStackTrace();
         }
        return "resvPageManager";
    }
   
   @RequestMapping("/resvDelete.do")
   public String ServChoiceDelete(@RequestParam("msr_no") int msr_no) {
       try {
        int cnt = servchoiceDAO.servChoiceDelete(msr_no);
       } catch (Exception e) {
           e.printStackTrace();
        }
        return "redirect:resvPageManager.do";
   }
}
