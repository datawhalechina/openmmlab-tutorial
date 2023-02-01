#初始设置，配置你想要下载的 OpenMMLab 项目,不需要的注释即可
download_list=(
    # mmcv
    mmengine
    # mim
    # mmclassification
    # mmsegmentation
    mmdetection
    # mmdetection3d
    mmyolo
    # mmrotate
    # mmocr
    # mmpose
    # mmhuman3d
    # mmselfsup
    mmrazor
    # mmfewshot
    # mmaction2
    # mmtracking
    # mmflow
    # mmediting
    # mmgeneration
    mmdeploy
)

#变量区
download_source="github"
download_way="http"
#执行区
echo "====== Welcome to use OpenMMLab-full-download-tools,please choose these options ======"
echo "====== 欢迎使用 OpenMMLab 全家桶下载工具，请根据以下选项选择自己的下载需求 ======"
echo ""
echo "Please choose the source where download OpenMMLab-files:"
echo "请选择 OpenMMLab 下载来源："
echo "Do you choose to get OpenMMLab from github? [Y/N], if you choose N, we will download from gitee"
echo "是否选择从 github 获取？[Y/N]，若选择N则从 gitee 获取下载来源"
echo ""

read -r -p "Are You Sure? [Y/N] " input

case $input in
    [yY][eE][sS]|[yY])
        echo "Yes,download from $download_source"
        ;;

    [nN][oO]|[nN])
        download_source="gitee"
        echo "No,download from $download_source"
        ;;

    *)
        echo "Invalid input...please tap Y or N"
        ;;
esac

echo ""
echo "Do you choose to download OpenMMLab by http? [Y/N], if you choose N we will download by ssh" 
echo "(Make sure you have set the github ssh)"
echo "是否选择用 http 方式下载？[Y/N]，若选择N则使用ssh获取（确保你已经绑定了 github ssh）"

read -r -p "Are You Sure? [Y/N] " input

case $input in
    [yY][eE][sS]|[yY])
        echo "Yes,download from $download_way"
        ;;

    [nN][oO]|[nN])
        download_way="ssh"
        echo "No,download from $download_way"
        ;;

    *)
        echo "Invalid input...please tap Y or N"
        ;;
esac

if [ $download_way == 'http' ]
then
    echo "Start download all files of openmmlab:[by $download_way]"
    for line in  ${download_list[@]}
    do
        git clone https://$download_source.com/open-mmlab/$line.git
        if [ $line == "mmdeploy" ]
        then
        # https://mmdeploy.readthedocs.io/en/latest/01-how-to-build/build_from_source.html
            cd $line && git submodule update --init --recursive && cd ..
        fi
    done
else
    echo "Start download all files of openmmlab:[by $download_way]"
    for line in  ${download_list[@]}
    do
        git clone git@$download_source.com:open-mmlab/$line.git
        if [ $line == "mmdeploy" ]
        then
        # https://mmdeploy.readthedocs.io/en/latest/01-how-to-build/build_from_source.html
            cd $line && git submodule update --init --recursive && cd ..
        fi
    done
fi
echo ""
echo "❀ Congratulations! All files download completely. Start your installation and use ❀"
echo "❀ 恭喜！全部文件已经下载完成，接下来请根据需求安装并使用。❀"












