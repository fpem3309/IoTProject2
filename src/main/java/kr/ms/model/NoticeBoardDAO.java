package kr.ms.model;

import java.util.List;

import org.springframework.ui.Model;

public interface NoticeBoardDAO {
    public int noticeCountPage(); //전체게시글
	public List<NoticeBoardVO> noticeBoardList(PagingVO vo); // 게시판 리스트
	public int noticeBoardInsert(NoticeBoardVO vo); //게시판 추가
	public int noticeBoardDelete(int msnb_no); //게시물 삭제(회원)
	public NoticeBoardVO noticeBoardContent(int msnb_no); //게시물 상세정보 가져오기(내용)
	public int boardHit(int msnb_no); //게시글 조회수 올리기
	public int noticeBoardUpdate(NoticeBoardVO vo); //게시물 수정
}
