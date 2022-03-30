package shop.getum.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import shop.getum.domain.member.Member;

public interface MemberRepository extends JpaRepository<Member, String> {

}
