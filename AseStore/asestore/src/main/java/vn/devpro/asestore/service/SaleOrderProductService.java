package vn.devpro.asestore.service;

import org.springframework.stereotype.Service;


import vn.devpro.asestore.dto.AsestoreContants;

import vn.devpro.asestore.Model.SaleOrderProduct;
@Service
public class SaleOrderProductService extends BaseService<SaleOrderProduct> implements AsestoreContants{

	@Override
	public Class<SaleOrderProduct> clazz() {
		// TODO Auto-generated method stub
		return SaleOrderProduct.class;
	}

}
