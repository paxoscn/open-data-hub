package cn.paxos.odata.hub.examples.simple.repository;

import java.util.LinkedList;
import java.util.List;
import java.util.Map;

import cn.paxos.odata.hub.api.EntitySetMeta;
import cn.paxos.odata.hub.api.Repository;
import cn.paxos.odata.hub.examples.simple.entity.User;

public class SimpleRepository implements Repository
{

  @Override
  public Iterable<EntitySetMeta> getEntitySetMetas()
  {
    List<EntitySetMeta> metas = new LinkedList<EntitySetMeta>();
    metas.add(new EntitySetMeta("Users", "User", User.class, false));
    return metas;
  }

  @SuppressWarnings("unchecked")
  @Override
  public <E> List<E> list(EntitySetMeta entitySetMeta, Map<String, Object> conditions, Integer top)
  {
    if (entitySetMeta.getName().equals("Users"))
    {
      List<User> users = new LinkedList<User>();
      users.add(new User("Tom"));
      users.add(new User("Jerry"));
      return (List<E>) users;
    }
    throw new IllegalArgumentException("Unknown entity set: " + entitySetMeta.getName());
  }

  @Override
  public String asyncListStart(EntitySetMeta entitySetMeta,
      Map<String, Object> conditions, Integer top)
  {
    // TODO Auto-generated method stub
    return null;
  }

  @Override
  public <E> List<E> asyncListCheck(String jobId)
  {
    // TODO Auto-generated method stub
    return null;
  }

}
