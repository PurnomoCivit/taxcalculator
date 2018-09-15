class TaxController < ApplicationController
  before_action :set_user
  before_action :set_user_tax, only: [:show, :update, :destroy]

  # GET /users/:user_id/tax
  def index
	counts_tax_detail 
  	if @user.tax_detail.present?
    	json_response(["User" => @user, "taxes" => @user.taxes, "tax_details" => @user.tax_detail])
  	elsif @user.taxes.present?
    	json_response(["User" => @user, "taxes" => @user.taxes])
    else
    	json_response(["User" => @user])
    end
  end

  # GET /users/:user_id/tax/:id
  def show 
    json_response(@tax)
  end

  # POST /users/:user_id/tax
  def create
   	total = counts_tax_total
    @user.taxes.create!(name: tax_params['name'], tax_code: tax_params['tax_code'], amount: tax_params['amount'], tax_amount: total[0]['tax_amount'], total_amount: total[0]['total_amount'])
    json_response(@user.taxes, :created)
  end

  # PUT /users/:user_id/tax/:id
  def update
  	if tax_params.empty?
  		head :no_content
  	else
   		total = counts_tax_total
		@tax.update(name: tax_params['name'], tax_code: tax_params['tax_code'], amount: tax_params['amount'], tax_amount: total[0]['tax_amount'], total_amount: total[0]['total_amount'])
    	json_response(@tax)
    end
  end

  # DELETE /users/:user_id/tax/:id
  def destroy
    @tax.destroy
    json_response(["User ID = "+params[:id]+" has been deleted"])
  end

  private

  def tax_params
    params.permit(:name, :tax_code, :amount)
  end

  def set_user
    @user = User.find(params[:user_id])
  end


  def set_user
    @user = User.find(params[:user_id])
  end

  def set_user_tax
    @tax = @user.taxes.find_by!(id: params[:id]) if @user
  end

  def counts_tax_total (tax_id = nil)
  	taxAmount = ""
  	totalAmount = ""
  	taxCode = tax_params['tax_code'].to_i
  	amount = tax_params['amount'].to_f

  	if taxCode.present?
  		if taxCode == 1
  			taxAmount = ( 10 * amount ) / 100;
  			totalAmount = amount + taxAmount;
  		elsif taxCode == 2
  			taxAmount = 10 + ( 2 * amount ) / 100;
  			totalAmount = amount + taxAmount;
  		else taxCode == 3
  			if amount >= 100
  				taxAmount = (amount - 100) / 100;
  			else
  				taxAmount = 0;
  			end
  			totalAmount = amount + taxAmount;
  		end
  	end

  	return @counts_tax = ["tax_amount" => taxAmount, "total_amount" => totalAmount]
  end

  def counts_tax_detail 
  	totals = @user.taxes.select("sum(taxes.amount) as jumlah_amount, sum(taxes.tax_amount) as total_tax_amount, sum(taxes.total_amount) as grand_total").where(user_id: @user.id)

  	if @user.tax_detail.nil?
    	@tax_detail = TaxDetail.create!(total_amount: totals[0]['jumlah_amount'], total_tax_amount: totals[0]['total_tax_amount'], grand_total: totals[0]['grand_total'], user_id: @user.id)
  	else
    	@tax_detail = TaxDetail.where(id: @user.tax_detail.id, user_id: @user.id).update_all(total_amount: totals[0]['jumlah_amount'], total_tax_amount: totals[0]['total_tax_amount'], grand_total: totals[0]['grand_total'])
    end
  end

end
