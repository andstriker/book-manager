package singi.stroika.book_manager;

import jakarta.persistence.Id;

import java.time.Year;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;

import lombok.*;

@Entity
public class Book {
	@Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
	@Getter
	@Setter
    private Long book_id;
	@Getter
	@Setter
    private String title;
	@Getter
	@Setter
    private String genre;
	@Getter
	@Setter
    private Year year;
	@Getter
	@Setter
    private Float price;

	@Getter
	@Setter
	@ManyToOne
    @JoinColumn(name = "author_id")
    private Author author;
}
