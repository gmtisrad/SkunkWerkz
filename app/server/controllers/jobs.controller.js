export function getCartItems (req, res) {
    const {entityId} = req.body;
    
    res.json({
        success: true,
        cartItems: []
    })
}