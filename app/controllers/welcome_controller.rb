class WelcomeController < ApplicationController
  #layout "external_pages", except: [:index, :faqs]
  #before_action :authenticate_user!, only: [:register]
  def about_us
  end
  def about_momo

  end

  def team
  end

  def faqs
  end

  def index
    #renders_with 'views/welcome/index.html.erb'
    #flash[:success ] = "Welcome to PayTel MoMo pages"
    #other alternatives are
    # flash[:warn ] = "Israel don't quite like warnings"
    #flash[:danger ] = "Naomi let the dog out!"
  end

  def enter
    #renders with views/layouts/application.html.erb
  end

  def news

  end
  def events

  end
end
