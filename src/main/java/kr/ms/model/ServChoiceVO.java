package kr.ms.model;

public class ServChoiceVO {
    private int msr_no;
    private int msp_no;
    private int msr_num;
    private String msr_date;
    private int msr_price;
    private int msm_no;
    private int msr_status;
    private int msr_reserv;
    private String msr_usedate;
    private String msr_usedate2;
    private int msr_use;
    private String msp_location;
    private int msp_type;
    private String msm_name;
    
    public int getMsr_no() {
        return msr_no;
    }
    public void setMsr_no(int msr_no) {
        this.msr_no = msr_no;
    }
    public int getMsp_no() {
        return msp_no;
    }
    public void setMsp_no(int msp_no) {
        this.msp_no = msp_no;
    }
    public int getMsr_num() {
        return msr_num;
    }
    public void setMsr_num(int msr_num) {
        this.msr_num = msr_num;
    }
    public String getMsr_date() {
        return msr_date;
    }
    public void setMsr_date(String msr_date) {
        this.msr_date = msr_date;
    }
    public int getMsr_price() {
        return msr_price;
    }
    public void setMsr_price(int msr_price) {
        this.msr_price = msr_price;
    }
    public int getMsm_no() {
        return msm_no;
    }
    public void setMsm_no(int msm_no) {
        this.msm_no = msm_no;
    }
    public int getMsr_status() {
        return msr_status;
    }
    public void setMsr_status(int msr_status) {
        this.msr_status = msr_status;
    }
    public int getMsr_reserv() {
        return msr_reserv;
    }
    public void setMsr_reserv(int msr_reserv) {
        this.msr_reserv = msr_reserv;
    }
    public String getMsr_usedate() {
        return msr_usedate;
    }
    public void setMsr_usedate(String msr_usedate) {
        this.msr_usedate = msr_usedate;
    }
    public String getMsr_usedate2() {
        return msr_usedate2;
    }
    public void setMsr_usedate2(String msr_usedate2) {
        this.msr_usedate2 = msr_usedate2;
    }
    public int getMsr_use() {
        return msr_use;
    }
    public void setMsr_use(int msr_use) {
        this.msr_use = msr_use;
    }
    public String getMsp_location() {
        return msp_location;
    }
    public void setMsp_location(String msp_location) {
        this.msp_location = msp_location;
    }
    public int getMsp_type() {
        return msp_type;
    }
    public void setMsp_type(int msp_type) {
        this.msp_type = msp_type;
    }
    public String getMsm_name() {
        return msm_name;
    }
    public void setMsm_name(String string) {
        this.msm_name = string;
    }
    public ServChoiceVO(int msr_no, int msp_no, int msr_num, String msr_date, int msr_price, int msm_no, int msr_status,
            int msr_reserv, String msr_usedate, String msr_usedate2, int msr_use, String msp_location, int msp_type,
            String msm_name) {
        super();
        this.msr_no = msr_no;
        this.msp_no = msp_no;
        this.msr_num = msr_num;
        this.msr_date = msr_date;
        this.msr_price = msr_price;
        this.msm_no = msm_no;
        this.msr_status = msr_status;
        this.msr_reserv = msr_reserv;
        this.msr_usedate = msr_usedate;
        this.msr_usedate2 = msr_usedate2;
        this.msr_use = msr_use;
        this.msp_location = msp_location;
        this.msp_type = msp_type;
        this.msm_name = msm_name;
    }
    
    public ServChoiceVO() {
        super();
    }
    @Override
    public String toString() {
        return "ServChoiceVO [msr_no=" + msr_no + ", msp_no=" + msp_no + ", msr_num=" + msr_num + ", msr_date="
                + msr_date + ", msr_price=" + msr_price + ", msm_no=" + msm_no + ", msr_status=" + msr_status
                + ", msr_reserv=" + msr_reserv + ", msr_usedate=" + msr_usedate + ", msr_usedate2=" + msr_usedate2
                + ", msr_use=" + msr_use + ", msp_location=" + msp_location + ", msp_type=" + msp_type + ", msm_name="
                + msm_name + "]";
    }

    
}
