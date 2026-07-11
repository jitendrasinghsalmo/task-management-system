package Task_management_system.Service;

import java.util.List;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;
import Task_management_system.Entity.Tasks;
import Task_management_system.Repository.TaskRepository;

@Service
public class TaskServiceImp implements TaskService {

    @Autowired
    private TaskRepository tr;

    @Override
    public Tasks save(Tasks t) {
        return tr.save(t);
    }

    @Override
    public List<Tasks> findAll() {
        return tr.findAll();
    }

    @Override
    public void deleteAllByUserId(int userId) {
        List<Tasks> list = tr.findByUsersId(userId);
        tr.deleteAll(list);
    }

    @Override
    public void deleteAll() {
        tr.deleteAll();
    }

    @Override
    public Tasks findById(int id) {
        return tr.findById(id).orElse(null);
    }

    @Override
    public Page<Tasks> getTasks(int userId,
                                String keyword,
                                int page,
                                int size,
                                String sortBy,
                                String direction) {

        Sort sort = direction.equalsIgnoreCase("asc")
                ? Sort.by(sortBy).ascending()
                : Sort.by(sortBy).descending();

        Pageable pageable = PageRequest.of(page, size, sort);

        if (keyword == null || keyword.trim().isEmpty()) {
            return tr.findByUsersId(userId, pageable);
        } else {
            return tr.findByUsersIdAndTaskNameContainingIgnoreCase(
                    userId,
                    keyword,
                    pageable);
        }
    }

    @Override
    public void deleteById(int id) {
        tr.deleteById(id);
    }

    @Override
    public int countByUserId(int userId) {
        return tr.countByUsersId(userId);
    }

    @Override
    public int countByUserIdAndStatus(int userId, String status) {
        return tr.countByUsersIdAndStatus(userId, status);
    }
}