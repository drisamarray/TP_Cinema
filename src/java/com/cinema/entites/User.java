/* 
    Classe     : User
    Created on : 2017-10-29, 19:01:15
    Author     : Dris & Francis
*/

package com.cinema.entites;

public class User {

	private String identifiant, motdepasse, nom, prenom, courriel,telephone, type;

        public User() {
                this.identifiant = "";
                this.motdepasse = "";
		this.nom = "";
		this.prenom = "";
                this.courriel = "";
                this.telephone = "";
                this.type = "";
        }
        
	public User(String identifiant, String motdepasse, String nom, String prenom, String courriel, String telephone, String type) {
		this.identifiant = identifiant;
                this.motdepasse = motdepasse;
		this.nom = nom;
		this.prenom = prenom;
                this.courriel = courriel;
                this.telephone = telephone;              
                this.type = type;
	}
	
	public String getIdentifiant() {
		return identifiant;
	}

        public String getType() {
            return type;
        }
                    
        public String getNom() {
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
        }
        
        public String getMotdepasse() {
                return motdepasse;
        }
        
        public void setIdentifiant(String identifiant) {
		this.identifiant = identifiant;
	}
        
        public void setMotdepasse(String motdepasse) {
		this.motdepasse = motdepasse;
	}
             
        public void setNom(String nom) {
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
	}

        public void setType(String type) {
            this.type = type;
        }

        

	

}
