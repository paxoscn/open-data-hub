package cn.paxos.odata.hub.api;

import java.util.List;
import java.util.Map;

public interface Repository
{

  Iterable<EntitySetMeta> getEntitySetMetas();

  <E> List<E> list(EntitySetMeta entitySetMeta, Map<String, Object> conditions, Integer top);

  String asyncListStart(EntitySetMeta entitySetMeta, Map<String, Object> conditions, Integer top);

  <E> List<E> asyncListCheck(String jobId);

}
