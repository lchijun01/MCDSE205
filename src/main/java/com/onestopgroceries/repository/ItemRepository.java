package com.onestopgroceries.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import com.onestopgroceries.model.Item;
import java.util.List;

public interface ItemRepository extends JpaRepository<Item, Long> {
    List<Item> findByStoreId(Long storeId);
}
