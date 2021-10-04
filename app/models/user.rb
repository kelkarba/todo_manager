class User < ActiveRecord::Base
  def to_pleaseant_string
    "#{id}. #{name} #{email} #{password}"
  end
end
