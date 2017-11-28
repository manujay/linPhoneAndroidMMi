<?xml version='1.0'?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

    <xsl:template match="BCUNIT_TEST_LIST_REPORT">
        <html>
            <head>
                <title>BCUnit - Suite and Test Case Organization in Test Registry</title>
            </head>

            <body bgcolor="#e0e0f0">
                <xsl:apply-templates />
            </body>
        </html>
    </xsl:template>

    <xsl:template match="BCUNIT_HEADER">
        <div align="center">
            <h3>
                <b>BCUnit - A Unit testing framework for C</b>
                <br />
                <a href="https://github.com/BelledonneCommunications/bcunit/">
                    https://github.com/BelledonneCommunications/bcunit/
                </a>
            </h3>
        </div>
    </xsl:template>

    <xsl:template match="BCUNIT_LIST_TOTAL_SUMMARY">
        <p />
        <table align="center" width="50%">
            <xsl:apply-templates />
        </table>
    </xsl:template>

    <xsl:template match="BCUNIT_LIST_TOTAL_SUMMARY_RECORD">
        <tr>
            <td bgcolor="#f0f0e0" width="70%">
                <xsl:value-of select="BCUNIT_LIST_TOTAL_SUMMARY_RECORD_TEXT" />
            </td>
            <td align="center" bgcolor="#f0e0e0">
                <xsl:value-of select="BCUNIT_LIST_TOTAL_SUMMARY_RECORD_VALUE" />
            </td>
        </tr>
    </xsl:template>

    <xsl:template match="BCUNIT_ALL_TEST_LISTING">
        <p />
        <div align="center">
            <h2>Listing of Registered Suites &amp; Tests</h2>
        </div>
        <table align="center" width="90%">
            <tr bgcolor="#00ccff">
                <td colspan="8"></td>
            </tr>
            <tr>
                <td bgcolor="#f0f0e0" colspan="2" width="44%"></td>
                <td align="center" bgcolor="#f0f0e0" width="14%">
                    <b>Initialize Function?</b>
                </td>
                <td align="center" bgcolor="#f0f0e0" width="14%">
                    <b>Cleanup Function?</b>
                </td>
                <td align="center" bgcolor="#f0f0e0" width="14%">
                    <b>Test Count</b>
                </td>
                <td align="center" bgcolor="#f0f0e0" width="14%">
                    <b>Active?</b>
                </td>
            </tr>
            <xsl:apply-templates />
        </table>
    </xsl:template>

    <xsl:template match="BCUNIT_ALL_TEST_LISTING_SUITE">
        <xsl:apply-templates />
    </xsl:template>

    <xsl:template match="BCUNIT_ALL_TEST_LISTING_SUITE_DEFINITION">
        <tr bgcolor="#00ccff">
            <td colspan="8"></td>
        </tr>
        <tr>
            <td align="left" bgcolor="#f0e0f0">Suite</td>
            <td align="left" bgcolor="#f0e0f0">
                <b>
                    <xsl:value-of select="SUITE_NAME" />
                </b>
            </td>

            <td align="center" bgcolor="#f0e0f0">
                <xsl:value-of select="INITIALIZE_VALUE" />
            </td>
            <td align="center" bgcolor="#f0e0f0">
                <xsl:value-of select="CLEANUP_VALUE" />
            </td>
            <td align="center" bgcolor="#f0e0f0">
                <xsl:value-of select="TEST_COUNT_VALUE" />
            </td>
            <td align="center" bgcolor="#f0e0f0">
                <xsl:value-of select="ACTIVE_VALUE" />
            </td>
        </tr>
        <tr bgcolor="#00ccff">
            <td colspan="8"></td>
        </tr>
    </xsl:template>

    <xsl:template match="BCUNIT_ALL_TEST_LISTING_SUITE_TESTS">
        <xsl:apply-templates />
    </xsl:template>

    <xsl:template match="TEST_CASE_DEFINITION">
        <tr>
            <td align="center" bgcolor="#e0f0d0">Test</td>
            <td align="left" bgcolor="#e0e0d0" colspan="4">
                <xsl:value-of select="TEST_CASE_NAME" />
            </td>
            <td align="center" bgcolor="#e0e0d0">
                <xsl:value-of select="TEST_ACTIVE_VALUE" />
            </td>
        </tr>
    </xsl:template>

    <xsl:template match="BCUNIT_ALL_TEST_LISTING_GROUP">
        <xsl:apply-templates />
    </xsl:template>

    <xsl:template match="BCUNIT_ALL_TEST_LISTING_GROUP_DEFINITION">
        <tr>
            <td bgcolor="#f0e0f0" width="10%">Suite</td>
            <td bgcolor="#e0f0f0" width="20%">
                <b>
                    <xsl:value-of select="GROUP_NAME" />
                </b>
            </td>

            <td bgcolor="#f0e0f0" width="15%">Initialize Function?</td>
            <td bgcolor="#e0f0f0" width="5%">
                <xsl:value-of select="INITIALIZE_VALUE" />
            </td>

            <td bgcolor="#f0e0f0" width="15%">Cleanup Function?</td>
            <td bgcolor="#e0f0f0" width="5%">
                <xsl:value-of select="CLEANUP_VALUE" />
            </td>

            <td bgcolor="#f0e0f0" width="10%">Test Count</td>
            <td bgcolor="#e0f0f0" width="5%">
                <xsl:value-of select="TEST_COUNT_VALUE" />
            </td>
        </tr>
    </xsl:template>

    <xsl:template match="BCUNIT_ALL_TEST_LISTING_GROUP_TESTS">
        <tr>
            <td align="center" bgcolor="#e0f0d0">Test Cases</td>
            <td align="left" bgcolor="#e0e0d0" colspan="7">
                <xsl:for-each select="TEST_CASE_NAME">
                    <xsl:apply-templates />
                    <br />
                </xsl:for-each>
            </td>
        </tr>
        <tr bgcolor="#00ccff">
            <td colspan="8"></td>
        </tr>
    </xsl:template>

    <xsl:template match="BCUNIT_FOOTER">
        <p />
        <hr align="center" color="maroon" width="90%" />
        <h5 align="center">
            <xsl:apply-templates />
        </h5>
    </xsl:template>

</xsl:stylesheet>
