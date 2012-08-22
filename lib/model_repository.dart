// Copyright (c) 2012 Solvr, Inc. All rights reserved.
//
// This open source software is governed by the license terms 
// specified in the LICENSE file

/**
 * Repository for working with read-models
 */ 
interface ModelRepository<T> {
  /**
   * Get all instances of T
   */
  List<T> get all();
  
  T getById(Guid id);
  
  /**
   * Get single instance of T if any exists or use [builder] to make a new one. 
   *
   * Throws exception if more than one instance already exists
   */
  T getOrNew(T builder());
  
  remove(T instance);
  
  removeById(Guid id);
  
  save(T instance);
}

/**
 * Marker interface than can optionally be put on models to ensure they can 
 * be saved in the model repository.
 */
interface IdModel {
  Guid get id();
}