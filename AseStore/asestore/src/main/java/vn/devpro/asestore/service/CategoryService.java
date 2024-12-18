package vn.devpro.asestore.service;

import org.springframework.stereotype.Service;

import vn.devpro.asestore.Model.Category;

@Service
public class CategoryService extends BaseService<Category>{

	@Override
	public Class<Category> clazz() {
		// TODO Auto-generated method stub
		return Category.class;
	}
	
}
