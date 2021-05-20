package kr.ms.model;

import java.util.List;

public interface ParkingDAO {
    public int parkingInsert(ParkingVO vo);
    public List<ParkingVO> parkingList(); //주차등록내역(월권)
    public List<ParkingVO> parkingList2(); //주차등록내역(일권)
    public ParkingVO mspNo(int msp_no); //등록된 주차장 한개 가져오기
    public int timeDelete(int msr_usedate);//시간 삭제
    public int choiceUpdate(ParkingVO vo);
}
