package cn.paxos.odata.hub.api;

public class EntitySetMeta
{

  private final String name;
  private final String entityName;
  private final Class<?> entityType;
  private final boolean async;
  
  public EntitySetMeta(String name, String entityName, Class<?> entityType, boolean async)
  {
    this.name = name;
    this.entityName = entityName;
    this.entityType = entityType;
    this.async = async;
  }
  
  public String getName()
  {
    return name;
  }
  public String getEntityName()
  {
    return entityName;
  }
  public Class<?> getEntityType()
  {
    return entityType;
  }
  public boolean isAsync()
  {
    return async;
  }

}
