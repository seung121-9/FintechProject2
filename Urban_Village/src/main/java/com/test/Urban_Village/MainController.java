package com.test.Urban_Village; // 실제 패키지 경로에 맞게 수정

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MainController {

    @RequestMapping("/urban/main") // 이 URL로 접속하면 JSP 파일이 표시됩니다.
    public String showMainPage() {
        return "urbanMain"; // "main"은 뷰 이름으로, main.jsp 파일을 찾습니다.
    }
}