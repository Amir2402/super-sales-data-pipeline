from airflow import DAG  
from airflow.operators.bash import BashOperator 
from datetime import datetime 

dag_configs = {
    'owner': 'Amir', 
    'depends_on_past': False, 
    'start_date': datetime(2023,1,1), 
    'catchup': False, 
    'retries': 0
}

with DAG(
    dag_id = 'dbt_dag', 
    default_args = dag_configs, 
    schedule_interval = None  
) as dag:
    
    seed_task = BashOperator(
        task_id = 'dbt_seed', 
        bash_command = 'cd /opt/airflow/code/sales_dbt && dbt seed', 
        dag = dag  
    )
    run_task = BashOperator(
        task_id = 'dbt_run', 
        bash_command = 'cd /opt/airflow/code/sales_dbt && dbt run', 
        dag = dag  
    )
    test_task = BashOperator(
        task_id = 'dbt_test', 
        bash_command = 'cd /opt/airflow/code/sales_dbt && dbt test', 
        dag = dag  
    )
    
seed_task >> run_task >> test_task 
    
