/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.cinema.entites;

public class User {

	private String identifiant, nom, prenom, courriel,telephone, motdepasse;

        public User() {
            this.identifiant = "";
		//this.nom = "";
		//this.prenom = "";
                //this.courriel = "";
                //this.telephone = "";
                this.motdepasse = "";
        }
        
	/*public User(String identifiant, String nom, String prenom, String courriel, String telephone, String motdepasse) {
		this.identifiant = identifiant;
		this.nom = nom;
		this.prenom = prenom;
                this.courriel = courriel;
                this.telephone = telephone;
                this.motdepasse = motdepasse;
	}*/
        
        /******************temp**********************/
        public User(String identifiant, String motdepasse) {
		this.identifiant = identifiant;
                this.motdepasse = motdepasse;
	}
        /********************************************/

	
	public String getIdentifiant() {
		return identifiant;
	}
        
        /*public String getNom() {
		return nom;
	}
        
        public String getPrenom() {
		return prenom;
	}
        
        public String getCourriel() {
                return courriel;
        }
        
        public String getTelephone() {
                return telephone;
        }*/
        
        public String getMotdepasse() {
                return motdepasse;
        }
        
        public void setIdentifiant(String identifiant) {
		this.identifiant = identifiant;
	}
        
       /* public void setNom(String nom) {
		this.nom = nom;
	}
        
        public void setPrenom(String prenom) {
		this.prenom = prenom;
	}

	public void setCourriel(String courriel) {
		this.courriel = courriel;
	}
        
        public void setTelephone(String telephone) {
		this.telephone = telephone;
	}*/

	public void setMotdepasse(String motdepasse) {
		this.motdepasse = motdepasse;
	}
     

}
