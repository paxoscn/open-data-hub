package cn.paxos.odata.hub.service;

import java.util.ArrayList;

import org.apache.olingo.server.api.OData;
import org.apache.olingo.server.api.ODataHttpHandler;
import org.apache.olingo.server.api.ServiceMetadata;
import org.apache.olingo.server.api.edmx.EdmxReference;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.paxos.odata.hub.meta.DefaultEdmProvider;
import cn.paxos.odata.hub.processor.DefaultEntityCollectionProcessor;

@Service
public class ODataService {
	
	@Autowired RepositoryManager repositoryManager;
	
	public ODataHttpHandler getHandler() {
    OData odata = OData.newInstance();
    ServiceMetadata edm = odata.createServiceMetadata(new DefaultEdmProvider(repositoryManager), new ArrayList<EdmxReference>());
    ODataHttpHandler handler = odata.createHandler(edm);
    handler.register(new DefaultEntityCollectionProcessor(repositoryManager));
    return handler;
	}  

}
