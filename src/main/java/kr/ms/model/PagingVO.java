package kr.ms.model;

public class PagingVO {
    private int nowPage;
    private int startPage;
    private int endPage;
    private int lastPage;
    private int total;
    private int start;
    private int end;
    private int cntPerPage = 10; //페이지당 글수
    private int cntPage = 10; //페이지의 블럭
    
    public PagingVO() {
        super();
    }

    public PagingVO(int total, int cntPage, int nowPage, int cntPerPage) {
        setNowPage(nowPage);
        setCntPerPage(cntPerPage);
        setTotal(total);
        setCntPage(cntPage);
        calcLastPage(getTotal(), getCntPerPage());
        calcStartEndPage(getNowPage(), getCntPage());
        calcStartEnd(getNowPage(), getCntPerPage());
    }

    // 제일 마지막 페이지 계산
    public void calcLastPage(int total, int cntPerPage) {
        setLastPage((int) Math.ceil((double)total / (double)cntPerPage));
    }
    
    // 시작, 끝 페이지 계산
    public void calcStartEndPage(int nowPage, int cntPage) {
        setEndPage(((int)Math.ceil((double)nowPage / (double)cntPage)) * cntPage);
        if (getLastPage() < getEndPage()) {
            setEndPage(getLastPage());
        }
        setStartPage(getEndPage() - cntPage + 1);
        if (getStartPage() < 1) {
            setStartPage(1);
        }
    }
    // DB 쿼리에서 사용할 start, end값 계산
    public void calcStartEnd(int nowPage, int cntPerPage) {
        setEnd(nowPage * cntPerPage);
        setStart(getEnd() - cntPerPage + 1);
    }

    public int getNowPage() {
        return nowPage;
    }

    public void setNowPage(int nowPage) {
        this.nowPage = nowPage;
    }

    public int getStartPage() {
        return startPage;
    }

    public void setStartPage(int startPage) {
        this.startPage = startPage;
    }

    public int getEndPage() {
        return endPage;
    }

    public void setEndPage(int endPage) {
        this.endPage = endPage;
    }

    public int getLastPage() {
        return lastPage;
    }

    public void setLastPage(int lastPage) {
        this.lastPage = lastPage;
    }

    public int getTotal() {
        return total;
    }

    public void setTotal(int total) {
        this.total = total;
    }

    public int getCntPerPage() {
        return cntPerPage;
    }

    public void setCntPerPage(int cntPerPage) {
        this.cntPerPage = cntPerPage;
    }

    public int getStart() {
        return start;
    }

    public void setStart(int start) {
        this.start = start;
    }

    public int getEnd() {
        return end;
    }

    public void setEnd(int end) {
        this.end = end;
    }

    public int getCntPage() {
        return cntPage;
    }

    public void setCntPage(int cntPage) {
        this.cntPage = cntPage;
    }

    @Override
    public String toString() {
        return "PagingVO [nowPage=" + nowPage + ", startPage=" + startPage + ", endPage=" + endPage + ", lastPage="
                + lastPage + ", total=" + total + ", cntPerPage=" + cntPerPage + ", start=" + start + ", end=" + end
                + ", cntPage=" + cntPage + "]";
    }
}
