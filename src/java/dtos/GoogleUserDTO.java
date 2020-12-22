/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dtos;

/**
 *
 * @author baoph
 */
public class GoogleUserDTO {
    private String googleName;
    private String googleEmail;

    public GoogleUserDTO() {
    }

    public GoogleUserDTO(String googleName, String googleEmail) {
        this.googleName = googleName;
        this.googleEmail = googleEmail;
    }

    public String getGoogleName() {
        return googleName;
    }

    public void setGoogleName(String googleName) {
        this.googleName = googleName;
    }

    public String getGoogleEmail() {
        return googleEmail;
    }

    public void setGoogleEmail(String googleEmail) {
        this.googleEmail = googleEmail;
    }
}
