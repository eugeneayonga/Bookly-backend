class Review < ActiveRecord::Base

    # macros association
    belongs_to :book

end