/* 
    Classe     : Encodage servanr à encoder les données sensibles comme mot de passe
    Created on : 2017-10-29, 18:58:03
    Author     : Dris & Francis
 */

package com.cinema.services;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;


/* 
    Fonctions utilitaires pour le cryptage MD5
    Encode une chaine et renvoi son résultat crypté en
    héxadécimal avec l'algorithme MD5 ou test
    une chaine et une valeur crypté. Main d'exemple fourni.    
*/

public class Encodage
  {
  /*
     Encode la chaine passé en paramètre avec l'algorithme MD5
     @param key : la chaine à encoder
     @return la valeur (string) hexadécimale sur 32 bits     	 
  */
	public static String getEncodedPassword(String key) {
	  byte[] uniqueKey = key.getBytes();
	  byte[] hash = null;
	  try {
		hash = MessageDigest.getInstance("MD5").digest(uniqueKey);
	  } catch (NoSuchAlgorithmException e) {
		throw new Error("no MD5 support in this VM");
	  }
	  StringBuffer hashString = new StringBuffer();
	  for ( int i = 0; i < hash.length; ++i ) {
		String hex = Integer.toHexString(hash[i]);
		if ( hex.length() == 1 ) {
		  hashString.append('0');
		  hashString.append(hex.charAt(hex.length()-1));
		} else {
		  hashString.append(hex.substring(hex.length()-2));
		}
	  }
	  return hashString.toString();
	}

  /*     
     Test une chaine et une valeur encodé (chaine hexadécimale)
     @param clearTextTestPassword : la chaine non codé à tester  
     @param encodedActualPassword : la valeur hexa MD5 de référence
     @return true si vérifié false sinon     
    */

  public static boolean testPassword(String clearTextTestPassword,
				   String encodedActualPassword)
				 //  throws NoSuchAlgorithmException
	{
                String encodedTestPassword = Encodage.getEncodedPassword(
                                                  clearTextTestPassword);
                return (encodedTestPassword.equals(encodedActualPassword));
        }
  
  public static boolean isInteger(String str) {
    if (str == null) {
        return false;
    }
    int length = str.length();
    if (length == 0) {
        return false;
    }
    int i = 0;
    if (str.charAt(0) == '-') {
        if (length == 1) {
            return false;
        }
        i = 1;
    }
    for (; i < length; i++) {
        char c = str.charAt(i);
        if (c < '0' || c > '9') {
            return false;
        }
    }
    return true;
}
}
