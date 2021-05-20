package kr.ms.model;

public class ParkingVO {
    private int msp_no;
    private int msm_no;
    private String msp_location;
    private int msp_num;
    private int msp_type;
    private String msp_date;
    private int msr_num;
    private String msm_name;

    public int getMsp_no() {
        return msp_no;
    }

    public void setMsp_no(int msp_no) {
        this.msp_no = msp_no;
    }

    public int getMsm_no() {
        return msm_no;
    }

    public void setMsm_no(int msm_no) {
        this.msm_no = msm_no;
    }

    public String getMsp_location() {
        return msp_location;
    }

    public void setMsp_location(String msp_location) {
        this.msp_location = msp_location;
    }

    public int getMsp_num() {
        return msp_num;
    }

    public void setMsp_num(int msp_num) {
        this.msp_num = msp_num;
    }

    public int getMsp_type() {
        return msp_type;
    }

    public void setMsp_type(int msp_type) {
        this.msp_type = msp_type;
    }

    public String getMsp_date() {
        return msp_date;
    }

    public void setMsp_date(String msp_date) {
        this.msp_date = msp_date;
    }

    public int getMsr_num() {
        return msr_num;
    }

    public void setMsr_num(int msr_num) {
        this.msr_num = msr_num;
    }

    public String getMsm_name() {
        return msm_name;
    }

    public void setMsm_name(String msm_name) {
        this.msm_name = msm_name;
    }

    public ParkingVO(int msp_no, int msm_no, String msp_location, int msp_num, int msp_type, String msp_date,
            int msr_num, String msm_name) {
        super();
        this.msp_no = msp_no;
        this.msm_no = msm_no;
        this.msp_location = msp_location;
        this.msp_num = msp_num;
        this.msp_type = msp_type;
        this.msp_date = msp_date;
        this.msr_num = msr_num;
        this.msm_name = msm_name;
    }

    public ParkingVO() {
        super();
    }

    @Override
    public String toString() {
        return "ParkingVO [msp_no=" + msp_no + ", msm_no=" + msm_no + ", msp_location=" + msp_location + ", msp_num="
                + msp_num + ", msp_type=" + msp_type + ", msp_date=" + msp_date + ", msr_num=" + msr_num + ", msm_name="
                + msm_name + "]";
    }

}
