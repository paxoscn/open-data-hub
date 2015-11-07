package cn.paxos.odata.hub.meta;

import java.lang.reflect.Field;
import java.lang.reflect.Modifier;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashSet;
import java.util.LinkedList;
import java.util.List;
import java.util.Set;

import org.apache.olingo.commons.api.ODataException;
import org.apache.olingo.commons.api.edm.EdmPrimitiveTypeKind;
import org.apache.olingo.commons.api.edm.FullQualifiedName;
import org.apache.olingo.commons.api.edm.provider.CsdlAbstractEdmProvider;
import org.apache.olingo.commons.api.edm.provider.CsdlAction;
import org.apache.olingo.commons.api.edm.provider.CsdlActionImport;
import org.apache.olingo.commons.api.edm.provider.CsdlEntityContainer;
import org.apache.olingo.commons.api.edm.provider.CsdlEntityContainerInfo;
import org.apache.olingo.commons.api.edm.provider.CsdlEntitySet;
import org.apache.olingo.commons.api.edm.provider.CsdlEntityType;
import org.apache.olingo.commons.api.edm.provider.CsdlProperty;
import org.apache.olingo.commons.api.edm.provider.CsdlPropertyRef;
import org.apache.olingo.commons.api.edm.provider.CsdlSchema;

import cn.paxos.odata.hub.api.EntitySetMeta;
import cn.paxos.odata.hub.api.Key;
import cn.paxos.odata.hub.api.Repository;
import cn.paxos.odata.hub.service.RepositoryManager;

public class DefaultEdmProvider extends CsdlAbstractEdmProvider
{

  private final RepositoryManager repositoryManager;
  private final FullQualifiedName container;

  public DefaultEdmProvider(RepositoryManager repositoryManager)
  {
    this.repositoryManager = repositoryManager;
    this.container = new FullQualifiedName("cn.paxos.odata", "Container");
  }

  @Override
  public CsdlEntityContainer getEntityContainer() throws ODataException
  {
    List<CsdlEntitySet> entitySets = new ArrayList<CsdlEntitySet>();
    List<CsdlActionImport> actionImports = new ArrayList<CsdlActionImport>();
    for (Repository repository : repositoryManager.getRepositories())
    {
      for (EntitySetMeta entitySetMeta : repository.getEntitySetMetas())
      {
        CsdlEntitySet entitySet = new CsdlEntitySet();
        entitySet.setName(entitySetMeta.getName());
        entitySet.setType(new FullQualifiedName(container.getNamespace(), entitySetMeta.getEntityName()));
        entitySets.add(entitySet);
      }
    }
    CsdlEntityContainer entityContainer = new CsdlEntityContainer();
    entityContainer.setName(container.getName());
    entityContainer.setEntitySets(entitySets);
    entityContainer.setActionImports(actionImports);
    return entityContainer;
  }

  @Override
  public CsdlEntityContainerInfo getEntityContainerInfo(
      FullQualifiedName entityContainerName) throws ODataException
  {
    if (entityContainerName == null || entityContainerName.equals(container))
    {
      CsdlEntityContainerInfo entityContainerInfo = new CsdlEntityContainerInfo();
      entityContainerInfo.setContainerName(container);
      return entityContainerInfo;
    }
    return null;
  }

  @Override
  public CsdlEntitySet getEntitySet(FullQualifiedName entityContainer,
      String setName) throws ODataException
  {
    for (Repository repository : repositoryManager.getRepositories())
    {
      for (EntitySetMeta entitySetMeta : repository.getEntitySetMetas())
      {
        if (entitySetMeta.getName().equals(setName))
        {
          CsdlEntitySet entitySet = new CsdlEntitySet();
          entitySet.setName(setName);
          entitySet.setType(new FullQualifiedName(container.getNamespace(), entitySetMeta.getEntityName()));
          return entitySet;
        }
      }
    }
    // TODO Wild field names to filter would be setName. Why ?
    return null;
  }

