package shop.getum.domain;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import shop.getum.domain.common.Address;
import shop.getum.domain.common.BaseEntity;

import javax.persistence.Column;
import javax.persistence.Embedded;
import javax.persistence.Entity;
import javax.persistence.Id;

@NoArgsConstructor
@AllArgsConstructor
@Entity
@Getter
public class member extends BaseEntity {
    @Id
    @Column(name = "member_email")
    private String email;//회원 이메일

    @Column(name = "member_pw")
    private String password;//회원비밀번호

    @Column(name = "member_name")
    private String name;//회원이름

    @Column(name = "member_tel")
    private String telephone;//회원전화번호

    @Embedded
    private Address address;//회원 주소
}
