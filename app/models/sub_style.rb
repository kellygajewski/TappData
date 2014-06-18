class SubStyle < ActiveRecord::Base
  has_many :beers
  belongs_to :main_style
end
