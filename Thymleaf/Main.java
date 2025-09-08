import org.thymeleaf.TemplateEngine;
import org.thymeleaf.context.Context;
import org.thymeleaf.templateresolver.ClassLoaderTemplateResolver;

public class Main {
    public static void main(String[] args) {
        // 템플릿 엔진 설정
        ClassLoaderTemplateResolver resolver = new ClassLoaderTemplateResolver();
        resolver.setPrefix("templates/");
        resolver.setSuffix(".html");
        resolver.setTemplateMode("HTML");
        resolver.setCharacterEncoding("UTF-8");

        TemplateEngine engine = new TemplateEngine();
        engine.setTemplateResolver(resolver);

        // Java 객체 생성 및 데이터 바인딩
        User user = new User("홍길동", "test@example.com");
        Context context = new Context();
        context.setVariable("user", user);

        // 렌더링 실행
        String result = engine.process("user", context);
        System.out.println(result);
    }
}