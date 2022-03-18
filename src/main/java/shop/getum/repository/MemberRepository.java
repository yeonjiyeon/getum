package shop.getum.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import shop.getum.domain.Member;

public interface MemberRepository extends JpaRepository<Member, String> {
}
