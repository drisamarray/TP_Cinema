/* 
    Classe     : Projection
    Created on : 2017-10-29, 19:01:15
    Author     : Dris & Francis
 */
package com.cinema.classes;

public class Projection {

    String codeProjection, codeFilm, codeCinema, seance, du, au;
    int numSalle;
    //Date du = new Date(0);
    //Date au = new Date(0);

    public Projection() {
    }

    public Projection(String codeProjection, String codeFilm, String codeCinema, String seance, int numSalle, String du, String au) {
        this.codeProjection = codeProjection;
        this.codeFilm = codeFilm;
        this.codeCinema = codeCinema;
        this.seance = seance;
        this.du = du;
        this.au = au;
        this.numSalle = numSalle;
    }

    public String getCodeProjection() {
        return codeProjection;
    }

    public void setCodeProjection(String codeProjection) {
        this.codeProjection = codeProjection;
    }

    public String getCodeFilm() {
        return codeFilm;
    }

    public void setCodeFilm(String codeFilm) {
        this.codeFilm = codeFilm;
    }

    public String getCodeCinema() {
        return codeCinema;
    }

    public void setCodeCinema(String codeCinema) {
        this.codeCinema = codeCinema;
    }

    public String getSeance() {
        return seance;
    }

    public void setSeance(String seance) {
        this.seance = seance;
    }

    public String getDu() {
        return du;
    }

    public void setDu(String du) {
        this.du = du;
    }

    public String getAu() {
        return au;
    }

    public void setAu(String au) {
        this.au = au;
    }

    public int getNumSalle() {
        return numSalle;
    }

    public void setNumSalle(int numSalle) {
        this.numSalle = numSalle;
    }

}
