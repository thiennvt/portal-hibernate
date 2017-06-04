/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.util.ArrayList;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import util.HibernateUtil;

/**
 *
 * @author root
 */
public abstract class BaseModel<T> {

    private Class<T> objModel;
    protected final SessionFactory sf = HibernateUtil.getSessionFactory();
    protected Session session = null;
    protected Transaction tran = null;
    public BaseModel(Class<T> obj) {
        this.objModel = obj;
    }

    public abstract ArrayList<T> getAllObject();

    public abstract T getObject(int objKey);

    public abstract boolean addObject(T instence);

    public abstract boolean UpdateObject(T instence);

    public abstract boolean DeleteObject(T instence);
}
