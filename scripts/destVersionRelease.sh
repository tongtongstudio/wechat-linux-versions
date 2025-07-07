download_path="WeChatLinux"


function install_depends() {
    printf "#%.0s" {1..60}
    echo 
    echo -e "## \033[1;33mInstalling 7zip, shasum, wget, curl, git\033[0m"
    printf "#%.0s" {1..60}
    echo 

    apt install -y p7zip-full p7zip-rar libdigest-sha-perl wget curl git rpm libfuse2 lsb-release libatomic1 libxkbcommon-x11-0 libxcb-icccm4 libxcb-image0 libxcb-render-util0 libxcb-keysyms1 libnss3

    arch=$(uname -m)
    echo "arch=$arch"

    # wget https://github.com/AppImage/AppImageKit/releases/download/continuous/appimagetool-${arch}.AppImage -O appimagetool
    #   if [ "$?" -ne 0 ]; then
    #     >&2 echo -e "\033[1;31mDownload Failed, please check your network!\033[0m"
    # fi
    # chmod +x appimagetool
    # mv appimagetool /usr/local/bin/

    echo
    appimagetool --version
    echo
    dpkg --version
    echo
    rpm --version
    echo

    # wget -P ${download_path} https://dldir1v6.qq.com/weixin/Universal/Linux/WeChatLinux_x86_64.deb
    # wget -P ${download_path} https://dldir1v6.qq.com/weixin/Universal/Linux/WeChatLinux_x86_64.rpm
    # wget -P ${download_path} https://dldir1v6.qq.com/weixin/Universal/Linux/WeChatLinux_x86_64.AppImage

    # wget -P ${download_path} https://dldir1v6.qq.com/weixin/Universal/Linux/WeChatLinux_arm64.deb
    # wget -P ${download_path} https://dldir1v6.qq.com/weixin/Universal/Linux/WeChatLinux_arm64.rpm
    # wget -P ${download_path} https://dldir1v6.qq.com/weixin/Universal/Linux/WeChatLinux_arm64.AppImage

    # wget -P ${download_path} https://dldir1v6.qq.com/weixin/Universal/Linux/WeChatLinux_LoongArch.deb

    dpkg-deb --info ${download_path}/WeChatLinux_x86_64.deb | grep Version
    dpkg-deb --info ${download_path}/WeChatLinux_arm64.deb | grep Version
    dpkg-deb --info ${download_path}/WeChatLinux_LoongArch.deb | grep Version

    rpm -qp --queryformat '%{NAME}-%{VERSION}-%{RELEASE}.%{ARCH}\n' ${download_path}/WeChatLinux_x86_64.rpm
    rpm -qp --queryformat '%{NAME}-%{VERSION}-%{RELEASE}.%{ARCH}\n' ${download_path}/WeChatLinux_arm64.rpm

    appimagetool --info ${download_path}/WeChatLinux_x86_64.AppImage
    appimagetool --info ${download_path}/WeChatLinux_arm64.AppImage
}

function main() {
    install_depends
}
main