package com.example.player

import org.springframework.data.repository.CrudRepository

interface PlayerRepository : CrudRepository<Player, String>