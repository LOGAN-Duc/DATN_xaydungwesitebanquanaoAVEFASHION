package vn.devpro.asestore.controller.frontend;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import vn.devpro.asestore.Model.Category;
import vn.devpro.asestore.controller.BaseController;
import vn.devpro.asestore.service.CategoryService;

@Controller
public class UserContactController extends BaseController{
	@Autowired
	private CategoryService categoryService;
	@RequestMapping(value = "/contact", method = RequestMethod.GET)
	public String contact(
			final Model model,
			final HttpServletRequest request,
			final HttpServletResponse response
			)throws IOException{
		List<Category> categories = categoryService.findAll();model.addAttribute("categories", categories);
		return "frontend/contact/contact";
	}
}
