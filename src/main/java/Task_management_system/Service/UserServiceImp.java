package Task_management_system.Service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import Task_management_system.Entity.Users;
import Task_management_system.Repository.UserRepository;



@Service
public class UserServiceImp implements UserService{

	
	@Autowired
	private UserRepository u1;
	
	
	
	@Override
	public Users save(Users u) {
		
		return u1.save(u);
	}
	
	


	@Override
	public Users findByEmailAndPassword(String email, String password) {
		return u1.findByEmailAndPassword(email, password);
	}




	@Override
	public Users findByEmail(String email) {
		// TODO Auto-generated method stub
		return u1.findByEmail(email);
	}
	
		
	

}
