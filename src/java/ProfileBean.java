package beans;

import java.io.Serializable;

public class ProfileBean implements Serializable {
    private static final long serialVersionUID = 1L;
    
  
    private String name;
    private String studentId;
    private String program;
    private String email;
    private String hobbies;
    private String intro;
    
   
    public ProfileBean() {
    }
    
    public ProfileBean(String name, String studentId, String program, 
                      String email, String hobbies, String intro) {
        this.name = name;
        this.studentId = studentId;
        this.program = program;
        this.email = email;
        this.hobbies = hobbies;
        this.intro = intro;
    }
    
    public String getName() {
        return name;
    }
    
    public void setName(String name) {
        this.name = name;
    }
    
    public String getStudentId() {
        return studentId;
    }
    
    public void setStudentId(String studentId) {
        this.studentId = studentId;
    }
    
    public String getProgram() {
        return program;
    }
    
    public void setProgram(String program) {
        this.program = program;
    }
    
    public String getEmail() {
        return email;
    }
    
    public void setEmail(String email) {
        this.email = email;
    }
    
    public String getHobbies() {
        return hobbies;
    }
    
    public void setHobbies(String hobbies) {
        this.hobbies = hobbies;
    }
    
    public String getIntro() {
        return intro;
    }
    
    public void setIntro(String intro) {
        this.intro = intro;
    }
    
    @Override
    public String toString() {
        return "ProfileBean [name=" + name + ", studentId=" + studentId + 
               ", program=" + program + ", email=" + email + 
               ", hobbies=" + hobbies + ", intro=" + intro + "]";
    }
}