# User Types

* Owner of the books

# Stories

## Owner Adds New Book

> As an owner, I want to add new books to my collection so I can
> keep track of my personal library

### Acceptance Criteria

* Owner selects 1 and sees output "Let's Add a New Book"
* Owner is prompted for input to the following questions:
  * Title?
  * Author?
  * Genre?
  * Description?
  * Have you read this book? Y/N
* Displays success message: "#{title} has been added to your library!"

### Usage Example

    ./bookbank
    => What would you like to do?
    => 1. Add a new book
    => 2. Find books
    => 3. Update a book
    => 4. Mark book as read
    "1"
    => Let's add a new book!
    => Title?
    "Room"
    => Author?
    "Emma Donoghue"
    => Genre?
    "Literary Fiction"
    => Description?
    "Told entirely in the language of the energetic, pragmatic five-year-old Jack, ROOM is a celebration of resilience and the limitless bond between parent and child, a brilliantly executed novel about what it means to journey from one world to another."
    => Have you read Room? Y/N
    "Y"
    => Room has been added to your library!

## Owner Searches through Their Books

> As an owner, I want to search through my books (by title, genre or author) and see a list of
> all the books that match the criteria. I can also view the details of a book from the list.

### Acceptance Criteria

* Owner selects 2 and sees output "How would you like to search?"
* Owner can select by title, author or genre.
* Owner will enter the title, author or genre and a list of the corresponding books
will be displayed.
* Owner can select a number that corresponds to a book and view its details.

### Usage Example

    ./bookbank
    => What would you like to do?
    => 1. Add a new book
    => 2. Find books
    => 3. Update a book
    => 4. Mark book as read
    "2"
    => How would you like to search?
    => 1. By title
    => 2. By author
    => 3. By genre
    "2"
    => Please enter an author:
    "Stephen King"
    => 1. Carrie
    => 2. The Shining
    => 3. Cell
    "2"
    => The Shining by Stephen King
    => Genre: Horror
    => Description: The Shining is a horror novel by American author Stephen King. Published in 1977, it is King's third published novel and first hardback bestseller, and the success of the book firmly established King as a preeminent author in the horror genre.
    => Read? No

## Owner Updates Books

> As an owner, I want to update books that have already been added to my library

### Acceptance Criteria

* Owner selects 3 and sees output "Please enter title to update" and then
"Please enter author".
* Owner is then asked what it is they would like to update and are given a list:
  * Title, Author, Genre, Description, & Is Read? status
* Owner selects option and is asked to enter the new information.
* Information is updated and owner sees a success message: #{title} has been updated!

### Usage Example

    ./bookbank
    => What would you like to do?
    => 1. Add a new book
    => 2. Find books
    => 3. Update a book
    => 4. Mark book as read
    "3"
    => Please enter the title you would like to update
    "The Great Gatsby"
    => Please enter the author of this title
    "F. Scott Fitzgerald"
    => What would you like to update?
    => 1. Title
    => 2. Author
    => 3. Genre
    => 4. Description
    "3"
    => Please enter the updated genre
    "fiction"
    => The Great Gatsby has been updated!

## Owner Updates 'is read?' status

> As an owner, I want to mark a book as read once I have finished it.

### Acceptance Criteria

* Owner selects 4 and is prompted to enter the title and author.
* Owner is asked "Have you read this book? Y/N".
* Owner responds "Y" if read or "N" if not.
* Owner sees success message "#{title} has been marked as read/not read"

### Usage Example

    ./bookbank
    => What would you like to do?
    => 1. Add a new book
    => 2. Find books
    => 3. Update a book
    => 4. Mark book as read
    "4"
    => Please enter the title you would like to update
    "The Great Gatsby"
    => Please enter the author of this title
    "F. Scott Fitzgerald"
    => Have you read this book? Y/N
    "Y"
    => The Great Gatby has been marked as read.
