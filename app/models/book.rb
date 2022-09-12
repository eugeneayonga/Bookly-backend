class Book < ActiveRecord::Base

    # macros association
    has_many :reviews

end