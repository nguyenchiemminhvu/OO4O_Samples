connect /@exampledb as sysdba;
set serveroutput on
set echo on

rem  Set up a user with appropriate privileges
create user event identified by event;
grant dba to event;

create user pubsub identified by pubsub;
grant connect, resource, dba to pubsub;
grant AQ_ADMINISTRATOR_ROLE, AQ_USER_ROLE to pubsub;
grant select_catalog_role to pubsub;
grant execute on dbms_aq to pubsub;
execute dbms_aqadm.grant_type_access('pubsub');
execute dbms_aqadm.grant_system_privilege('ENQUEUE_ANY','pubsub',FALSE);
execute dbms_aqadm.grant_system_privilege('DEQUEUE_ANY','pubsub',FALSE);
connect pubsub/pubsub@exampledb;

rem create queue tables for persistent multiple consumers

rem  Create or replace a queue table
begin
DBMS_AQADM.CREATE_QUEUE_TABLE(
    QUEUE_TABLE=>'pubsub.raw_msg_table',
    MULTIPLE_CONSUMERS => TRUE,
    QUEUE_PAYLOAD_TYPE =>'RAW',
    COMPATIBLE => '9.0.0');
end;
/

rem  Create various persistent queues for publishing messages


rem  Create a queue for logon events
begin
DBMS_AQADM.CREATE_QUEUE(QUEUE_NAME=>'pubsub.logon',
            QUEUE_TABLE=>'pubsub.raw_msg_table',
            COMMENT=>'Q for logon triggers');
end;
/



rem  Start all queues

begin
DBMS_AQADM.START_QUEUE('pubsub.logon');
end;
/


rem  define new_enqueue/new_np_enqueue for convenience

create or replace procedure new_enqueue(queue_name  in varchar2,
                                        payload  in raw ,
                                        correlation  in varchar2 := NULL,
                                        exception_queue  in varchar2 := NULL)
as

enq_ct     dbms_aq.enqueue_options_t;
msg_prop   dbms_aq.message_properties_t;
enq_msgid  raw(16);
userdata   raw(1000);

begin
    msg_prop.exception_queue := exception_queue;
    msg_prop.correlation := correlation;
    userdata := payload;

    DBMS_AQ.ENQUEUE(queue_name, enq_ct, msg_prop, userdata, enq_msgid);
end;
/
grant execute on new_enqueue to public;

create or replace procedure new_np_enqueue(queue  varchar2,
                                           id  integer,
                                           correlation  varchar2)
as

msgprop        dbms_aq.message_properties_t;
enqopt         dbms_aq.enqueue_options_t;
enq_msgid      raw(16);
payload        raw(10);

begin
    payload := hextoraw('123');
    enqopt.visibility:=dbms_aq.IMMEDIATE;
    msgprop.correlation:=correlation;
    DBMS_AQ.ENQUEUE( queue, enqopt, msgprop, payload, enq_msgid);
end;
/

grant execute on new_np_enqueue to public;

rem  create subscriptions to all event-publications for agent 'ADMIN'

DECLARE

subscriber sys.aq$_agent;

begin

subscriber := sys.aq$_agent('admin', null, null);

dbms_aqadm.add_subscriber(queue_name => 'pubsub.logon',
                          subscriber => subscriber);

end;
/

rem  add subscriber with rule based on curent user name, using correlation_id

declare
subscriber sys.aq$_agent;
begin
subscriber := sys.aq$_agent('SNOOP', null, null);
dbms_aqadm.add_subscriber(queue_name => 'pubsub.logon',
                          subscriber         => subscriber,
                          rule => 'CORRID = ''EVENT'' ');
end;
/

rem  now create triggers on various events

rem  create trigger on after logon
create or replace trigger systrig3
   AFTER LOGON
   ON DATABASE
   begin
      new_enqueue('pubsub.logon', hextoraw('9999'), dbms_standard.login_user);
   end;
/


rem disconnect
