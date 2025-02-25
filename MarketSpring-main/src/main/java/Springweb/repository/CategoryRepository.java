
package Springweb.repository;

import Springweb.entity.Category;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;


@Repository
public interface CategoryRepository extends CrudRepository<Category, Integer>{
    @Query("SELECT COUNT(ca) FROM Category ca")
    long countAllCategory();
}
