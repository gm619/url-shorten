class CleanLinksWorker
  include Sidekiq::Worker

  sidekiq_options queue: 'default'

  def perform(*args)
    # Do something
    Link.all.each do |link|
    	link.destroy if link.expiration_date.present? && link.expiration_date.strftime('%Y-%m-%d').to_date < Date.current
    end
  end
end
