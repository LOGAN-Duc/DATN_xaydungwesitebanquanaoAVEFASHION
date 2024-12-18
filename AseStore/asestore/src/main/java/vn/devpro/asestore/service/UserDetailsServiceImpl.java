package vn.devpro.asestore.service;


import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import vn.devpro.asestore.Model.User;

@Service
public class UserDetailsServiceImpl extends BaseService<User> implements UserDetailsService {

	@Override
	public Class<User> clazz() {
		// TODO Auto-generated method stub
		return User.class;
	}

	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		// TODO Auto-generated method stub
		// Lay user trong tbl_user theo username (username tu form login)
		String sql = "select * from tbl_user u where u.username='" + username + "' and u.status=1";
		User user = this.getEntityByNativeSQL(sql);
		if (user != null) {
//					System.out.println("username: " + user.getUsername());
//					System.out.println("Password: " + user.getPassword());
			return user;
		}

		else
			return new User(); // UserDetails khong duoc null
	}

}
