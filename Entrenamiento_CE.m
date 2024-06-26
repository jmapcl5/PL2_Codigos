  %Cross entropy + backpropagation
  
function [W1, W2, W3] = Entrenamiento_CE(W1, W2, W3, X, D)
  alpha = 0.001;
  beta  = 0.8;
  mmt1 = zeros(size(W1));
  mmt2 = zeros(size(W2));
  mmt3 = zeros(size(W3));
  %mmt4 = zeros(size(W4)); 
  
  N = 50;  
  for k = 1:N
    x  = reshape(X(:, :, k), 400, 1); 
    
    v1 = W1*x;    
    y1 = ReLU(v1);
    
    v2 = W2*y1;
    y2 = ReLU(v2);
    
    %v3 = W3*y2;
    %y3 = ReLU(v3);

    v3 = W3*y2;
    y = Softmax(v3);
    d = D(k, :)';
    
    %backpropagation
    e = d - y;
    delta = e;
    
    %e3 = W4'*delta;
    %delta3=  (v3>0).*e3;

     e2     = W3'*delta;
    delta2 = (v2 > 0).*e2;
    
    e1     = W2'*delta2;
    delta1 = (v1 > 0).*e1;
    
    %dW4 = alpha*delta*y3';
    %mmt4= dW4 + beta*mmt4;
    %W4 = W4 + mmt4;

    dW3 = alpha*delta*y2';
    mmt3 = dW3 + beta*mmt3;
    W3  = W3 + mmt3;

    dW2 = alpha*delta2*y1';
    mmt2 = dW2 + beta*mmt2; 
    W2  = W2 + mmt2;

    dW1 = alpha*delta1*x';
    mmt1 = dW1 + beta*mmt1;
    W1  = W1 + mmt1;

  end
end