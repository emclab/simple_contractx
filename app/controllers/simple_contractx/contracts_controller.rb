require_dependency "simple_contractx/application_controller"

module SimpleContractx
  class ContractsController < ApplicationController
    before_action :require_employee
    before_action :load_parent_record
    
    def index
      @title = 'Contracts'      
      @contracts = params[:simple_contractx_contracts][:model_ar_r]
      @contracts = @contracts.where(:project_id => params[:project_id]) if @project
      @contracts = @contracts.page(params[:page]).per_page(@max_pagination)
      @erb_code = find_config_const('contract_index_view', 'simple_contractx')
    end
  
    def new
      @title = 'New Contract'
      @contract = SimpleContractx::Contract.new
      @erb_code = find_config_const('contract_new_view', 'simple_contractx')
    end
  
    def create
      @contract = SimpleContractx::Contract.new(new_params)
      @contract.last_updated_by_id = session[:user_id]
      if @contract.save
        redirect_to URI.escape(SUBURI + "/authentify/view_handler?index=0&msg=Successfully Saved!")
      else
        @erb_code = find_config_const('contract_new_view', 'simple_contractx')
        flash.now[:error] = t('Data Error. Not Saved!')
        render 'new'
      end
    end
  
    def edit
      @title = 'Edit Contract'
      @contract = SimpleContractx::Contract.find_by_id(params[:id])
      @erb_code = find_config_const('contract_edit_view', 'simple_contractx')
    end
  
    def update
      @contract = SimpleContractx::Contract.find_by_id(params[:id])
      @contract.last_updated_by_id = session[:user_id]
      if @contract.update_attributes(edit_params)
        redirect_to URI.escape(SUBURI + "/authentify/view_handler?index=0&msg=Successfully Updated!")
      else
        @erb_code = find_config_const('contract_edit_view', 'simple_contractx')
        flash.now[:error] = t('Data Error. Not Updated!')
        render 'edit'
      end
    end
  
    def show
      @title = 'Contract Info'
      @contract = SimpleContractx::Contract.find_by_id(params[:id])
      @erb_code = find_config_const('contract_show_view', 'simple_contractx')
    end
    
    protected
    def load_parent_record
      @project = SimpleContractx.project_class.find_by_id(params[:project_id]) if params[:project_id].present? 
      @project = SimpleContractx.project_class.find_by_id(SimpleContractx::Contract.find_by_id(params[:id]).project_id) if params[:id].present? 
      @project = SimpleContractx.project_class.find_by_id(params[:contract][:project_id]) if params[:contract].present? && params[:contract][:project_id].present?
    end
    
    private
    
    def new_params
      params.require(:contract).permit(:contract_on_file, :contract_total, :last_updated_by_id, :note, :paid_out, :payment_agreement, :project_id, :sign_date, 
                    :signed, :signed_by_id, :payment_term, :contract_num, :void, :other_charge, :executed_contract_total)
    end
    
    def edit_params
      params.require(:contract).permit(:contract_on_file, :contract_total, :last_updated_by_id, :note, :paid_out, :payment_agreement, :project_id, :sign_date, 
                    :signed, :signed_by_id, :payment_term, :contract_num, :void, :other_charge, :executed_contract_total)
    end
    
  end
end
