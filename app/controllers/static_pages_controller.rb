class StaticPagesController < ApplicationController
  def home
  end

  def help
  end

  def about
  end

  def donate
    respond_to do | format |
      format.js {render :layout => false}
    end
  end
end
