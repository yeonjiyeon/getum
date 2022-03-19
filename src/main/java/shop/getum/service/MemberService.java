package shop.getum.service;

import shop.getum.domain.Member;

public interface MemberService {

    //회원가입(회원 생성)
    public Long join(Member member);

    //로그인(단일 회원 조회)
    public Member login();

    //회원 수정
    public void updateMember();


    //회원 삭제
    public void deleteMember();

    //전체 회원 조회(관리자 기능)
    public void retireMembers();
}
