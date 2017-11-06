/* 
    Classe     : Salle
    Created on : 2017-10-29, 19:01:15
    Author     : Dris & Francis
                    !!!!!!!!!!!!!!!!!!!!!! cette classe n'a pas encore servi !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
 */

package com.cinema.classes;

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
