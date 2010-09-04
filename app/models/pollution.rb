class Pollution < ActiveRecord::Base
  has_many :pollution
  before_save :insert_null_if_empty

  def insert_null_if_empty
    self.value = nil if self.value == ''
  end
  
end
