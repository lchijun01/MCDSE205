package com.onestopgroceries.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.onestopgroceries.model.Store;
import com.onestopgroceries.repository.StoreRepository;

import java.util.List;

@Service
public class StoreService {

    @Autowired
    private StoreRepository storeRepository;

    public List<Store> getAllStores() {
        return storeRepository.findAll();
    }

    public Store getStoreById(Long id) {
        return storeRepository.findById(id).orElseThrow(() -> new IllegalArgumentException("Invalid store Id:" + id));
    }

    public void addStore(Store store) {
        storeRepository.save(store);
    }

    public void updateStore(Long id, Store store) {
        store.setId(id);
        storeRepository.save(store);
    }

    public void deleteStore(Long id) {
        storeRepository.deleteById(id);
    }

    public List<Store> searchStores(String keyword) {
        // Assuming you want to search by name, adjust accordingly
        return storeRepository.findByNameContainingIgnoreCase(keyword);
    }
}
