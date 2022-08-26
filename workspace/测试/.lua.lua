io.stdout: setvbuf 'no' io.stderr: setvbuf 'no' local testName = '中文编码输出测试'
print(testName)

while true do
    io.write('-->')
    local str_1 = io.read()
    print(str_1)
end