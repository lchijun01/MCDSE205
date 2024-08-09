package com.onestopgroceries.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import com.onestopgroceries.model.Store;
import java.util.List;

public interface StoreRepository extends JpaRepository<Store, Long> {
    List<Store> findByNameContainingIgnoreCase(String name);
}
