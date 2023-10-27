CREATE TABLE `users` (
    `id` INT NOT NULL AUTO_INCREMENT,
    `username` VARCHAR(16) NOT NULL,
    `password` VARCHAR(64) NOT NULL,
    `display_name` VARCHAR(16) NOT NULL,
    `profile_image` VARCHAR(128) NOT NULL,
    `profile_message` VARCHAR(128) NOT NULL,
    `is_quit` TINYINT(1) NOT NULL DEFAULT 0,
    `assign_date` DATETIME NOT NULL,
    PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `channels` (
    `id` INT NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(32) NOT NULL,
    `creating_user` INT NOT NULL,
    `channel_link` VARCHAR(128) NOT NULL,
    `capacity` INT NOT NULL,
    `is_quit` TINYINT(1) NOT NULL DEFAULT 0,
    `creating_date` DATETIME NOT NULL,
    PRIMARY KEY (`id`),
    FOREIGN KEY (`creating_user`) REFERENCES `users`(`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `chats` (
    `id` INT NOT NULL AUTO_INCREMENT,
    `message` TEXT NOT NULL,
    `creating_user` INT NOT NULL,
    `channel` INT NOT NULL,
    `creating_date` DATETIME NOT NULL,
    PRIMARY KEY (`id`),
    FOREIGN KEY (`creating_user`) REFERENCES `users`(`id`) ON DELETE CASCADE,
    FOREIGN KEY (`channel`) REFERENCES `channels`(`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `follows` (
    `id` INT NOT NULL AUTO_INCREMENT,
    `follower` INT NOT NULL,
    `followee` INT NOT NULL,
    `follow_date` DATETIME NOT NULL,
    PRIMARY KEY (`id`),
    FOREIGN KEY (`follower`) REFERENCES `users`(`id`) ON DELETE CASCADE,
    FOREIGN KEY (`follower`) REFERENCES `users`(`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `blocks` (
    `id` INT NOT NULL AUTO_INCREMENT,
    `blocking_user` INT NOT NULL,
    `blocked_user` INT NOT NULL,
    `block_date` DATETIME NOT NULL,
    PRIMARY KEY (`id`),
    FOREIGN KEY (`blocking_user`) REFERENCES `users`(`id`) ON DELETE CASCADE,
    FOREIGN KEY (`blocked_user`) REFERENCES `users`(`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
