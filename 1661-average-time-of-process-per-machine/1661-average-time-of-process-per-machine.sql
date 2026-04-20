# Write your MySQL query statement below

with  processing As(
     select  machine_id, round( sum(case when activity_type='start'  then timestamp else  timestamp *-1 end ) *-1/(count(*)/2.0)  ,3) As  processing_time
     from Activity
     group by  machine_id 

)

select  machine_id, processing_time
from  processing 















