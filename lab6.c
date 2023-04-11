#include <mysql/mysql.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

void finish_with_error(MYSQL *con)
{
  fprintf(stderr, "%s\n", mysql_error(con));
  mysql_close(con);
  exit(1);
}

void err_exit(char* s){
    perror(s); 
    perror("\n"); 
    exit(1); 
}

int main(int argc, char **argv)
{
	MYSQL *con = mysql_init(NULL);

	if (con == NULL){
		fprintf(stderr, "%s\n", mysql_error(con));
		exit(1);
	}

	if (mysql_real_connect(con, "localhost", "root", "1221", "testdb", 0, NULL, 0) == NULL) {
		finish_with_error(con);
	}
	int choice;
	printf("Your choice: ");
	scanf("%d", &choice);
	char username[20];
	char password[32];
	printf("username: ");
	scanf("%s", username);
	printf("password: ");
	scanf("%s", password);
	char query[1024] = "";
	if (choice == 0){
		strncat(query, "select * from creds where username = '", sizeof("select * from creds where username = '"));
		strncat(query, username, sizeof(username));
		strncat(query, "' and password = '", 18);
		strncat(query, password, sizeof(password));
		strncat(query, "'", 1);
		if (mysql_query(con, query)){
			finish_with_error(con);
		}
	
		printf("%s\n", query);
		MYSQL_RES *result = mysql_store_result(con);
  	
		if (result == NULL)
		{
			
			finish_with_error(con);
		}

		
		int num_fields = mysql_num_fields(result);

		MYSQL_ROW row;
		MYSQL_FIELD *field;

		while ((row = mysql_fetch_row(result)))
		{
			for(int i = 0; i < num_fields; i++){
				if (i == 0)
				{
					while(field = mysql_fetch_field(result))
					{
						printf("%s ", field->name);
					}
					printf("\n");
				}
				printf("%s  ", row[i] ? row[i] : "NULL");
			}
		}

		printf("\n");
		mysql_free_result(result);
		mysql_close(con);
	} else {
	
		MYSQL_STMT *stmt;
		MYSQL_BIND ps_params[2];
		int status;
		unsigned long usernameLen = strlen(username); 
		unsigned long passwordLen = strlen(password);
		char query[] = "select * from creds where username = ? and password = ?";
		
		stmt = mysql_stmt_init(con);
		status = mysql_stmt_prepare(stmt, query, strlen(query));
		if (status != 0) err_exit("prepare stmt failed"); 
		
		int count = mysql_stmt_param_count(stmt);
		
		
		memset(ps_params, 0, sizeof(ps_params)*2);
		
		ps_params[0].buffer_type = MYSQL_TYPE_STRING;
		ps_params[0].buffer = username;
		ps_params[0].buffer_length = strlen(username);
		ps_params[0].length = &usernameLen;
		
		ps_params[1].buffer_type = MYSQL_TYPE_STRING;
		ps_params[1].buffer = password;
		ps_params[1].buffer_length = strlen(password);
		ps_params[1].length = &passwordLen;
	
		status = mysql_stmt_bind_param(stmt, ps_params);
		if (status != 0) err_exit("bind stmt select failed");
		status = mysql_stmt_execute(stmt);
		if (status != 0) err_exit("execute stmt insert failed");
		
		int numFields; 
		char strName[100]; 
		char strOpaque[100]; 
		long lenName; 
		long lenOpaque; 
		long longResult; 
		int result; 
		int row; 
		MYSQL_BIND bind[3]; /*used to get result, not to provide parameters*/
		MYSQL_FIELD *fields; 
		MYSQL_RES *metaData; 
		my_bool isNull[3]; 

		numFields = mysql_stmt_field_count(stmt);
		
		metaData = mysql_stmt_result_metadata(stmt); 
		if (metaData == NULL) err_exit("failed to get metadata"); 

		fields = mysql_fetch_fields(metaData); 
		memset(bind,0,sizeof(MYSQL_BIND)*3);  
	 

		bind[0].buffer_type = fields[0].type; 
		bind[0].buffer = strName; 
		bind[0].buffer_length = 100;
		bind[0].is_null = &isNull[0]; 
		bind[0].length = &lenName; 

		bind[1].buffer_type = fields[1].type; 
		bind[1].buffer = strOpaque; 
		bind[1].buffer_length = 100;
		bind[1].is_null = &isNull[1];
		bind[1].length = &lenOpaque; 


		result = mysql_stmt_bind_result(stmt, bind); 
		if (result!=0) err_exit("bind result failed"); 

		result = mysql_stmt_execute(stmt); 
		if (result!=0) err_exit("execute select all failed"); 

		row = 0; 
		while(1){
		row++; 
		result = mysql_stmt_fetch(stmt); 
		if (result == MYSQL_NO_DATA){
		    printf("%d row(s)\n", row - 1);
		    break; 
		}
		if (result != 0){
		    printf("error happened while fetch data error code is:%d\n", result);
		    printf("error str is %s \n", mysql_error(con));
		    break; 
		}

		strName[lenName]='\0'; 
		strOpaque[lenOpaque]='\0'; 
		printf("%s %s\n", strName, strOpaque); 
		} 

    		mysql_free_result(metaData);
		
		
		
		mysql_stmt_close(stmt);
	}
	
	
	
  	

	exit(0);
	
	
	
}
