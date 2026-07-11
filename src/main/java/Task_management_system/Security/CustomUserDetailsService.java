package Task_management_system.Security;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import Task_management_system.Entity.Users;
import Task_management_system.Repository.UserRepository;

@Service
public class CustomUserDetailsService implements UserDetailsService {

    @Autowired
    private UserRepository userRepository;

    @Override
    public UserDetails loadUserByUsername(String email) throws UsernameNotFoundException {
        Users user = userRepository.findByEmail(email);

        if (user == null) {
            throw new UsernameNotFoundException("User Not Found");
        }
        
        // ⚠️ YEH CHECK ADD KARO: Agar user blocked (active = false) h toh login fail kar do
        if (!user.isActive()) {
            throw new org.springframework.security.authentication.DisabledException("Your account is blocked by Admin!");
        }

        return new CustomUserDetails(user);
    }
}