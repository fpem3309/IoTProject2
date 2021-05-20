package kr.ms.model;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class NoticeBoardDAOImpl implements NoticeBoardDAO{

	@Autowired
	private SqlSessionFactory sqlSessionFactory;
	
	
	@Override
	public List<NoticeBoardVO> noticeBoardList(PagingVO vo) {
		SqlSession session = sqlSessionFactory.openSession();
		List<NoticeBoardVO> list = session.selectList("noticeBoardList", vo);
		session.close();
		return list;
	}

    @Override
    public int noticeCountPage() {
        SqlSession session = sqlSessionFactory.openSession();
        int cnt = session.selectOne("noticeCountPage");
        session.close();
        return cnt;
    };
    
	@Override
	public int noticeBoardInsert(NoticeBoardVO vo) {
		SqlSession session = sqlSessionFactory.openSession();
		int cnt = session.insert("noticeBoardInsert",vo);
		session.commit();
		session.close();
		return cnt;
	}

	@Override
	public int noticeBoardDelete(int msnb_no) {
		SqlSession session = sqlSessionFactory.openSession();
		int cnt = session.delete("noticeBoardDelete",msnb_no);
		session.commit(); //완료
		session.close(); //반납
		return cnt;
	}

	@Override
	public NoticeBoardVO noticeBoardContent(int msnb_no) {
		SqlSession session = sqlSessionFactory.openSession();
		NoticeBoardVO vo = session.selectOne("noticeBoardContent",msnb_no);
		session.close(); //반납
		return vo;
	}
	
	@Override
	public int boardHit(int msnb_no) {
		SqlSession session = sqlSessionFactory.openSession();
		int cnt = session.update("boardHit", msnb_no);
		session.commit(); //완료
		session.close(); //반납
		return cnt;
	}

	@Override
	public int noticeBoardUpdate(NoticeBoardVO vo) {
		SqlSession session = sqlSessionFactory.openSession();
		int cnt = session.update("noticeBoardUpdate",vo);
		session.commit(); //완료
		session.close(); //반납
		return cnt;
	}

}
