CREATE type message_type as object (subject  VARCHAR2(30),text VARCHAR2(80));   
/

EXECUTE dbms_aqadm.create_queue_table (queue_table => 'scott.msg',sort_list=> 'PRIORITY,ENQ_TIME', queue_payload_type => 'scott.message_type');
EXECUTE dbms_aqadm.create_queue ( queue_name  => 'msg_queue',queue_table => 'scott.msg');
EXECUTE dbms_aqadm.start_queue (queue_name  => 'msg_queue');
  

EXECUTE dbms_aqadm.create_queue_table ( queue_table => 'scott.priority_msg', sort_list => 'PRIORITY,ENQ_TIME', queue_payload_type => 'scott.message_type');
EXECUTE dbms_aqadm.create_queue (queue_name  => 'priority_msg_queue', queue_table => 'scott.priority_msg');
EXECUTE dbms_aqadm.start_queue (queue_name => 'priority_msg_queue');

EXECUTE dbms_aqadm.create_queue_table (queue_table => 'scott.msg_multiple', multiple_consumers => TRUE, queue_payload_type => 'scott.message_type');
EXECUTE dbms_aqadm.create_queue ( queue_name  => 'msg_queue_multiple', queue_table => 'scott.msg_multiple');
EXECUTE dbms_aqadm.start_queue ( queue_name  => 'msg_queue_multiple');

EXECUTE dbms_aqadm.create_queue_table (queue_table => 'scott.raw_msg',sort_list=> 'PRIORITY,ENQ_TIME', queue_payload_type => 'raw');
EXECUTE dbms_aqadm.create_queue ( queue_name  => 'raw_msg_queue',queue_table => 'scott.raw_msg');
EXECUTE dbms_aqadm.start_queue (queue_name  => 'raw_msg_queue');
