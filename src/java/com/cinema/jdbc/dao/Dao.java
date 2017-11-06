/* 
    classe     : Générique pour implémenter DAO
    Created on : 2017-11-04, 01:26:59
    Author     : Dris & francis
 */

package com.cinema.jdbc.dao;

import java.sql.Connection;
import java.util.List;

public abstract class Dao<T> {
	protected Connection cnx;

	public Dao(Connection cnx) {
		super();
		this.cnx = cnx;
	}
	
	public Connection getCnx() {
		return cnx;
	}

	public void setCnx(Connection cnx) {
		this.cnx = cnx;
	}

	public abstract boolean create(T x);
	public abstract T read(String id);
	public abstract boolean update(T x);
	public abstract boolean delete(T x);
	public abstract List<T> findAll();
       // public abstract List<T> findBy(String id);
       // public abstract List<T> findBy(int id);
}