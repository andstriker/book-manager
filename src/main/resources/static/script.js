axios.get('/api/books')
  .then(response => {
    const books = response.data;
    const container = document.getElementById("bookCards");
    const allCards = [];

    document.getElementById('searchInput').addEventListener('input', (e) => {
      const query = e.target.value.toLowerCase();
      console.log(allCards);

      allCards.forEach(({ element, title }) => {
        if (title.includes(query)) {
          element.style.display = 'block';
        } else {
          element.style.display = 'none';
        }
      });
    });

    books.forEach(book => {
      axios.get(`https://www.googleapis.com/books/v1/volumes?q=intitle:${book.title}+inauthor:${book.author.name}+${book.year}&maxResults=1`)
        .then(googleRes => {
          const gBook = googleRes.data.items?.[0];
          const info = gBook?.volumeInfo || {};
          const thumbnail = info.imageLinks?.thumbnail?.replace('http:', 'https:') || 'https://via.placeholder.com/150';

          const card = document.createElement('div');
          card.className = 'col';
          card.innerHTML = `
            <div class="card h-100 text-bg-dark shadow" style="cursor: pointer;">
              <img src="${thumbnail}" class="card-img-top" alt="${book.title}">
              <div class="card-body">
                <h5 class="card-title">${book.title}</h5>
                <p class="card-text mb-1"><strong>Autor:</strong> ${book.author?.name || 'Nepoznat'}</p>
                <p class="card-text mb-1"><strong>Žanr:</strong> ${book.genre}</p>
                <p class="card-text"><strong>Godina:</strong> ${book.year || 'N/A'}.</p>
              </div>
            </div>
          `;

          card.addEventListener('click', () => {
            localStorage.setItem('bookDetails', JSON.stringify(gBook));
            window.location.href = 'book.html';
          });

          container.appendChild(card);
          allCards.push({ element: card, title: book.title.toLowerCase() });
        })
        .catch(err => {
          console.warn("Google Books lookup failed:", err);
        });
      });
    })
    .catch(err => {
      console.error("Book API failed:", err);
    });