package cn.paxos.odata.hub.examples.simple;

import java.util.LinkedList;
import java.util.List;

import cn.paxos.deployer.PluginContext;
import cn.paxos.odata.hub.api.Repository;
import cn.paxos.odata.hub.examples.simple.repository.SimpleRepository;

public class Main
{
  
  public static void main(String[] args)
  {
    List<Repository> repositories = new LinkedList<Repository>();
    repositories.add(new SimpleRepository());
    PluginContext.attributes.put("cn.paxos.odata.hub.examples.simple.repositories", repositories);
  }

}
