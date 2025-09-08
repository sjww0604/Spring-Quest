package kr.sparta.practical2_starter;

/*
 model
 */
public class Person { //클래스 선언
    private String name;
    private Integer age;
    private String mbti;
    private String favoriteFood;
    private String favoriteColor;

    public Person() {} //클래스 선언 이후 생성자 선언(초기화 방법에 대한 선언)

    public String getName() {return name;}
    public void setName(String name) {this.name = name;}

    public Integer getAge() {return age;}
    public void setAge(Integer age) {this.age = age;}

    public String getMbti() {return mbti;}
    public void setMbti(String mbti) {this.mbti = mbti;}

    public String getFavoriteFood() {return favoriteFood;}
    public void setFavoriteFood(String favoriteFood) {this.favoriteFood = favoriteFood;}

    public String getFavoriteColor() {return favoriteColor;}
    public void setFavoriteColor(String favoriteColor) {this.favoriteColor = favoriteColor;}
}
