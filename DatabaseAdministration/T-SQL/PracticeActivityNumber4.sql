select system_type_id, column_id, try_convert(tinyint,system_type_id *2) as Calculation
from sys.all_columns

