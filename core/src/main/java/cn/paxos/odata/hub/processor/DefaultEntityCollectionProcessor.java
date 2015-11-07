package cn.paxos.odata.hub.processor;

import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import org.apache.olingo.commons.api.data.ContextURL;
import org.apache.olingo.commons.api.data.EntityCollection;
import org.apache.olingo.commons.api.edm.EdmEntitySet;
import org.apache.olingo.commons.api.edm.EdmEntityType;
import org.apache.olingo.commons.api.edm.EdmEnumType;
import org.apache.olingo.commons.api.edm.EdmType;
import org.apache.olingo.commons.api.format.ContentType;
import org.apache.olingo.commons.api.format.ODataFormat;
import org.apache.olingo.commons.api.http.HttpHeader;
import org.apache.olingo.commons.api.http.HttpStatusCode;
import org.apache.olingo.server.api.OData;
import org.apache.olingo.server.api.ODataApplicationException;
import org.apache.olingo.server.api.ODataRequest;
import org.apache.olingo.server.api.ODataResponse;
import org.apache.olingo.server.api.ServiceMetadata;
import org.apache.olingo.server.api.deserializer.DeserializerException;
import org.apache.olingo.server.api.processor.ComplexProcessor;
import org.apache.olingo.server.api.processor.EntityCollectionProcessor;
import org.apache.olingo.server.api.processor.EntityProcessor;
import org.apache.olingo.server.api.processor.PrimitiveProcessor;
import org.apache.olingo.server.api.processor.PrimitiveValueProcessor;
import org.apache.olingo.server.api.serializer.EntityCollectionSerializerOptions;
import org.apache.olingo.server.api.serializer.ODataSerializer;
import org.apache.olingo.server.api.serializer.SerializerException;
import org.apache.olingo.server.api.serializer.SerializerResult;
import org.apache.olingo.server.api.uri.UriInfo;
import org.apache.olingo.server.api.uri.UriInfoResource;
import org.apache.olingo.server.api.uri.UriResource;
import org.apache.olingo.server.api.uri.UriResourceEntitySet;
import org.apache.olingo.server.api.uri.queryoption.expression.BinaryOperatorKind;
import org.apache.olingo.server.api.uri.queryoption.expression.Expression;
import org.apache.olingo.server.api.uri.queryoption.expression.ExpressionVisitException;
import org.apache.olingo.server.api.uri.queryoption.expression.ExpressionVisitor;
import org.apache.olingo.server.api.uri.queryoption.expression.MethodKind;
import org.apache.olingo.server.api.uri.queryoption.expression.UnaryOperatorKind;

import cn.paxos.odata.hub.api.EntitySetMeta;
import cn.paxos.odata.hub.api.Repository;
import cn.paxos.odata.hub.service.RepositoryManager;
import cn.paxos.odata.hub.util.Binder;

