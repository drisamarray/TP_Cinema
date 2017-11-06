/* 
    Classe     : Cinema
    Created on : 2017-10-29, 19:01:15
    Author     : Dris & Francis
 */
package com.cinema.classes;

public class Cinema {

    private String idCinema, idGestionnaire, nomCinema, ville;
    private int nb_salles;

    public Cinema() {
    }

    public Cinema(String idCinema, String idGestionnaire, String nomCinema, String ville, int nb_salles) {
        this.idCinema = idCinema;
        this.idGestionnaire = idGestionnaire;
        this.nomCinema = nomCinema;
        this.ville = ville;
        this.nb_salles = nb_salles;
    }

    public String getIdCinema() {
        return idCinema;
    }

    public String getIdGestionnaire() {
        return idGestionnaire;
    }

    public String getNomCinema() {
        return nomCinema;
    }

    public String getVille() {
        return ville;
    }

    public int getNb_salles() {
        return nb_salles;
    }

    public void setIdCinema(String idCinema) {
        this.idCinema = idCinema;
    }

    public void setIdGestionnaire(String idGestionnaire) {
        this.idGestionnaire = idGestionnaire;
    }

    public void setNomCinema(String nomCinema) {
        this.nomCinema = nomCinema;
    }

    public void setVille(String ville) {
        this.ville = ville;
    }

    public void setNb_salles(int nb_salles) {
        this.nb_salles = nb_salles;
    }

}
