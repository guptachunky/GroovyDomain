package linksharing

class JobsJob {
    boolean lazyInit = false

    UnreadItemService unreadItemService
    static triggers = {

        cron name: 'cronTrigger', startDelay: 10000, cronExpression: '0 0 1 ? * MON *'
        cron name: 'cronTrigger', startDelay: 10000, cronExpression: '0 0 12 1/1 * ? *'
    }

    def execute() {
        // execute job

        unreadItemService.unreaditem()
    }


}
