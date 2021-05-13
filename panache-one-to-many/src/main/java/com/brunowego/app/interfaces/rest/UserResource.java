package com.brunowego.app.interfaces.rest;

import java.util.List;
import java.util.UUID;

import javax.inject.Inject;
import javax.ws.rs.Consumes;
import javax.ws.rs.DELETE;
import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.PUT;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;

import com.brunowego.app.domain.model.entities.User;
import com.brunowego.app.infrastructure.repositories.hibernate.UserRepository;

@Path("users")
@Consumes(MediaType.APPLICATION_JSON)
@Produces(MediaType.APPLICATION_JSON)
public class UserResource {

    @Inject
    private UserRepository repo;

    @GET
    public List<User> getAll() {
        return repo.findAll();
    }

    @GET
    @Path("{id}")
    public User get(@PathParam("id") UUID id) {
        return repo.get(id);
    }

    @POST
    public User create(User entity) {
        return repo.create(entity);
    }

    @PUT
    public User update(User entity) {
        return repo.update(entity);
    }

    @DELETE
    @Path("{id}")
    public Response delete(@PathParam("id") UUID id) {
        repo.delete(id);

        return Response.status(Response.Status.NO_CONTENT).build();
    }

}
