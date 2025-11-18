package vn.uhie.ieuhsshop.service;

import org.springframework.stereotype.Service;
import vn.uhie.ieuhsshop.domain.Category;
import vn.uhie.ieuhsshop.repository.CategoryRepository;

import java.util.List;
import java.util.Optional;

@Service
public class CategoryService {
    private final CategoryRepository categoryRepository;
    public CategoryService(CategoryRepository categoryRepository){
        this.categoryRepository = categoryRepository;
    }

    public List<Category> fetchCategory(){
        return categoryRepository.findAll();
    }

    public Category fetchCategoryByName(String name){
        Optional<Category> category = this.categoryRepository.findCategoryByName(name);
        if(category.isPresent()){
            return category.get();
        }
        return null;
    }

    public Category fetchCategoryById(Long id) {
        Optional<Category> category = this.categoryRepository.findById(id);
        if(category.isPresent()){
            return category.get();
        }
        return null;
    }

    public void handleSaveCategory(Category category){
        this.categoryRepository.save(category);
    }
}
