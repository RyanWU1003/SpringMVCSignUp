package tw.iii.model;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ProductDao {
	@Autowired
	private SessionFactory sessionfactory;

	public ProductDao(SessionFactory sessionfactory) {
		this.sessionfactory = sessionfactory;
	}
	
	public List<Product> findAll(){
		Session session=sessionfactory.getCurrentSession();
		Query<Product> query=session.createQuery("from Product",Product.class);
		return query.list();
		
	}
	
	public Product getById(int productID) {
		Session session=sessionfactory.getCurrentSession();
		Product product =session.get(Product.class,productID);
		return product;
	}
	
	public List<Product> selectbrand(String brand) {
		Session session=sessionfactory.getCurrentSession();
		Query<Product> query = session.createQuery("from Product where  brand like ?1",Product.class);
		query.setParameter(1,brand);
		return query.list();
	}
	
	public List<Product> selectspecies(String species) {
		Session session=sessionfactory.getCurrentSession();
		Query<Product> query = session.createQuery("from Product where species like ?1",Product.class);
		query.setParameter(1,species);
		return query.list();
	}
	
	public List<Product> selectclass(String classification) {
		Session session=sessionfactory.getCurrentSession();
		Query<Product> query = session.createQuery("from Product where classification like ?1",Product.class);
		query.setParameter(1,classification);
		return query.list();
	}


	public List<Product> selectwhere(int max, int min) {
		Session session = sessionfactory.getCurrentSession();
		Query<Product> query = session.createQuery("from Product where price between :xxx and :ooo", Product.class);
		query.setParameter("xxx", min);
		query.setParameter("ooo", max);
		return query.list();
	}
	
	
	public Object countbrand(String brand) {
		Session session=sessionfactory.getCurrentSession();
		Query<Object> query =session.createQuery("select count(*)  from Product where  brand like ?1");
		query.setParameter(1,brand);	
		Object count3  = query.uniqueResult();
		return count3;
	}
	public Object countspecies(String species) {
		Session session=sessionfactory.getCurrentSession();
		Query<Object> query =session.createQuery("select count(*)  from Product where  species like ?1");
		query.setParameter(1,species);	
		Object count4  = query.uniqueResult();
		return count4;
	}
	
	public Object countwhere(int max, int min) {
		Session session=sessionfactory.getCurrentSession();
		Query<Object> query =session.createQuery("select count(*) from Product where price between :xxx and :ooo");
		query.setParameter("xxx",min);
		query.setParameter("ooo",max);
		Object count2  = query.uniqueResult();
		return count2;
	}
	
	public Object countclass(String classification) {
		Session session=sessionfactory.getCurrentSession();
		Query<Object> query =session.createQuery("select count(*)  from Product where  classification like ?1");
		query.setParameter(1,classification);	
		Object count5  = query.uniqueResult();
		return count5;
	}

	

}
