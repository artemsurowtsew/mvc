<?php
include_once("Book.php"); 
class Model {
    private $db;

    public function __construct() {
        // Підключення до бази даних
        $this->db = new mysqli("localhost", "root", "", "library");

        // Перевірка підключення
        if ($this->db->connect_error) {
            die("Connection failed: " . $this->db->connect_error);
        }
    }

    // Отримати список книг
    public function getBookList() {
        $books = [];
        $query = "SELECT b.title, a.first_name, a.last_name, b.description 
                  FROM books b 
                  JOIN authors a ON b.author_id = a.author_id";
        $result = $this->db->query($query);

        if ($result) {
            while ($row = $result->fetch_assoc()) {
                $books[] = new Book($row['title'], $row['first_name'] . ' ' . $row['last_name'], $row['description']);
            }
        }

        return $books;
    }

    // Отримати книгу за назвою
    public function getBook($title) {
        $query = "SELECT b.title, a.first_name, a.last_name, b.description 
                  FROM books b 
                  JOIN authors a ON b.author_id = a.author_id
                  WHERE b.title = ?";
        $stmt = $this->db->prepare($query);
        $stmt->bind_param("s", $title);
        $stmt->execute();
        $result = $stmt->get_result();
        $book = null;

        if ($result && $row = $result->fetch_assoc()) {
            $book = new Book($row['title'], $row['first_name'] . ' ' . $row['last_name'], $row['description']);
        }

        return $book;
    }

    // Пошук книг за автором та назвою
    public function searchBooks($author, $title) {
        $books = [];
        $query = "SELECT b.title, a.first_name, a.last_name, b.description 
                  FROM books b 
                  JOIN authors a ON b.author_id = a.author_id
                  WHERE a.first_name LIKE ? AND a.last_name LIKE ? AND b.title LIKE ?";
        $stmt = $this->db->prepare($query);
        $author = "%$author%";
        $title = "%$title%";
        $stmt->bind_param("sss", $author, $author, $title);
        $stmt->execute();
        $result = $stmt->get_result();

        while ($row = $result->fetch_assoc()) {
            $books[] = new Book($row['title'], $row['first_name'] . ' ' . $row['last_name'], $row['description']);
        }

        return $books;
    }
}
?>
