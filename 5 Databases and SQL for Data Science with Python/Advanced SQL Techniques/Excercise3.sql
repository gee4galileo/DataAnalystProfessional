DROP PROCEDURE IF EXISTS `UPDATE_LEADERS_SCORE`;


DELIMITER //

CREATE PROCEDURE `UPDATE_LEADERS_SCORE` (
  IN School_ID  INTEGER, IN Leader_Score INTEGER)

BEGIN

  UPDATE chicago_public_schools cps
  SET cps.Leaders_Score = Leader_Score
  WHERE cps.School_ID = School_ID;

  IF Leader_Score > 0 and Leader_Score < 20  THEN
    UPDATE chicago_public_schools cps
    SET cps.Leaders_Icon = 'Very Weak'
    WHERE cps.School_ID = School_ID;

  ELSEIF Leader_Score < 40  THEN
    UPDATE chicago_public_schools cps
    SET cps.Leaders_Icon = 'Weak'
    WHERE cps.School_ID = School_ID;

  ELSEIF Leader_Score < 60  THEN
    UPDATE chicago_public_schools cps
    SET cps.Leaders_Icon = 'Average'
    WHERE cps.School_ID = School_ID;

  ELSEIF Leader_Score < 80  THEN
    UPDATE chicago_public_schools cps
    SET cps.Leaders_Icon = 'Strong'
    WHERE cps.School_ID = School_ID;

  ELSE 'Very Strong'

  END IF;

END //

DELIMITER ;


ALTER TABLE chicago_public_schools
MODIFY COLUMN Leaders_Icon VARCHAR(11);

CALL UPDATE_LEADERS_SCORE(610038, 50);


SELECT School_ID, Leaders_Score, Leaders_Icon
FROM `chicago_public_schools`
WHERE `School_ID` = 610038;
