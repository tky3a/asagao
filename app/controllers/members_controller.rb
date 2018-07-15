class MembersController < ApplicationController
  def index
    @members = Member.all
    @members = Member.order("number")
  end

  def show
    @member =Member.find(params[:id])
  end

  def new
  end

  def edit
    @member = Member.find(params[:id])
  end

  def create
  end

  def update
  end

  def destroy
  end

  def search
    @members = Member.search(params[:q])
    render "index"                        #検索してindexアクションを返す
  end

end
