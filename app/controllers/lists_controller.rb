class ListsController < ApplicationController
  before_action :set_list, only: [:show, :update, :destroy]

  def index
    @lists = current_user.lists.to_json(include: :places)
    puts current_user.lists.to_json(include: :places)
    json_response(@lists)
  end

  private
  def list_params
    # whitelist params
    params.permit(:title)
  end

  def set_list
    @list = List.find(params[:id])
  end
end
