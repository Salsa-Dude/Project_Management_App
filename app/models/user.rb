class User < ApplicationRecord
has_many :collaborators
has_many :projects, through: :collaborators
has_many :notes

end
