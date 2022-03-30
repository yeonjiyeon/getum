package shop.getum.controller.member;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
@Controller
public class MemberController {

    @GetMapping("/member")
    public String joinForm(Model model){
        return "member/joinForm";
    }
}
