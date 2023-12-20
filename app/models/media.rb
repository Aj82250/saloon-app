class Media < ApplicationRecord 
  belongs_to :mediable, polymorphic: true
end
