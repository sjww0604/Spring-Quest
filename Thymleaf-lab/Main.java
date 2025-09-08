import java.util.List;

public class Main {
    public static void main(String[] args) {
        List<Product> productList = List.of(
            new Product("노트북", 1500000, 5),
            new Product("마우스", 25000, 20),
            new Product("키보드", 70000, 10)
        );

        String result = ProductController.render("알렉", productList);
        System.out.println(result);
    }
}