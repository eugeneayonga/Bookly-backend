class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'
  
  get "/books" do
    books = Book.all
    books.to_json(include: :reviews)
  end

  get "/books/" do
    book = Book.all(title: params[:title], author: params[:author], likes: params[:likes])
    book.to_json(include: :reviews)
  end

  get 'reviews/:id' do 
    review = Review.find(params[:id])
    review.to_json
  end

  # POST routes
  post "/books" do 
    new_book = Book.create(title: params[:title], author: params[:author], likes: params[:likes])
    new_book.to_json
  end

  post '/books/:book_id/reviews' do 
    book = Book.find_by(id: params[:book_id])
    new_review = book.reviews.create(text: params[:text])
    new_review.to_json(include: :book)
  end

  # PATCH route
  patch '/books/:id' do 
    book = Book.find_by(id: params[:id])
    book.update(likes: params[:likes])
    book.to_json(include: :reviews)
  end

  # DELETE route
  delete '/reviews/:id' do 
    review = Review.find_by(id: params[:id])
    review.destroy
    review.to_json
  end

end
