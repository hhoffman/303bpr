from datetime import datetime
import os
from ansible.plugins.callback import CallbackBase
import json

class CallbackModule(CallbackBase):
    CALLBACK_VERSION = 2.0
    CALLBACK_TYPE = 'notification'
    CALLBACK_NAME = 'custom_logging'

    def __init__(self):
        super(CallbackModule, self).__init__()
        log_dir = './logs/hosts'
        os.makedirs(log_dir, exist_ok=True)
        now = datetime.now().strftime('%Y-%m-%d_%H-%M-%S')
        self.logfile = open(os.path.join(log_dir, f'ansible-{now}.log'), 'w')

    def _log(self, message):
        self.logfile.write(message + "\n")
        self.logfile.flush()

    def v2_playbook_on_start(self, playbook, **kwargs):
        self._log(f"Starting playbook: {playbook._file_name}")

    def v2_playbook_on_play_start(self, play):
        self._log(f"Starting play: {play.name}")

    def v2_playbook_on_task_start(self, task, **kwargs):
        self._log(f"Starting task: {task.name}")

    def v2_runner_on_ok(self, result, **kwargs):
        self._log(f"OK: {result._host.get_name()} | {result.task_name}\n{json.dumps(result._result, indent=2)}")

    def v2_runner_on_failed(self, result, **kwargs):
        self._log(f"FAILED: {result._host.get_name()} | {result.task_name}\n{json.dumps(result._result, indent=2)}")

    def v2_runner_on_skipped(self, result, **kwargs):
        self._log(f"SKIPPED: {result._host.get_name()} | {result.task_name}\n{json.dumps(result._result, indent=2)}")

    def v2_runner_on_unreachable(self, result, **kwargs):
        self._log(f"UNREACHABLE: {result._host.get_name()} | {result.task_name}\n{json.dumps(result._result, indent=2)}")

    def v2_playbook_on_stats(self, stats):
        self._log("Playbook run statistics:")
        hosts = sorted(stats.processed.keys())
        for host in hosts:
            summary = stats.summarize(host)
            self._log(f"{host} : ok={summary['ok']} changed={summary['changed']} unreachable={summary['unreachable']} failed={summary['failures']} skipped={summary['skipped']} rescued={summary['rescued']} ignored={summary['ignored']}")

    def close(self):
        self.logfile.close()
      
