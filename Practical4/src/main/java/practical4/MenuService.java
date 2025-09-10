package practical4;

import java.util.*;

public class MenuService {
    private MenuService() {}
    private static final List<Menu> menuList = new ArrayList<>();
    public static void add(Menu menu) { menuList.add(menu); }
    public static List<Menu> findAll() { return Collections.unmodifiableList(menuList); }
}