package hr.zavrsni.trainflowspringbackend.authRepositories;

import hr.zavrsni.trainflowspringbackend.authDomain.UserInfo;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.Optional;

@Repository
public interface UserRepository extends JpaRepository<UserInfo, Integer> {
    UserInfo findByEmail(String email);
    @Query("""
        select distinct u
        from UserInfo u
        left join fetch u.savedPlans sp
        left join fetch sp.user
        where u.email = :email
    """)
    Optional<UserInfo> findByEmailWithSavedPlans(@Param("email") String email);

}
