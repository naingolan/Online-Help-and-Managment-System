package User;
public abstract class User extends Person {
    private String idRollNo;
    private String password; 
    private String fullname;
    private String course;

    public User(String idRollNo, String password, String fullname, String course) {
        this.idRollNo = idRollNo;
        this.password = password;
        this.fullname = fullname;
        this.course = course;
    }

    public User(String idRollNo, String fullname, String course) {
        this.idRollNo = idRollNo;
        this.fullname = fullname;
        this.course = course;
    }

   

    public User(String idRollNo, String password) {
        this.idRollNo = idRollNo;
        this.password = password;
    }

    public String getCourse() {
        return course;
    }

    public void setCourse(String course) {
        this.course = course;
    }

    public String getIdRollNo() {
        return idRollNo;
    }

    public void setIdRollNo(String idRollNo) {
        this.idRollNo = idRollNo;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getFullname() {
        return fullname;
    }

    public void setFullname(String fullname) {
        this.fullname = fullname;
    }
    @Override
    public String login(String idRollNo, String password){
        return "success";
    }
    @Override
    public String register(String idRollNo, String password, String fullname, String course){
        return "Success";
    }
    @Override
    public  String admin(String idRollNo, String Password){
        return "Success";
    }
  public String add(String idRollNo, String fullname, String course) {
     return "success";
  }
  
}
