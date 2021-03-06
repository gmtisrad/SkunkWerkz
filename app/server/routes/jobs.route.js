import express from 'express';
import * as jobsCtrl from '../controllers/jobs.controller';
import isAuthenticated from '../middlewares/authenticate';
import validate from '../config/joi.validate';
import schema from '../utils/validator';

const router = express.Router();

/**
 * @swagger
 * tags:
 *   - name: job
 *     description: job operations
 */

/**
 * @swagger
 * definitions:
 *   job:
 *     type: object
 *     properties:
 *       id:
 *         type: integer
 *         description: Unique identifier representing a specific job
 *         example: 2
 *       originator_id:
 *         type: integer
 *         description: Unique identifier representing a specific user
 *         example: 2
 *       title:
 *          type: string
 *          description: the title of the job posting
 *          example: "Software Engineer"
 *       created_at:
 *          type: timestamp
 *          description: The time at which this object was created.
 *          example: NOW()
 *       updated_at:
 *          type: timestamp
 *          description: the time at which this object was last updated
 *   Error:
 *     type: object
 *     properties:
 *        message:
 *           type: string
 *        error:
 *           type: boolean
 *           default: true
 */

/**
 * @swagger
 * securityDefinitions:
 *   Bearer:
 *     description: |
 *            For accessing the API a valid JWT token must be passed in all the queries in
 *            the 'Authorization' header.
 *
 *
 *            A valid JWT token is generated by the API and returned as answer of a call
 *            to the route /auth/login giving a valid user & password.
 *
 *
 *            The following syntax must be used in the 'Authorization' header:
 *
 *            Bearer xxxxxx.yyyyyyy.zzzzzz
 *     type: apiKey
 *     name: Authorization
 *     in: header
 *
 */

router.route('/')
    //.post(validate(schema.storeJob), (req, res) => {
    //    userCtrl.store(req, res);
    //})
    .get( (req, res) => {
        jobsCtrl.findAll(req, res);
    });


//router.route('/:id')
//    .get( (req, res) => {
//        userCtrl.findById(req, res);
//    })
//    .put(isAuthenticated, (req, res) => {
//        userCtrl.update(req, res);
//    })
//    .delete(isAuthenticated, (req, res) => {
//        userCtrl.destroy(req, res);
//    });


export default router;