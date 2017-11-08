package entity;


import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Set;


/**
 * 购物车实体类(添加、删除和计算价格)
 * @author Administrator
 * @date 2016年08月01日
 */
public class Cart {
	
	    //购买商品的集合
		private HashMap<Items,Integer> goods;
		
		//购物车的总金额
		private double totalPrice;


		//构造方法
		public Cart(){
			goods = new HashMap<Items,Integer>();
			totalPrice = 0.0;
		}
		
		
		public HashMap<Items, Integer> getGoods() {
			return goods;
		}


		public void setGoods(HashMap<Items, Integer> goods) {
			this.goods = goods;
		}


		public double getTotalPrice() {
			return totalPrice;
		}


		public void setTotalPrice(double totalPrice) {
			this.totalPrice = totalPrice;
		}
		
		//添加商品进购物车的方法
		public boolean addGoodsInCart(Items item ,int number){
			System.out.println("in addgoodsincart function");
			if(goods.containsKey(item)){
				goods.put(item, goods.get(item)+number);
			}else{
				goods.put(item, number);	
			}
			calTotalPrice(); //重新计算购物车的总金额
			return true;
		}
		
		//删除商品的方法
		public boolean removeGoodsFromCart(Items item){
			goods.remove(item);
			calTotalPrice(); //重新计算购物车的总金额
			return true;
		}
		
		//统计购物车的总金额
		public double calTotalPrice(){
			double sum = 0.0;
			Set<Items> keys = goods.keySet(); //获得键的集合
			Iterator<Items> it = keys.iterator(); //获得迭代器对象
		    while(it.hasNext()){
		    	Items i = it.next();
		    	sum += i.getPrice()* goods.get(i);
		    }
		    this.setTotalPrice(sum); //设置购物车的总金额
		    return this.getTotalPrice();
		}
		
		public static void main(String[] args) {
			
			//先创建两个商品对象
			Items i1 = new Items();
			Items i2 = new Items();
			Items i3 = new Items();
			i1.setPrice(1);
			i1.setName("Hang");
			Cart cart = new Cart();
			cart.addGoodsInCart(i1, 1);
			cart.addGoodsInCart(i2, 2);
			//再次购买沃特篮球鞋，购买3双
			cart.addGoodsInCart(i3, 3);
			
			
			//遍历购物车商品的集合
			Set<Map.Entry<Items, Integer>> items= cart.getGoods().entrySet();
			for(Map.Entry<Items, Integer> obj:items){
				System.out.println(obj);
			}	
			
			System.out.println("购物车的总金额："+cart.getTotalPrice());
		}


}