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
@RequestMapping(path = "/api/books")
@CrossOrigin
public class BookController {
    @Autowired private BookRepository bookRepo;

    @GetMapping public List<Book> getAll() { return bookRepo.findAll(); }
    @PostMapping public Book create(@RequestBody Book b) { return bookRepo.save(b); }
    @PutMapping("/{id}")
    public Book update(@PathVariable Long id, @RequestBody Book b) {
        b.setBook_id(id);
        return bookRepo.save(b);
    }
    @DeleteMapping("/{id}") public void delete(@PathVariable Long id) { bookRepo.deleteById(id); }
}
