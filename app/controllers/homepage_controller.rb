class HomepageController < ApplicationController
  def index
    gon.logo = get_asset_path('preplogo@2x.png')
  end

  private

    def get_asset_path(name)
      ActionController::Base.helpers.asset_path(name)
    end
end
