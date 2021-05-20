package kr.ms.model;

import java.util.List;

public interface ServChoiceDAO {
    public int servInsert(ServChoiceVO vo); //예약 넣기
    public List<ServChoiceVO> servChoiceList(int msm_no); // 주차장 예약 리스트 (1.월권)
    public List<ServChoiceVO> servChoiceList2(int msm_no); // 주차장 예약 리스트 (2.일권)
    
    public List<ServChoiceVO> servChoiceList3(int msm_no); //관리자 월권 예약 보기
    public List<ServChoiceVO> servChoiceList4(int msm_no); //관리자 일권 예약 보기
    
    public int parkOpen(ServChoiceVO vo); //문열기
    public int parkClose(ServChoiceVO vo); //문닫기

    public int servChoiceDelete(int msp_no); //관리자 예약 삭제
}
