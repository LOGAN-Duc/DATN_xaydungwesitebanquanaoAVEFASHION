package vn.devpro.asestore.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import vn.devpro.asestore.Model.Role;

@Service
public class RoleService extends BaseService<Role>{

	@Override
	public Class<Role> clazz() {
		// TODO Auto-generated method stub
		return Role.class;
	}
	public List<Role> findAllAction() {
		return super.executeNativeSql("SELECT * FROM tbl_role WHERE status=1");
	}

	@Transactional
	public void deleteRoleById(int id) {
		super.deleteById(id);
	}

//	public Role checkMail(String email) {
//
//	}

	public Role getRoleByName(String name) {

		String sql = "SELECT * FROM tbl_role WHERE name='" + name + "'";
		List<Role> roles = super.executeNativeSql(sql);

		if (roles.size() > 0) {
			return roles.get(0);
		} else {
			return new Role();
		}
	}
}
