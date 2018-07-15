class MembersController < ApplicationController
  def index
    @members = Member.all
    @members = Member.order("number")
  end

  def show
    @member =Member.find(params[:id])
  end

  def new
    @member = Member.new(birthday: Date.new(1980, 1, 1)) #作成時の誕生日初期値を1980/01/01にした状態で新たなオブジェクトを作成します
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
