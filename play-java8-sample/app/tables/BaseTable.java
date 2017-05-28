package tables;

import com.avaje.ebean.Model;
import com.avaje.ebean.annotation.CreatedTimestamp;
import com.avaje.ebean.annotation.UpdatedTimestamp;

import javax.persistence.MappedSuperclass;
import javax.persistence.Version;
import java.util.Date;

@MappedSuperclass
public class BaseTable extends Model {

    @CreatedTimestamp
    public Date createdAt;

    @Version
    @UpdatedTimestamp
    public Date updatedAt;
}
