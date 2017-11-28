<?xml version='1.0'?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

    <xsl:template match="MEMORY_DUMP_REPORT">
        <html>
            <head>
                <title>BCUnit Memory Debugger Dumper - All Allocation/Deallocation Report.</title>
            </head>

            <body bgcolor="e0e0f0">
                <xsl:apply-templates />
            </body>
        </html>
    </xsl:template>

    <xsl:template match="MD_HEADER">
        <div align="center">
            <h3>
                <b>BCUnit - A Unit testing framework for C.</b>
                <br />
                <a href="https://github.com/BelledonneCommunications/bcunit/">
                    https://github.com/BelledonneCommunications/bcunit/
                </a>
            </h3>
        </div>
    </xsl:template>

    <xsl:template match="MD_RUN_LISTING">
        <div align="center">
            <h2>
                BCUnit Memory Debugger Report
                <br />
                Memory Allocation/Deallocation Records
            </h2>
            <hr align="center" color="maroon" width="100%" />
        </div>
        <table cols="6" width="95%">
            <th align="left" width="10%">Pointer</th>
            <th align="left" width="35%">Allocation File</th>
            <th align="left" width="10%">Line #</th>
            <th align="left" width="35%">Deallocation File</th>
            <th align="left" width="10%">Line #</th>
            <th align="left" width="10%">Data Size</th>
            <xsl:apply-templates />
        </table>
    </xsl:template>

    <xsl:template match="MD_RUN_RECORD">
        <xsl:param name="ptr" select="MD_POINTER" />
        <xsl:for-each select="MD_EVENT_RECORD">
            <tr>
                <td>
                    <xsl:value-of select="$ptr" />
                </td>
                <td>
                    <xsl:value-of select="MD_ALLOC_FILE" />
                </td>
                <td>
                    <xsl:value-of select="MD_ALLOC_LINE" />
                </td>
                <td>
                    <xsl:value-of select="MD_DEALLOC_FILE" />
                </td>
                <td>
                    <xsl:value-of select="MD_DEALLOC_LINE" />
                </td>
                <td>
                    <xsl:value-of select="MD_SIZE" />
                </td>
            </tr>
        </xsl:for-each>
    </xsl:template>

    <xsl:template match="MD_SUMMARY">
        <p />
        <table align="center" rows="2" width="90%">
            <tr align="center" bgcolor="skyblue">
                <th colspan="5">Cumulative Summary for Memory Debugger Dumper Run</th>
            </tr>
            <tr>
                <td align="center" bgcolor="ffffc0" width="50%">Valid Records</td>
                <td bgcolor="#e0f0d0">
                    <xsl:value-of select="MD_SUMMARY_VALID_RECORDS" />
                </td>
            </tr>

            <tr>
                <td align="center" bgcolor="ffffc0" width="50%">Invalid Records</td>
                <td bgcolor="#e0f0d0">
                    <xsl:value-of select="MD_SUMMARY_INVALID_RECORDS" />
                </td>
            </tr>

            <tr>
                <td align="center" bgcolor="ffffc0" width="50%">Total Number of
                    Allocation/Deallocation Records
                </td>
                <td bgcolor="#e0f0d0">
                    <xsl:value-of select="MD_SUMMARY_TOTAL_RECORDS" />
                </td>
            </tr>

        </table>
    </xsl:template>

    <xsl:template match="MD_FOOTER">
        <p />
        <hr align="center" color="maroon" width="100%" />
        <h5 align="center">
            <xsl:apply-templates />
        </h5>
    </xsl:template>

</xsl:stylesheet>
