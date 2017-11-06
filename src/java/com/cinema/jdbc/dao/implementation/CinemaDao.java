/* 
    ClasseDao  : Cinema
    Created on : 2017-10-29, 18:58:03
    Author     : Dris & Francis
 */

package com.cinema.jdbc.dao.implementation;

import com.cinema.classes.Cinema;
import com.cinema.services.Encodage;
import com.cinema.jdbc.dao.Dao;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.LinkedList;
import java.util.List;

public class CinemaDao extends Dao<Cinema> {

    public CinemaDao(Connection c) {
        super(c);
    }

    @Override
    public boolean create(Cinema x) {
        // TODO Auto-generated method stub       
        String req = "INSERT INTO cinema VALUES (NULL, '" + x.getIdCinema() + "', '" + x.getIdGestionnaire() + "', '" + x.getNomCinema() + "', "
                + "'" + x.getVille() + "', " + x.getNb_salles() + ")";
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
    public boolean delete(Cinema x) {
        // TODO Auto-generated method stub
        Statement stm = null;
        try {
            stm = cnx.createStatement();
            int n = stm.executeUpdate("DELETE FROM  cinema WHERE IDCINEMA='" + x.getIdCinema() + "'");
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
    public Cinema read(String id) {
        // TODO Auto-generated method stub
        PreparedStatement stm = null;
        try {
            //Avec requête paramétrée :
            stm = cnx.prepareStatement("SELECT * FROM  cinema WHERE IDCINEMA = ?");
            stm.setString(1, id);
            ResultSet r = stm.executeQuery();
            if (r.next()) {
                Cinema cinema = new Cinema(r.getString("IDCINEMA"), r.getString("IDGESTIONNAIRE"),
                        r.getString("NOMCINEMA"), r.getString("VILLE"), r.getInt("NBRSALLES"));
                r.close();
                stm.close();
                return cinema;
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
    public boolean update(Cinema x) {
        // TODO Auto-generated method stub
        Statement stm = null;
        try {
            String req = "UPDATE  cinema"
                    + " SET `IDGESTIONNAIRE` = '" + x.getIdGestionnaire() + "', `NOMCINEMA` = '" + x.getNomCinema() + "',"
                    + "`VILLE` =  '" + x.getVille() + "', `NBRSALLES` = '" + x.getNb_salles() + "'"
                    + " WHERE IDCINEMA = '" + x.getIdCinema() + "'";
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
    public List<Cinema> findAll() {
        // TODO Auto-generated method stub
        List<Cinema> liste;
        liste = new LinkedList<>();
        try {
            Statement stm = cnx.createStatement();
            ResultSet r = stm.executeQuery("SELECT * FROM  cinema");
            while (r.next()) {
                Cinema cinema = new Cinema(r.getString("IDCINEMA"), r.getString("IDGESTIONNAIRE"),
                        r.getString("NOMCINEMA"), r.getString("VILLE"), r.getInt("NBRSALLES"));
                liste.add(cinema);
            }
            r.close();
            stm.close();
        } catch (SQLException exp) {
        }
        return liste;
    }

    public List<String> findByIDgestionnaire(String idGestionnaire) {
        // TODO Auto-generated method stub
        List<String> liste;
        liste = new ArrayList<>();
        PreparedStatement stm = null;
        try {
            stm = cnx.prepareStatement("SELECT DISTINCT NOMCINEMA FROM cinema WHERE IDGESTIONNAIRE = ?");
            stm.setString(1, idGestionnaire);
            ResultSet r = stm.executeQuery();
            while (r.next()) {
                String cinema = r.getString("NOMCINEMA");
                liste.add(cinema);
            }
            r.close();
            stm.close();
        } catch (SQLException exp) {
        }
        return liste;
    }

    public int findByNomCine(String nomCinema) {
        // TODO Auto-generated method stub
        int nbrSalles = 1;
        PreparedStatement stm = null;
        try {
            stm = cnx.prepareStatement("SELECT DISTINCT NBRSALLES FROM cinema WHERE NOMCINEMA = ?");
            stm.setString(1, nomCinema);
            ResultSet r = stm.executeQuery();
            while (r.next()) {
                nbrSalles = r.getInt("NBRSALLES");
            }
            r.close();
            stm.close();
        } catch (SQLException exp) {
        }
        return nbrSalles;
    }
}
