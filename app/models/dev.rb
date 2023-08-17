class Dev < ActiveRecord::Base
  has_many :freebies
  has_many :companies, through: :freebies

  def received_one? item_name
    freebie_items = self.freebies.map {|freebie| freebie.item_name}
    freebie_items.include? item_name

    # Alternate Solution
    # self.freebies.any? {|freebie| freebie.item_name == item_name}
  end

  def give_away dev, freebie
    if self.received_one? freebie.item_name
      freebie.update(dev: dev)
      "#{freebie.item_name} now belongs to #{dev.name}"
    else
      "#{freebie.item_name} doesn't belong to #{self.name}"
    end

    # Alternate Solution
    # freebie.update(dev: dev) unless freebie.dev != self
  end

end
