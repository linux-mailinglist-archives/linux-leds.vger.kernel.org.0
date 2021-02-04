Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7914930F534
	for <lists+linux-leds@lfdr.de>; Thu,  4 Feb 2021 15:42:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236866AbhBDOk7 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 4 Feb 2021 09:40:59 -0500
Received: from mail-eopbgr130123.outbound.protection.outlook.com ([40.107.13.123]:56965
        "EHLO EUR01-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S236782AbhBDOit (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Thu, 4 Feb 2021 09:38:49 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KIMTX1dry8vQrnTSSazGWEaxj3gtnD/Rxs8fkdaMnW3F1v3H1sLC7Kz9nlx1HwFVfJs+Z4moMbAA8YKtzTTdv/l1e9MM7oBNV1UkruY/t0rlsEPGRQOxN/yzSjF2XK1PsC1LP4Rm3eUw65Dzd4hIhaitXJ1jfYr/pU0AFyDHIhV9gWg6crATWVv+4PMYqBkIBBMjwtzbw4j//nPB1e76iEItW/I4AOZUkLf5mLqYoA+2WbOMbifogClfmP6cGR8agMpyg+K5mCiLQiDO1NU7NHBRAD4V1Ep3WVRTeQP7mPP/X+C6d9wsKTNPH/Gp06oLidtCYUnzEWCE25gL3eXFng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dFrn7Vt1je7kdjp8cC5anRNu7TqR8GzlT3IrLRF893c=;
 b=Q0kdwi92jnEYO1eaqwXK3EeT7qB2pQmvaxJYJTHGeNUH2qLxEh9be6FkIPTWZRxQQfkcxNPiy+gwqEjUt6TJMSj9zvxWNh88+Dmr37aiEq2TaA5NhqIw0HYy7cf6IiTtNU/fH9dJUP3Pu7FB1FetQzjCLwRw1KXL2lWO6CakGFhi2/DhyuDgMH6/sP7dVpY1+0sEFBN1Qv9ufK4XI1SRWQAmgd8nf2t1SuSgoGW8MM4rbBXY1VU8qMfg9TnQr7yam063rNgdZ6lcKglX6xRfGuS9bAzrKSA3St1gWbbxyTC5m6UEbtuDTlRwb6BimIXvFgBcUhlSua4BnXlXd8piwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 62.153.209.162) smtp.rcpttodomain=vger.kernel.org
 smtp.mailfrom=schleissheimer.de; dmarc=none action=none
 header.from=schleissheimer.de; dkim=fail (no key for signature)
 header.d=schleissheimer.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=schleissheimer.onmicrosoft.com; s=selector1-schleissheimer-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dFrn7Vt1je7kdjp8cC5anRNu7TqR8GzlT3IrLRF893c=;
 b=P5fkwEvpPauRFsKqswLqQn+vep8BseCU//n43ra1GOhJ1Ed/WK9b+1mnzNZgszt37sP/mxySpzOh5Re8bgTdcr0ll48u6X5zmxjXye3EtBmHeBQF4yOhF4yUK5fmS/kZatrMMCgHB/w2nG8fry+kS28qyVPYLLIA3iGkMKBIBu4=
Received: from DB8PR04CA0013.eurprd04.prod.outlook.com (2603:10a6:10:110::23)
 by VI1P190MB0221.EURP190.PROD.OUTLOOK.COM (2603:10a6:800:9b::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3805.20; Thu, 4 Feb
 2021 14:38:01 +0000
Received: from DB3EUR04FT057.eop-eur04.prod.protection.outlook.com
 (2603:10a6:10:110:cafe::3c) by DB8PR04CA0013.outlook.office365.com
 (2603:10a6:10:110::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3825.17 via Frontend
 Transport; Thu, 4 Feb 2021 14:38:01 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 62.153.209.162)
 smtp.mailfrom=schleissheimer.de; vger.kernel.org; dkim=fail (no key for
 signature) header.d=schleissheimer.de;vger.kernel.org; dmarc=none action=none
 header.from=schleissheimer.de;
Received-SPF: Fail (protection.outlook.com: domain of schleissheimer.de does
 not designate 62.153.209.162 as permitted sender)
 receiver=protection.outlook.com; client-ip=62.153.209.162;
 helo=mail.schleissheimer.de;
Received: from mail.schleissheimer.de (62.153.209.162) by
 DB3EUR04FT057.mail.protection.outlook.com (10.152.24.125) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3784.11 via Frontend Transport; Thu, 4 Feb 2021 14:38:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=schleissheimer.de; s=dkim1;
        h=Message-Id:Date:Subject:Cc:To:From; bh=dFrn7Vt1je7kdjp8cC5anRNu7TqR8GzlT3IrLRF893c=;
        b=PwBeeBShfeX9QSZk4jqnhs/IGysUq8cuLP05N4Nb1Fnn4WGWQFap5HzzeRQ+FAe2DDbm20BCap8guNOZ47F3XP0j69swlg9v/Ha63BKEUkKTarGT2ekqjS2+svtH70P5PY4FSwry/EuLyU5wsR2e2C+QXVruvGzJGvktPkQni5E=;
Received: from [192.168.10.165] (port=41974 helo=contiredmine.schleissheimer.de)
        by mail.schleissheimer.de with esmtp (Exim 4.82_1-5b7a7c0-XX)
        (envelope-from <schuchmann@schleissheimer.de>)
        id 1l7fld-000419-0I; Thu, 04 Feb 2021 15:37:57 +0100
X-CTCH-RefID: str=0001.0A782F1F.601C06C5.0018,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
From:   Sven Schuchmann <schuchmann@schleissheimer.de>
Cc:     Sven Schuchmann <schuchmann@schleissheimer.de>,
        Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 3/4] leds: lp50xx: add setting of default intensity from DT
