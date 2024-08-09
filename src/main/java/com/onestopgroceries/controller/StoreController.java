package com.onestopgroceries.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import com.onestopgroceries.model.Store;
import com.onestopgroceries.model.Item;

import com.onestopgroceries.service.StoreService;
import com.onestopgroceries.service.ItemService;

import java.util.List;
import java.util.Map;

@Controller
public class StoreController {
    @Autowired
    private StoreService storeService;

    @Autowired
    private ItemService itemService;

    @GetMapping("/stores/search")
    @ResponseBody
    public List<Store> searchStoresAjax(@RequestParam("keyword") String keyword) {
        return storeService.searchStores(keyword);
    }

    @GetMapping("/stores")
    public String viewStores(Model model) {
        List<Store> stores = storeService.getAllStores();
        model.addAttribute("stores", stores);
        return "viewStores";
    }

    @GetMapping("/stores/add")
    public String addStoreForm(Model model) {
        model.addAttribute("store", new Store());
        return "addStore";
    }

    @PostMapping("/stores")
    public String addStore(@ModelAttribute Store store) {
        storeService.addStore(store);
        return "redirect:/stores";
    }

    @GetMapping("/stores/edit/{id}")
    public String editStoreForm(@PathVariable Long id, Model model) {
        Store store = storeService.getAllStores().stream()
                .filter(s -> s.getId().equals(id))
                .findFirst()
                .orElse(null);
        model.addAttribute("store", store);
        return "editStore";
    }

    @PostMapping("/stores/edit/{id}")
    public String editStore(@PathVariable Long id, @ModelAttribute Store store) {
        storeService.updateStore(id, store);
        return "redirect:/stores";
    }

    @GetMapping("/stores/delete/{id}")
    public String deleteStore(@PathVariable Long id) {
        storeService.deleteStore(id);
        return "redirect:/stores";
    }

    @PostMapping("/stores/manageItems/{id}")
    public String addItem(@PathVariable Long id, @ModelAttribute Item item) {
        itemService.addItem(id, item);
        return "redirect:/stores/manageItems/" + id;
    }

    @GetMapping("/stores/manageItems/{id}")
    public String manageItems(@PathVariable Long id, Model model) {
        Store store = storeService.getStoreById(id);
        model.addAttribute("store", store);
        model.addAttribute("items", itemService.getItemsByStoreId(id));
        return "manageItems";
    }

    @GetMapping("/stores/shop/{id}")
    public String shop(@PathVariable Long id, Model model) {
        Store store = storeService.getStoreById(id);
        model.addAttribute("store", store);
        model.addAttribute("items", itemService.getItemsByStoreId(id));
        return "shopNow";
    }
    
    @PostMapping("/stores/shop/{id}/checkout")
    public String checkout(@PathVariable Long id, @RequestParam Map<Long, Integer> quantities) {
        // Handle the payment logic here, for simplicity just redirecting to success
        return "redirect:/paymentSuccess";
    }

    @GetMapping("/paymentSuccess")
    public String paymentSuccess() {
        return "paymentSuccess";
    }
}
