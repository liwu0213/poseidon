package ${content.dao.classPackage};

import ${content.entity.classPackage}.${content.entity.className};
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;


/**
* ${content.entity.className}的Repository接口
 *
 * @author
 *
 */
@Repository
public interface ${content.dao.className} extends CrudRepository<${content.entity.className}, String>, JpaSpecificationExecutor<${content.entity.className}> {

}
