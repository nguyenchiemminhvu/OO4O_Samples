

EXECUTE dbms_aqadm.stop_queue (queue_name  => 'msg_queue');
EXECUTE dbms_aqadm.drop_queue ( queue_name  => 'msg_queue');
EXECUTE dbms_aqadm.drop_queue_table (queue_table => 'scott.msg');
  

EXECUTE dbms_aqadm.stop_queue (queue_name => 'priority_msg_queue');
EXECUTE dbms_aqadm.drop_queue (queue_name  => 'priority_msg_queue');
EXECUTE dbms_aqadm.drop_queue_table ( queue_table => 'scott.priority_msg');

EXECUTE dbms_aqadm.stop_queue ( queue_name  => 'msg_queue_multiple');
EXECUTE dbms_aqadm.drop_queue ( queue_name  => 'msg_queue_multiple');
EXECUTE dbms_aqadm.drop_queue_table (queue_table => 'scott.msg_multiple');

EXECUTE dbms_aqadm.stop_queue (queue_name => 'raw_msg_queue');
EXECUTE dbms_aqadm.drop_queue (queue_name => 'raw_msg_queue');
EXECUTE dbms_aqadm.drop_queue_table (queue_table => 'scott.raw_msg');

drop type message_type;

