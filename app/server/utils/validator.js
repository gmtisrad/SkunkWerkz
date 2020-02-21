import Joi from '@hapi/joi';
import { join } from 'path';

export default {
    storeUser:
        Joi.object({
            first_name: Joi.string().required(),
            last_name: Joi.string().required(),
            email: Joi.string().email().required(),
            password: Joi.string().min(6).required()
        }),

    updateUser: 
        Joi.object({
            first_name: Joi.string().required(),
            last_name: Joi.string().required(),
            email: Joi.string().email().required(),
            password: Joi.string().min(6).required()
        }),

    storeJob:
        Joi.object({
            originator_id: Joi.number().required(),
            title: Joi.string().required(),
        }),
    
    updateJob:
        Joi.object({
            originator_id: Joi.number().required(),
            title: Joi.string().required(),
        }),

    login:
        Joi.object({
            username: Joi.string().required(),
            password: Joi.string().required()
        })

};