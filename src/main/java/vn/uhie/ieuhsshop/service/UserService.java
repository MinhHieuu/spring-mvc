package vn.uhie.ieuhsshop.service;

import org.springframework.stereotype.Service;
import vn.uhie.ieuhsshop.domain.User;
import vn.uhie.ieuhsshop.repository.UserRepository;

import java.util.List;
import java.util.Optional;

@Service
public class UserService {
    private final UserRepository userRepository;
    public UserService(UserRepository userRepository) {
        this.userRepository = userRepository;
    }

    public void handleSaveUser(User user) {
        this.userRepository.save(user);
    }
    public List<User> fetchUser() {
        return this.userRepository.findAll();
    }
    public User getUserByUserName(String username) {
        Optional<User> user = this.userRepository.findByUsername(username);
        if(user.isPresent()) {
            return user.get();
        }
        return null;
    }
}
