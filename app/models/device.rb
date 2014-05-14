  # Schema Information
  # Table name: device
  #  id         :integer          not null, primary key
  #  user_id    :integer
  #  token      :string(255)
  #  enabled    :boolean          default(TRUE)
  #  created_at :datetime         not null
  #  updated_at :datetime         not null
  #  platform   :string(255)

  class Device < ActiveRecord::Base
    #attr_accessible :enabled, :token, :user, :platform
    belongs_to :user
    validates_uniqueness_of :token, :scope => :user_id
  end

