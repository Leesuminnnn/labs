package com.nnn.app.vo;

import java.util.Date;

import javax.persistence.Lob;

public class ImageEntitytest {
    private int idx;
    private int cs_idx;
    @Lob
    private byte[] imageData;
    private Date regdate;

    public byte[] getImageData() {
        return imageData;
    }

    public void setImageData(byte[] imageData) {
        this.imageData = imageData;
    }

    public int getIdx() {
        return idx;
    }

    public void setIdx(int idx) {
        this.idx = idx;
    }

    public int getCs_idx() {
        return cs_idx;
    }

    public void setCs_idx(int cs_idx) {
        this.cs_idx = cs_idx;
    }

    public Date getRegdate() {
        return regdate;
    }

    public void setRegdate(Date regdate) {
        this.regdate = regdate;
    }
}