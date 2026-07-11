package Task_management_system.Controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.data.domain.Page;
import Task_management_system.Entity.Tasks;
import Task_management_system.Entity.Users;
import Task_management_system.Repository.TaskRepository;
import Task_management_system.Repository.UserRepository;
import Task_management_system.Service.TaskService;
import jakarta.servlet.http.HttpSession;


@Controller
public class TasksController {

    @Autowired
    private TaskService ts;

    // Save Task
    @PostMapping("/saveTask")
    public String save(@ModelAttribute Tasks task,
                       HttpSession session) {

        Users user = (Users) session.getAttribute("loggedInUser");

        if (user == null) {
            return "redirect:/loginPage";
        }

        task.setUsers(user);
        ts.save(task);

        return "redirect:/viewTasks";
    }

    // View Logged In User Tasks
    @GetMapping("/viewTasks")
    public String viewTasks(
            @RequestParam(defaultValue = "0") int page,
            @RequestParam(defaultValue = "5") int size,
            @RequestParam(defaultValue = "") String keyword,
            @RequestParam(defaultValue = "id") String sortBy,
            @RequestParam(defaultValue = "desc") String direction,
            Model model,
            HttpSession session) {

        Users user = (Users) session.getAttribute("loggedInUser");

        if (user == null) {
            return "redirect:/loginPage";
        }

        Page<Tasks> taskPage = ts.getTasks(
                user.getId(),
                keyword,
                page,
                size,
                sortBy,
                direction);

        model.addAttribute("tasks", taskPage.getContent());
        model.addAttribute("currentPage", page);
        model.addAttribute("totalPages", taskPage.getTotalPages());
        model.addAttribute("size", size);

        // JSP ko values wapas bhejenge
        model.addAttribute("keyword", keyword);
        model.addAttribute("sortBy", sortBy);
        model.addAttribute("direction", direction);

        return "ViewTasks";
    }
    
    
    @Autowired // <--- Yeh line missing ho sakti hai!
    private TaskRepository taskRepository;
    
    @GetMapping("/admin/search")
    public String searchTasks(@RequestParam(required = false) String userName, Model model) {
        List<Tasks> tasks;
        
        if (userName != null && !userName.isEmpty()) {
            // Sirf us user ke tasks search karega
            tasks = taskRepository.findByUsers_NameContainingIgnoreCase(userName);
        } else {
            // Search bar khali ho toh sabhi tasks
            tasks = taskRepository.findAll();
        }
        
        model.addAttribute("tasks", tasks);
        model.addAttribute("searchQuery", userName);
        return "admin_dashboard"; // Wahi JSP page
    }

    @Autowired
    private UserRepository userrepository;
    
    @GetMapping("/admin/viewUserTasks/{userId}")
    public String viewTasksOfUser(@PathVariable int userId, Model model) {
        List<Tasks> tasks = taskRepository.findByUsersId(userId);
        Users user = userrepository.findById(userId).orElse(null);
        
        model.addAttribute("tasks", tasks);
        model.addAttribute("user", user);
        model.addAttribute("isAdmin", true); // ⭐ Yeh flag bata raha hai ki Admin view hai
        return "user_tasks_view";
    }
    
    
    // Delete Task
    @GetMapping("/deleteTask/{id}")
    public String deleteTask(@PathVariable int id) {

        ts.deleteById(id);

        return "redirect:/viewTasks";
    }

    // Delete All Tasks of Logged In User
    @GetMapping("/deleteAll")
    public String deleteAll(HttpSession session) {

        Users user = (Users) session.getAttribute("loggedInUser");

        if (user == null) {
            return "redirect:/loginPage";
        }

        ts.deleteAllByUserId(user.getId());

        return "redirect:/viewTasks";
    }

    // Open Edit Page
    @GetMapping("/editTask/{id}")
    public String editTask(@PathVariable int id,
                           Model model,
                           HttpSession session) {

        Users user = (Users) session.getAttribute("loggedInUser");

        if (user == null) {
            return "redirect:/loginPage";
        }

        Tasks task = ts.findById(id);

        if (task == null || task.getUsers().getId() != user.getId()) {
            return "redirect:/viewTasks";
        }

        model.addAttribute("task", task);

        return "EditTask";
    }

    // Update Task
    @PostMapping("/updateTask")
    public String updateTask(@ModelAttribute Tasks task,
                             HttpSession session) {

        Users user = (Users) session.getAttribute("loggedInUser");

        if (user == null) {
            return "redirect:/loginPage";
        }

        task.setUsers(user);

        ts.save(task);

        return "redirect:/viewTasks";
    }

}