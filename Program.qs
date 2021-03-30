namespace helloquantum {

    open Microsoft.Quantum.Canon;
    open Microsoft.Quantum.Intrinsic; // Message
    open Microsoft.Quantum.Measurement; // ?
    open Microsoft.Quantum.Math;
    open Microsoft.Quantum.Convert;
    
    operation SayHello() : Unit {
        Message("Hello quantum world!");
    }

    operation GenerateRandomBit() : Result {
        use q = Qubit();
        H(q);
        return M(q);
    }

    operation SampleRandomNumberInRange(max : Int) : Int {
        mutable output = 0; 
        repeat {
            mutable bits = new Result[0]; 
            for idxBit in 1..BitSizeI(max) {
                set bits += [GenerateRandomBit()]; 
            }
            set output = ResultArrayAsInt(bits);
        } until (output <= max);
        return output;
    }

    @EntryPoint()
    operation SampleRandomNumber() : Int {
        let max = 50;
        Message($"Sampling a random number between 0 and {max}: ");
        return SampleRandomNumberInRange(max);
    }
}
