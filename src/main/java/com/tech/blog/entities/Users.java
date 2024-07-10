package com.tech.blog.entities;

import java.sql.Timestamp;

public class Users {
    private int id;
    private String username;
    private String email;
    private String password;
    private String gender;
    private String about;
    private Timestamp rdate;
    private String profile;

    public Users(int id, String username, String email, String password, String gender, String about, Timestamp rdate,String profile) {
        this.id = id;
        this.username = username;
        this.email = email;
        this.password = password;
        this.gender = gender;
        this.about = about;
        this.rdate = rdate;
        this.profile = profile;
    }

    public Users(String username, String email, String password, String gender, String about,String profile) {
        this.username = username;
        this.email = email;
        this.password = password;
        this.gender = gender;
        this.about = about;
        this.rdate = rdate;
        this.profile = profile;
    }

    public Users(){};
    public String getName() {
        return username;
    }

    public void setName(String name) {
        this.username = name;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getAbout() {
        return about;
    }

    public void setAbout(String about) {
        this.about = about;
    }

    public Timestamp getRdate() {
        return rdate;
    }

    public void setRdate(Timestamp rdate) {
        this.rdate = rdate;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getProfile() {
        return profile;
    }

    public void setProfile(String profile) {
        this.profile = profile;
    }
}
