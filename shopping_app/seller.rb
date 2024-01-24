require_relative "user"
require_relative "ownable"

class Seller < User
  include Ownable
  def initialize(name)
    super(name) # superの役割について確認したい場合は[https://diver.diveintocode.jp/curriculums/2360]のテキストを参考にしてください。
  end

end