  @Override
  public CsdlEntityType getEntityType(FullQualifiedName entityTypeName)
      throws ODataException
  {
    for (Repository repository : repositoryManager.getRepositories())
    {
      for (EntitySetMeta entitySetMeta : repository.getEntitySetMetas())
      {
        if (entitySetMeta.getEntityName().equals(entityTypeName.getName()))
        {
          List<CsdlProperty> properties = new LinkedList<CsdlProperty>();
          List<CsdlPropertyRef> keys = new LinkedList<CsdlPropertyRef>();
          for (Field field : entitySetMeta.getEntityType().getDeclaredFields())
          {
            if ((field.getModifiers() & Modifier.STATIC) > 0)
            {
              continue;
            }
            FullQualifiedName propertyFQN;
            if (field.getType().equals(String.class))
            {
              propertyFQN = EdmPrimitiveTypeKind.String.getFullQualifiedName();
            } else if (field.getType().equals(Date.class))
            {
              propertyFQN = EdmPrimitiveTypeKind.String.getFullQualifiedName();
            } else if (field.getType().equals(Double.class)
                || field.getType().equals(double.class))
            {
              propertyFQN = EdmPrimitiveTypeKind.Double.getFullQualifiedName();
            } else if (field.getType().equals(Integer.class)
                || field.getType().equals(int.class))
            {
              propertyFQN = EdmPrimitiveTypeKind.Int32.getFullQualifiedName();
            } else if (field.getType().equals(Long.class)
                || field.getType().equals(long.class))
            {
              propertyFQN = EdmPrimitiveTypeKind.Int64.getFullQualifiedName();
            } else if (field.getType().equals(Boolean.class)
                || field.getType().equals(boolean.class))
            {
              propertyFQN = EdmPrimitiveTypeKind.Boolean.getFullQualifiedName();
            } else if (field.getType().equals(byte[].class))
            {
              propertyFQN = EdmPrimitiveTypeKind.Binary.getFullQualifiedName();
            } else
            {
              throw new RuntimeException("Unknown type: " + field.getType());
            }
            properties.add(new CsdlProperty().setName(field.getName()).setType(
                propertyFQN));
            if (field.isAnnotationPresent(Key.class))
            {
              CsdlPropertyRef propertyRef = new CsdlPropertyRef();
              propertyRef.setName(field.getName());
              keys.add(propertyRef);
            }
          }
          CsdlEntityType entityType = new CsdlEntityType();
          entityType.setName(entitySetMeta.getEntityName());
          entityType.setProperties(properties);
          entityType.setKey(keys);
          return entityType;
        }
      }
    }
    // TODO Warning
    return null;
  }

  @Override
  public List<CsdlSchema> getSchemas() throws ODataException
  {
    CsdlSchema schema = new CsdlSchema();
    schema.setNamespace(container.getNamespace());
    Set<CsdlEntityType> entityTypes = new HashSet<CsdlEntityType>();
    for (Repository repository : repositoryManager.getRepositories())
    {
      for (EntitySetMeta entitySetMeta : repository.getEntitySetMetas())
      {
        FullQualifiedName fqn = new FullQualifiedName(container.getNamespace(),
            entitySetMeta.getEntityName());
        entityTypes.add(getEntityType(fqn));
      }
    }
    schema.setEntityTypes(new LinkedList<CsdlEntityType>(entityTypes));
    schema.setEntityContainer(getEntityContainer());
    List<CsdlSchema> schemas = new ArrayList<CsdlSchema>();
    schemas.add(schema);
    return schemas;
  }

  @Override
  public List<CsdlAction> getActions(FullQualifiedName actionName)
      throws ODataException
  {
    List<CsdlAction> list = new LinkedList<CsdlAction>();
    CsdlAction action = new CsdlAction();
    action.setBound(false);
    action.setName(actionName.getName());
    list.add(action);
    return list;
  }

  @Override
  public CsdlActionImport getActionImport(FullQualifiedName entityContainer,
      String actionImportName) throws ODataException
  {
    CsdlActionImport actionImport = new CsdlActionImport();
    actionImport.setAction(new FullQualifiedName(container.getNamespace(),
        actionImportName));
    actionImport.setName(actionImportName);
    return actionImport;
  }

}
