package vn.devpro.asestore.controller.backend;

import java.io.IOException;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import vn.devpro.asestore.controller.BaseController;
import vn.devpro.asestore.dto.AsestoreContants;

@Controller
public class AdminHomeController extends BaseController  implements AsestoreContants {
		@RequestMapping(value = "/admin/home", method = RequestMethod.GET)
		public String viewAdmin()throws IOException{
			return "backend/home";
		}
}
