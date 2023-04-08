class Audition < ActiveRecord::Base
    belongs_to :role

  def call_back
    self.hired = true
    save
  end

  def role
    Role.find(self.role_id)
  end
  
end