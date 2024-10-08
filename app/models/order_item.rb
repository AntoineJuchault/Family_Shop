class OrderItem < ApplicationRecord
  belongs_to :order
  belongs_to :product
  
  after_initialize :set_default_quatity, if: :new_record?

  private

  def set_default_quatity
    self.quantity ||= O
  end
end
