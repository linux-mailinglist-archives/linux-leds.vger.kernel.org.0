Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2851D30D54E
	for <lists+linux-leds@lfdr.de>; Wed,  3 Feb 2021 09:36:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232590AbhBCIfR (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 3 Feb 2021 03:35:17 -0500
Received: from mail-eopbgr60122.outbound.protection.outlook.com ([40.107.6.122]:36741
        "EHLO EUR04-DB3-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S232599AbhBCIfL (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Wed, 3 Feb 2021 03:35:11 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oMSaw8RLcZJm9XYHNqMf2KzDd81eAW+gaxUofxMfmE+kIwzbv605J9vXej0nreYQUmFRZFH0lmSKF8r7J6+c0EJo2R/4q8tBqxfrlwD39CLlFPnUqr5PguYMLdZ4SDtL/YjAEZ9vXUXzvbqUB++VRd7daVuKLNVI9Sq0MmFQF6uMyoOa/1NBbZOIBeHSB2mUtN7nX0c/eS/0OBec3NXtSj+KbFPw9jDIII9oT3CSkoA2x8e8X/Kjjc0FQ93Xb/t8zpPd8OpEalT/GOISnvI/jSphTHefuSB1UEQAvXnGo3YEB2sCIbq3BMbO7JQEgqffe0ambI/QYTZf8AzD0HHS9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cbm+6OHG7Hsit5rbDiWNzN9vof6WsnRbTnD2nK9A3Kc=;
 b=C0JBXo+yjpuXempAeitDypxw66W7gO7kSaO9zWmGprIgzMmrCq5F4x18SoPKeOrNvh0oGsB3DV80gAwSg4MLfevUnHuTSFYQP+QP4gkZacsoPjLzusqE2zZLClMuwQQpoLpfV1ZB9gYhDyoLuXXdnnpt1ZREgArAz2a2UoQ6ROOjvmOFjLCTn07QmEHBLjAOZRef4s7GZ3SaY9xBxUtVbpEixassHG2bAI28pMbVHi/LneIMHehYWSEPAaay6AMRxmJulPbJ42Yh3cqGqynphPZQ8ouo7SvZGYDdVJuLVRKhIi0aUrQR2fUhzoBK730wIh3g53dSMD8EUCiUTAwDIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 62.153.209.162) smtp.rcpttodomain=vger.kernel.org
 smtp.mailfrom=schleissheimer.de; dmarc=none action=none
 header.from=schleissheimer.de; dkim=fail (no key for signature)
 header.d=schleissheimer.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=schleissheimer.onmicrosoft.com; s=selector1-schleissheimer-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cbm+6OHG7Hsit5rbDiWNzN9vof6WsnRbTnD2nK9A3Kc=;
 b=E+qkE5Wx6fBBO9htEm/YfITeuEoAi846KOyHz+Wyamg5EJvqZUjJ7xaiJ0vmin3rynrCyleUT0iURq55xciIDAjR8Hv/R03apcXt9d6+a/BM8KP7a+vJUizg1/gFZqIcbAE+BpbSbQgClsf3wE5+pQYBT5HUsqH5sFuVFFLFEv0=
Received: from AS8PR04CA0061.eurprd04.prod.outlook.com (2603:10a6:20b:313::6)
 by DB9P190MB1355.EURP190.PROD.OUTLOOK.COM (2603:10a6:10:22a::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3805.23; Wed, 3 Feb
 2021 08:34:22 +0000
Received: from HE1EUR04FT040.eop-eur04.prod.protection.outlook.com
 (2603:10a6:20b:313:cafe::df) by AS8PR04CA0061.outlook.office365.com
 (2603:10a6:20b:313::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3825.19 via Frontend
 Transport; Wed, 3 Feb 2021 08:34:22 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 62.153.209.162)
 smtp.mailfrom=schleissheimer.de; vger.kernel.org; dkim=fail (no key for
 signature) header.d=schleissheimer.de;vger.kernel.org; dmarc=none action=none
 header.from=schleissheimer.de;
Received-SPF: Fail (protection.outlook.com: domain of schleissheimer.de does
 not designate 62.153.209.162 as permitted sender)
 receiver=protection.outlook.com; client-ip=62.153.209.162;
 helo=mail.schleissheimer.de;
Received: from mail.schleissheimer.de (62.153.209.162) by
 HE1EUR04FT040.mail.protection.outlook.com (10.152.26.160) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3784.11 via Frontend Transport; Wed, 3 Feb 2021 08:34:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=schleissheimer.de; s=dkim1;
        h=Message-Id:Date:Subject:Cc:To:From; bh=cbm+6OHG7Hsit5rbDiWNzN9vof6WsnRbTnD2nK9A3Kc=;
        b=cqz6QM/see/WO+40DQs4kCXVAeiORycvdbFdmVp9EbK4IQf4UGON61ghyjYukbdbht+Uo2FGTP+slmlUfRYcp2KLPpahRPofp/9jld/gCbTdntHc3e6QhM1yap9RBXPCAG2R6xM565mj8tkw4IhGliDSe6QSeyee1vEMYJV4/6w=;
Received: from [192.168.10.165] (port=41938 helo=contiredmine.schleissheimer.de)
        by mail.schleissheimer.de with esmtp (Exim 4.82_1-5b7a7c0-XX)
        (envelope-from <schuchmann@schleissheimer.de>)
        id 1l7Dc4-0001pv-1d; Wed, 03 Feb 2021 09:34:12 +0100
X-CTCH-RefID: str=0001.0A782F17.601A6004.009B,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
From:   Sven Schuchmann <schuchmann@schleissheimer.de>
To:     schuchmann@schleissheimer.de
Cc:     Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        Rob Herring <robh+dt@kernel.org>, linux-leds@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] leds: lp50xx: remove unused regulator
Date:   Wed,  3 Feb 2021 08:34:08 +0000
Message-Id: <20210203083408.2534-1-schuchmann@schleissheimer.de>
X-Mailer: git-send-email 2.17.1
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
MIME-Version: 1.0
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 4b419a2a-544d-43bc-7ee9-08d8c81e8157
X-MS-TrafficTypeDiagnostic: DB9P190MB1355:
X-Microsoft-Antispam-PRVS: <DB9P190MB135565E3A8C10A906942C8F1D8B49@DB9P190MB1355.EURP190.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: XdUz9LYDZBcMP6+FqXzVMFiZyj2kjoeGQGnGwvybUf7htnntZF6qJv+afijCMW5XM32IuwTyZUgflwJ/v8Dpju0CsY2M7p67Ax7tJ42a/Nln9HMA91oSjbR8PWdxt7ODpOKwUO+AbvsJ8cipZv0FsvN3lsUYR/arm1HSbuCID4Sfe7ub+aqpL/PGqjtamt/I1ubNW/SLyx8IveNsnMUyNBarTrfOgFbkCG0by8HAv4WaxehxTuDq4yQi87nweFvC2ueRLelc2bc5XVwu745w6quJXJIzTaRdh2J6atM6eCN1zrqZrcnA1xm5qe8p1xYrb0jJulYaQGYQUKeIIDFeih2sG6Epo/sxFiRrHx6i435FLajO5VDN7/2gzcq1t776CsF6K4EaIj3SjUo0xAfuuFRU73yRlH0XMf9M2Qs0lzOnh8KYbeeaJkdYhvTPXmbAmwYjSsxHu4dmgXCzpk5xpeoCYvi/VQ/4VMbixTu32qoMOPhOGEqutPNtWCHg78pm6vhfIC0r2PipH1jF8qmAtX+BpXJAdCZ4clzo7I6jOScGT4Kt9D8jm5XbjhuB1iTvjx6xhEvLs5bWUtIFrKoDOV4lNLGZapuEQLWVvcC1APHHpsm2fNvWjN/fkCPscxCx8WLx2j96qjnmyTLjIacEsw==
X-Forefront-Antispam-Report: CIP:62.153.209.162;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:mail.schleissheimer.de;PTR:www.schleissheimer.de;CAT:NONE;SFS:(376002)(396003)(346002)(136003)(39830400003)(36840700001)(46966006)(26005)(2906002)(478600001)(6666004)(336012)(316002)(9786002)(47076005)(70206006)(70586007)(4326008)(36860700001)(36756003)(426003)(8936002)(7696005)(1076003)(34206002)(2616005)(8676002)(186003)(37006003)(7636003)(54906003)(356005)(5660300002)(82310400003)(83380400001);DIR:OUT;SFP:1102;
X-OriginatorOrg: schleissheimer.de
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2021 08:34:21.6544
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4b419a2a-544d-43bc-7ee9-08d8c81e8157
X-MS-Exchange-CrossTenant-Id: ba05321a-a007-44df-8805-c7e62d5887b5
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=ba05321a-a007-44df-8805-c7e62d5887b5;Ip=[62.153.209.162];Helo=[mail.schleissheimer.de]
X-MS-Exchange-CrossTenant-AuthSource: HE1EUR04FT040.eop-eur04.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9P190MB1355
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

The regulator for vled-supply is unused in the driver.
It is just assigned from DT and disabled in lp50xx_remove.
So the code can be removed from the driver.

Part 1 updates the documentation
Part 2 removes the code

Signed-off-by: Sven Schuchmann <schuchmann@schleissheimer.de>

---
 drivers/leds/leds-lp50xx.c | 14 --------------
 1 file changed, 14 deletions(-)

diff --git a/drivers/leds/leds-lp50xx.c b/drivers/leds/leds-lp50xx.c
index f13117eed976..b0871495bae3 100644
--- a/drivers/leds/leds-lp50xx.c
+++ b/drivers/leds/leds-lp50xx.c
@@ -11,7 +11,6 @@
 #include <linux/of.h>
 #include <linux/of_gpio.h>
 #include <linux/regmap.h>
-#include <linux/regulator/consumer.h>
 #include <linux/slab.h>
 #include <uapi/linux/uleds.h>
 
@@ -275,7 +274,6 @@ struct lp50xx_led {
 /**
  * struct lp50xx -
  * @enable_gpio: hardware enable gpio
- * @regulator: LED supply regulator pointer
  * @client: pointer to the I2C client
  * @regmap: device register map
  * @dev: pointer to the devices device struct
@@ -286,7 +284,6 @@ struct lp50xx_led {
  */
 struct lp50xx {
 	struct gpio_desc *enable_gpio;
-	struct regulator *regulator;
 	struct i2c_client *client;
 	struct regmap *regmap;
 	struct device *dev;
@@ -462,10 +459,6 @@ static int lp50xx_probe_dt(struct lp50xx *priv)
 		return ret;
 	}
 
-	priv->regulator = devm_regulator_get(priv->dev, "vled");
-	if (IS_ERR(priv->regulator))
-		priv->regulator = NULL;
-
 	device_for_each_child_node(priv->dev, child) {
 		led = &priv->leds[i];
 		ret = fwnode_property_count_u32(child, "reg");
@@ -583,13 +576,6 @@ static int lp50xx_remove(struct i2c_client *client)
 		return ret;
 	}
 
-	if (led->regulator) {
-		ret = regulator_disable(led->regulator);
-		if (ret)
-			dev_err(&led->client->dev,
-				"Failed to disable regulator\n");
-	}
-
 	mutex_destroy(&led->lock);
 
 	return 0;
-- 
2.17.1

