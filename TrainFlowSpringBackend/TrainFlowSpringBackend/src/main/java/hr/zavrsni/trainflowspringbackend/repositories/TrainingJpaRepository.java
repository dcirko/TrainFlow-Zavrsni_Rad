package hr.zavrsni.trainflowspringbackend.repositories;

import hr.zavrsni.trainflowspringbackend.authDomain.UserInfo;
import hr.zavrsni.trainflowspringbackend.trainingDomain.TrainingPlan;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;
import java.util.Optional;

public interface TrainingJpaRepository extends JpaRepository<TrainingPlan, Integer> {
    List<TrainingPlan> findByIsSuggested(Boolean isSuggested);
    List<TrainingPlan> findTrainingPlansByUser_Id(Integer userId);
    List<TrainingPlan> findTrainingPlansByIsActiveAndUserEquals(Boolean isActive, UserInfo user);
    List<TrainingPlan> findTrainingPlansByIsActiveAndIsSuggested(Boolean isActive, Boolean isSuggested);
    Optional<TrainingPlan> findByIsActive(Boolean isActive);

    @Query("""
        select distinct tp
        from TrainingPlan tp
        left join fetch tp.trainingDays td
        where tp.id in :planIds
    """)
    List<TrainingPlan> findAllWithTrainingDaysByIdIn(@Param("planIds") List<Integer> planIds);

    @Query("""
        select tp
        from TrainingPlan tp
        left join fetch tp.user
        where tp.isSuggested = true
    """)
    List<TrainingPlan> findSuggestedPlansWithUser();


}
