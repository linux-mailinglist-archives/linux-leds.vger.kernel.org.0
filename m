Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4C3B530F55F
	for <lists+linux-leds@lfdr.de>; Thu,  4 Feb 2021 15:51:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236766AbhBDOte (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 4 Feb 2021 09:49:34 -0500
Received: from mail-am6eur05on2132.outbound.protection.outlook.com ([40.107.22.132]:4288
        "EHLO EUR05-AM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S236858AbhBDOip (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Thu, 4 Feb 2021 09:38:45 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NMepqI2S0GOoLRAqfX6AlSkRY4O6v79FLpHGOZf7fAXmNW/R+tJ8cMSoiqZuU5ZT1HMKOcT3zCuLXqigM2AKT3p8R4vJpm+Au0Et4GcKhr6R7ArevniJGTsnfIHKn7e43D1M6NbTtHjTZOsK6LN9IoX8x2mPiTDUwWuWlVUIGzwXHUCt1MXy7uU5tKlO4lj68atSVXsfPLmAPoUxArQMbL+ywhPQMD14r0q1gWbi6lxAhC8jffT6NJciCL5bBlARFe7Ty1tv96k6e3xFn8E7Ex8nnbvb/bdpJEMOeVXoW7vsECENEGQ/cbM6y4AT3fS8yAAdg2vqjpMWCTmny/5zfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U8hwsuotRJyFZlNoGcVUj+0hWqgZSxHdgSkrE5F3vSI=;
 b=Zp7v5oqtCnN6pQXFJ0qLCe4m6sL6Z5p03w5u8xqG9im3hdqEEChItiZRPUvv3GGmlOyKECuNxS0XI/kazY7o1ic2w12s10oiAlzV84gsHl1bvXKFXoMV/sDiLHiBq5+BoIrPRlUQtI8PU9je6I0+lsLc2BJ5WiVcCoHnghQXITHByE0aXEAd3zLXtun2bFPp8MXcJ9kstcUVMRIkXIHEOGj/E8t0LS/aTSskS3i5XB6II7YIrhFWjAQYxcHtgAshOjZ+gUX2FXBmV4zLHy/ttJwjngvMbZRd0lWO3ulzTSFpsqEC3af97JMfYOcEpJy1JMvkgEkjuy4ePG4maY2i9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 62.153.209.162) smtp.rcpttodomain=vger.kernel.org
 smtp.mailfrom=schleissheimer.de; dmarc=none action=none
 header.from=schleissheimer.de; dkim=fail (no key for signature)
 header.d=schleissheimer.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=schleissheimer.onmicrosoft.com; s=selector1-schleissheimer-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U8hwsuotRJyFZlNoGcVUj+0hWqgZSxHdgSkrE5F3vSI=;
 b=XHx35wpjaF6ncmCPrAcpH64RfW717kLpYZHQByx3q0BNRwVSHovKPhqToGXjlgZA8uQBgoSpMiH5bdPUDqIB2G6JjeTQsDnbc1w1S756f5jPsDvPj3SdU2pGhDPwfrfC5Cg5jAJy/GfosEjwKq7ImWRj+L691E/ik5VSB3Gi/8Q=
Received: from AS8PR04CA0148.eurprd04.prod.outlook.com (2603:10a6:20b:127::33)
 by VI1P190MB0525.EURP190.PROD.OUTLOOK.COM (2603:10a6:802:30::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3805.16; Thu, 4 Feb
 2021 14:37:43 +0000
Received: from HE1EUR04FT020.eop-eur04.prod.protection.outlook.com
 (2603:10a6:20b:127:cafe::ad) by AS8PR04CA0148.outlook.office365.com
 (2603:10a6:20b:127::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3825.19 via Frontend
 Transport; Thu, 4 Feb 2021 14:37:43 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 62.153.209.162)
 smtp.mailfrom=schleissheimer.de; vger.kernel.org; dkim=fail (no key for
 signature) header.d=schleissheimer.de;vger.kernel.org; dmarc=none action=none
 header.from=schleissheimer.de;
Received-SPF: Fail (protection.outlook.com: domain of schleissheimer.de does
 not designate 62.153.209.162 as permitted sender)
 receiver=protection.outlook.com; client-ip=62.153.209.162;
 helo=mail.schleissheimer.de;
Received: from mail.schleissheimer.de (62.153.209.162) by
 HE1EUR04FT020.mail.protection.outlook.com (10.152.26.199) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3784.11 via Frontend Transport; Thu, 4 Feb 2021 14:37:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=schleissheimer.de; s=dkim1;
        h=Message-Id:Date:Subject:Cc:To:From; bh=U8hwsuotRJyFZlNoGcVUj+0hWqgZSxHdgSkrE5F3vSI=;
        b=XIa+P2RRW7UyamNm4sr8MiWKyRyPniw+zSDXBZYeKiIPPuMWTTnmHbtaVmgMerK8zXRSaZ7b7BzlNr/0pz70lAJrz86Pf80v8SEANUfzQVtsDmLxMudfm6gCMmKL3dZiaZPihDbBUTOjUZ2FaEM0gSt0YAM0/KaAt+p32ApTivU=;
Received: from [192.168.10.165] (port=41972 helo=contiredmine.schleissheimer.de)
        by mail.schleissheimer.de with esmtp (Exim 4.82_1-5b7a7c0-XX)
        (envelope-from <schuchmann@schleissheimer.de>)
        id 1l7flL-00040F-1q; Thu, 04 Feb 2021 15:37:39 +0100
X-CTCH-RefID: str=0001.0A782F17.601C06B3.0090,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
From:   Sven Schuchmann <schuchmann@schleissheimer.de>
Cc:     Sven Schuchmann <schuchmann@schleissheimer.de>,
        Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/4] leds: lp50xx: add setting of default intensity from DT
Date:   Thu,  4 Feb 2021 14:37:38 +0000
Message-Id: <20210204143738.28036-1-schuchmann@schleissheimer.de>
X-Mailer: git-send-email 2.17.1
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
MIME-Version: 1.0
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 8bfbdf91-97cf-4070-a5a7-08d8c91a6e76
X-MS-TrafficTypeDiagnostic: VI1P190MB0525:
X-Microsoft-Antispam-PRVS: <VI1P190MB0525A2CE1A0ECA81C50D894C86B39@VI1P190MB0525.EURP190.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: OpZ+bFTklA31lXOeuxm1+vz3AJ/wMBS/sVm+BweSvC/MEdg0RQw8jXNUQLxvAudrgXkJLIie9dtxKpxYlk7eEvKsUqWTvRFHRj7hvj2VyNk2OUqTBg6xovL7+p8DFnXp7hi9ZQZfgaT/lb8JRlNc89a7E1+at+lJlDpLJeuSb9kjr/fA73lBpA5MWIiwS1gv3uJWr0rIHdYeTyprzLyOsXlhEmQ7q4C+83SMYsSWBMP9ixdNhmBSGWHZoQZ99mBMWlhAHpzuyO6n9AzoDbBtwkb+zapd/a7JToKgrGz7+DuG+VhgaPDRdkqpWzWkkwYrG4MT0F+Sb5nkr3NjaVLlhQ1O3u1juA5gOUnLWOVS2O444whlWEifEU4aDF91oyz23cSbkFm+VJN0BPit1E/VRZsPhUp0TAgpLj+mgYaTX4mhxVGzUQ7XBQoklWrc3pwGu+NReDsddv+kObjcUtZwGKuCVL9m1cgtDuvITWBprwAp7Ju6IaQW7wyA5i/8bNuLm80HpgHP4BMetfoUnw+L2zMZAcTF/UahbfGXKaL6KOyr6t28lmJaGk1JkiDCWV/yPOOzXTnyGAsYegN216JiK6j6aX5lBNx/LDwmpvx85ayHq9dUYNCNjmpZ165NJQOerxipWX7BibGkzDTIulRzA1rKVo4AyBGvzES/JUbXyzE=
X-Forefront-Antispam-Report: CIP:62.153.209.162;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:mail.schleissheimer.de;PTR:mail.schleissheimer.de;CAT:NONE;SFS:(396003)(376002)(39840400004)(346002)(136003)(36840700001)(46966006)(2906002)(109986005)(9786002)(7596003)(186003)(36860700001)(478600001)(8936002)(356005)(26005)(336012)(47076005)(70206006)(36756003)(82310400003)(1076003)(7636003)(70586007)(8676002)(426003)(316002)(2616005)(7696005)(54906003)(4326008)(5660300002)(83380400001)(266003);DIR:OUT;SFP:1102;
X-OriginatorOrg: schleissheimer.de
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Feb 2021 14:37:43.1547
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8bfbdf91-97cf-4070-a5a7-08d8c91a6e76
X-MS-Exchange-CrossTenant-Id: ba05321a-a007-44df-8805-c7e62d5887b5
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=ba05321a-a007-44df-8805-c7e62d5887b5;Ip=[62.153.209.162];Helo=[mail.schleissheimer.de]
X-MS-Exchange-CrossTenant-AuthSource: HE1EUR04FT020.eop-eur04.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1P190MB0525
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
 drivers/leds/leds-lp50xx.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/leds/leds-lp50xx.c b/drivers/leds/leds-lp50xx.c
index f13117eed976..4b40bf66483c 100644
--- a/drivers/leds/leds-lp50xx.c
+++ b/drivers/leds/leds-lp50xx.c
@@ -267,7 +267,6 @@ struct lp50xx_led {
 	struct led_classdev_mc mc_cdev;
 	struct lp50xx *priv;
 	unsigned long bank_modules;
-	int led_intensity[LP50XX_LEDS_PER_MODULE];
 	u8 ctrl_bank_enabled;
 	int led_number;
 };
-- 
2.17.1

