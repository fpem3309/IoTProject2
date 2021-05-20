package kr.ms.smartcar;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.google.gson.Gson;

import kr.ms.model.MemberVO;
import kr.ms.model.ParkingDAO;
import kr.ms.model.ParkingVO;
import kr.ms.model.ServChoiceDAO;
import kr.ms.model.ServChoiceVO;

@Controller
public class ParkingController {
    @Autowired
    private ParkingDAO parkingDAO;
    
    @Autowired
    private ServChoiceDAO servchoiceDAO;

    @RequestMapping("/parkingList.do")
    public String parkingList(Model model) {
        try {
            List<ParkingVO> list = parkingDAO.parkingList(); // msp_type = 1인 컬럼만 출력하는 for문
            List<ParkingVO> list2 = parkingDAO.parkingList2();
            model.addAttribute("list", list);
            model.addAttribute("list2", list2);
        } catch (Exception e) {
            e.printStackTrace();
         }
        return "parkingList";
    }

    /*주차관리(관리자)*/
    @RequestMapping("/parkingForm.do")
    public String ParkingInsertForm() {
        return "parkingForm";
    }

    @RequestMapping("/parkingInsert.do")
    public String parkingInsert(ParkingVO vo) {
        int cnt = parkingDAO.parkingInsert(vo);
        return "redirect:parkingList.do";
    }

    @RequestMapping("/parkingContent.do")
    public String parkingContent() {
        return "redirect:parkingList.do";
    }

    @RequestMapping("/parkingDelete.do")
    public String parkingDelete() {
        return "redirect:parkingList.do";
    }
    /*주차관리(관리자*/

    /*주차관리(사용자)*/
    @RequestMapping("/parkingList2.do")
    public String parkingList2(Model model) {
        try {
            List<ParkingVO> list = parkingDAO.parkingList();
            List<ParkingVO> list2= parkingDAO.parkingList2();
            model.addAttribute("list", list);
            model.addAttribute("list2", list2);
        } catch (Exception e) {
            e.printStackTrace();
         }
        return "parkingList2";
    }
    
    @RequestMapping("/parkingList21.do")
    public void parkingList21(@RequestParam("msp_type") int msp_type, Model model, HttpServletResponse response) {
        Gson g = new Gson();
        PrintWriter out = null;
        response.setContentType("text/json; charset=UTF-8");
        String gList  = null;
        
        if(msp_type == 1) {
            List<ParkingVO> list = parkingDAO.parkingList(); //월간타입
            gList = g.toJson(list);
        } else if(msp_type == 2) {
            List<ParkingVO> list= parkingDAO.parkingList2(); //일간타입
            gList = g.toJson(list);
        }
        
        try {
           out = response.getWriter();
        } catch (IOException e) {
           e.printStackTrace();
        }
        out.println(gList);
    }

    @RequestMapping("/areaPage.do")
    public String areaPage() {
        return "areaPage";  
    }
        
    @RequestMapping("/parkingPage.do")
    public String parkingPage(@RequestParam("msp_no") int msp_no, Model model) {
        try {
            ParkingVO vo = parkingDAO.mspNo(msp_no);
            model.addAttribute("vo",vo);
        } catch (Exception e) {
            e.printStackTrace();
         }
        return "parkingPage";
    }

    @RequestMapping("/parkingPage2.do")
    public String parkingPage2(@RequestParam("msp_no") int msp_no, Model model) {
        try {
            ParkingVO vo = parkingDAO.mspNo(msp_no);
            model.addAttribute("vo",vo);
        } catch (Exception e) {
            e.printStackTrace();
         }
        return "parkingPage2";
    }
    
    @RequestMapping("/parkPage.do")
    public void parkPage(@RequestParam("msp_no") int msp_no, Model model, HttpServletResponse response) {
        Gson g = new Gson();
        PrintWriter out = null;
        response.setContentType("text/json; charset=UTF-8");
        ParkingVO vo = parkingDAO.mspNo(msp_no);
        String gList = g.toJson(vo);
        try {
            out = response.getWriter();
         } catch (IOException e) {
            e.printStackTrace();
         }
         out.println(gList);
    }

    @RequestMapping("/popupPage.do")
    public String popupPage(ServChoiceVO vo, Model model, HttpSession session) {
        MemberVO memberVO = (MemberVO) session.getAttribute("mem"); //회원정보 가져오기
        ParkingVO parkingVO = parkingDAO.mspNo(vo.getMsp_no()); //등록된 주차장 가져오기
        vo.setMsr_price(3000);
        vo.setMsr_status(1);
        vo.setMsm_no(memberVO.getMsm_no());
        
        try {
            int cnt = parkingDAO.choiceUpdate(parkingVO);
            int cnt2 = servchoiceDAO.servInsert(vo);
            //model.addAttribute("vo",parkingVO);
        } catch (Exception e) {
            e.printStackTrace();
         }
        return "popupPage";
    }

    @RequestMapping("/delete.do")
    public String timeDelete(@RequestParam("msr_usedate") int msr_usedate, Model model){
        try {
            int cnt = parkingDAO.timeDelete(msr_usedate);
        } catch (Exception e) {
            e.printStackTrace();
         }
        return "redirect: parking.do";
    }
    /*주차관리(사용자)*/
}
