package com.muggle.poseidon.service;

import com.muggle.poseidon.base.ResultBean;
import com.muggle.poseidon.model.PoseidonGrantedAuthority;
import com.muggle.poseidon.model.Role;
import com.muggle.poseidon.repos.PoseidonRoleRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.persistence.criteria.Predicate;
import java.util.List;
import java.util.Set;

@Service
public class RoleService {
    @Autowired
    PoseidonRoleRepository poseidonRoleRepository;

    public ResultBean setRole(Role role) {
        Role save = poseidonRoleRepository.save(role);
        ResultBean resultBean = new ResultBean();
        resultBean.success("插入成功",role);
        return resultBean;
    }
    @Transactional
    public List<Role> findAll(Role role){
        final List<Role> all = poseidonRoleRepository.findAll((root, query, builder) -> {
            Predicate predicate = builder.isNull(root.get("deleteTime"));
            if (role.getRoleCode() != null) {
                predicate = builder.and(predicate, builder.equal(root.get("roleCode"), role.getRoleCode()));
            }
            if (role.getName() != null) {
                predicate = builder.and(predicate, builder.equal(root.get("name"), role.getName()));
            }
            if (role.getId() != null) {
                predicate = builder.and(predicate, builder.equal(root.get("id"), role.getId()));
            }
            return query.where(predicate).getRestriction();
        });
        return all;
    }
}
