package kr.sparta.practical2_starter;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

/*
 Controller ?
 사용자의 요청을 처음으로 받아서
 어떤 작업을 해야 할지 판단하고** 그 작업을 Service에게 시키는 역할을 해요.
 */
@Controller
public class IntroController {

    // 스프링에서 관리하는 객체를 자동으로 주입해주는 애노테이션
    @Autowired
    private MbtiEmojiService mbtiEmojiService;

    // 폼 보여주기
    @GetMapping("/")
    public String form(Model model) {
        model.addAttribute("person", new Person());
        return "form";  //templates/form.html
    }

    // 제출 처리
    @PostMapping("/intro")
    public String submit(@ModelAttribute("person")  Person person, Model model) {
        String emoji = mbtiEmojiService.emojiFor(person.getMbti());
        model.addAttribute("emoji", emoji);
        return "result"; // templates.result.html
    }
}
