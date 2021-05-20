package kr.ms.model;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.ms.model.ParkingVO;

@Repository
public class ParkingDAOImpl implements ParkingDAO {

    @Autowired
    private SqlSessionFactory sqlSessionFactory;

    @Override
    public int parkingInsert(ParkingVO vo) {
        SqlSession session = sqlSessionFactory.openSession();
        int cnt = session.insert("parkingInsert", vo);
        session.commit();
        session.close();
        return cnt;
    }

    @Override
    public List<ParkingVO> parkingList() {
        SqlSession session = sqlSessionFactory.openSession();
        List<ParkingVO> list = session.selectList("parkingList");
        session.close();
        return list;
    }

    @Override
    public List<ParkingVO> parkingList2() {
        SqlSession session = sqlSessionFactory.openSession();
        List<ParkingVO> list = session.selectList("parkingList2");
        session.close();
        return list;
    }

    @Override
    public ParkingVO mspNo(int msp_no) {
        SqlSession session = sqlSessionFactory.openSession();
        ParkingVO vo = session.selectOne("mspNo", msp_no);
        session.close();
        return vo;  
    }

    @Override
    public int choiceUpdate(ParkingVO vo) {
        SqlSession session = sqlSessionFactory.openSession();
        int cnt = session.update("choiceUpdate", vo);
        session.commit();
        session.close();
        return cnt;
    }

    @Override
    public int timeDelete(int msr_usedate) {
        SqlSession session = sqlSessionFactory.openSession();
        int cnt =session.delete("timeDelete", msr_usedate);
        session.commit();
        session.close();
        return cnt;
    }}
