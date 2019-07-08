package com.njnu.bean;

import java.io.Serializable;
import java.util.Date;

public class Comment implements Serializable {
    private Integer commentId;

    private Integer userId;

    private String comment;

    private Date time;

    private String commentCorp;

    private String commentJob;

    private static final long serialVersionUID = 1L;

    public Integer getCommentId() {
        return commentId;
    }

    public void setCommentId(Integer commentId) {
        this.commentId = commentId;
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment == null ? null : comment.trim();
    }

    public Date getTime() {
        return time;
    }

    public void setTime(Date time) {
        this.time = time;
    }

    public String getCommentCorp() {
        return commentCorp;
    }

    public void setCommentCorp(String commentCorp) {
        this.commentCorp = commentCorp == null ? null : commentCorp.trim();
    }

    public String getCommentJob() {
        return commentJob;
    }

    public void setCommentJob(String commentJob) {
        this.commentJob = commentJob == null ? null : commentJob.trim();
    }
}