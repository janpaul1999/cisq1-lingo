package trainer.domain;

import java.util.List;
import java.util.function.Predicate;

public class Feedback {
    String attempt;
    List<Mark> marks;

    public Feedback(String attempt, List<Mark> marks){
        this.attempt = attempt;
        this.marks = marks;
    }

    public boolean isWordGuessed(){
        return this.marks.stream().allMatch(Predicate.isEqual(Mark.CORRECT));
    }
}
