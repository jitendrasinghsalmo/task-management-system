package Task_management_system.Repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Repository;
import java.util.List;
import Task_management_system.Entity.Tasks;

@Repository
public interface TaskRepository extends JpaRepository<Tasks, Integer> {
    
    // Sahi mapping: Users class ka 'name' field
    List<Tasks> findByUsers_NameContainingIgnoreCase(String name);
    
    // Baaki methods jo pehle se the
    List<Tasks> findByUsersId(int userId);
    Page<Tasks> findByUsersId(int userId, Pageable pageable);
    Page<Tasks> findByUsersIdAndTaskNameContainingIgnoreCase(int userId, String keyword, Pageable pageable);
    
    int countByUsersId(int userId);
    int countByUsersIdAndStatus(int userId, String status);
}