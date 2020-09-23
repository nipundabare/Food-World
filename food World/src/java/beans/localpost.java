/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package beans;

import java.io.Serializable;

/**
 *
 * @author F.R.I.D.A.Y
 */
public class localpost implements Serializable{
    private String progid;
    private String title;
    private String description;
    private String image;
    public int uid;

 
    public String getProgid() {
        return progid;
    }

    public void setProgid(String progid) {
        this.progid = progid;
    }

 
    public String getTitle() {
        return title;
    }

   
    public void setTitle(String title) {
        this.title = title;
    }

    
    public String getDescription() {
        return description;
    }

    
    public void setDescription(String description) {
        this.description = description;
    }

 
    public String getImage() {
        return image;
    }

   
    public void setImage(String image) {
        this.image = image;
    }

    public int getUid() {
        return uid;
    }
    public void setUid(int uid) {
        this.uid = uid;
    }

   
    
}
