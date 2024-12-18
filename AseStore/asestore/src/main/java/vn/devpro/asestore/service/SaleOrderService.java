package vn.devpro.asestore.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import vn.devpro.asestore.Model.SaleOrder;
import vn.devpro.asestore.dto.AsestoreContants;
import vn.devpro.asestore.dto.SearchModel;

@Service
public class SaleOrderService extends BaseService<SaleOrder> implements AsestoreContants{

	@Override
	public Class<SaleOrder> clazz() {
		// TODO Auto-generated method stub
		return SaleOrder.class;
	}

	public List<SaleOrder> sreachOrder(SearchModel productSearch) {
		// TODO Auto-generated method stub
		// Tao cau lệnh sql
				String sql = "SELECT * FROM tbl_sale_order p WHERE 1=1";
				// Tìm kiếm với status
				if (productSearch.getStatus() != 2) {
					sql += " AND p.status=" + productSearch.getStatus();
				}
				// Tìm kiếm theo category
				if (productSearch.getCategoryId() != 0) {
					sql += " AND p.user_id=" + productSearch.getCategoryId();
				}
				// Tìm kiếm theo key

				if (!StringUtils.isEmpty(productSearch.getKeyword())) {
					String keyword = productSearch.getKeyword().toLowerCase();
					sql += " AND (LOWER(p.customer_name) like '%" + keyword + "%'" + "LOWER(p.code) like '%" + keyword + "%'" + " OR LOWER(p.customer_mobile) like '%" + keyword
							+ "%'" + " OR LOWER(p.customer_address) like '%" + keyword + "%')";

//					sql += " AND (LOWER(p.name) like '%" + keyword + "%'" + " OR LOWER(p.short_description) like '%" + keyword
//							+ "%'" + " OR LOWER(p.seo) like '%" + keyword + "%')";
				}
				if (!StringUtils.isEmpty(productSearch.getBeginDate()) && !StringUtils.isEmpty(productSearch.getEndDate())) {

					String beginDate = productSearch.getBeginDate();
					String endDate = productSearch.getEndDate();

					sql += " AND p.create_date BETWEEN '" + beginDate + "' AND '" + endDate + "'";
				}

				return super.executeNativeSql(sql);
	}

}
