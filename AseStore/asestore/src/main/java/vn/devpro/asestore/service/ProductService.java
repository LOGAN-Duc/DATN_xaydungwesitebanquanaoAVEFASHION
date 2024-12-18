package vn.devpro.asestore.service;

import java.io.File;
import java.io.IOException;
import java.util.Date;
import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;
import org.springframework.web.multipart.MultipartFile;

import vn.devpro.asestore.Model.Product;
import vn.devpro.asestore.Model.ProductImage;
import vn.devpro.asestore.dto.AsestoreContants;
import vn.devpro.asestore.dto.SearchModel;

@Service
public class ProductService extends BaseService<Product> implements AsestoreContants {

	@Override
	public Class<Product> clazz() {
		// TODO Auto-generated method stub
		return Product.class;
	}

	@Autowired
	ProductImageService productImageService;

	@Transactional
	public void deleteProductbyId(int productId) {
		// TODO Auto-generated method stub
		Product product = super.getById(productId);

		String sql = "SELECT *FROM tbl_product_image WHERE product_id=" + productId;
		List<ProductImage> productImages = productImageService.executeNativeSql(sql);

		// Xoas laanf luowtj casc anrh cua product trong Product/image va
		// Xoas laanf luowtj cac duowngf dan anh trong tib_product_image
		for (ProductImage productImage : productImages) {

			// xoas file thu muc Produc/Image
			String path = FOLER_UPLOAD + productImage.getPath();
			File file = new File(path);
			file.delete();

			// Xoa thong tin anh trong tbl_product_image
			product.removeRelationalProductImage(productImage);
		}

		// xoas avatar cu
		String path = FOLER_UPLOAD + product.getAvatar();
		File file = new File(path);
		file.delete();
		super.deleteById(productId);
	}

	public List<Product> findAllActive() {
		return super.executeNativeSql("SELECT *FROM tbl_product WHERE status=1");
	}

//	public List<Product> searchByName(SearchModel productSearch) {
//		String sql = "SELECT * FROM tbl_product p WHERE 1=1";
//		if (!StringUtils.isEmpty(productSearch.getKeyword())) {
//			String keyword = productSearch.getKeyword().toLowerCase();
//			sql += " AND (LOWER(p.name) like '%" + keyword + "%')";
//
////			sql += " AND (LOWER(p.name) like '%" + keyword + "%'" + " OR LOWER(p.short_description) like '%" + keyword
////					+ "%'" + " OR LOWER(p.seo) like '%" + keyword + "%')";
//		}
//		return super.executeNativeSql(sql);
//	}

	public List<Product> findHot() {
		// return super.executeNativeSql("SELECT * FROM tbl_product WHERE is_hot = 1 OR
		// id IN (SELECT id FROM tbl_product ORDER BY created_date DESC LIMIT 5)");
		return super.executeNativeSql("SELECT *FROM tbl_product WHERE is_hot=1 ");
	}

	public List<Product> findCreatDate() {
		return super.executeNativeSql(
				"SELECT *FROM tbl_product WHERE  create_date = (SELECT MAX(create_date) FROM tbl_product)LIMIT  5");
	}
	public List<Product> findCreatDateTop10() {
		
				return super.executeNativeSql("SELECT *FROM tbl_product WHERE status=1 LIMIT  10");
	}

	// KIểm tra file có được upload không
	public boolean isUploasFile(MultipartFile file) {
		if (file == null || file.getOriginalFilename().isEmpty()) {
			return false;
		}
		return true;
	}

	// Kiem tra danh sach co uplaod file nao khong
	public boolean isUploasFiles(MultipartFile[] files) {
		if (files == null || files.length == 0) {
			return false;
		}
		return true;
	}

