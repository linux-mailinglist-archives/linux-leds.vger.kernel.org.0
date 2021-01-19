Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B110D2FBE07
	for <lists+linux-leds@lfdr.de>; Tue, 19 Jan 2021 18:45:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731337AbhASOwx (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 19 Jan 2021 09:52:53 -0500
Received: from mail-db8eur05on2127.outbound.protection.outlook.com ([40.107.20.127]:55641
        "EHLO EUR05-DB8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S2404653AbhASKyM (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Tue, 19 Jan 2021 05:54:12 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Uar8qATU4CiTvz9ANSYF8YfOfw4y21hC9yjlGp3Lw+3AN7k3Wrs1MRaHe+slxKQjVN8vy+YcsoOpnuocLp2zztwpnCDG4Yir0ccCbqifQK7WCuJc79jbBGcSWBQ2cmAhGR0AmWoFZKjlG/O3QOQ5mDWz5Huni/hCTujx7MsYFU62FOgsP+DHBX9Hj5eitrcy1SKwFXGyZ+Kh0qQzhMFCYssZ48OpGz7KwnUcGahpSsTmQCD34M38KBKZr0c3+WG3aupixlyEZyXqFTBxOyjfJ+FLkmhYwZTOmtkWEatmvJQjCKL/w7GfH9Zlau4i/kTH4n5O2SSltXJ2Ga3LxN09tQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0F7yAidr0T81HREofnWAgNGv1GvLo5Pfvu/QPA2JaoI=;
 b=e0kCyu6hdjrix16UX/b30wskrHo9OiDNNWjnPzjwhexLCdx6CChI1Yi/5OuhHqHNHOeyO6eM8vN9Ts/qUnlqltVeK14JxmDTcdGRxa7LR4+DKOPO7OGBDbIK3d6av5omfuk7wPiEdjDb/9K79C7c7qBT0XmToHqoQ6iUB0ghlBuiykd1mPYiDifNVbfCTjQa85hJWv2sON5vk84e69yoOI8iEIx78lI1PpM1Uxzc600DYvP7Bps9quzDK+UkeEbcEiAqkldlZ04BH2CCgdAKw6zo3A80OzJwlbA6PfIXiO7FPgMQ1OujzdjajO8JvY5Vig8FK83MGbNvamOjet1zkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 62.153.209.162) smtp.rcpttodomain=vger.kernel.org
 smtp.mailfrom=schleissheimer.de; dmarc=none action=none
 header.from=schleissheimer.de; dkim=fail (no key for signature)
 header.d=schleissheimer.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=schleissheimer.onmicrosoft.com; s=selector1-schleissheimer-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0F7yAidr0T81HREofnWAgNGv1GvLo5Pfvu/QPA2JaoI=;
 b=hJdaIhmGN5frroukLtcFCnuqHhj4aAAYwi4sfFURnuGCZWK4PR2PbYdp4RnJgG/59kG8t1IG1tOItCSZUc1kQDGmt3SiThH0poSxDlizp9YgnlVJ1MXpeOVSl4fdvmUGKNGj8mIZTVAmdbt5lHqBQta/lu7myiC2biUpGd6pFfA=
Received: from DB8PR03CA0002.eurprd03.prod.outlook.com (2603:10a6:10:be::15)
 by DBAP190MB1013.EURP190.PROD.OUTLOOK.COM (2603:10a6:10:1b1::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.11; Tue, 19 Jan
 2021 10:53:21 +0000
Received: from DB3EUR04FT025.eop-eur04.prod.protection.outlook.com
 (2603:10a6:10:be:cafe::91) by DB8PR03CA0002.outlook.office365.com
 (2603:10a6:10:be::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.11 via Frontend
 Transport; Tue, 19 Jan 2021 10:53:21 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 62.153.209.162)
 smtp.mailfrom=schleissheimer.de; vger.kernel.org; dkim=fail (no key for
 signature) header.d=schleissheimer.de;vger.kernel.org; dmarc=none action=none
 header.from=schleissheimer.de;
Received-SPF: Fail (protection.outlook.com: domain of schleissheimer.de does
 not designate 62.153.209.162 as permitted sender)
 receiver=protection.outlook.com; client-ip=62.153.209.162;
 helo=mail.schleissheimer.de;
Received: from mail.schleissheimer.de (62.153.209.162) by
 DB3EUR04FT025.mail.protection.outlook.com (10.152.24.144) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3763.12 via Frontend Transport; Tue, 19 Jan 2021 10:53:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=schleissheimer.de; s=dkim1;
        h=Message-Id:Date:Subject:Cc:To:From; bh=0F7yAidr0T81HREofnWAgNGv1GvLo5Pfvu/QPA2JaoI=;
        b=VuGTlqpj1u9rwKTsTszVcAXngDRjeOOolPxqpDlXZmn3TakW7jcNdphPQMa9pyXhVcTF6KnL2lCSpAIy+oTjV6le5oA9yYxw/nYcgedNrhqMrpDiPcnqQ4eoPYVtTcsdjpWNLj0Rpkr12DiDj7TWy/oEX/woWhKcRbedYw33GFM=;
Received: from [192.168.10.165] (port=50098 helo=contiredmine.schleissheimer.de)
        by mail.schleissheimer.de with esmtp (Exim 4.82_1-5b7a7c0-XX)
        (envelope-from <schuchmann@schleissheimer.de>)
        id 1l1odQ-000789-0y; Tue, 19 Jan 2021 11:53:16 +0100
X-CTCH-RefID: str=0001.0A782F1B.6006BA1C.0069,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
From:   Sven Schuchmann <schuchmann@schleissheimer.de>
To:     schuchmann@schleissheimer.de
Cc:     Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        Rob Herring <robh+dt@kernel.org>, linux-leds@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v1] leds: lp50xx: add setting of default intensity from DT
Date:   Tue, 19 Jan 2021 10:53:12 +0000
Message-Id: <20210119105312.2636-1-schuchmann@schleissheimer.de>
X-Mailer: git-send-email 2.17.1
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
MIME-Version: 1.0
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: e6b7c33b-3eb3-4cc3-9c94-08d8bc686fee
X-MS-TrafficTypeDiagnostic: DBAP190MB1013:
X-Microsoft-Antispam-PRVS: <DBAP190MB101321229280657E4973E5718FA30@DBAP190MB1013.EURP190.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:5797;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: gR52ezOR2lY87PbIaS+V9egGp8u2MQq7VmZV64U8f4N/dS0rDSKzDH/CSDpkVVGNR0T/h2BiZMPkvm8X+qf1TzLpF/A7AVo5+8PBhnWsGBhAuhAfxeLFt5mklGA7bwzERelvhevLGOK4YGTULCfCrW6RO3OT2owy6NghygyriQY14WNVNmPlTu9BDjn8kFlAQzPXGmbl/dQmGPX9/hL+gn/0Mmuizj2C9OwaGh7ZktRu00llG+bXqW1LCfCQ3mOje3QyN1ItmsjjhMnWVwC5+3W43xY4omNBFlmf+/xx+IEoxYoz/iifWylLOLw8EXkitJ530Lad3ORhh7uVR2poEj1KIDM8/Rx9Z5IKFpX/xmcg4BAaxENLFPbOFMtnEKUVIsXr3SrAUKpS//V8haURB7/h7eVtfRN/naB+kf9tCsrxEdAIz8AnfYINM+YxnWiyeVSfv45EILjotMNQYt92vg==
X-Forefront-Antispam-Report: CIP:62.153.209.162;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:mail.schleissheimer.de;PTR:www.schleissheimer.de;CAT:NONE;SFS:(396003)(376002)(136003)(39840400004)(346002)(46966006)(1076003)(2906002)(47076005)(7696005)(316002)(54906003)(478600001)(8676002)(4326008)(5660300002)(9786002)(7636003)(34206002)(186003)(356005)(426003)(26005)(6666004)(37006003)(36756003)(8936002)(2616005)(70206006)(70586007)(83380400001)(336012)(82310400003);DIR:OUT;SFP:1102;
X-OriginatorOrg: schleissheimer.de
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jan 2021 10:53:21.2414
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e6b7c33b-3eb3-4cc3-9c94-08d8bc686fee
X-MS-Exchange-CrossTenant-Id: ba05321a-a007-44df-8805-c7e62d5887b5
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=ba05321a-a007-44df-8805-c7e62d5887b5;Ip=[62.153.209.162];Helo=[mail.schleissheimer.de]
X-MS-Exchange-CrossTenant-AuthSource: DB3EUR04FT025.eop-eur04.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAP190MB1013
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

In order to use a multicolor-led together with a trigger
from DT the led needs to have an intensity set to see something.
The trigger changes the brightness of the led but if there
is no intensity we actually see nothing.

This patch adds the ability to set the default intensity
of each led so that it is turned on from DT.

Signed-off-by: Sven Schuchmann <schuchmann@schleissheimer.de>
---
 Documentation/devicetree/bindings/leds/leds-lp50xx.yaml | 8 +++++++-
 drivers/leds/leds-lp50xx.c                              | 4 ++++
 2 files changed, 11 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/leds/leds-lp50xx.yaml b/Documentation/devicetree/bindings/leds/leds-lp50xx.yaml
index c192b5feadc7..5ad2a0c3c052 100644
--- a/Documentation/devicetree/bindings/leds/leds-lp50xx.yaml
+++ b/Documentation/devicetree/bindings/leds/leds-lp50xx.yaml
@@ -69,7 +69,12 @@ patternProperties:
     patternProperties:
       "(^led-[0-9a-f]$|led)":
         type: object
-        $ref: common.yaml#
+        allOf:
+          - $ref: common.yaml#
+        properties:
+          default-intensity:
+            maxItems: 1
+            description: The intensity the LED gets initialised with.
 
 required:
   - compatible
@@ -102,6 +107,7 @@ examples:
 
                led-0 {
                    color = <LED_COLOR_ID_RED>;
+                   default-intensity = <100>;
                };
 
                led-1 {
diff --git a/drivers/leds/leds-lp50xx.c b/drivers/leds/leds-lp50xx.c
index f13117eed976..ba760fa33bdc 100644
--- a/drivers/leds/leds-lp50xx.c
+++ b/drivers/leds/leds-lp50xx.c
@@ -501,6 +501,10 @@ static int lp50xx_probe_dt(struct lp50xx *priv)
 			}
 
 			mc_led_info[num_colors].color_index = color_id;
+
+			fwnode_property_read_u32(led_node, "default-intensity",
+						 &mc_led_info[num_colors].intensity);
+
 			num_colors++;
 		}
 
-- 
2.17.1

