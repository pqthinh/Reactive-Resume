/*
  Warnings:

  - A unique constraint covering the columns `[userId,id]` on the table `Secrets` will be added. If there are existing duplicate values, this will fail.

*/
-- CreateTable
CREATE TABLE `Statistics` (
    `id` VARCHAR(255) NOT NULL,
    `views` INT NOT NULL DEFAULT 0,
    `downloads` INT NOT NULL DEFAULT 0,
    `resumeId` VARCHAR(255) NOT NULL,
    `createdAt` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `updatedAt` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,

    PRIMARY KEY (`id`)
);

-- CreateIndex
CREATE UNIQUE INDEX `Statistics_resumeId_key` ON `Statistics`(`resumeId`);

-- CreateIndex
CREATE UNIQUE INDEX `Statistics_resumeId_id_key` ON `Statistics`(`resumeId`, `id`);

-- CreateIndex
CREATE UNIQUE INDEX `Secrets_userId_id_key` ON `Secrets`(`userId`, `id`);

-- AddForeignKey
ALTER TABLE `Statistics` ADD CONSTRAINT `Statistics_resumeId_fkey` FOREIGN KEY (`resumeId`) REFERENCES `Resume`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;
