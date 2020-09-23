require 'rails_helper'

RSpec.describe HealthController, type: :controller do
  describe 'GET #health' do
    it 'should return 204' do
      get :health

      expect(response.status).to eq(204)
    end
  end
end
