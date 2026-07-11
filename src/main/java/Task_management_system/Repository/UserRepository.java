package Task_management_system.Repository;

import java.util.List;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import Task_management_system.Entity.Users;

@Repository
public interface UserRepository extends JpaRepository<Users, Integer> {
    
    Users findByEmailAndPassword(String email, String password);
    Users findByEmail(String email);
    
    // ⭐ SEARCH METHOD: Name ke basis par search karne ke liye
    List<Users> findByNameContainingIgnoreCase(String name);
}