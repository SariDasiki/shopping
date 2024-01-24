require_relative "item_manager"
require_relative "ownable"

class Cart
  include Ownable
  include ItemManager

  def initialize(owner)
    self.owner = owner
    @items = []
  end

  def items
    @items
  end

  def add(item)
    @items << item
  end
  
  def total_amount
    @items.sum(&:price)
  end
  def check_out
    return if owner.wallet.balance < total_amount
    
    # self.owner.wallet.price=item.owner.wallet.price 
    items.each do|item| 
      
      # Customerの財布の処理
      # Customerの情報から、Customerの財布の金額を得たいから
      # 商品の値段が知りたくて、itemの金額を取得する
      # 購入者の財布の引き算をしたいから、変数amountに金額を代入している
      
      amount=item.price
      self.owner.wallet.withdraw(amount)
      # withdrow関数で、財布を引き算した
      
      # withdrow関数を呼び出したいから使う

      item.owner.wallet.deposit(amount)
      # お金の情報が、cartのオーナーからitemのオーナーに移された
      
      item.owner=self.owner
    
    end
  
    self.items.clear  
    

  # ## ヒント
  #   - カートのオーナーのウォレット ==> self.owner.wallet
  #   - アイテムのオーナーのウォレット ==> item.owner.wallet
  #   - お金が移されるということ ==> (？)のウォレットからその分を引き出して、(？)のウォレットにその分を入金するということ
  #   - アイテムのオーナー権限がカートのオーナーに移されること ==> オーナーの書き換え(item.owner = ?)
  end

end
