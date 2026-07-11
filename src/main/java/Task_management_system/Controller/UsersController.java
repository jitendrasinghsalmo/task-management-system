package Task_management_system.Controller;

import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import Task_management_system.Entity.Users;
import Task_management_system.Repository.UserRepository;
import Task_management_system.Service.UserService;
import jakarta.servlet.http.HttpSession;
import java.security.Principal;

@Controller
public class UsersController {
	
    @Autowired
    private UserService ur;
     
    @Autowired
    private PasswordEncoder passwordEncoder;

    // Save Data in DB
    @PostMapping("/register")
    public String saved(@ModelAttribute Users u, Model model) {

        // Aapka original message same rakha hai
        model.addAttribute("msg",
                "Registration successfully "
                        + u.getName());
         
        u.setPassword(passwordEncoder.encode(u.getPassword()));
        u.setRole("USER");
        ur.save(u);
         
        // Spring Security ke loop se bachne ke liye redirect standard tarika hai
        return "redirect:/loginPage";
    }
  
    @GetMapping("/loginPage")
    public String loginPage() {     
        return "Login1";
    }

    @GetMapping("/registerPage")
    public String registerPage() {
        return "Register1";
    }

    @Autowired
    private Task_management_system.Service.TaskService ts; // TaskService inject karo upar

    @GetMapping("/")
    public String homePage(HttpSession session, Principal principal, Model model) {
        if (principal != null) {
            Users user = ur.findByEmail(principal.getName());
            session.setAttribute("loggedInUser", user);
            
            // ⭐ YEH CHECK ADD KARO: Agar login karne wala ADMIN hai, toh use direct admin page par bhejo
            if ("ADMIN".equalsIgnoreCase(user.getRole())) {
                return "redirect:/admin/dashboard";
            }
            
            // Baki normal users ke liye purana code waisa hi rahega
            int userId = user.getId();
            model.addAttribute("totalTasks", ts.countByUserId(userId));
            model.addAttribute("pendingTasks", ts.countByUserIdAndStatus(userId, "Pending"));
            model.addAttribute("inProgressTasks", ts.countByUserIdAndStatus(userId, "In Progress"));
            model.addAttribute("completedTasks", ts.countByUserIdAndStatus(userId, "Completed"));
        }
        return "Home1";
    }
	
    @GetMapping("/addTask")
    public String addTaskPage() {
        return "AddTask";
    }
    
    
 // Open Change Password Page
    @GetMapping("/changePassword")
    public String changePasswordPage(HttpSession session) {
        if (session.getAttribute("loggedInUser") == null) {
            return "redirect:/loginPage";
        }
        return "ChangePassword";
    }
    
    
 // 🤫 SECRET URL: Kisi ko is page ka pata nahi chalega, sirf aap browser me hit karoge
    @GetMapping("/createSecretAdminJitendra")
    @org.springframework.web.bind.annotation.ResponseBody // Taaki direct text return ho sake
    public String createAdminDirectly() {
        
        // Check karo ki ye admin email pehle se table me hai ya nahi
        if (ur.findByEmail("jitendrasingh07022004@gmail.com") != null) {
            return "Admin account already exists!";
        }

        Users admin = new Users();
        admin.setName("Jitendra Singh");
        admin.setEmail("jitendrasingh07022004@gmail.com");
        admin.setPassword(passwordEncoder.encode("Admin@123")); // Aapka secret admin password
        admin.setRole("ADMIN");
        
        ur.save(admin);
        
        return "<h1>Success!</h1> Admin Account Created Successfully. Now you can login with this email.";
    }
    
    

    // Process Change Password
    @PostMapping("/updatePassword")
    public String updatePassword(
            @RequestParam String oldPassword,
            @RequestParam String newPassword,
            @RequestParam String confirmPassword,
            HttpSession session,
            Model model) {
        
        Users user = (Users) session.getAttribute("loggedInUser");
        if (user == null) {
            return "redirect:/loginPage";
        }

        // 1. Check karo naye dono password match ho rahe hain ya nahi
        if (!newPassword.equals(confirmPassword)) {
            model.addAttribute("error", "New Password and Confirm Password do not match!");
            return "ChangePassword";
        }

        // 2. Check karo BCrypt me purana password sahi hai ya nahi
        if (!passwordEncoder.matches(oldPassword, user.getPassword())) {
            model.addAttribute("error", "Incorrect Old Password!");
            return "ChangePassword";
        }

        // 3. Naya password encode karke save karo
        user.setPassword(passwordEncoder.encode(newPassword));
        ur.save(user); // UserRepository ke through save ho jayega

        model.addAttribute("success", "Password updated successfully!");
        return "ChangePassword";
    }
    
    
    @Autowired
    private org.springframework.mail.javamail.JavaMailSender mailSender;

    // 1. Forgot Password Page Open Karo
    @GetMapping("/forgotPassword")
    public String forgotPasswordPage() {
        return "ForgotPassword";
    }

    // 2. Email par OTP Bhejo
    @PostMapping("/sendOtp")
    public String sendOtp(@RequestParam String email, HttpSession session, Model model) {
        Users user = ur.findByEmail(email);
        if (user == null) {
            model.addAttribute("error", "Email id not registered!");
            return "ForgotPassword";
        }

        // 6-digit random OTP generate karo
        int otp = (int)(Math.random() * 900000) + 100000;
        
        // OTP aur Email ko session me save karo temporary
        session.setAttribute("generatedOtp", otp);
        session.setAttribute("resetEmail", email);

        // Email send karne ka logic
        try {
            org.springframework.mail.SimpleMailMessage message = new org.springframework.mail.SimpleMailMessage();
            message.setTo(email);
            message.setSubject("Password Reset OTP - TaskWorkspace");
            message.setText("Your OTP for resetting password is: " + otp);
            mailSender.send(message);
            
            model.addAttribute("success", "OTP sent successfully to your email!");
            model.addAttribute("otpSent", true); // JSP par OTP field dikhane ke liye
        } catch (Exception e) {
            model.addAttribute("error", "Failed to send email. Check your SMTP config!");
        }
        return "ForgotPassword";
    }

    // 3. OTP Verify aur Password Reset Karo
    @PostMapping("/resetPassword")
    public String resetPassword(
            @RequestParam int userOtp,
            @RequestParam String newPassword,
            HttpSession session,
            Model model) {

        Integer generatedOtp = (Integer) session.getAttribute("generatedOtp");
        String email = (String) session.getAttribute("resetEmail");

        if (generatedOtp == null || generatedOtp != userOtp) {
            model.addAttribute("error", "Invalid OTP! Try again.");
            model.addAttribute("otpSent", true);
            return "ForgotPassword";
        }

        
        
        
        
        
        
        // Password Update Karo
        Users user = ur.findByEmail(email);
        user.setPassword(passwordEncoder.encode(newPassword));
        ur.save(user);

        // Session clean karo
        session.removeAttribute("generatedOtp");
        session.removeAttribute("resetEmail");

        model.addAttribute("msg", "Password reset successfully! Please Login.");
        return "Login1";
    }
    
}