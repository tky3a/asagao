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
    @member = Member.new(params[:member])
    if @member.save
      redirect_to @member, notice: "会員登録をしました"
    else
      render "new"
    end
  end

  def update
    @member = Member.find(params[:id])
    @member.assign_attributes(params[:member])
    if @member.save
      redirect_to @member, notice: "会員情報を更新しました"
    else
      render 'edit'
    end
  end

  def destroy
    @member = Member.find_by(id: params[:id])
    @member.destroy
    redirect_to :members, notice: "会員を削除しました"
  end

  def search
    @members = Member.search(params[:q])
    render "index"                        #検索してindexアクションを返す
  end

end
