package cn.paxos.odata.hub.util;

import java.lang.reflect.Field;
import java.lang.reflect.Modifier;
import java.util.List;

import org.apache.olingo.commons.api.data.Entity;
import org.apache.olingo.commons.api.data.EntityCollection;
import org.apache.olingo.commons.api.data.Property;
import org.apache.olingo.commons.api.data.ValueType;
import org.apache.olingo.commons.api.edm.EdmEntityType;

public class Binder
{
  
  static public Entity object2entity(Object e)
  {
    Entity entity = new Entity();

    Field[] fields = e.getClass().getDeclaredFields();
    for (Field field : fields)
    {
      if ((field.getModifiers() & Modifier.STATIC) > 0)
      {
        continue;
      }
      field.setAccessible(true);
      try
      {
        entity.addProperty(new Property(null, field.getName(),
            ValueType.PRIMITIVE, field.get(e)));
      } catch (IllegalArgumentException e1)
      {
        // TODO Auto-generated catch block
        e1.printStackTrace();
      } catch (IllegalAccessException e1)
      {
        // TODO Auto-generated catch block
        e1.printStackTrace();
      }
    }
    return entity;
  }

  static public Entity entity2object(Object e)
  {
    return null;
  }

  static public EdmEntityType map(Class<?> e)
  {
    return null;
  }

  static public Class<?> remap(EdmEntityType e)
  {
    try
    {
      return Class.forName("com.hxxr.oplatform.odata.entity." + e.getName());
    } catch (ClassNotFoundException e1)
    {
      throw new RuntimeException("Should not happen", e1);
    }
  }

  static public EntityCollection entityCollection(List<?> list)
  {

    EntityCollection entitySet = new EntityCollection();
    for (Object e : list)
    {
      Entity entity = object2entity(e);
      entitySet.getEntities().add(entity);
    }
    return entitySet;

  }
}
