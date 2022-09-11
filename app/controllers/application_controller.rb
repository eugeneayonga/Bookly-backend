class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'
  
  # Add your routes here
  # get "/" do
  #   { message: "Good luck with your project!" }.to_json
  # end

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

  post "/books" do 
    new_book = Book.create(title: params[:title], author: params[:author], likes: params[:likes])
    new_book.to_json
  end

end
