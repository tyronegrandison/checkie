class ApiController < ApplicationController
  def check_fraud
    random_status = %w(found, not_found, non_compliant)[rand 3]
    render json: {status: random_status}
  end
end
