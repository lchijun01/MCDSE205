package com.onestopgroceries.service;

import org.springframework.stereotype.Service;
import com.onestopgroceries.model.Item;
import com.onestopgroceries.model.Store;
import com.onestopgroceries.repository.ItemRepository;
import com.onestopgroceries.repository.StoreRepository;

import java.util.List;

@Service
public class ItemService {
    private final ItemRepository itemRepository;
    private final StoreRepository storeRepository;

    public ItemService(ItemRepository itemRepository, StoreRepository storeRepository) {
        this.itemRepository = itemRepository;
        this.storeRepository = storeRepository;
    }

    public List<Item> getItemsByStoreId(Long storeId) {
        return itemRepository.findByStoreId(storeId);
    }    

    public void addItem(Long storeId, Item item) {
        Store store = storeRepository.findById(storeId)
                .orElseThrow(() -> new IllegalArgumentException("Invalid store Id:" + storeId));
        item.setStore(store);
        itemRepository.save(item);
    }
}
