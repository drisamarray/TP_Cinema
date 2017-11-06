/* 
    ClasseDao  : Projection
    Created on : 2017-10-29, 18:58:03
    Author     : Dris & Francis
 */

package com.cinema.jdbc.dao.implementation;

import com.cinema.classes.Projection;
import com.cinema.jdbc.dao.Dao;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.LinkedList;
import java.util.List;

public class ProjectionDao extends Dao<Projection> {

    public ProjectionDao(Connection c) {
        super(c);
    }

    @Override
    public boolean create(Projection x) {
        // TODO Auto-generated method stub       
        String req = "INSERT INTO projection VALUES (NULL, '" + x.getCodeProjection() + "', '" + x.getCodeFilm() + "', '" + x.getCodeCinema() + "', "
                + x.getNumSalle() + ", '" + x.getSeance() + "', '" + x.getDu() + "', '" + x.getAu() + "')";
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
    public boolean delete(Projection x) {
        // TODO Auto-generated method stub
        Statement stm = null;
        try {
            stm = cnx.createStatement();
            int n = stm.executeUpdate("DELETE FROM  projection WHERE CODEPROJECTION='" + x.getCodeProjection() + "'");
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
    public Projection read(String code) {
        // TODO Auto-generated method stub
        PreparedStatement stm = null;
        try {
            //Avec requête paramétrée :
            stm = cnx.prepareStatement("SELECT * FROM  projection WHERE CODEPROJECTION = ?");
            stm.setString(1, code);
            ResultSet r = stm.executeQuery();
            if (r.next()) {
                Projection projection = new Projection(r.getString("CODEPROJECTION"), r.getString("CODEFILM"), r.getString("CODECINEMA"),
                        r.getString("SEANCE"), r.getInt("NUMSALLE"), r.getString("DU"), r.getString("AU"));
                r.close();
                stm.close();
                return projection;
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
    public boolean update(Projection x) {
        // TODO Auto-generated method stub
        Statement stm = null;
        try {
            String req = "UPDATE  projection"
                    + " SET `CODEFILM` = '" + x.getCodeFilm() + "', `CODECINEMA` = '" + x.getCodeCinema() + "',"
                    + "`SEANCE` =  '" + x.getSeance() + "`NUMSALLE` =  '" + x.getNumSalle() + "`DU` =  '" + x.getDu() + "', `AU` = '" + x.getAu() + "'"
                    + " WHERE CODEPROJECTION = '" + x.getCodeProjection() + "'";
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
    public List<Projection> findAll() {
        // TODO Auto-generated method stub
        List<Projection> liste;
        liste = new LinkedList<>();
        try {
            Statement stm = cnx.createStatement();
            ResultSet r = stm.executeQuery("SELECT * FROM  projection");
            while (r.next()) {
                Projection projection = new Projection(r.getString("CODEPROJECTION"), r.getString("CODEFILM"), r.getString("CODECINEMA"),
                        r.getString("SEANCE"), r.getInt("NUMSALLE"), r.getString("DU"), r.getString("AU"));
                liste.add(projection);
            }
            r.close();
            stm.close();
        } catch (SQLException exp) {
        }
        return liste;
    }
}
