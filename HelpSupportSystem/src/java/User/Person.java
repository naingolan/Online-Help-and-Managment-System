package User;
public abstract class Person {
    public abstract String login(String idRollNo, String password);
    public abstract String admin(String idRollNo, String Password);
    public abstract String register(String idRollNo, String password, String fullname, String course);
  
}
