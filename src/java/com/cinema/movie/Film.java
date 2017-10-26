/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.cinema.movie;

public class Film {

	private String titre, description;
        private int numero, duree;
        public Film() {
        }
        
	public Film(String titre, String description, int numero, int duree) {
		this.titre = titre;
		this.description = description;
		this.numero = numero;
                this.duree = duree;
	}

	public String getTitre() {
		return titre;
	}

	public String getDescription() {
		return description;
	}
        
        public int getNumero() {
		return numero;
	}
        
        public int getDuree() {
		return duree;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public void setNumero(int numero) {
		this.numero = numero;
	}
        
        public void setDuree(int duree) {
		this.duree = duree;
	}

}