	@Transactional
	public Product saveAddProduct(MultipartFile avatarFile, MultipartFile[] imageFiles, Product product)
			throws IOException {
		// save avatar file
		if (isUploasFile(avatarFile)) {
			// save file vao thu muc Product/Avatar
			String path = FOLER_UPLOAD + "Product/Avatar/" + avatarFile.getOriginalFilename();
			File file = new File(path);
			avatarFile.transferTo(file);
			// Luu duong dan vao bang tbl_product
			product.setAvatar("Product/Avatar/" + avatarFile.getOriginalFilename());
		}

		// Luu image file
		if (isUploasFiles(imageFiles)) {

			for (MultipartFile multipartFile : imageFiles) {
				if (isUploasFile(multipartFile)) {
					String path = FOLER_UPLOAD + "Product/Image/" + multipartFile.getOriginalFilename();
					File file = new File(path);
					multipartFile.transferTo(file);
					// Luu duong dan vao bang tbl_productimage
					ProductImage images = new ProductImage();
					images.setTitle(multipartFile.getOriginalFilename());
					images.setPath("Product/Image/" + multipartFile.getOriginalFilename());
					images.setStatus(Boolean.TRUE);
					images.setCreateDate(new Date());
					product.addRelationalProductImage(images);
				}
			}
		}
		return super.saveOrUpdate(product);
	}

	@Transactional
	public Product saveEditProduct(MultipartFile avatarFile, MultipartFile[] imageFiles, Product product)
			throws IOException {
		// TODO Auto-generated method stub
		// Lay product trong database
		Product dbproduct = super.getById(product.getId());

		// save avatar file
		if (isUploasFile(avatarFile)) {
			// xoas avatar cu
			String path = FOLER_UPLOAD + dbproduct.getAvatar();
			File file = new File(path);
			file.delete();

			// save file vao thu muc Product/Avatar
			path = FOLER_UPLOAD + "Product/Avatar/" + avatarFile.getOriginalFilename();
			file = new File(path);
			avatarFile.transferTo(file);

			// Luu duong dan vao bang tbl_product
			product.setAvatar("Product/Avatar/" + avatarFile.getOriginalFilename());
		} else {
			// Nguoi dung khong uploads avatar thi gui nguyen avatar cu
			product.setAvatar(dbproduct.getAvatar());
		}

		// Luu image file
		if (isUploasFiles(imageFiles)) {

			for (MultipartFile multipartFile : imageFiles) {
				if (isUploasFile(multipartFile)) {
					String path = FOLER_UPLOAD + "Product/Image/" + multipartFile.getOriginalFilename();
					File file = new File(path);
					multipartFile.transferTo(file);

					// Luu duong dan vao bang tbl_productimage
					ProductImage images = new ProductImage();
					images.setTitle(multipartFile.getOriginalFilename());
					images.setPath("Product/Image/" + multipartFile.getOriginalFilename());
					images.setStatus(Boolean.TRUE);
					images.setCreateDate(new Date());
					product.addRelationalProductImage(images);
				}
			}
		}
		return super.saveOrUpdate(product);
	}

//  Search Product
	public List<Product> sreachProduct(SearchModel productSearch) {
		// Tao cau lệnh sql
		String sql = "SELECT * FROM tbl_product p WHERE 1=1";
		// Tìm kiếm với status
		if (productSearch.getStatus() != 2) {
			sql += " AND p.status=" + productSearch.getStatus();
		}
		// Tìm kiếm theo category
		if (productSearch.getCategoryId() != 0) {
			sql += " AND p.category_id=" + productSearch.getCategoryId();
		}
		// Tìm kiếm theo key

		if (!StringUtils.isEmpty(productSearch.getKeyword())) {
			String keyword = productSearch.getKeyword().toLowerCase();
			sql += " AND (LOWER(p.name) like '%" + keyword + "%'" + " OR LOWER(p.short_description) like '%" + keyword
					+ "%'" + " OR LOWER(p.seo) like '%" + keyword + "%')";

//			sql += " AND (LOWER(p.name) like '%" + keyword + "%'" + " OR LOWER(p.short_description) like '%" + keyword
//					+ "%'" + " OR LOWER(p.seo) like '%" + keyword + "%')";
		}

		if (!StringUtils.isEmpty(productSearch.getBeginDate()) && !StringUtils.isEmpty(productSearch.getEndDate())) {

			String beginDate = productSearch.getBeginDate();
			String endDate = productSearch.getEndDate();

			sql += " AND p.create_date BETWEEN '" + beginDate + "' AND '" + endDate + "'";
		}

		return super.executeNativeSql(sql);
	}
}
