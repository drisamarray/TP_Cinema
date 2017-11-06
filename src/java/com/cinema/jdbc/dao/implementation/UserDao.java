/* 
    ClasseDao  : User
    Created on : 2017-10-29, 18:58:03
    Author     : Dris & Francis
 */
package com.cinema.jdbc.dao.implementation;

import com.cinema.classes.Cinema;
import com.cinema.classes.User;
import com.cinema.services.Encodage;
import com.cinema.jdbc.dao.Dao;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.LinkedList;
import java.util.List;

public class UserDao extends Dao<User> {

    public UserDao(Connection c) {
        super(c);
    }

    @Override
    public boolean create(User x) {
        // TODO Auto-generated method stub       
        String req = "INSERT INTO user VALUES (NULL, '" + x.getIdentifiant() + "','" + Encodage.getEncodedPassword(x.getMotdepasse()) + "', "
                + "'" + x.getNom() + "','" + x.getPrenom() + "', "
                + "'" + x.getCourriel() + "', '" + x.getTelephone() + "', '" + x.getType() + "')";
        Statement stm = null;
        try {
            stm = cnx.createStatement();
            int n = stm.executeUpdate(req);
            if (n > 0) {
                stm.close();
                return true;
            }
        } catch (SQLException exp) {
        } finally {
            if (stm != null) {
                try {
                    stm.close();
                } catch (SQLException e) {
                    // TODO Auto-generated catch block
                    e.printStackTrace();
                }
            }
        }

        return false;
    }

    @Override
    public boolean delete(User x) {
        // TODO Auto-generated method stub
        Statement stm = null;
        try {
            stm = cnx.createStatement();
            int n = stm.executeUpdate("DELETE FROM user WHERE IDENTIFIANT='" + x.getIdentifiant() + "'");
            if (n > 0) {
                stm.close();
                return true;
            }
        } catch (SQLException exp) {
        } finally {
            if (stm != null) {
                try {
                    stm.close();
                } catch (SQLException e) {
                    // TODO Auto-generated catch block
                    e.printStackTrace();
                }
            }
        }
        return false;
    }

    @Override
    public User read(String id) {
        // TODO Auto-generated method stub
        PreparedStatement stm = null;
        try {
            //Avec requête paramétrée :
            stm = cnx.prepareStatement("SELECT * FROM user WHERE IDENTIFIANT = ?");
            stm.setString(1, id);
            ResultSet r = stm.executeQuery();
            if (r.next()) {
                User user = new User(r.getString("IDENTIFIANT"), r.getString("MOTDEPASSE"),
                        r.getString("NOM"), r.getString("PRENOM"), r.getString("COURRIEL"),
                        r.getString("TEL"), r.getString("TYPE"));
                r.close();
                stm.close();
                return user;
            }
        } catch (SQLException exp) {
        } finally {
            if (stm != null) {
                try {
                    stm.close();
                } catch (SQLException e) {
                    // TODO Auto-generated catch block
                    e.printStackTrace();
                }
            }
        }
        return null;
    }

    @Override
    public boolean update(User x) {
        // TODO Auto-generated method stub
        Statement stm = null;
        try {
            String req = "UPDATE user"
                    + " SET `MOTDEPASSE` = '" + Encodage.getEncodedPassword(x.getMotdepasse()) + "', `COURRIEL` = '" + x.getCourriel() + "',"
                    + "`NOM` =  '" + x.getNom() + "', `PRENOM` = '" + x.getPrenom() + "',"
                    + "`TEL` = '" + x.getTelephone() + "', `TYPE` = '" + x.getType() + "'"
                    + " WHERE IDENTIFIANT = '" + x.getIdentifiant() + "'";
            stm = cnx.createStatement();
            int n = stm.executeUpdate(req);
            if (n > 0) {
                stm.close();
                return true;
            }
        } catch (SQLException exp) {
        } finally {
            if (stm != null) {
                try {
                    stm.close();
                } catch (SQLException e) {
                    // TODO Auto-generated catch block
                    e.printStackTrace();
                }
            }
        }
        return false;
    }

    @Override
    public List<User> findAll() {
        // TODO Auto-generated method stub
        List<User> liste = new LinkedList<User>();
        try {
            Statement stm = cnx.createStatement();
            ResultSet r = stm.executeQuery("SELECT * FROM user");
            while (r.next()) {
                User user = new User(r.getString("IDENTIFIANT"), r.getString("MOTDEPASSE"),
                        r.getString("NOM"), r.getString("PRENOM"),
                        r.getString("COURRIEL"), r.getString("TEL"),
                        r.getString("TYPE"));
                liste.add(user);
            }
            r.close();
            stm.close();
        } catch (SQLException exp) {
        }
        return liste;
    }

}
