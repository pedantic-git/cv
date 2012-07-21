module ApplicationHelper
	require 'digest/md5'
	
	def gravatar(email, size=80, options={})
		hash = Digest::MD5.hexdigest(email)
		image_tag "http://www.gravatar.com/avatar/#{hash}?s=#{size}", options
	end
	
	def sections
		%w{profile skills employment education interests references}
	end
	
	def section_header(section)
		{
			'employment' => 'Employment history',
			'interests' => 'Interests & other achievements'
		}[section] || section.capitalize
	end
	
end
