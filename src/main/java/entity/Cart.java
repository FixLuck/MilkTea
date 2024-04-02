package entity;

import java.util.ArrayList;
import java.util.List;

public class Cart {
    private List<Item> items;

    public Cart() {
        items = new ArrayList<>();
    }

    public Cart(List<Item> items) {
        this.items = items;
    }

    public List<Item> getItems() {
        return items;
    }

    public void setItems(List<Item> items) {
        this.items = items;
    }

    public Item getItemById(int id) {
        for (Item i: items
             ) {
            if(i.getProduct().getProductId() == id) {
                return i;
            }
        }
        return null;
    }

    public int getQuantityById(int id) {
        return getItemById(id).getQuantity();
    }

    public void addItem(Item item) {
       //nếu có item trong cart rồi
        if (getItemById(item.getProduct().getProductId()) != null) {
            Item chooseItem = getItemById(item.getProduct().getProductId());
            //cộng số lượng item mới vào số lượng item cũ
            chooseItem.setQuantity(item.getQuantity() + chooseItem.getQuantity());
        } else {
            //nếu chưa có item đó thì thêm mới item vào trong giỏ
            items.add(item);
        }

    }

    public void removeItem(int id) {
        if (getItemById(id) != null) {
            items.remove(getItemById(id));
        }
    }

    public double getTotalMoney() {
        double total = 0;
        for (Item i: items
             ) {
            total += i.getQuantity() * i.getPrice();
        }
        return total;
    }

}
