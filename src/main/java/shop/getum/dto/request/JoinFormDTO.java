package shop.getum.dto.request;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import shop.getum.domain.common.Address;

import javax.validation.constraints.Email;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.Pattern;


@Data
@AllArgsConstructor
public class JoinFormDTO {
    @NotEmpty(message = "이메일을 입력 해 주세요.")
    @Email(message = "이메일의 형식을 맞춰주세요.")
    private String email;//회원 이메일

    @NotEmpty(message = "비밀번호를 입력 해 주세요.")
    @Pattern(regexp = "^(?=.*[a-zA-Z0-9`~!@#$%^&*()\\-_+=\\\\]).{8,10}$", message = "비밀번호는 영문/숫자/특수문자 조합 8자리~10자리")
    private String password;//회원비밀번호

    @NotEmpty(message = "비밀번호 확인을 입력 해 주세요.")
    private String rePassword;

    @NotEmpty(message = "이름을 입력 해 주세요.")
    private String name;//회원이름

    @NotEmpty(message = "전화번호를 입력 해 주세요.")
    private String telephone;//회원전화번호

    @NotEmpty(message = "주소를 입력 해 주세요.")
    private Address address;//회원 주소
}
