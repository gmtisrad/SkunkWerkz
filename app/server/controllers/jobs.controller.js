import HttpStatus from 'http-status-codes';
import Job from '../models/job.model';

/**
 * Find all jobs
 * 
 * @param {object} req
 * @param {object} res
 * @returns {*}
 */
export function findAll(req, res) {
    Job.forge()
        .fetchAll()
        .then(job => res.json({
            error:false,
            data: job.toJSON()
        }))
        .catch(err => {
            console.log(err);
            return res.status(HttpStatus.INTERNAL_SERVER_ERROR).json({
                error: err
            });
        });

}