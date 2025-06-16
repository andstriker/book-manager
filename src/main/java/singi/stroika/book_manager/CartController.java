package singi.stroika.book_manager;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api/cart")
public class CartController {

    @Autowired
    private CartRepository korpaRepository;

    @PostMapping("/{id}")
    public ResponseEntity<?> addToCart(@RequestBody CartItem item) {
        return ResponseEntity.ok(korpaRepository.save(item));
    }

    @GetMapping
    public List<CartItem> getCart() {
        return korpaRepository.findAll();
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<?> removeFromCart(@PathVariable Long id) {
        korpaRepository.deleteById(id);
        return ResponseEntity.ok().build();
    }
}
