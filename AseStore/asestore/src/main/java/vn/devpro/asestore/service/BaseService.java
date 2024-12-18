package vn.devpro.asestore.service;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import javax.persistence.Table;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;
import vn.devpro.asestore.Model.BaseModel;

@Service
public abstract class BaseService<E extends BaseModel> {
	@PersistenceContext
	EntityManager entityManager;
	
	public abstract Class<E> clazz();

	// lấy một bản ghi theo id
	public E getById(int id) {
		return entityManager.find(clazz(), id);
	}

	// Lấy tất cả các bản ghi trong một table
	@SuppressWarnings("unchecked")
	public List<E> findAll() {
		Table table = clazz().getAnnotation(Table.class);
		return (List<E>) entityManager.createNativeQuery("SELECT * FROM " + table.name(), clazz()).getResultList();
	}

	// Thêm mới hoặc sửa một bản ghi
	@Transactional
	public E saveOrUpdate(E entity) {
		if (entity.getId() == null || entity.getId() <= 0) { // Add new entity
			entityManager.persist(entity);
			return entity;
		} else { // update entity
			return entityManager.merge(entity);
		}
	}

	// Xóa một bản ghi theo entity
	public void delete(E entity) {
		entityManager.remove(entity);

	}

	// Xóa một bản ghi theo id
	public void deleteById(int id) {
		E entity = this.getById(id);
		delete(entity);
	}

	// Lấy dữu liệu theo điều kiện
	@SuppressWarnings("unchecked")
	public List<E> executeNativeSql(String sql) {
		try {
			Query query = entityManager.createNativeQuery(sql, clazz());
			return query.getResultList();
		} catch (Exception e) {
			e.printStackTrace();
			return new ArrayList<E>();
		}
	}
	public E getEntityByNativeSQL(String sql) {
		// TODO Auto-generated method stub
		List<E> list =  executeNativeSql(sql);
		if (list.size()>0) {
			return list.get(0);
		}
		else
		return null;
	}
}
