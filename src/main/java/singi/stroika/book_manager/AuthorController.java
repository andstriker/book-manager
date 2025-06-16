package singi.stroika.book_manager;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/authors")
@CrossOrigin
public class AuthorController {
    @Autowired private AuthorRepository authorRepo;

    @GetMapping public List<Author> getAll() { return authorRepo.findAll(); }
    @PostMapping public Author create(@RequestBody Author a) { return authorRepo.save(a); }
    @PutMapping("/{id}")
    public Author update(@PathVariable Long id, @RequestBody Author a) {
        a.setAuthor_id(id);
        return authorRepo.save(a);
    }
    @DeleteMapping("/{id}") public void delete(@PathVariable Long id) { authorRepo.deleteById(id); }
}
