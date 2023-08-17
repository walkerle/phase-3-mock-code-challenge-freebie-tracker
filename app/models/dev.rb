class Dev < ActiveRecord::Base
  has_many :freebies
  has_many :companies, through: :freebies

  def received_one? item_name
    # self.freebies.any? { |f| f.item_name == item_name } # option

    # self.freebies.pluck(:item_name).include?(item_name) # option

    !!self.freebies.find_by(item_name: item_name) # option => coerces expression into a boolean

    # self.freebies.find_by(item_name: item_name) ? true : false # option
  end

  def give_away dev, freebie
    freebie.update(dev: dev) unless freebie.dev != self # option huh? .update?

    # if freebie.dev != self # option huh?
    #   "Dev doesn't own this item!"
    # else
    #   freebie.update(dev: dev)
    #   dev.reload
    # end
  end

  def total_freebies_value # not in deliverables
    self.freebies.sum(:value)
  end

end
