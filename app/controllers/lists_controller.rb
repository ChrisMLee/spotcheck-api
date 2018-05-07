class ListsController < ApplicationController
  before_action :set_list, only: [:show, :update, :destroy]

  def index
    @lists = current_user.lists.to_json(include: :places)
    # puts current_user.lists.to_json(include: :places)
    json_response(@lists)
  end

  # GET lists/:id
  def show
    json_response(@list)
  end

  # DELETE /lists/:id
  def destroy
    @list.destroy
    # 204 the action has been enacted and no further information is to be supplied
    head :no_content
  end

  # POST /lists
  def create
    @list = current_user.lists.create!(list_params)
    json_response(@list, :created)
  end

  private
  def list_params
    # whitelist params
    params.permit(:title, :created_by, :user_ids)
  end

  def set_list
    @list = List.find(params[:id])
  end
end
