package com.brunowego.app.infrastructure.repositories.hibernate;

import java.util.UUID;

import io.quarkus.hibernate.orm.panache.PanacheRepositoryBase;

public interface BaseRepository<Entity> extends PanacheRepositoryBase<Entity, UUID> {}
