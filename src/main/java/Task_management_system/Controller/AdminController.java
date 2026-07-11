package Task_management_system.Controller;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import Task_management_system.Repository.UserRepository;
import Task_management_system.Entity.Users;
import Task_management_system.Repository.TaskRepository;

@Controller
@RequestMapping("/admin")
public class AdminController {

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private TaskRepository taskRepository;

    @GetMapping("/dashboard")
    public String adminDashboard(Model model, @RequestParam(required = false, name = "name") String name) {
        List<Users> users;
        
        // Agar admin ne search bar mein kuch type kiya hai
        if (name != null && !name.isEmpty()) {
            users = userRepository.findByNameContainingIgnoreCase(name);
        } else {
            // Default: Sabhi users dikhayein
            users = userRepository.findAll();
        }

        model.addAttribute("totalUsers", userRepository.count());
        model.addAttribute("totalTasks", taskRepository.count());
        model.addAttribute("allUsers", users); // Ye list JSP mein display hogi
        model.addAttribute("searchQuery", name); // Input box mein text hold karne ke liye

        return "AdminDashboard"; // Aapki JSP file ka naam
    }

    @GetMapping("/toggleStatus/{id}")
    public String toggleUserStatus(@PathVariable int id) {
        Users user = userRepository.findById(id).orElse(null);
        if (user != null) {
            user.setActive(!user.isActive()); 
            userRepository.save(user);
        }
        return "redirect:/admin/dashboard"; 
    }
}