package singi.stroika.book_manager;

import jakarta.persistence.Id;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;

import lombok.*;

@Entity
public class Author {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Getter
	@Setter
    private Long author_id;
    @Getter
	@Setter
    private String name;
    @Getter
	@Setter
    private String nationality;
}
