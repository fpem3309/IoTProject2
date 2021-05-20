package kr.ms.model;

public class NoticeBoardVO {
	private int msnb_no;
	private String msnb_subject;
	private String msnb_content;
	private int msm_no;
	private String msnb_date;
	private int msnb_hit;
	private String msm_name;
	private int rn;
	
	public NoticeBoardVO() {
		super();
	}
	
	public NoticeBoardVO(int msnb_no, String msnb_subject, String msnb_content, int msm_no, String msnb_date,
			int msnb_hit) {
		super();
		this.msnb_no = msnb_no;
		this.msnb_subject = msnb_subject;
		this.msnb_content = msnb_content;
		this.msm_no = msm_no;
		this.msnb_date = msnb_date;
		this.msnb_hit = msnb_hit;
	}

	
	public int getRn() {
        return rn;
    }

    public void setRn(int rn) {
        this.rn = rn;
    }

    public String getMsm_name() {
		return msm_name;
	}

	public void setMsm_name(String msm_name) {
		this.msm_name = msm_name;
	}

	public int getMsnb_no() {
		return msnb_no;
	}

	public void setMsnb_no(int msnb_no) {
		this.msnb_no = msnb_no;
	}

	public String getMsnb_subject() {
		return msnb_subject;
	}

	public void setMsnb_subject(String msnb_subject) {
		this.msnb_subject = msnb_subject;
	}

	public String getMsnb_content() {
		return msnb_content;
	}

	public void setMsnb_content(String msnb_content) {
		this.msnb_content = msnb_content;
	}

	public int getMsm_no() {
		return msm_no;
	}

	public void setMsm_no(int msm_no) {
		this.msm_no = msm_no;
	}

	public String getMsnb_date() {
		return msnb_date;
	}

	public void setMsnb_date(String msnb_date) {
		this.msnb_date = msnb_date;
	}

	public int getMsnb_hit() {
		return msnb_hit;
	}

	public void setMsnb_hit(int msnb_hit) {
		this.msnb_hit = msnb_hit;
	}



	@Override
	public String toString() {
		return "NoticeBoardVO [msnb_no=" + msnb_no + ", msnb_subject=" + msnb_subject + ", msnb_content=" + msnb_content
				+ ", msm_no=" + msm_no + ", msnb_date=" + msnb_date + ", msnb_hit=" + msnb_hit + "]";
	}
}
