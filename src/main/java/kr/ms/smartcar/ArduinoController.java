package kr.ms.smartcar;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.google.gson.Gson;

import kr.ms.model.ArduinoDAO;
import kr.ms.model.ArduinoVO;

@Controller
public class ArduinoController {
    @Autowired
    private  ArduinoDAO arduinoDAO;

    @RequestMapping("/AduinoCheck")
    public void ArduinoCheck(Model model, HttpServletResponse resp){
       String a = "";
       
       try {
           //데이터 베이스에서 가져온 select 값
           List<ArduinoVO> list = arduinoDAO.arduinoList(); //첫번째 모터
           List<ArduinoVO> list2 = arduinoDAO.arduinoList2(); //두번째 모터
           
           Gson g=new Gson();
           String json=g.toJson(list);
           String json2=g.toJson(list2);
           String replace = json2.replace("msr_no", "msr_no2");
           String replace2 = replace.replace("msr_use", "msr_use2");
           
           a += json;
           a += replace2;
           String replace3 = a.replace("}][{", ",");
           String replace4 = replace3.replace('[', '/');
           String replace5 = replace4.replace(']', '/');
           
           // 전송해주어야 할 값 /{"msr_no":1,"msr_use":0,"msr_no2":4,"msr_use2":0}/
           PrintWriter out = null;
        
          out = resp.getWriter();
          out.print(replace5);
       } catch (IOException e) {
          e.printStackTrace();
       }
    }
}
