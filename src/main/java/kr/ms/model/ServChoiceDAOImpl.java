package kr.ms.model;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ServChoiceDAOImpl implements ServChoiceDAO {

    @Autowired
    private SqlSessionFactory sqlSessionFactory;

    @Override
    public List<ServChoiceVO> servChoiceList(int msm_no) {
        SqlSession session = sqlSessionFactory.openSession();
        List<ServChoiceVO> list = session.selectList("servChoiceList", msm_no);
        session.close();
        return list;
    }

    @Override
    public List<ServChoiceVO> servChoiceList2(int msm_no) {
        SqlSession session = sqlSessionFactory.openSession();
        List<ServChoiceVO> list = session.selectList("servChoiceList2", msm_no);
        session.close();
        return list;
    }
    
    @Override
    public List<ServChoiceVO> servChoiceList3(int msm_no) {
        SqlSession session = sqlSessionFactory.openSession();
        List<ServChoiceVO> list = session.selectList("servChoiceList3", msm_no);
        session.close();
        return list;
    }
    
    @Override
    public List<ServChoiceVO> servChoiceList4(int msm_no) {
        SqlSession session = sqlSessionFactory.openSession();
        List<ServChoiceVO> list = session.selectList("servChoiceList4", msm_no);
        session.close();
        return list;
    }
    
    @Override
    public int servInsert(ServChoiceVO vo) {
        SqlSession session = sqlSessionFactory.openSession();
        int cnt = session.insert("servInsert", vo);
        session.commit();
        session.close();
        return cnt;
    }

    @Override
    public int parkOpen(ServChoiceVO vo) {
        SqlSession session = sqlSessionFactory.openSession();
        int cnt = session.update("parkOpen", vo);
        session.commit();
        session.close();
        return cnt;
    }

    @Override
    public int parkClose(ServChoiceVO vo) {
        SqlSession session = sqlSessionFactory.openSession();
        int cnt = session.update("parkClose", vo);
        session.commit();
        session.close();
        return cnt;
    }

    @Override
    public int servChoiceDelete(int msp_no) {
        SqlSession session = sqlSessionFactory.openSession();
        int cnt = session.delete("servChoiceDelete",msp_no);
        session.commit(); //완료
        session.close(); //반납
        return cnt;
    }
}
