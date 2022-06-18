package shop.getum.domain.member;

import com.fasterxml.jackson.annotation.JsonIgnore;
import java.util.Set;
import javax.persistence.GeneratedValue;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.Table;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.NoArgsConstructor;
import shop.getum.domain.Authority;
import shop.getum.domain.common.Address;
import shop.getum.domain.common.BaseEntity;

import javax.persistence.Column;
import javax.persistence.Embedded;
import javax.persistence.Entity;
import javax.persistence.Id;

@NoArgsConstructor
@AllArgsConstructor
@Entity//데이터베이스 테이블로 1대 1 매핑되는 객체
@Getter
@Builder
@EqualsAndHashCode(of = "id")
@Table(name = "member")
public class Member extends BaseEntity {

    @JsonIgnore
    @Id
    @GeneratedValue
    @Column(name = "member_id")
    private Long id;//회원 아이디

    @Column(name = "member_email", unique = true)
    private String email;//회원 이메일

    @JsonIgnore
    @Column(name = "member_pw", nullable = false)
    private String password;//회원비밀번호

    @Column(name = "member_name", nullable = false)
    private String name;//회원이름

    @JsonIgnore
    @Column(name = "activated")
    private boolean activated;

    private boolean emailVerified;//이메일 인증 절차 위해 사용
    
    private String emailCheckToken;// 이메일 검증 토큰값

    //알림 설정
    private boolean orderByEmail;

    private boolean orderByWeb;

    @Column(name = "member_tel", nullable = false)
    private String telephone;//회원전화번호

    @Embedded
    @Column(nullable = false)
    private Address address;//회원 주소

    @ManyToMany
    @JoinTable(
        name = "member_authority",
        joinColumns = {@JoinColumn(name = "member_id", referencedColumnName = "member_id")},
        inverseJoinColumns = {@JoinColumn(name = "authority_name", referencedColumnName = "authority_name")})
    private Set<Authority> authorities;

    @Builder
    public Member(String email, String password, String name, String telephone, Address address) {
        this.email = email;
        this.password = password;
        this.name = name;
        this.telephone = telephone;
        this.address = address;
    }
}
