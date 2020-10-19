Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2D111292867
	for <lists+linux-leds@lfdr.de>; Mon, 19 Oct 2020 15:41:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728471AbgJSNlm (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 19 Oct 2020 09:41:42 -0400
Received: from outbound-ip24b.ess.barracuda.com ([209.222.82.221]:53664 "EHLO
        outbound-ip24b.ess.barracuda.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727796AbgJSNll (ORCPT
        <rfc822;linux-leds@vger.kernel.org>);
        Mon, 19 Oct 2020 09:41:41 -0400
X-Greylist: delayed 1988 seconds by postgrey-1.27 at vger.kernel.org; Mon, 19 Oct 2020 09:41:41 EDT
Received: from NAM02-CY1-obe.outbound.protection.outlook.com (mail-cys01nam02lp2051.outbound.protection.outlook.com [104.47.37.51]) by mx6.us-east-2b.ess.aws.cudaops.com (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO); Mon, 19 Oct 2020 13:41:39 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nAWuOfHKss4Uw6g/tn5Iupvx15v04q24dYKncycI/F47MW9mj1ZhlZvpUkjTDLn1JlsF+UDorGWUrX8MugXaKZxL3HF5oMCfo78pUwrdCBayUPGsWh2MqS1H+dWwpXt1wb5RlHnMf+h5BeT8LghhTcrMu1jlC7Ote3qJGS3a9eVAxOjbf/X6upPBCUdUUi9lLopFjuCIdbJtCiWOsdC+yIAsomMldp1aBCrvVWU6yuqdN7Mhqh6DkjAMgpE980PjN4LqTdxqDQTFecBMo3MlS8j3oGe+F1npVPJGEVuTZwpLXaTCKH//15UFeOfugcaA7ai+L8hlo7fOW1lz4CVx2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ssFGTxbw5AidqtNwKUZP0eApoWyIvZSnmx+hEYFyHk0=;
 b=AfCcLvMwpFnG/m/SDD6+V+SVK+1QzPurF2wXEd5Ch8fsbJLTmVzfb9rZlo578qnRooHcHYnAOk4TSIFf0i4hpq0eG+a/FEye8fg/Ie0pXdBJEdItpHF8rE52zcGd1rUGMdLMSMT0uSOr9HMHYRXwjIz7WMnOF4Carg/LrDbRWhFsZEZAGZfLCzguA7kBh3KemC7Fs59ljPJ4cDonY46zYr/7iWl9HYHSjp9hWQto+apwMK3QAkdnC4qhsZmcss5q4/5k7SFacvPtXy5917QYfdGqAFQOLNOO6Anv5GCf7NZBrF9puzB3qcsZbzKThRJPfOolBWJHXFXx7a6c+g+Vdg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 198.51.192.230) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=digi.com;
 dmarc=fail (p=reject sp=reject pct=100) action=oreject header.from=digi.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=digi.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ssFGTxbw5AidqtNwKUZP0eApoWyIvZSnmx+hEYFyHk0=;
 b=MJk1CNtfFlm7z2xkq7xPaBQmXRmd9PepQn0sdFPDDcKwOj061RXLsh2npiCYLNqdkH9Tcy12EjQ2W8OYvTbHa2u1PMUVLhy565HIS8K56zKLu+DYiqtw7TecCg5/LCSBq8hDTeKEn5lQZRzw30mAan26aAUHrEhDDwtvKGyLekY=
Received: from DM5PR06CA0028.namprd06.prod.outlook.com (2603:10b6:3:5d::14) by
 DM6PR10MB3276.namprd10.prod.outlook.com (2603:10b6:5:1a0::28) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3477.24; Mon, 19 Oct 2020 13:08:28 +0000
Received: from DM6NAM10FT067.eop-nam10.prod.protection.outlook.com
 (2603:10b6:3:5d:cafe::f7) by DM5PR06CA0028.outlook.office365.com
 (2603:10b6:3:5d::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.22 via Frontend
 Transport; Mon, 19 Oct 2020 13:08:28 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is
 198.51.192.230) smtp.mailfrom=digi.com; vger.kernel.org; dkim=none (message
 not signed) header.d=none;vger.kernel.org; dmarc=fail action=oreject
 header.from=digi.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 digi.com discourages use of 198.51.192.230 as permitted sender)
Received: from MTK-SMS-XCH04.digi.com (198.51.192.230) by
 DM6NAM10FT067.mail.protection.outlook.com (10.13.152.252) with Microsoft SMTP
 Server (version=TLS1_0, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA) id
 15.20.3477.21 via Frontend Transport; Mon, 19 Oct 2020 13:08:26 +0000
Received: from MTK-SMS-XCH01.digi.com ([fe80::cca7:5299:c88e:1c40]) by
 MTK-SMS-XCH04.digi.com ([fe80::ed97:4834:fa1b:3be7%19]) with mapi id
 14.03.0487.000; Mon, 19 Oct 2020 08:08:26 -0500
