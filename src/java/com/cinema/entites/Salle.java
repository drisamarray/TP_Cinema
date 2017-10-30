/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.cinema.entites;

public class Salle {

	private String type;
        private int numero, nb_places;
        public Salle() {
        }
        
	public Salle(String type,int numero, int nb_places) {
		this.type = type;
		this.numero = numero;
		this.nb_places = nb_places;
	}

	public String getType() {
		return type;
	}

	public int getNumero() {
		return numero;
	}
        
        public int getNb_places() {
		return nb_places;
	}

	public void setType(String type) {
		this.type = type;
	}

	public void setNumero(int numero) {
		this.numero = numero;
	}
        
        public void setNb_places(int nb_places) {
		this.nb_places = nb_places;
	}

}
