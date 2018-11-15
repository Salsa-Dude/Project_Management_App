class Project < ApplicationRecord
  has_many :tasks
  has_many :collaborators
  has_many :users, through: :collaborators
  has_many :notes

  validates :name, presence: true, uniqueness: true
  validates :description, presence: true
  validates :status, presence: true
  validates :due_date, presence: true

  def format_due_date
    self.due_date.strftime("%A, %B %d, %Y")
  end

  def capitalize_stuff
    self.name.split.map{|x| x.capitalize}.join(" ")
  end
end
