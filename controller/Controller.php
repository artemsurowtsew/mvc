<?php
include_once("model/Model.php");

class Controller {
    public $model;

    public function __construct() {
        $this->model = new Model();
    }

    public function invoke() {
        // Перевірка на пошук
        if (isset($_GET['search'])) {
            $author = isset($_GET['author']) ? $_GET['author'] : '';
            $title = isset($_GET['title']) ? $_GET['title'] : '';
            $books = $this->model->searchBooks($author, $title);
            include 'view/booklist.php';
        } elseif (!isset($_GET['book'])) {
            // Якщо не шукаємо конкретну книгу, відображаємо весь список
            $books = $this->model->getBookList();
            include 'view/booklist.php';
        } else {
            // Якщо конкретну книгу запитують
            $book = $this->model->getBook($_GET['book']);
            include 'view/viewbook.php';
        }
    }
}
?>
