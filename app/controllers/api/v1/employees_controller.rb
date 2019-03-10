class Api::V1::EmployeesController < ApplicationController 
  before_action :set_employee, only: [:update, :destroy]
  resource_description do
    short 'EmployeesController'
    formats ['json']
    api_version 'v1'
    error 401, 'Not authorized'
  end

  api!
  description 'employee list'
  example "
  {
    message:{
      listing employees.
    }
  }"
  def index
    @employee = Employee.all
    render 'employees/index.rabl'
  end

  api!
  param :firstname, String, desc: 'Firstname', required: true
  param :lastname, String, desc: 'Lastname', required: true
  param :email, String, desc: 'Email', required: true
  param :gender, String, desc: 'Gender', required: true
  param :phone, String, desc: 'Phone', required: true
  param :address, String, desc: 'Address', required: true
  param :employee_id, String, desc: 'Employee ID', required: true
  param :picture, String, desc: 'Picture', required: true
  param :DOB, String, desc: 'DOB', required: true
  description 'Create Employee'
  example "
  {
    message:{
      notice: Employee created
    }
  }"
  def create
    @employee = Employee.new(employee_params)
    if @employee.save
      render json: { status: true, notice: 'Employee was successfully created.'}
    else
      render json: { status: false, notice: @employee.errors }
    end
  end

  api!
  param :firstname, String, desc: 'Firstname'
  param :lastname, String, desc: 'Lastname'
  param :email, String, desc: 'Email'
  param :gender, String, desc: 'Gender'
  param :phone, String, desc: 'Phone'
  param :address, String, desc: 'Address'
  param :employee_id, String, desc: 'Employee ID'
  param :picture, String, desc: 'Picture'
  param :DOB, String, desc: 'DOB'
  description 'Update Employee'
  example "
  {
    message:{
      notice: Employee updated.
    }
  }"
  def update
    if @employee.update(employee_params)
      render json: { success: true, notice: 'Employee updated.'}
    else
      render json: {success: false, notice: @employee.errors}
    end
  end
  
  api!
  description 'destroy employee'
  example "
  {
    message:{
      employee destroyed.
    }
  }"
  def destroy
    @employee.destroy
      render json: { notice: 'Employee was successfully destroyed.' }
  end
  
  private

    def set_employee
      @employee = Employee.find(params[:id])
    end

    def employee_params
      params.permit(:firstname, :lastname, :email, :gender, :phone, :address, :employee_id, :department, :picture, :DOB)
    end
  
end
