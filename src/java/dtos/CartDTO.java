/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dtos;

import java.util.HashMap;
import java.util.Map;

/**
 *
 * @author baoph
 */
public class CartDTO {
    private String customer;
    private Map<String, BookDTO> cart;

    public CartDTO() {
    }

    public CartDTO(String customer, Map<String, BookDTO> cart) {
        this.customer = customer;
        this.cart = cart;
    }

    public String getCustomer() {
        return customer;
    }

    public void setCustomer(String customer) {
        this.customer = customer;
    }

    public Map<String, BookDTO> getCart() {
        return cart;
    }

    public void setCart(Map<String, BookDTO> cart) {
        this.cart = cart;
    }

    public void add(BookDTO book) {
        if (cart == null) {
            cart = new HashMap<>();
        }
        if (cart.containsKey(String.valueOf(book.getBookID()))) {
            int quantity = this.cart.get(String.valueOf(book.getBookID())).getCartQuantity();
            book.setCartQuantity(quantity + 1);
        }
        cart.put(String.valueOf(book.getBookID()), book);
    }

    public void delete(int id) {
        if (cart == null) {
            return;
        }
        if (this.cart.containsKey(String.valueOf(id))) {
            this.cart.remove(String.valueOf(id));
        }
    }

    public void update(int id, int newValue) {
        if (this.cart != null) {
            if (this.cart.containsKey(String.valueOf(id))) {
                this.cart.get(String.valueOf(id)).setCartQuantity(newValue);
            }
        }
    }
}
