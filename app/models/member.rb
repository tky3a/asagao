class Member < ActiveRecord::Base
  include EmailAddressChecker
  #バリデーション
  # 背番号：空を禁止、１以上１００未満の整数、重複を禁止(ユニーク設定)
  validates :number, presence: true,
    numericality: { only_integer: true,
      greater_than: 0, less_than: 100, allow_blank: true },
    uniqueness: true

  #名前：空を禁止、半角英数字のみ、文字列の先頭はアルファベット、2文字以上20文字以下、重複を禁止(ユニーク設定)
  validates :name, presence: true,
    format: { with: /\A[A-Za-z]}\w*\z/, allow_blank: true },
    length: { minimum: 2, maximum: 20, allow_blank: true },
    uniqueness: true

  #本名；最大20文字
  validates :full_name, length: { maximum: 20 }

  #メール：メールが空では無い場合、書式をチェック、正しく無い場合はエラー
  validate :check_email

  private
  def check_email
    if email.present?
      errors.add(:email, :invalid) unless well_formed_as_email_address(email)
    end
  end

  #ここまでバリデーション

  class << self
    def search(query)
      rel = order("number")
        if query.present?
          rel = rel.where("name LIKE ? OR full_name LIKE ?",
              "%#{query}%", "%#{query}%")
        end
        rel
      end
    end
end
