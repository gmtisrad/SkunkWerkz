import bookshelf from '../config/bookshelf';

const TABLE_NAME = 'jobs';

/**
 * Job Model.
 */
class Job extends bookshelf.Model {
    /**
     * Get table name.
     */
    get tableName() {
        return TABLE_NAME;
    }

    /**
     * Table has timestamps.
     */
    get hasTimeStamps() {
        return true;
    }
}

export default Job;