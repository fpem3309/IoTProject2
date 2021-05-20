package kr.ms.model;

import java.util.List;

public interface MemberDAO {
    public int countPage(); // 총 회원수
    // public List<MemberVO> memberList(); //회원 전체 목록
    public List<MemberVO> memberList(PagingVO vo); // 페이징 처리 회원조회
    public int memberInsert(MemberVO vo); // 회원 가입
    public int memberDelete(int num); // 회원삭제
    public MemberVO memberContent(int mem_no); // 회원정보 보기
    public int memberUpdate(MemberVO vo); // 회원정보 수정
    public MemberVO loginOk(MemberVO vo); // 로그인
}
