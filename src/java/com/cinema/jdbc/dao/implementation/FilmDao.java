/* 
    ClasseDao  : Film
    Created on : 2017-10-29, 18:58:03
    Author     : Dris & Francis
 */

package com.cinema.jdbc.dao.implementation;

import com.cinema.classes.Film;
import com.cinema.jdbc.dao.Dao;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.LinkedList;
import java.util.List;

public class FilmDao extends Dao<Film> {

    public FilmDao(Connection c) {
        super(c);
    }

    @Override
    public boolean create(Film x) {
        // TODO Auto-generated method stub       
        String req = "INSERT INTO film VALUES (NULL, '" + x.getCodeFilm() + "', '" + x.getGenre() + "', '" + x.getTitre() + "', "
                + "'" + x.getRealisateur() + "', '" + x.getActeurs() + "', '" + x.getDescription() + "', '" + x.getAffiche() + "')";
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
    public boolean delete(Film x) {
        // TODO Auto-generated method stub
        Statement stm = null;
        try {
            stm = cnx.createStatement();
            int n = stm.executeUpdate("DELETE FROM  film WHERE CODEFILM='" + x.getCodeFilm() + "'");
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
    public Film read(String code) {
        // TODO Auto-generated method stub
        PreparedStatement stm = null;
        try {
            //Avec requête paramétrée :
            stm = cnx.prepareStatement("SELECT * FROM  film WHERE CODEFILM = ?");
            stm.setString(1, code);
            ResultSet r = stm.executeQuery();
            if (r.next()) {
                Film film = new Film(r.getString("CODEFILM"), r.getString("GENRE"),
                        r.getString("TITRE"), r.getString("REALISATEUR"), r.getString("ACTEURS"), r.getString("DESCRIPTION"), r.getString("AFFICHE"));
                r.close();
                stm.close();
                return film;
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
    public boolean update(Film x) {
        // TODO Auto-generated method stub
        Statement stm = null;
        try {
            String req = "UPDATE  film"
                    + " SET `GENRE` = '" + x.getGenre() + "', `TITRE` = '" + x.getTitre() + "',"
                    + "`REALISATEUR` =  '" + x.getRealisateur() + "`AFFICHE` =  '" + x.getAffiche() + "', `ACTEURS` = '" + x.getActeurs() + "'"
                    + " WHERE CODEFILM = '" + x.getCodeFilm() + "'";
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
    public List<Film> findAll() {
        // TODO Auto-generated method stub
        List<Film> liste;
        liste = new LinkedList<>();
        try {
            Statement stm = cnx.createStatement();
            ResultSet r = stm.executeQuery("SELECT * FROM  film");
            while (r.next()) {
                Film film = new Film(r.getString("CODEFILM"), r.getString("GENRE"),
                        r.getString("TITRE"), r.getString("REALISATEUR"), r.getString("ACTEURS"), r.getString("DESCRIPTION"), r.getString("AFFICHE"));
                liste.add(film);
            }
            r.close();
            stm.close();
        } catch (SQLException exp) {
        }
        return liste;
    }
}
