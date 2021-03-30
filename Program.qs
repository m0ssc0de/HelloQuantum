namespace helloquantum {

    open Microsoft.Quantum.Canon;
    open Microsoft.Quantum.Intrinsic; // Message
    open Microsoft.Quantum.Measurement; // ?
    
    operation SayHello() : Unit {
        Message("Hello quantum world!");
    }
    @EntryPoint()
    operation GenerateRandomBit() : Result {
        use q = Qubit();
        H(q);
        return M(q);
    }
}
