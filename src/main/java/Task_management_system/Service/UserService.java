package Task_management_system.Service;

import Task_management_system.Entity.Users;

public interface UserService {

    Users save(Users u);

    Users findByEmailAndPassword(String email, String password);

    Users findByEmail(String email);
}