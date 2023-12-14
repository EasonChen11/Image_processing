function stable=skeletonizationrecurtion(erosion,B)
    open=imopen(erosion,B);
    diff=erosion & ~open;
    if open==zeros(size(erosion))
        stable=diff;
        return;
    end
    erosion=imerode(erosion,B);
    stable=diff+skeletonizationrecurtion(erosion,B);
end