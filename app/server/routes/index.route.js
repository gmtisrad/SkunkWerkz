import express from 'express';
import authRoutes from './auth.route';
import userRoutes from './user.route';
import jobRoutes from './jobs.route';

const router = express.Router();

// mount auth routes at /auth
router.use('/auth', authRoutes);

// mount user routes at /users
router.use('/users', userRoutes);

// mount job routes at /jobs
router.use('/jobs', jobRoutes)

export default router;