<html>
<head></head>
<body>
    <!-- Форма для пошуку -->
    <form method="get" action="index.php">
        <label for="author">Author:</label>
        <input type="text" id="author" name="author" value="<?php echo isset($_GET['author']) ? $_GET['author'] : ''; ?>">
        <label for="title">Title:</label>
        <input type="text" id="title" name="title" value="<?php echo isset($_GET['title']) ? $_GET['title'] : ''; ?>">
        <button type="submit" name="search" value="1">Search</button>
    </form>

    <table>
        <tbody>
            <tr><td>Title</td><td>Author</td><td>Description</td></tr>
            <?php
                foreach ($books as $book) {
                    echo '<tr><td><a href="index.php?book=' . $book->title . '">' . $book->title . '</a></td><td>' . $book->author . '</td><td>' . $book->description . '</td></tr>';
                }
            ?>
        </tbody>
    </table>
</body>
</html>
