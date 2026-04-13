package hr.zavrsni.trainflowspringbackend.repositories;

import hr.zavrsni.trainflowspringbackend.trainingDomain.TrainingDay;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;


public interface TrainingDayJpaRepository extends JpaRepository<TrainingDay, Integer> {
    List<TrainingDay> findByPlan_Id(Integer planId);

    @Query("""
        select distinct td
        from TrainingDay td
        left join fetch td.exercises e
        left join fetch e.exercise
        where td.id in :dayIds
    """)
    List<TrainingDay> findAllWithExercisesByIdIn(@Param("dayIds") List<Integer> dayIds);
}
