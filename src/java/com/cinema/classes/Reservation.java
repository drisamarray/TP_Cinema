/* 
    Classe     : Projection
    Created on : 2017-10-29, 19:01:15
    Author     : Dris & Francis
               !!!!!!!!!!!!!!!!!!!!!! cette classe n'a pas encore servi !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
 */
package com.cinema.classes;

import com.cinema.classes.User;
import com.cinema.classes.Film;

public class Reservation {

    private User unVisiteur;
    private Film unFilm;
    private String uneDate, heure;

    public Reservation(User unVisiteur, Film unFilm, String uneDate, String heure) {
        this.unVisiteur = unVisiteur;
        this.unFilm = unFilm;
        this.uneDate = uneDate;
        this.heure = heure;
    }

    public User getUnVisiteur() {
        return unVisiteur;
    }

    public Film getUnFilm() {
        return unFilm;
    }

    public String getUneDate() {
        return uneDate;
    }

    public String getHeure() {
        return heure;
    }

    public void setUnVisiteur(User unVisiteur) {
        this.unVisiteur = unVisiteur;
    }

    public void setUnFilm(Film unFilm) {
        this.unFilm = unFilm;
    }

    public void setUneDate(String uneDate) {
        this.uneDate = uneDate;
    }

    public void setHeure(String heure) {
        this.heure = heure;
    }

}
