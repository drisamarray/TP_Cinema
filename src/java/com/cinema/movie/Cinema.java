/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.cinema.movie;

public class Cinema {

	private String identifiant, adresse;
        private int nb_salles;
        public Cinema() {
        }
        
	public Cinema(String identifiant, String adresse, int nb_salles) {
		this.identifiant = identifiant;
		this.adresse = adresse;
		this.nb_salles = nb_salles;
	}

	public String getIdentifiant() {
		return identifiant;
	}

	public String getAdresse() {
		return adresse;
	}
        
        public int getNb_salles() {
		return nb_salles;
	}

	public void setIdentifiant(String identifiant) {
		this.identifiant = identifiant;
	}

	public void setAdresse(String adresse) {
		this.adresse = adresse;
	}
        
        public void setNb_salles(int nb_salles) {
		this.nb_salles = nb_salles;
	}

}