public class DefaultEntityCollectionProcessor implements
    EntityCollectionProcessor, EntityProcessor, PrimitiveProcessor,
    PrimitiveValueProcessor, ComplexProcessor
{

  private final RepositoryManager repositoryManager;
  
  private OData odata;
  private ServiceMetadata serviceMetadata;

  public DefaultEntityCollectionProcessor(RepositoryManager repositoryManager)
  {
    this.repositoryManager = repositoryManager;
  }

  @Override
  public void init(OData odata, ServiceMetadata serviceMetadata)
  {
    this.odata = odata;
    this.serviceMetadata = serviceMetadata;
  }

  @Override
  public void readEntityCollection(ODataRequest request,
      ODataResponse response, UriInfo uriInfo, ContentType responseFormat)
      throws ODataApplicationException, SerializerException
  {
    try
    {
      List<UriResource> resourcePaths = uriInfo.getUriResourceParts();
      UriResourceEntitySet uriResourceEntitySet = (UriResourceEntitySet) resourcePaths
          .get(0);
      EdmEntitySet edmEntitySet = uriResourceEntitySet.getEntitySet();
      for (Repository repository : repositoryManager.getRepositories())
      {
        for (EntitySetMeta entitySetMeta : repository.getEntitySetMetas())
        {
          if (entitySetMeta.getName().equals(edmEntitySet.getName()))
          {
            final Map<String, Object> conditions = new HashMap<String, Object>();
            if (uriInfo.getFilterOption() != null)
            {
              Expression expression = uriInfo.getFilterOption().getExpression();
              try
              {
                expression.accept(new ExpressionVisitor<Object>()
                {
                  @Override
                  public Object visitBinaryOperator(
                      BinaryOperatorKind operator, Object left, Object right)
                      throws ExpressionVisitException, ODataApplicationException
                  {
                    if (operator.equals(BinaryOperatorKind.EQ))
                    {
                      conditions.put((String) left, right);
                      return null;
                    } else
                    {
                      // Ignored: AND, OR ...
                      return null;
                    }
                  }
                  @Override
                  public Object visitUnaryOperator(UnaryOperatorKind operator,
                      Object operand) throws ExpressionVisitException,
                      ODataApplicationException
                  {
                    throw new UnsupportedOperationException("Not yet implemented");
                  }
                  @Override
                  public Object visitMethodCall(MethodKind methodCall,
                      List<Object> parameters) throws ExpressionVisitException,
                      ODataApplicationException
                  {
                    throw new UnsupportedOperationException("Not yet implemented");
                  }
                  @Override
                  public Object visitLambdaExpression(String lambdaFunction,
                      String lambdaVariable, Expression expression)
                      throws ExpressionVisitException, ODataApplicationException
                  {
                    throw new UnsupportedOperationException("Not yet implemented");
                  }
                  @Override
                  public Object visitLiteral(String literal)
                      throws ExpressionVisitException, ODataApplicationException
                  {
                    if (literal.matches("^'.*'$"))
                    {
                      literal = literal.substring(1, literal.length() - 1);
                    }
                    return literal;
                  }
                  @Override
                  public Object visitMember(UriInfoResource member)
                      throws ExpressionVisitException, ODataApplicationException
                  {
                    return member.getUriResourceParts().get(0).toString();
                  }
                  @Override
                  public Object visitAlias(String aliasName)
                      throws ExpressionVisitException, ODataApplicationException
                  {
                    throw new UnsupportedOperationException("Not yet implemented");
                  }
                  @Override
                  public Object visitTypeLiteral(EdmType type)
                      throws ExpressionVisitException, ODataApplicationException
                  {
                    throw new UnsupportedOperationException("Not yet implemented");
                  }
                  @Override
                  public Object visitLambdaReference(String variableName)
                      throws ExpressionVisitException, ODataApplicationException
                  {
                    throw new UnsupportedOperationException("Not yet implemented");
                  }
                  @Override
                  public Object visitEnum(EdmEnumType type,
                      List<String> enumValues) throws ExpressionVisitException,
                      ODataApplicationException
                  {
                    throw new UnsupportedOperationException("Not yet implemented");
                  }
                });
              } catch (Exception e)
              {
                throw new RuntimeException("Should not happen", e);
              }
            }
            if (entitySetMeta.isAsync())
            {
              String location = request.getRawRequestUri();
              if (location.indexOf("_jobId=") > -1)
              {
                String jobId = location.substring(location.indexOf("_jobId=") + 7);
                List<Object> entities = repository.asyncListCheck(jobId);
                if (entities == null)
                {
                  response.setHeader("Location", location);
                  response.setStatusCode(HttpStatusCode.ACCEPTED.getStatusCode());
                  response.setHeader(HttpHeader.CONTENT_TYPE,
                      responseFormat.toContentTypeString());
                } else
                {
                  EntityCollection entitySet = Binder.entityCollection(entities);
                  ODataFormat format = ODataFormat.fromContentType(responseFormat);
                  ODataSerializer serializer = odata.createSerializer(format);
                  EdmEntityType edmEntityType = edmEntitySet.getEntityType();
                  ContextURL contextUrl = ContextURL.with().entitySet(edmEntitySet).build();
                  EntityCollectionSerializerOptions opts = EntityCollectionSerializerOptions
                      .with().contextURL(contextUrl).build();
                  SerializerResult serializedContent = serializer.entityCollection(
                      serviceMetadata, edmEntityType, entitySet, opts);
                  response.setContent(serializedContent.getContent());
                  response.setStatusCode(HttpStatusCode.OK.getStatusCode());
                  response.setHeader(HttpHeader.CONTENT_TYPE,
                      responseFormat.toContentTypeString());
                }
              } else
              {
                String jobId = repository.asyncListStart(entitySetMeta, conditions, uriInfo.getTopOption() == null ? null : uriInfo.getTopOption().getValue());
                if (location.indexOf('?') > -1)
                {
                  location = location.substring(0, location.indexOf('?'));
                }
                location += "?_jobId=" + jobId;
                response.setHeader("Location", location);
                response.setStatusCode(HttpStatusCode.ACCEPTED.getStatusCode());
                response.setHeader(HttpHeader.CONTENT_TYPE,
                    responseFormat.toContentTypeString());
              }
            } else
            {
              List<Object> entities = repository.list(entitySetMeta, conditions, uriInfo.getTopOption() == null ? null : uriInfo.getTopOption().getValue());
              EntityCollection entitySet = Binder.entityCollection(entities);
              ODataFormat format = ODataFormat.fromContentType(responseFormat);
              ODataSerializer serializer = odata.createSerializer(format);
              EdmEntityType edmEntityType = edmEntitySet.getEntityType();
              ContextURL contextUrl = ContextURL.with().entitySet(edmEntitySet).build();
              EntityCollectionSerializerOptions opts = EntityCollectionSerializerOptions
                  .with().contextURL(contextUrl).build();
              SerializerResult serializedContent = serializer.entityCollection(
                  serviceMetadata, edmEntityType, entitySet, opts);
              response.setContent(serializedContent.getContent());
              response.setStatusCode(HttpStatusCode.OK.getStatusCode());
              response.setHeader(HttpHeader.CONTENT_TYPE,
                  responseFormat.toContentTypeString());
            }
            return;
          }
        }
      }
    } catch (Throwable t)
    {
      t.printStackTrace();
      throw new ODataApplicationException("Unknown error. See catalina.out.",
          HttpStatusCode.INTERNAL_SERVER_ERROR.getStatusCode(), Locale.ENGLISH);
    }
  }

  @Override
  public void readEntity(final ODataRequest request, ODataResponse response,
      final UriInfo uriInfo, final ContentType requestedContentType)
      throws ODataApplicationException, SerializerException
  {
    throw new ODataApplicationException("Entity read is not supported yet.",
        HttpStatusCode.NOT_IMPLEMENTED.getStatusCode(), Locale.ENGLISH);
  }

  @Override
  public void createEntity(ODataRequest request, ODataResponse response,
      UriInfo uriInfo, ContentType requestFormat, ContentType responseFormat)
      throws ODataApplicationException, DeserializerException,
      SerializerException
  {
    throw new ODataApplicationException("Entity create is not supported yet.",
        HttpStatusCode.NOT_IMPLEMENTED.getStatusCode(), Locale.ENGLISH);
  }

  @Override
  public void deleteEntity(ODataRequest request, ODataResponse response,
      UriInfo uriInfo) throws ODataApplicationException
  {
    throw new ODataApplicationException("Entity delete is not supported yet.",
        HttpStatusCode.NOT_IMPLEMENTED.getStatusCode(), Locale.ENGLISH);
  }

  @Override
  public void readPrimitive(ODataRequest request, ODataResponse response,
      UriInfo uriInfo, ContentType format) throws ODataApplicationException,
      SerializerException
  {
    throw new ODataApplicationException("Primitive read is not supported yet.",
        HttpStatusCode.NOT_IMPLEMENTED.getStatusCode(), Locale.ENGLISH);
  }

  @Override
  public void readComplex(ODataRequest request, ODataResponse response,
      UriInfo uriInfo, ContentType format) throws ODataApplicationException,
      SerializerException
  {
    throw new ODataApplicationException("Complex read is not supported yet.",
        HttpStatusCode.NOT_IMPLEMENTED.getStatusCode(), Locale.ENGLISH);
  }

  @Override
  public void readPrimitiveValue(ODataRequest request, ODataResponse response,
      UriInfo uriInfo, ContentType format) throws ODataApplicationException,
      SerializerException
  {
    throw new ODataApplicationException("ComplexValue read is not supported yet.",
        HttpStatusCode.NOT_IMPLEMENTED.getStatusCode(), Locale.ENGLISH);
  }

  @Override
  public void updatePrimitive(final ODataRequest request,
      final ODataResponse response, final UriInfo uriInfo,
      final ContentType requestFormat, final ContentType responseFormat)
      throws ODataApplicationException, DeserializerException,
      SerializerException
  {
    throw new ODataApplicationException(
        "Primitive property update is not supported yet.",
        HttpStatusCode.NOT_IMPLEMENTED.getStatusCode(), Locale.ENGLISH);
  }

  @Override
  public void deletePrimitive(ODataRequest request, ODataResponse response,
      UriInfo uriInfo) throws ODataApplicationException
  {
    throw new ODataApplicationException(
        "Primitive property delete is not supported yet.",
        HttpStatusCode.NOT_IMPLEMENTED.getStatusCode(), Locale.ENGLISH);
  }

  @Override
  public void updateComplex(final ODataRequest request,
      final ODataResponse response, final UriInfo uriInfo,
      final ContentType requestFormat, final ContentType responseFormat)
      throws ODataApplicationException, DeserializerException,
      SerializerException
  {
    throw new ODataApplicationException(
        "Complex property update is not supported yet.",
        HttpStatusCode.NOT_IMPLEMENTED.getStatusCode(), Locale.ENGLISH);
  }

  @Override
  public void deleteComplex(final ODataRequest request,
      final ODataResponse response, final UriInfo uriInfo)
      throws ODataApplicationException
  {
    throw new ODataApplicationException(
        "Complex property delete is not supported yet.",
        HttpStatusCode.NOT_IMPLEMENTED.getStatusCode(), Locale.ENGLISH);
  }

  @Override
  public void updateEntity(final ODataRequest request,
      final ODataResponse response, final UriInfo uriInfo,
      final ContentType requestFormat, final ContentType responseFormat)
      throws ODataApplicationException, DeserializerException,
      SerializerException
  {
    throw new ODataApplicationException("Entity update is not supported yet.",
        HttpStatusCode.NOT_IMPLEMENTED.getStatusCode(), Locale.ENGLISH);
  }
  
}
