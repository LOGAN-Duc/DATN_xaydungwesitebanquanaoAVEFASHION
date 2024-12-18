package vn.devpro.asestore.controller.backend;

import java.io.IOException;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import vn.devpro.asestore.Model.Category;
import vn.devpro.asestore.controller.BaseController;
import vn.devpro.asestore.service.CategoryService;

@Controller
public class AdminCategoryController extends BaseController{

	@Autowired
	private CategoryService categoryService;
	
	@RequestMapping(value = "/admin/category-list", method = RequestMethod.GET)
	private String categoryList(final Model model) throws IOException{
		List<Category>  categories = categoryService.findAll();
		model.addAttribute("categories", categories);
		return "backend/category-list";
	}
	
	@RequestMapping(value = "/admin/category-add", method = RequestMethod.GET)
	private String categoryAdd(final Model model) throws IOException{
		List<Category>  categories = categoryService.findAll();
		model.addAttribute("categories", categories);
		Category category = new Category();
		category.setCreateDate(new Date());
		model.addAttribute("category", category);
		return "backend/category-add";
	}
	
	@RequestMapping(value = "/admin/category-add-save", method = RequestMethod.POST)
	private String categoryAddSave(final Model model,
			final HttpServletRequest request,
			@ModelAttribute("category") Category category) throws IOException{
		categoryService.saveOrUpdate(category);
		return "redirect:/admin/category-list";
	}
	
	@RequestMapping(value = "/admin/category-edit/{categoryId}", method = RequestMethod.GET)
	private String categoryEdit(final Model model,
			@PathVariable("categoryId")int categoryId) throws IOException{
		
		Category category = categoryService.getById(categoryId);
		model.addAttribute("categpry", category);
		
		List<Category>  categories = categoryService.findAll();
		model.addAttribute("categories", categories);
		
		model.addAttribute("category", category);
		return "backend/category-edit";
	}
	
	@RequestMapping(value = "/admin/category-edit-save", method = RequestMethod.POST)
	private String categoryEditSave(final Model model,
			final HttpServletRequest request,
			@ModelAttribute("category") Category category) throws IOException{
		categoryService.saveOrUpdate(category);
		return "redirect:/admin/category-list";
	}
}
