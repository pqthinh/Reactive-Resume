-- CreateTable
CREATE TABLE `User` (
    `id` VARCHAR(255) NOT NULL,
    `name` VARCHAR(255) NOT NULL,
    `picture` VARCHAR(255),
    `username` VARCHAR(255) NOT NULL,
    `email` VARCHAR(255) NOT NULL,
    `locale` VARCHAR(255) NOT NULL DEFAULT 'en-US',
    `emailVerified` BOOLEAN NOT NULL DEFAULT false,
    `twoFactorEnabled` BOOLEAN NOT NULL DEFAULT false,
    `createdAt` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `updatedAt` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    `provider` VARCHAR(255) NOT NULL,

    PRIMARY KEY (`id`)
);

-- CreateTable
CREATE TABLE `Secrets` (
    `id` VARCHAR(255) NOT NULL,
    `password` VARCHAR(255),
    `lastSignedIn` TIMESTAMP,
    `verificationToken` VARCHAR(255),
    `twoFactorSecret` VARCHAR(255),
    `twoFactorBackupCodes` JSON,
    `refreshToken` VARCHAR(255),
    `resetToken` VARCHAR(255),
    `userId` VARCHAR(255) NOT NULL,

    PRIMARY KEY (`id`)
);

-- CreateTable
CREATE TABLE `Resume` (
    `id` VARCHAR(255) NOT NULL,
    `title` VARCHAR(255) NOT NULL,
    `slug` VARCHAR(255) NOT NULL,
    `data` JSON NOT NULL,
    `visibility` VARCHAR(255) NOT NULL DEFAULT 'private',
    `locked` BOOLEAN NOT NULL DEFAULT false,
    `userId` VARCHAR(255) NOT NULL,
    `createdAt` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `updatedAt` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,

    PRIMARY KEY (`id`)
);

-- CreateIndex
CREATE UNIQUE INDEX `User_username_key` ON `User`(`username`);

-- CreateIndex
CREATE UNIQUE INDEX `User_email_key` ON `User`(`email`);

-- CreateIndex
CREATE UNIQUE INDEX `Secrets_resetToken_key` ON `Secrets`(`resetToken`);

-- CreateIndex
CREATE UNIQUE INDEX `Secrets_userId_key` ON `Secrets`(`userId`);

-- CreateIndex
CREATE INDEX `Resume_userId_idx` ON `Resume`(`userId`);

-- CreateIndex
CREATE UNIQUE INDEX `Resume_userId_id_key` ON `Resume`(`userId`, `id`);

-- CreateIndex
CREATE UNIQUE INDEX `Resume_userId_slug_key` ON `Resume`(`userId`, `slug`);

-- AddForeignKey
ALTER TABLE `Secrets` ADD CONSTRAINT `Secrets_userId_fkey` FOREIGN KEY (`userId`) REFERENCES `User`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Resume` ADD CONSTRAINT `Resume_userId_fkey` FOREIGN KEY (`userId`) REFERENCES `User`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;
