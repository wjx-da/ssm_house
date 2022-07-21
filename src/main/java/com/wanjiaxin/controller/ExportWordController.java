package com.wanjiaxin.controller;

import com.booway.wordgenerator.html2word.HtmlToWorldUtil;
import com.booway.wordgenerator.html2word.HtmlUtil;
import org.apache.commons.io.IOUtils;
import org.apache.poi.poifs.filesystem.DirectoryEntry;
import org.apache.poi.poifs.filesystem.POIFSFileSystem;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.net.URLEncoder;

/**
 * @Description: 导出word1$
 * @Param: $
 * @return: $
 * @Author 万家欣
 * @Date: 2022/5/27
 * springbootHouseRent
 * @Version 1.0
 */
public class ExportWordController {

    public static void exportWord(HttpServletRequest request, HttpServletResponse response, String content, String title) throws Exception {
        try {
            //word内容
            String tempContent = "<html xmlns:v='urn:schemas-microsoft-com:vml'xmlns:o='urn:schemas-microsoft-com:office:office'xmlns:w='urn:schemas-microsoft-com:office:word'xmlns:m='http://schemas.microsoft.com/office/2004/12/omml'xmlns='http://www.w3.org/TR/REC-html40'  xmlns='http://www.w3.org/1999/xhtml' > <head><!--[if gte mso 9]><xml><w:WordDocument><w:View>Print</w:View><w:TrackMoves>false</w:TrackMoves><w:TrackFormatting/><w:ValidateAgainstSchemas/><w:SaveIfXMLInvalid>false</w:SaveIfXMLInvalid><w:IgnoreMixedContent>false</w:IgnoreMixedContent><w:AlwaysShowPlaceholderText>false</w:AlwaysShowPlaceholderText><w:DoNotPromoteQF/><w:LidThemeOther>EN-US</w:LidThemeOther><w:LidThemeAsian>ZH-CN</w:LidThemeAsian><w:LidThemeComplexScript>X-NONE</w:LidThemeComplexScript><w:Compatibility><w:BreakWrappedTables/><w:SnapToGridInCell/><w:WrapTextWithPunct/><w:UseAsianBreakRules/><w:DontGrowAutofit/><w:SplitPgBreakAndParaMark/><w:DontVertAlignCellWithSp/><w:DontBreakConstrainedForcedTables/><w:DontVertAlignInTxbx/><w:Word11KerningPairs/><w:CachedColBalance/><w:UseFELayout/></w:Compatibility><w:BrowserLevel>MicrosoftInternetExplorer4</w:BrowserLevel><m:mathPr><m:mathFont m:val='Cambria Math'/><m:brkBin m:val='before'/><m:brkBinSub m:val='--'/><m:smallFrac m:val='off'/><m:dispDef/><m:lMargin m:val='0'/> <m:rMargin m:val='0'/><m:defJc m:val='centerGroup'/><m:wrapIndent m:val='1440'/><m:intLim m:val='subSup'/><m:naryLim m:val='undOvr'/></m:mathPr></w:WordDocument></xml><![endif]--></head><body>"
                    + "<p style='text-align: center;font-weight: bold;font-size: 32px;'>"
                    + title
                    + "</P>"
                    + content
                    + "</body></html>";
            InputStream inputStream = new ByteArrayInputStream(tempContent.getBytes("GBK"));
            /*
             * 关键地方
             * 生成word格式 */
            POIFSFileSystem poifsFileSystem = new POIFSFileSystem();
            DirectoryEntry directory = poifsFileSystem.getRoot();
            request.setCharacterEncoding("UTF-8");
            //导出word格式
            response.setContentType("application/msword");
            response.addHeader("Content-Disposition", "attachment;filename=" + URLEncoder.encode(title + ".doc", "UTF-8"));
            OutputStream outputStream = new BufferedOutputStream(response.getOutputStream());
            IOUtils.copy(inputStream, outputStream);
            outputStream.flush();
            IOUtils.closeQuietly(inputStream);
            IOUtils.closeQuietly(outputStream);
        } catch (Exception e) {
            e.printStackTrace();
            //异常处理
        }
    }
}
