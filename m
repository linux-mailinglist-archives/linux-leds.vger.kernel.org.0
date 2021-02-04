Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 67C8130F536
	for <lists+linux-leds@lfdr.de>; Thu,  4 Feb 2021 15:42:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236771AbhBDOlN (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 4 Feb 2021 09:41:13 -0500
Received: from mail-am6eur05on2106.outbound.protection.outlook.com ([40.107.22.106]:49732
        "EHLO EUR05-AM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S236797AbhBDOi5 (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Thu, 4 Feb 2021 09:38:57 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=E8/9urRPFlf3/OP3j+6DMVeg2qgrwgukNwtKhZk0ggRMZJmt67Es9p026VqSqBmj5Cj97uRyDpaHko3PlwacVzrKO9/LoobnQvv8r7E6d6Nnm5GGgTrIGcI13Hp4/F4IPKzPqdSIYhYuB6/rHvjOi7vRFj/kWUP7clhG1svTectDmQbAsAEJNro7d79bxDCfs7JmDmX4WDP5DkBgYWh1cgRkbPOiQUwQhQZesFvMu/t/WF2cre5VoKtPbYjD3+tvQZrXzdF/YXgojJ0eMJ/UPQ5JC0bnJ7GpMqpsCV7ia8bp0WhK016vVdtVduSQgNH21avBiEqsS33AX/OpqLSxiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jDyisx5GKNuYiaZx3bcN5ZL8eCRJewgkWWNpmsbdMM4=;
 b=TVSH5c3PNnEq5zgNAtS1S+tvsL/FSmdV5+7C8Jl0uGfLeTHIN0f1dP937F0JW4xkA9oJ0u/msnG951bCsibSLe/Uz4u9ivWPZJu2Oi6MxLdp/HpvzKoD7hb3BHyD9lH8OTzE8Hz2S3c9Cn2Zdk+9kXFnEt5i9Q/GiSKeMutkudpcgdiFJBIDT+EAYNvxzBF/kigvoYkWtpHEvQ/vXDdyEPBtcseftrAW0mXSigyf0K7yza45DoJ6clw4KJ2PuFQqWarmGflWl4BOEZvNN1aAkPUki7cVjnRey2rJ+QfaY9t49veKE+9VOBzJs6awe1tINADYQhuUGM6l8XUXKHtncw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 62.153.209.162) smtp.rcpttodomain=vger.kernel.org
 smtp.mailfrom=schleissheimer.de; dmarc=none action=none
 header.from=schleissheimer.de; dkim=fail (no key for signature)
 header.d=schleissheimer.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=schleissheimer.onmicrosoft.com; s=selector1-schleissheimer-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jDyisx5GKNuYiaZx3bcN5ZL8eCRJewgkWWNpmsbdMM4=;
 b=Yl+/k7FNvXKwdwtydeiU4qF82t9R90DS5PdXevfBiU3mxb4Kp3RZNjYgrfdnYvLhAA0SPRkv5I625TuSn8OGswWN1/Eo/OcQhcOdg2UdLQlnCXcJmE2SzVi/mmy4lpwypsgu63S5H0GxeSsP1fNpFKV5Tto7TXTzWuG99sjQ56M=
Received: from DU2PR04CA0073.eurprd04.prod.outlook.com (2603:10a6:10:232::18)
 by AS8P190MB1368.EURP190.PROD.OUTLOOK.COM (2603:10a6:20b:2e8::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3825.20; Thu, 4 Feb
 2021 14:38:08 +0000
Received: from DB3EUR04FT064.eop-eur04.prod.protection.outlook.com
 (2603:10a6:10:232:cafe::75) by DU2PR04CA0073.outlook.office365.com
 (2603:10a6:10:232::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3825.19 via Frontend
 Transport; Thu, 4 Feb 2021 14:38:08 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 62.153.209.162)
 smtp.mailfrom=schleissheimer.de; vger.kernel.org; dkim=fail (no key for
 signature) header.d=schleissheimer.de;vger.kernel.org; dmarc=none action=none
 header.from=schleissheimer.de;
Received-SPF: Fail (protection.outlook.com: domain of schleissheimer.de does
 not designate 62.153.209.162 as permitted sender)
 receiver=protection.outlook.com; client-ip=62.153.209.162;
 helo=mail.schleissheimer.de;
Received: from mail.schleissheimer.de (62.153.209.162) by
 DB3EUR04FT064.mail.protection.outlook.com (10.152.24.87) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3784.11 via Frontend Transport; Thu, 4 Feb 2021 14:38:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=schleissheimer.de; s=dkim1;
        h=Message-Id:Date:Subject:Cc:To:From; bh=jDyisx5GKNuYiaZx3bcN5ZL8eCRJewgkWWNpmsbdMM4=;
        b=VvuzQrUvsBAd0pg1VEx3us8RxCwTtHGVVKyKtFUjYoBKE0C9+B3W00WeYaVFggz4sL80KoKKkiu1oE73iG82HzhluZ3t2MwjDbdfc4bYGaJbxgdQ9t6u235AfVn1uI2tqzofRrBMDoHTLNTkRjkf8RzVr56D2IaQDOwBHg5IKyw=;
Received: from [192.168.10.165] (port=41976 helo=contiredmine.schleissheimer.de)
        by mail.schleissheimer.de with esmtp (Exim 4.82_1-5b7a7c0-XX)
        (envelope-from <schuchmann@schleissheimer.de>)
        id 1l7flk-00042E-2E; Thu, 04 Feb 2021 15:38:04 +0100
X-CTCH-RefID: str=0001.0A782F20.601C06CC.00BB,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
From:   Sven Schuchmann <schuchmann@schleissheimer.de>
Cc:     Sven Schuchmann <schuchmann@schleissheimer.de>,
        Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 4/4] leds: lp50xx: add setting of default intensity from DT
Date:   Thu,  4 Feb 2021 14:38:03 +0000
Message-Id: <20210204143803.28140-1-schuchmann@schleissheimer.de>
X-Mailer: git-send-email 2.17.1
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
MIME-Version: 1.0
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 0e3166d4-be03-4de4-687c-08d8c91a7d49
X-MS-TrafficTypeDiagnostic: AS8P190MB1368:
X-Microsoft-Antispam-PRVS: <AS8P190MB13681952D4F13626302A5A9C86B39@AS8P190MB1368.EURP190.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 5/Xs4HfhBluQPkukgaikwPPu+HXvJLZwQZ3va5m1/T4GtXcaGpYhG6xlyyjIi8NtLIopg4unKT771fK38VpV6CfTCIM4Kbqiggz0e6UitqQnfmouaFU+maeeP2cdPIAire6P9b2Fq4OkW+PSWny6ouSq+O5+LC1YOiOaX3p4V3fd6E/YCIeSe0Iz+ZeuO8rvVMUG9GlvdcmZYOFdwlt2K1Y5DDSeZ/948UjbI1EK3WyFZUiAO8/0WagOhpFmEyE4+9fgveBwiSYXboV9JT01paeWOGVZ8eNMf8Q9/sMsMY4/BdEtXpWEaV5yag/0A9gjWp4d8pT0XB72x3a9ZBGmTFh//3P2d0vmTR3Q+JoBSlUVLnfLLYkoGn3qQSkJIg3Py0oTomIbFXhPxWZDUi2y5X4Dknwy++hMMo0wsqklGHAHlY2SIFZ96kfrmPOTwaEKyrF6ak7UYNE0W+X3fRPuMCMz77DZ9la2kps58jbJO1TCfijbUHunGjsQnxxBeSv0qh4wuCV3qQw5m8cYUZY4ftlWTzw8fDoV4C8aSvPV5uWutcddZg9TLvh4zpep/OU01+AelTYiFr0R/ERUwjzFSsib5ypxhUZOjlqtJ1AogMJyo9AVucHojVepV179wz5zzV1gXzMy9/b5SCPel8q2CFm3rHp8ZBNmgInSh2DTuOE=
X-Forefront-Antispam-Report: CIP:62.153.209.162;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:mail.schleissheimer.de;PTR:mail.schleissheimer.de;CAT:NONE;SFS:(39840400004)(376002)(136003)(396003)(346002)(36840700001)(46966006)(47076005)(70206006)(70586007)(82310400003)(7596003)(356005)(7636003)(2906002)(5660300002)(26005)(8676002)(83380400001)(1076003)(109986005)(8936002)(36860700001)(9786002)(186003)(2616005)(36756003)(478600001)(426003)(54906003)(336012)(7696005)(316002)(4326008)(266003);DIR:OUT;SFP:1102;
X-OriginatorOrg: schleissheimer.de
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Feb 2021 14:38:08.0341
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0e3166d4-be03-4de4-687c-08d8c91a7d49
X-MS-Exchange-CrossTenant-Id: ba05321a-a007-44df-8805-c7e62d5887b5
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=ba05321a-a007-44df-8805-c7e62d5887b5;Ip=[62.153.209.162];Helo=[mail.schleissheimer.de]
X-MS-Exchange-CrossTenant-AuthSource: DB3EUR04FT064.eop-eur04.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8P190MB1368
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
 drivers/leds/leds-lp50xx.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/drivers/leds/leds-lp50xx.c b/drivers/leds/leds-lp50xx.c
index 79bc071c31fb..e8aa36c7e963 100644
--- a/drivers/leds/leds-lp50xx.c
+++ b/drivers/leds/leds-lp50xx.c
@@ -504,6 +504,24 @@ static int lp50xx_probe_dt(struct lp50xx *priv)
 			num_colors++;
 		}
 
+		if (fwnode_property_count_u32(child, "default-intensity")
+			== num_colors) {
+
+			int j, def_int[LP50XX_LEDS_PER_MODULE];
+
+			ret = fwnode_property_read_u32_array(child,
+				"default-intensity", def_int, num_colors);
+			if (ret) {
+				dev_err(&priv->client->dev,
+					"Cannot read default-intensity: %d\n",
+					ret);
+				goto child_out;
+			}
+
+			for (j = 0; j < num_colors; j++)
+				mc_led_info[j].intensity = def_int[j];
+		}
+
 		led->priv = priv;
 		led->mc_cdev.num_colors = num_colors;
 		led->mc_cdev.subled_info = mc_led_info;
-- 
2.17.1

