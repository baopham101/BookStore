/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dtos;

/**
 * @author baoph
 */
public class ErrorUserDTO {
    private String errorUserID, errorName, errorAddress, errorPhoneNumber, errorEmail, confirm;

    public ErrorUserDTO() {
    }

    public ErrorUserDTO(String errorUserID, String errorName, String errorAddress, String errorPhoneNumber, String errorEmail, String confirm) {
        this.errorUserID = errorUserID;
        this.errorName = errorName;
        this.errorAddress = errorAddress;
        this.errorPhoneNumber = errorPhoneNumber;
        this.errorEmail = errorEmail;
        this.confirm = confirm;
    }

    public String getErrorUserID() {
        return errorUserID;
    }

    public void setErrorUserID(String errorUserID) {
        this.errorUserID = errorUserID;
    }

    public String getErrorName() {
        return errorName;
    }

    public void setErrorName(String errorName) {
        this.errorName = errorName;
    }

    public String getErrorAddress() {
        return errorAddress;
    }

    public void setErrorAddress(String errorAddress) {
        this.errorAddress = errorAddress;
    }

    public String getErrorPhoneNumber() {
        return errorPhoneNumber;
    }

    public void setErrorPhoneNumber(String errorPhoneNumber) {
        this.errorPhoneNumber = errorPhoneNumber;
    }

    public String getErrorEmail() {
        return errorEmail;
    }

    public void setErrorEmail(String errorEmail) {
        this.errorEmail = errorEmail;
    }

    public String getConfirm() {
        return confirm;
    }

    public void setConfirm(String confirm) {
        this.confirm = confirm;
    }
}
