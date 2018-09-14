class ExternalPagesController < ApplicationController
  layout "external_pages", except: [:index, :faqs]

  def about_us
  end

  def team
  end

  def faqs
  end
end
