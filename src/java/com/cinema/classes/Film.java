/* 
    Classe     : Film
    Created on : 2017-10-29, 19:01:15
    Author     : Dris & Francis
 */
package com.cinema.classes;

public class Film {

    private String codeFilm, genre, titre, realisateur, acteurs, description, affiche;

    public Film() {
    }

    public Film(String codeFilm, String genre, String titre, String realisateur, String acteurs, String description, String affiche) {
        this.codeFilm = codeFilm;
        this.genre = genre;
        this.titre = titre;
        this.realisateur = realisateur;
        this.acteurs = acteurs;
        this.description = description;
        this.affiche = affiche;

    }

    public String getCodeFilm() {
        return codeFilm;
    }

    public void setCodeFilm(String codeFilm) {
        this.codeFilm = codeFilm;
    }

    public String getGenre() {
        return genre;
    }

    public void setGenre(String genre) {
        this.genre = genre;
    }

    public String getTitre() {
        return titre;
    }

    public void setTitre(String titre) {
        this.titre = titre;
    }

    public String getRealisateur() {
        return realisateur;
    }

    public void setRealisateur(String realisateur) {
        this.realisateur = realisateur;
    }

    public String getActeurs() {
        return acteurs;
    }

    public void setActeurs(String acteurs) {
        this.acteurs = acteurs;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getAffiche() {
        return affiche;
    }

    public void setAffiche(String affiche) {
        this.affiche = affiche;
    }

    @Override
    public String toString() {
        return "Genre : " + genre + "/n Titre : " + titre + "/n Réalisateur : " + realisateur + "/n Acteurs : " + acteurs + "/n Synopsis : " + description;
    }

}
