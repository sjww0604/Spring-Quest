import org.thymeleaf.TemplateEngine;
import org.thymeleaf.context.Context;
import org.thymeleaf.templateresolver.ClassLoaderTemplateResolver;

import java.util.List;

public class ProductController {
    public static String render(String userName, List<Product> products) {
        TemplateEngine engine = new TemplateEngine();

        ClassLoaderTemplateResolver resolver = new ClassLoaderTemplateResolver();
        resolver.setPrefix("templates/");
        resolver.setSuffix(".html");
        resolver.setTemplateMode("HTML");
        resolver.setCharacterEncoding("UTF-8");

        engine.setTemplateResolver(resolver);

        Context context = new Context();
        context.setVariable("userName", userName);
        context.setVariable("products", products);

        return engine.process("product", context); // product.html
    }
}