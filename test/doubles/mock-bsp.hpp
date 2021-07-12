class if_bsp {
public:
    virtual int bsp_board_led_invert(int) { return 0;};
    virtual ~if_bsp() {}
};

class mock_bsp: public if_bsp {
public:
    mock_bsp() {}
    virtual ~mock_bsp() {}

    MOCK_METHOD(int, bsp_board_led_invert, (int));
};
