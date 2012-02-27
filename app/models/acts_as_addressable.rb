module ActsAsAddressable
  module ClassMethods
    def acts_as_addressable
      geocoded_by :full_address
      after_validation :geocode #, :if => :address_changed?
    end
  end
  
  module InstanceMethods
    def full_address
      %[#{street_address}, #{apt_suite_other}, #{city}, #{region} #{postal_code}]
    end
  end
  
  def self.included(receiver)
    receiver.extend         ClassMethods
    receiver.send :include, InstanceMethods
  end
end