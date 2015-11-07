package cn.paxos.odata.hub.service;

import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import cn.paxos.deployer.LifecycleListener;
import cn.paxos.deployer.Plugin;
import cn.paxos.deployer.PluginContext;
import cn.paxos.odata.hub.api.EntitySetMeta;
import cn.paxos.odata.hub.api.Repository;

@Service
public class RepositoryManager
{
  
  private final Map<String, List<Repository>> repositoriyMap = new HashMap<String, List<Repository>>();
  
  public RepositoryManager()
  {
    new Thread() {
      @Override
      public void run()
      {
        try
        {
          new PluginContext("/var/odata-hub-repositories", new LifecycleListener() {
            @SuppressWarnings("unchecked")
            @Override
            public void onDeploy(final Plugin plugin)
            {
              String pluginQN = plugin.getNamespace() + "." + plugin.getName();
              List<Repository> repositories = new LinkedList<Repository>();
              for (final Repository repository : (List<Repository>) PluginContext.attributes.get(pluginQN + ".repositories"))
              {
                repositories.add(new Repository()
                {
                  @Override
                  public <E> List<E> list(EntitySetMeta entitySetMeta,
                      Map<String, Object> conditions, Integer top)
                  {
                    confirmClassLoader();
                    return repository.list(entitySetMeta, conditions, top);
                  }
                  @Override
                  public Iterable<EntitySetMeta> getEntitySetMetas()
                  {
                    confirmClassLoader();
                    return repository.getEntitySetMetas();
                  }
                  @Override
                  public String asyncListStart(EntitySetMeta entitySetMeta,
                      Map<String, Object> conditions, Integer top)
                  {
                    confirmClassLoader();
                    return repository.asyncListStart(entitySetMeta, conditions, top);
                  }
                  @Override
                  public <E> List<E> asyncListCheck(String jobId)
                  {
                    confirmClassLoader();
                    return repository.asyncListCheck(jobId);
                  }
                  private void confirmClassLoader()
                  {
                    if (Thread.currentThread().getContextClassLoader() != plugin.getClassLoader())
                    {
                      Thread.currentThread().setContextClassLoader(plugin.getClassLoader());
                    }
                  }
                });
              }
              repositoriyMap.put(pluginQN, repositories);
            }
            @Override
            public void onDelete(Plugin plugin)
            {
              String pluginQN = plugin.getNamespace() + "." + plugin.getName();
              repositoriyMap.remove(pluginQN);
            }
          });
        } catch (Exception e)
        {
          throw new RuntimeException(e);
        }
      }
    }.start();
  }

  public Iterable<Repository> getRepositories()
  {
    List<Repository> repositories = new LinkedList<Repository>();
    for (List<Repository> pluginRepositories : repositoriyMap.values())
    {
      repositories.addAll(pluginRepositories);
    }
    return repositories;
  }

}
