class Company < ActiveRecord::Base

  def self.dev_with_highest_value_of_freebies # not in deliverables
    self.all.max_by(&:total_freebies_value)
    # max_by is a ruby method, not AR method
  end

  has_many :freebies
  has_many :devs, through: :freebies

  def give_freebie(dev, item_name, value)
    # self.freebies.create( # I was close...
    #   company_id: self.id,
    #   dev_id: dev,
    #   item_name: item_name,
    #   value: value
    # )

    Freebie.create( #solution
      company_id: self.id,
      dev_id: dev,
      item_name: item_name,
      value: value
    )
  end

  def self.oldest_company
    # oldest_year = self.minimum(:founding_year) # options
    # Company.find_by(founding_year: oldest_year)

    # self.all.min_by { |company| company.founding_year } # options

    # self.all.min_by(&:founding_year) # options

    self.order(:founding_year).first
  end

end
