class School < ActiveRecord::Base

  has_one :uname, :as => :named

  belongs_to :federation
  belongs_to :filiation_category

  validates_presence_of :name

  belongs_to :director, :class_name => "Person"
  has_many :team_members, :class_name => "Person"

  def find_k_school
    return nil if self.kshema_school_id.nil?
    response = Typhoeus::Request.get(School.k_school_url(self.kshema_school_id), :params => {:key => "a7ad4703203d9a3a120"})
    if response.code == 200
      k_school = ActiveSupport::JSON.decode response.body
    end
    return k_school
  end

  %W(students swasthya iniciantes).each do |attr|
    define_method "#{attr}_count" do
      ks = self.find_k_school
      unless ks.nil?
        ret = Rails.cache.fetch("school_#{self.id}_#{attr}_count", :expires_in => 5.hours){ ks[attr] }
      end
      return ret
    end
  end

  def self.k_school_url(args={})
    # TODO check environment and return accordingly
    if args.is_a?(Integer) || args.is_a?(String)
      id = args
    elsif args.is_a?(Hash)
      id = args[:id]
    end
    service_address = "https://metododerose.org/kshema"
    url = "#{service_address}/pws/v1/schools"
    url << "/#{id}" unless id.nil?
    return url
  end
end