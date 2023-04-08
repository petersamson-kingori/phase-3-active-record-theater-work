class Role < ActiveRecord::Base
    has_many :auditions
  
    def actors
      auditions.pluck(:actor).uniq
    end
  
    def locations
      auditions.pluck(:location).uniq
    end
  
    def lead
      hired_auditions = auditions.where(hired: true)
      if hired_auditions.empty?
        'no actor has been hired for this role'
      else
        hired_auditions.first
      end
    end
  
    def understudy
      hired_auditions = auditions.where(hired: true)
      if hired_auditions.size < 2
        'no actor has been hired for understudy for this role'
      else
        hired_auditions.second
      end
    end
  end
  