Date:   Thu,  4 Feb 2021 14:37:56 +0000
Message-Id: <20210204143756.28088-1-schuchmann@schleissheimer.de>
X-Mailer: git-send-email 2.17.1
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
MIME-Version: 1.0
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: eeea7ab8-6e88-42e8-ff48-08d8c91a78f5
X-MS-TrafficTypeDiagnostic: VI1P190MB0221:
X-Microsoft-Antispam-PRVS: <VI1P190MB0221C86575B9474D1DDC75E786B39@VI1P190MB0221.EURP190.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: t7FyVm09h9AZYuLZFzSNV3x9QNx/L8eCl6jYgGzwqz23y8iFh2Tq4ZjXJhZ3oj2t0HnFWq7NmePrsIQB0S8sUrv3vs5X2STydPownXErpwdx27lrFZNP7TAQuiuZTD9LTU++wU+QqdoXdGrjw2724/JlP1MTT4hxvkxwVhrFcDvasGjTPaFTm5+PW9NEAQR9raUliLh67Q0+hdDarC3dYpQVuUEyMAJBihnOte4IBJQDGM3uLyfOQnzzIU2LCxCo7rnDwwRyZlWp5dHtueOdDmTo74pBUOlAIf+Ckv7CKVeMH0+hx7wpQ9eiHcNzk5u58Tzr/uvCfyazuZX5hipWFYkmSn3I2pvcnGXBILRFxae+Bi9Vz1HG/ghFHJYgpy/Vs1nRDaigQjYOjCgyzxWu3wt6cG+5tbB21z2Z3dP9ELuu9Xru3lJdyt3/fDRxdI46I8Fu0oi4tXZkOHGxzGWnqiIANsd85A7kdBP+eLW5UDwD/l7+hSt2Ry7tyvWNlcBwH6fZBrkyxftF3sZeGPr/dUMmI6dVv1eCgP5GYzCDjaNwPWx/P+9vPUIiDqaUrralM5JfgiB25gmVjHMzaxTSN+QDj5+44aSztW1ohxgE+b0RkACcnBJt2M/zrghXtEZlnK50d2clHgNfpC0Y5cpJrr5/HwNL8I6AzWTewG85za0=
X-Forefront-Antispam-Report: CIP:62.153.209.162;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:mail.schleissheimer.de;PTR:www.schleissheimer.de;CAT:NONE;SFS:(39840400004)(136003)(396003)(346002)(376002)(36840700001)(46966006)(478600001)(8936002)(426003)(9786002)(36756003)(5660300002)(4326008)(8676002)(2616005)(7636003)(1076003)(26005)(70586007)(336012)(356005)(54906003)(7696005)(47076005)(70206006)(82310400003)(36860700001)(109986005)(83380400001)(186003)(2906002)(316002)(266003);DIR:OUT;SFP:1102;
X-OriginatorOrg: schleissheimer.de
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Feb 2021 14:38:00.7715
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: eeea7ab8-6e88-42e8-ff48-08d8c91a78f5
X-MS-Exchange-CrossTenant-Id: ba05321a-a007-44df-8805-c7e62d5887b5
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=ba05321a-a007-44df-8805-c7e62d5887b5;Ip=[62.153.209.162];Helo=[mail.schleissheimer.de]
X-MS-Exchange-CrossTenant-AuthSource: DB3EUR04FT057.eop-eur04.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1P190MB0221
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

In order to use a multicolor-led together with a trigger
the led needs to have an intensity set to see something.
The trigger changes the brightness of the led but if there
is no intensity we actually see nothing.

This patch adds the ability to set the default intensity
of each multi-led node so that it is turned on from DT.
If no intensity is given the led will be initialized
with full intensity.

Part 1 updates the documentation.
Part 2 removes an unused variable.
Part 3 sets the initial intensity to full.
Part 4 reads the default intensity from DT

changes in v1
 - fix dt_binding_check errors

changes in v2
 - sets default intensity to full
 - adds the property to the multi-led node

Signed-off-by: Sven Schuchmann <schuchmann@schleissheimer.de>
---
 drivers/leds/leds-lp50xx.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/leds/leds-lp50xx.c b/drivers/leds/leds-lp50xx.c
index 4b40bf66483c..79bc071c31fb 100644
--- a/drivers/leds/leds-lp50xx.c
+++ b/drivers/leds/leds-lp50xx.c
@@ -500,6 +500,7 @@ static int lp50xx_probe_dt(struct lp50xx *priv)
 			}
 
 			mc_led_info[num_colors].color_index = color_id;
+			mc_led_info[num_colors].intensity = LED_FULL;
 			num_colors++;
 		}
 
-- 
2.17.1

