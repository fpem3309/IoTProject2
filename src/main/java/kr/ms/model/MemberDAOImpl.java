package kr.ms.model;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.ms.model.MemberVO;

@Repository
public class MemberDAOImpl implements MemberDAO{
    @Autowired
    private SqlSessionFactory sqlSessionFactory;

    @Override
    public List<MemberVO> memberList(PagingVO vo) {
        SqlSession session = sqlSessionFactory.openSession();
        List<MemberVO> list = session.selectList("memberList", vo);
        session.close();
        return list;
    }
    
    @Override
    public int countPage() {
        SqlSession session = sqlSessionFactory.openSession();
        int cnt = session.selectOne("countPage");
        session.close();
        return cnt;
    };

    @Override
    public int memberInsert(MemberVO vo) {
        SqlSession session = sqlSessionFactory.openSession();
        int cnt = session.insert("memberInsert", vo);
        session.commit();
        session.close();
        return cnt;
    }

    @Override
    public int memberDelete(int msm_no) {
        SqlSession session = sqlSessionFactory.openSession();
        int cnt = session.delete("memberDelete", msm_no);
        session.commit();
        session.close();
        return cnt;
    }

    @Override
    public MemberVO memberContent(int msm_no) {
        SqlSession session = sqlSessionFactory.openSession();
        MemberVO vo = session.selectOne("memberContent", msm_no);
        session.close();
        return vo;
    }

    @Override
    public int memberUpdate(MemberVO vo) {
        SqlSession session = sqlSessionFactory.openSession();
        int cnt = session.update("memberUpdate", vo);
        session.commit();
        session.close();
        return cnt;
    }
    
    @Override
    public MemberVO loginOk(MemberVO vo) {
        SqlSession session = sqlSessionFactory.openSession();
        MemberVO vo1 = session.selectOne("loginOk", vo);
        session.close();
        return vo1;
    }
}
