class ApiController < ApplicationController
  def check_fraud
    # possible status:
    #   found
    #   not_found
    #   non_compliant

    arel = Contractor.where(name: params[:name])
    status = if 0 == arel.count
      'not_found'
    else
      arel.first.osha_violation_indicator ? 'non_compliant' : 'found'
    end

    render json: {status: status}
  end
end
