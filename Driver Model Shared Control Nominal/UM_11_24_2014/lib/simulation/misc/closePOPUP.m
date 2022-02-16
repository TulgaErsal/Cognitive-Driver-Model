function closePOPUP(fname)

if POPUP == 1
    Q = matlab.desktop.editor.findOpenDocument(fname);
    Q.close();
end