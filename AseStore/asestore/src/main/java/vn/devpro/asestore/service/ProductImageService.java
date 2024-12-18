package vn.devpro.asestore.service;

import org.springframework.stereotype.Service;

import vn.devpro.asestore.Model.ProductImage;

@Service
public class ProductImageService extends BaseService<ProductImage> {

	@Override
	public Class<ProductImage> clazz() {
		// TODO Auto-generated method stub
		return ProductImage.class;
	}

}
