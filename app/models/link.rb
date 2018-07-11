class Link < ApplicationRecord
	validates :original_url, presence: true
	validates_format_of :original_url, :with => /(http|https):\/\/[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,5}/i, :on => :create
end
