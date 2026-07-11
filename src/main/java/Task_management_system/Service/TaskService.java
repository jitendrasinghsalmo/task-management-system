package Task_management_system.Service;

import java.util.List;
import org.springframework.data.domain.Page;
import Task_management_system.Entity.Tasks;

public interface TaskService {

    Tasks save(Tasks t);

    List<Tasks> findAll();

    Page<Tasks> getTasks(
            int userId,
            String keyword,
            int page,
            int size,
            String sortBy,
            String direction);

    void deleteAllByUserId(int userId);

    void deleteAll();

    Tasks findById(int id);

    void deleteById(int id);
    
    int countByUserId(int userId);
    
    int countByUserIdAndStatus(int userId, String status);
}