From:   "Bollinger, Seth" <Seth.Bollinger@digi.com>
To:     "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>
CC:     Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        Seth Bollinger <seth.boll@gmail.com>
Subject: Strange timer LED behavior 
Thread-Topic: Strange timer LED behavior 
Thread-Index: AQHWphjtC8cm4jdWIkSzxKEwDafg6Q==
Date:   Mon, 19 Oct 2020 13:08:25 +0000
Message-ID: <A2C38AF0-0CE8-4312-8329-54B7E9653223@digi.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.27.1.86]
Content-Type: text/plain; charset="us-ascii"
Content-ID: <A388B67585A5B5458A22703118ED60AB@digi.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7f51e12f-dfd9-44bd-ca9a-08d874301120
X-MS-TrafficTypeDiagnostic: DM6PR10MB3276:
X-Microsoft-Antispam-PRVS: <DM6PR10MB3276B3C849AA3BFC3EE17E04E81E0@DM6PR10MB3276.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2+gk+DR9MrrVg6TX8dQpzs0kRD/N0P9+RrTE1he4I4SgaoS/eXgPWSfAhl7iYpNrLVZAdVWgf6cB+boqpCXxwF+scpZa2m37LCzD21kAeIcGglVq+5ozZOzWjCvYZxY+y8nQrOsBr+HMoIuu3xV1w0JivNA4XKfK+Mh0TrVgQy00d3wnC4NzC6DJ44IbqkHG05lqcGFw2bRsJblFYxwkqwA10szX6ftC7pRDLuzJM5Kk/PuZ+VKT5UAw0VRlUdcvp2gfItLTd1fxHNj2QjxUUhCWpIRUByZUh5qggnN42AA+tfwF6/5syTGXVQFXkolQcIT6UtA/0/msbtmjcn6sIlryYB7wmEG3a9KkdPqxiBW+yLrrY0S+5zLooMFuWamhC+sclX8zADNM8td7QeZ3eO63jBGH9JXDMykEVisxuFfebxVW68JH7+dRZsuJCEYw
X-Forefront-Antispam-Report: CIP:198.51.192.230;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:MTK-SMS-XCH04.digi.com;PTR:ErrorRetry;CAT:NONE;SFS:(4636009)(39850400004)(136003)(346002)(396003)(376002)(46966005)(186003)(70586007)(70206006)(8936002)(7696005)(83380400001)(4744005)(4326008)(82310400003)(5660300002)(8676002)(2616005)(33656002)(36906005)(2906002)(86362001)(82740400003)(81166007)(316002)(36756003)(3480700007)(356005)(47076004)(33310700002)(478600001)(6916009)(4743002)(26005)(54906003)(426003)(336012);DIR:OUT;SFP:1102;
X-OriginatorOrg: digi.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2020 13:08:26.7099
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f51e12f-dfd9-44bd-ca9a-08d874301120
X-MS-Exchange-CrossTenant-Id: abb4cdb7-1b7e-483e-a143-7ebfd1184b9e
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=abb4cdb7-1b7e-483e-a143-7ebfd1184b9e;Ip=[198.51.192.230];Helo=[MTK-SMS-XCH04.digi.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM10FT067.eop-nam10.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR10MB3276
X-BESS-ID: 1603114898-893011-6887-10791-1
X-BESS-VER: 2019.1_20201016.1851
X-BESS-Apparent-Source-IP: 104.47.37.51
X-BESS-Outbound-Spam-Score: 0.00
X-BESS-Outbound-Spam-Report: Code version 3.2, rules version 3.2.2.227652 [from 
        cloudscan11-246.us-east-2a.ess.aws.cudaops.com]
        Rule breakdown below
         pts rule name              description
        ---- ---------------------- --------------------------------
        0.00 BSF_BESS_OUTBOUND      META: BESS Outbound 
X-BESS-Outbound-Spam-Status: SCORE=0.00 using account:ESS112744 scores of KILL_LEVEL=7.0 tests=BSF_BESS_OUTBOUND
X-BESS-BRTS-Status: 1
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hello All,

We use the sysfs timer trigger of the led subsystem to control our leds (tu=
rn on, turn off, and blink).  While doing this we found a strange behavior.=
  If the values of delay_on and delay_off are ever both zero, the led subsy=
stem will make the decision to blink at a 500ms on and 500ms off rate.

# cd /sys/class/leds/g01
# cat delay_on
0
# cat delay_off
86400
# echo 0 > delay_off
# cat delay_on
500
# cat delay_off
500

drivers/led/led-core.c:184
    /* blink with 1 Hz as default if nothing specified */
    if (!*delay_on && !*delay_off)
        *delay_on =3D *delay_off =3D 500;

Is there a reason that the kernel would decide to blink at this default rat=
e instead of leaving the timer disabled?

Thanks,

Seth=
