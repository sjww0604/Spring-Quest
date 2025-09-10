package practical4;

//DTO 개념 java class
public class Menu {
    private final String name;
    private final int price;
    private final String spice; // "MILD" | "NORMAL" | "HOT" 3단계로 구성
    private final String desc;

    public Menu(String name, int price, String spice, String desc) {
        this.name = name;
        this.price = price;
        this.spice = spice;
        this.desc = desc;
    }

    public String getName() {return name;}
    public int getPrice() {return price;}
    public String getSpice() {return spice;}
    public String getDesc() {return desc;}
}
