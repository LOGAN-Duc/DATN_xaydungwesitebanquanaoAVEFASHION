package vn.devpro.asestore.controller.frontend;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import vn.devpro.asestore.controller.BaseController;
@Controller
public class UserLienheController extends BaseController{
	@RequestMapping(value = "/lienhe", method = RequestMethod.GET)
	public String home(final Model model,
			final HttpServletRequest request,
			final HttpServletResponse response
			) throws IOException{
		return "frontend/lienhe";
	}
}
