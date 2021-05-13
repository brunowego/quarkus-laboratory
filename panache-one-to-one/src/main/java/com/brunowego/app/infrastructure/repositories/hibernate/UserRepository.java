package com.brunowego.app.infrastructure.repositories.hibernate;

import java.util.List;
import java.util.UUID;

import javax.enterprise.context.ApplicationScoped;
import javax.transaction.Transactional;
import javax.ws.rs.WebApplicationException;
import javax.ws.rs.core.Response;

import com.brunowego.app.domain.model.entities.User;

import io.quarkus.panache.common.Sort;

@ApplicationScoped
public class UserRepository {

    public List<User> findAll() {
        return User.listAll(Sort.by("id"));
    }

    public User get(UUID id) {
        return User.findById(id);
    }

    @Transactional
    public User create(User entity) {
        entity.persist();

        return entity;
    }

    @Transactional
    public User update(User entity) {
        User user = findUserById(entity.getId());

        if (entity.getUsername() != null) {
            user.setUsername(entity.getUsername());
        }

        if (entity.getProfile() != null) {
            user.setProfile(entity.getProfile());
        }

        return user;
    }

    @Transactional
    public void delete(UUID id) {
        User user = findUserById(id);
        user.delete();
    }

    public User findUserById(UUID id) {
        User user = User.findById(id);

        if (user == null) {
            throw new WebApplicationException("User with id of " + id + " does not exists.", Response.Status.NOT_FOUND);
        }

        return user;
    }

}
