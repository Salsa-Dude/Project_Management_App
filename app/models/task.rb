class Task < ApplicationRecord
  belongs_to :project

  def format_due_date
    self.due_date.strftime("%A, %B %d, %Y")
  end

  def capitalize_stuff
    self.name.split.map{|x| x.capitalize}.join(" ")
  end
end
