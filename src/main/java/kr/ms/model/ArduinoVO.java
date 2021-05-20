package kr.ms.model;

public class ArduinoVO {
    private int msr_no;
    private int msr_use;
    
    public int getMsr_no() {
        return msr_no;
    }
    
    public void setMsr_no(int msr_no) {
        this.msr_no = msr_no;
    }
    
    public int getMsr_use() {
        return msr_use;
    }
    
    public void setMsr_use(int msr_use) {
        this.msr_use = msr_use;
    }
    
    public ArduinoVO(int msr_no, int msr_use) {
        super();
        this.msr_no = msr_no;
        this.msr_use = msr_use;
    }
    
    public ArduinoVO() {
        super();
    }
    
    @Override
    public String toString() {
        return "ArduinoVO [msr_no=" + msr_no + ", msr_use=" + msr_use + "]";
    }
}
