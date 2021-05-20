package kr.ms.model;

public class MemberVO {
    private int msm_no;
    private String msm_id;
    private String msm_password;
    private String msm_name;
    private String msm_phone;
    private String msm_email;
    private int msm_level_no;
    private int msm_point;
    private String msm_car;
    private int msm_denied;
    
    public int getMsm_no() {
        return msm_no;
    }
    public void setMsm_no(int msm_no) {
        this.msm_no = msm_no;
    }
    public String getMsm_id() {
        return msm_id;
    }
    public void setMsm_id(String msm_id) {
        this.msm_id = msm_id;
    }
    public String getMsm_password() {
        return msm_password;
    }
    public void setMsm_password(String msm_password) {
        this.msm_password = msm_password;
    }
    public String getMsm_name() {
        return msm_name;
    }
    public void setMsm_name(String msm_name) {
        this.msm_name = msm_name;
    }
    public String getMsm_phone() {
        return msm_phone;
    }
    public void setMsm_phone(String msm_phone) {
        this.msm_phone = msm_phone;
    }
    public String getMsm_email() {
        return msm_email;
    }
    public void setMsm_email(String msm_email) {
        this.msm_email = msm_email;
    }
    public int getMsm_level_no() {
        return msm_level_no;
    }
    public void setMsm_level_no(int msm_level_no) {
        this.msm_level_no = msm_level_no;
    }
    public int getMsm_point() {
        return msm_point;
    }
    public void setMsm_point(int msm_point) {
        this.msm_point = msm_point;
    }
    public String getMsm_car() {
        return msm_car;
    }
    public void setMsm_car(String msm_car) {
        this.msm_car = msm_car;
    }
    public int getMsm_denied() {
        return msm_denied;
    }
    public void setMsm_denied(int msm_denied) {
        this.msm_denied = msm_denied;
    }
    public MemberVO(int msm_no, String msm_id, String msm_password, String msm_name, String msm_phone, String msm_email,
            int msm_level_no, int msm_point, String msm_car, int msm_denied) {
        super();
        this.msm_no = msm_no;
        this.msm_id = msm_id;
        this.msm_password = msm_password;
        this.msm_name = msm_name;
        this.msm_phone = msm_phone;
        this.msm_email = msm_email;
        this.msm_level_no = msm_level_no;
        this.msm_point = msm_point;
        this.msm_car = msm_car;
        this.msm_denied = msm_denied;
    }
    public MemberVO() {
        super();
    }
    
    @Override
    public String toString() {
        return "MemberVO [msm_no=" + msm_no + ", msm_id=" + msm_id + ", msm_password=" + msm_password + ", msm_name="
                + msm_name + ", msm_phone=" + msm_phone + ", msm_email=" + msm_email + ", msm_level_no=" + msm_level_no
                + ", msm_point=" + msm_point + ", msm_car=" + msm_car + ", msm_denied=" + msm_denied + "]";
    }
}
