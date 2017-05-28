package models;

import org.apache.commons.lang3.StringUtils;
import tables.T_User;

import java.util.List;
import java.util.stream.Collectors;

public class UserForm {
    public String searchWord;

    public List<UserItem> search() {
        List<T_User> list;
        if (StringUtils.isBlank(searchWord)) {
            list = T_User.find.all();
        } else {
            list = T_User.find.fuzzy(searchWord, "name");
        }
        return list.stream()
                .map(UserItem::new)
                .collect(Collectors.toList());
    }
}
