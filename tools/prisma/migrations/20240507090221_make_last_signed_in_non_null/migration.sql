-- Migrate the `Secrets` table to make the `lastSignedIn` column non-nullable
UPDATE `Secrets`
SET `lastSignedIn` = CURRENT_TIMESTAMP
WHERE `lastSignedIn` IS NULL;

-- AlterTable
ALTER TABLE `Secrets`
MODIFY COLUMN `lastSignedIn` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP;
