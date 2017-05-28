package tables.find;

import com.avaje.ebean.ExpressionList;

import java.util.List;

public interface Fuzzy<TABLE> extends Where<TABLE> {

    default List<TABLE> fuzzy(String value, String... columnNames) {
        ExpressionList<TABLE> ex = where();
        for (String c : columnNames) {
            ex = ex.like(c, "%" + value + "%");
        }
        return ex.findList();
    }

}
