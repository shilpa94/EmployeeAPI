class Api::V1::LeaveRequestsController < ApplicationController
  
  api!
  description 'employee list'
  example "
  {
    message:{
      listing leave requests.
    }
  }"
  def index
    @leave_request = LeaveRequest.all
    render 'leave_requests/index.rabl'
  end
end
