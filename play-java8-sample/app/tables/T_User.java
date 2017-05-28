package tables;

import play.data.validation.Constraints;
import tables.find.All;
import tables.find.Fuzzy;

import javax.persistence.*;
import java.util.Date;

@Entity
@Table(name = "t_user")
public class T_User  extends BaseTable {

    public static class Find extends FindDecorator<Long, T_User>
            implements All<T_User>, Fuzzy<T_User> {}

    public static Find find = new Find();

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    public Long id;

    @Constraints.Required
    public String name;

    public Integer schoolYear;

    public Date birthDay;

    public Integer height;

    public String food;

    public boolean isEmpty() {
        return id == null;
    }
}
