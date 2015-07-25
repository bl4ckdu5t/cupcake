class TransactionMailer < Devise::Mailer
	helper :application
	include Devise::Controllers::UrlHelpers
	default template_path: 'devise/mailer'

	def confirmation_instructions(record, token, opts={})
		headers["Custome-header"] = "DesignsCook confirmation instruction"
		opts[:from] = 'DesignsCook Mail Delivery'
		opts[:reply_to] = 'info@designscook.com'
	end
end
