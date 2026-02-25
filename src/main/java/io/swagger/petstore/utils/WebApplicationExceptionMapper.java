package io.swagger.petstore.utils;

import javax.ws.rs.WebApplicationException;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;
import javax.ws.rs.ext.ExceptionMapper;

public class WebApplicationExceptionMapper implements ExceptionMapper<WebApplicationException> {

    @Override
    public Response toResponse(WebApplicationException exception) {
        String message = exception.getMessage();
        Response response = exception.getResponse();
        Response.Status status = response.getStatusInfo().toEnum();
        
        // Log the actual exception message for debugging
        // Logger can be added if needed: logger.error("WebApplicationException occurred", exception);
        
        // Return generic error message to client
        String safeMessage = "An error occurred while processing your request";
        
        return Response.status(status)
                .entity(status + ": " + safeMessage)
                .type(MediaType.TEXT_PLAIN)
                .build();
    }

}
