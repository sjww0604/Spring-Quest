package practical4;

public class Menu {
    private final String name;
    private final String spice;
    private final int price;

    public Menu(String name, String spice, int price) {
        this.name = name;
        this.spice = spice;
        this.price = price;
    }

    public String getName() { return name; }
    public String getSpice() { return spice; }
    public int getPrice() { return price; }

}
