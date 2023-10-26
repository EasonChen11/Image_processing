function [Entropy,Brisque,Niqe]=score(name,image)
    Entropy=entropy(image);
    Brisque=brisque(image);
    Niqe=niqe(image);
    fprintf("%s entropy score is %f\n",name, Entropy);
    fprintf("%s brisque score is %f\n",name, Brisque);
    fprintf("%s niqe score is %f\n",name,Niqe);

end