const factorial = x => {
    let result = 1;
    for (let i = 0; i < x; i++) result *= (i + 1);
    return result;
};

const permutation = (n, r) => factorial(n) / factorial(n - r);
    
const combination = (n, r) => permutation(n, r) / factorial(r);
    
const multiPermutation = (n, r) => n ** r;
    
const multiCombination = (n, r) => combination(n + r - 1, r);
    
module.exports = {
    permutation,
    combination,
    multiPermutation,
    multiCombination,
};