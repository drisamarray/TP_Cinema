/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.cinema.entites;

import com.cinema.entites.User;
import com.cinema.entites.Film;
import com.cinema.entites.Film;
import com.cinema.entites.User;

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
