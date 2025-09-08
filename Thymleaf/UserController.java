import org.thymeleaf.TemplateEngine;
import org.thymeleaf.context.Context;
import org.thymeleaf.templateresolver.ClassLoaderTemplateResolver;
public class UserController {
  public static String render(User user) {
    TemplateEngine engine = new TemplateEngine();
    ClassLoaderTemplateResolver resolver = new ClassLoaderTemplateResolver();
    resolver.setPrefix("/templates/");
    resolver.setSuffix(".html");
    resolver.setTemplateMode("HTML");
    engine.setTemplateResolver(resolver);
    
    Context context = new Context();
    context.setVariable("user", user);
    return engine.process("user", context);
  }
}