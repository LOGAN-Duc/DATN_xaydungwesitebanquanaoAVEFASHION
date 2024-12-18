package vn.devpro.asestore.service;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.transaction.Transactional;

import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;
import org.springframework.web.multipart.MultipartFile;

import vn.devpro.asestore.Model.User;
import vn.devpro.asestore.dto.AsestoreContants;
import vn.devpro.asestore.dto.SearchModel;

@Service

public class UserService extends BaseService<User> implements AsestoreContants {

	@Override
	public Class<User> clazz() {
		// TODO Auto-generated method stub
		return User.class;
	}

	// KIểm tra file có được upload không
	public boolean isUploasFile(MultipartFile file) {
		if (file == null || file.getOriginalFilename().isEmpty()) {
			return false;
		}
		return true;
	}

	@Transactional
	public User saveAddUser(MultipartFile avatarFile, User user) throws IOException {
		// TODO Auto-generated method stub
		if (isUploasFile(avatarFile)) { // có file uploads

			String path = FOLER_UPLOAD + "User/Avatar" + avatarFile.getOriginalFilename();
			File file = new File(path);
			avatarFile.transferTo(file);
			user.setAvatar("User/Avatar" + avatarFile.getOriginalFilename());
		}
		// lưu images file

		return saveOrUpdate(user);
	}

	@Transactional
	public User saveEditUser(MultipartFile avatarFile, User user) throws IOException {
		// TODO Auto-generated method stub
		User dbproduct = super.getById(user.getId());

		if (isUploasFile(avatarFile)) { // có file uploads

			String path = FOLER_UPLOAD + dbproduct.getAvatar();
			File file = new File(path);
			file.delete();

			path = FOLER_UPLOAD + "User/Avatar" + avatarFile.getOriginalFilename();
			file = new File(path);
			avatarFile.transferTo(file);
			user.setAvatar("User/Avatar" + avatarFile.getOriginalFilename());
		}
		// lưu images file

		return saveOrUpdate(user);
	}

	public List<User> searchUser(SearchModel productSearch) {
		// TODO Auto-generated method stub
		String sql = "SELECT * FROM tbl_user p WHERE 1=1";
		// Tìm kiếm với status
		if (productSearch.getStatus() != 2) {
			sql += " AND p.status=" + productSearch.getStatus();
		}
		// Tìm kiếm theo key

		if (!StringUtils.isEmpty(productSearch.getKeyword())) {
			String keyword = productSearch.getKeyword().toLowerCase();
			sql += " AND (LOWER(p.name) like '%" + keyword + "%'" + " OR LOWER(p.description) like '%" + keyword

					+ "%')";

//					sql += " AND (LOWER(p.name) like '%" + keyword + "%'" + " OR LOWER(p.short_description) like '%" + keyword
//							+ "%'" + " OR LOWER(p.seo) like '%" + keyword + "%')";
		}

		return super.executeNativeSql(sql);
	}

}
