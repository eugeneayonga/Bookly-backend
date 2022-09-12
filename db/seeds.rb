puts "🌱 Seeding spices..."

# Seed your database here

Book.create(title: "The Great Gatsby", author: "F. Scott Fitzgerald", likes: 0)
Book.create(title: "The Catcher in the Rye", author: "J.D. Salinger", likes: 0)
Book.create(title: "The Grapes of Wrath", author: "John Steinbeck", likes: 0)
Book.create(title: "The Sun Also Rises", author: "Ernest Hemingway", likes: 0)
Book.create(title: "Steve Jobs", author: "Walter Isaacson", likes: 0)
Book.create(title: "The Hard Thing About Hard Things", author: "Ben Horowitz", likes: 0)
Book.create(title: "The Alchemist", author: "Paulo Coelho", likes: 0)
Book.create(title: "The Intelligent Investor", author: "Benjamin Graham", likes: 0)
Book.create(title: "The Art of War", author: "Sun Tzu", likes: 0)
Book.create(title: "The 48 Laws of Power", author: "Robert Greene", likes: 0)


all_reviews = ["This book is amazing!", "I love this book!", "This book is so good!", "I can't put this book down!", "This book is so interesting!", "This book is so boring!", "This book is so sad!", "This book is so funny!", "This book is so scary!", "This book is so weird!"]

Book.all.each do |book|
    Review.create(text: all_reviews.sample, book_id: book.id)
end


puts "✅ Done seeding!"
