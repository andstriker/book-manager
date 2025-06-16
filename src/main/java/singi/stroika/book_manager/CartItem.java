package singi.stroika.book_manager;

import jakarta.persistence.Id;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;

import lombok.*;

@Entity
public class CartItem {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Getter
	@Setter
    private Long cartItem_id;
    @Getter
	@Setter
    private Long bookId;
}
