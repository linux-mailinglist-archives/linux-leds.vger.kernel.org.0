Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 84DC2784868
	for <lists+linux-leds@lfdr.de>; Tue, 22 Aug 2023 19:28:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229912AbjHVR2h (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 22 Aug 2023 13:28:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43848 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229511AbjHVR2h (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 22 Aug 2023 13:28:37 -0400
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2068.outbound.protection.outlook.com [40.107.223.68])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8E63153153
        for <linux-leds@vger.kernel.org>; Tue, 22 Aug 2023 10:28:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GAHgk0bZO5YRUdP5C26aVQSu9CyluvwR3QZqzqPCWIG2Og8hQV0QyOtD5H1ewmix6n63lfvO1DE+Xhvsps8dugRXphh6/RI/YykUp7I9+AjoJ/mOrGmvqrC2vL+i+pGZSpdIH02naR70J/whoZJXvIi7bUKky93qZojseAAkxZZ/ucnAraGCSH6gE9paa5+kHKdWnM0oO1N6YpK95DOz57doOqHDz3OJ68B2UKp6F7rAlb/V9uV47dgpZwcyuLLVKRTz8f8zYcoSzUYdOxEugv79r+v+1qiH2SJJ1E8fQMGvhp2jRrH3z1iNkNCSHlPq+IMZDPbJluoBuUg6OEsVgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WW4FuOa4rZe9WExYaJyLRg5shDZTH6AAbDiYiM0JdvM=;
 b=ly9E30zrT1xNRK3r+LlGeUC9PDBZPG22pShaLkIfhGUpcfRMie1TrUZSHhQvUvAfrlnq1NUw4Nr59rn1WBskYTAPXAHPiJDBRsuJ2c4r91xngfBVJohsFvPFylGunfXorvPxbkT29usAvTsyooetglTXb39x99uLnsykbGt5cIRNiYmLtqGMPGvDz+Qf5i1i6VGAO0TQrBFLIFJSFIp2kRfM5Unj0d189ZV+qot7fnU521Q+qzNVPtJyJkoEVQ68EWBtM0KDRSmZrw4FOKrGP0TGUzRBzPTmH/G4Yek3BLaEnRNeqtRIC1JSGUPPlYj4YYtfl2vCbP3xsFJuLqvJQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=ucw.cz smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WW4FuOa4rZe9WExYaJyLRg5shDZTH6AAbDiYiM0JdvM=;
 b=jCQPbbVXqEm7G6XtYbKXF3QlCBNACFvdjD5rhtNcj/D204q+lrVV7UkLzqOcUdk+NKqlSwmWDSTMzRuxNga7dyFZWMG6Xrz38m2rVmWcRuiO5f+z8WGiOOzxqK1LUfH38pTpzlAB8U5fzmrGxFvKCXtXGMMwEIv0D3yOsGXjWfTTYkHeHVVz4aFiUYjy6Wt3t/miP2ppKvciRkZyQIFYu2I5aFbJqtgNXNyXuJhJpnveInHzhk8L1izk3dEEIfY4j1b9vyP+9tA1bHIgC9fnhZIAwWail7c9YW8xvsznIYuUvHXdPDp6zkKIN+nxAAjp5jEnCqStFquqLSVBQotJqw==
Received: from MW4PR04CA0319.namprd04.prod.outlook.com (2603:10b6:303:82::24)
 by CY8PR12MB8364.namprd12.prod.outlook.com (2603:10b6:930:7f::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.24; Tue, 22 Aug
 2023 17:28:33 +0000
Received: from CO1PEPF000042AC.namprd03.prod.outlook.com
 (2603:10b6:303:82:cafe::3e) by MW4PR04CA0319.outlook.office365.com
 (2603:10b6:303:82::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.25 via Frontend
 Transport; Tue, 22 Aug 2023 17:28:33 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 CO1PEPF000042AC.mail.protection.outlook.com (10.167.243.41) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6699.14 via Frontend Transport; Tue, 22 Aug 2023 17:28:31 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.5; Tue, 22 Aug 2023
 10:28:18 -0700
Received: from r-build-bsp-02.mtr.labs.mlnx (10.126.230.37) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.37; Tue, 22 Aug 2023 10:28:17 -0700
From:   Vadim Pasternak <vadimp@nvidia.com>
To:     <pavel@ucw.cz>
CC:     <linux-leds@vger.kernel.org>, Vadim Pasternak <vadimp@nvidia.com>
Subject: [PATCH platform-next 1/2] leds: mlxreg: Remove code for amber LED colour
Date:   Tue, 22 Aug 2023 17:27:56 +0000
Message-ID: <20230822172757.60851-2-vadimp@nvidia.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20230822172757.60851-1-vadimp@nvidia.com>
References: <20230822172757.60851-1-vadimp@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.126.230.37]
X-ClientProxiedBy: rnnvmail203.nvidia.com (10.129.68.9) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000042AC:EE_|CY8PR12MB8364:EE_
X-MS-Office365-Filtering-Correlation-Id: 53f50743-01f6-49c5-414c-08dba33534c9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: EWzgIoR9Ijk1uzHT4vYKv2QEThpM1yAKQkRRQ3c1TZQYvUVZv4C7Gaxpusv3mR1JJN+Kx1ol2oBmUHy3aYk7svJWNrIAoROVhkEkOHeK/ANw012CxlLOfrVmmE11JD3OLIorBNSCVkpJ1xceeJggcr3Wuk/Pk9brExdXmEtIWhr8Wa3oevyEGlSIZRbASMHWIhz8kzdU+SehY1/PziOGfMVdn4gp7mlSKjOTXIBdYJVUNBW4PvSr/Z5/CZlkX+tDPvGjoEKg93we6q3UMCpqBWCAAm2pNOtKwumOt9DrkFE9ouYxPA3UAhWMpLojKJK11qjzE1FZh/B7dlidUiTzkRoA6PSwBAcbNihjepXHOSmurqgfjQDQCZGhJBy5atAINUuRJQJqLNnyaB+sQyxcNhG3x9tX19LcAUKt4qCfUZimQqye3QxDs2lbyMfjmpRdURnvTNsHPwXv6/N7xD8zmUQtAHbxmA3n6eOyXbW0JfDXMcHfbKqSvHWwVPuXs1S4mSF0w5EE9kJHh8qUnPfheQBTX842wiTW1qtYoXPKgJQOW/XjuCLB+BvOUzBK/giHGDA8QSr3Xeh/+jMT6oOxgwmm9okZclTH1JfLZAARdpFO+EB16rNdAiXa45tfdp/TTz35P/1MIiKZhy0yhFrAE0MCnH1eQZmbLQriTi9X9x9EQGzM6dfb22zTbMmkqVMPQA0awPH+/2Wb2KyY9xmErWMP+dpj6F8xtAqCNGywTXszmJl5MDvYhAC7vHePP5jM
X-Forefront-Antispam-Report: CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230031)(4636009)(346002)(376002)(136003)(396003)(39860400002)(451199024)(82310400011)(186009)(1800799009)(46966006)(36840700001)(40470700004)(2906002)(40480700001)(83380400001)(5660300002)(426003)(336012)(16526019)(26005)(36860700001)(86362001)(47076005)(8676002)(2616005)(107886003)(8936002)(4326008)(70586007)(316002)(6916009)(54906003)(70206006)(478600001)(356005)(82740400003)(6666004)(40460700003)(36756003)(1076003)(41300700001)(7636003);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2023 17:28:31.6474
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 53f50743-01f6-49c5-414c-08dba33534c9
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1PEPF000042AC.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB8364
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_NONE,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Remove unused code for amber LED colour.

In case system LED color is "red", "orange" or "amber" same code is to
be used for colour setting.

Signed-off-by: Vadim Pasternak <vadimp@nvidia.com>
Reviewed-by: Michael Shych <michaelsh@nvidia.com>
---
 drivers/leds/leds-mlxreg.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/leds/leds-mlxreg.c b/drivers/leds/leds-mlxreg.c
index b7855c93bd72..916544e95e26 100644
--- a/drivers/leds/leds-mlxreg.c
+++ b/drivers/leds/leds-mlxreg.c
@@ -19,7 +19,6 @@
 #define MLXREG_LED_IS_OFF		0x00 /* Off */
 #define MLXREG_LED_RED_SOLID		0x05 /* Solid red */
 #define MLXREG_LED_GREEN_SOLID		0x0D /* Solid green */
-#define MLXREG_LED_AMBER_SOLID		0x09 /* Solid amber */
 #define MLXREG_LED_BLINK_3HZ		167 /* ~167 msec off/on - HW support */
 #define MLXREG_LED_BLINK_6HZ		83 /* ~83 msec off/on - HW support */
 #define MLXREG_LED_CAPABILITY_CLEAR	GENMASK(31, 8) /* Clear mask */
@@ -218,13 +217,10 @@ static int mlxreg_led_config(struct mlxreg_led_priv_data *priv)
 
 		led_cdev = &led_data->led_cdev;
 		led_data->data_parent = priv;
-		if (strstr(data->label, "red") ||
-		    strstr(data->label, "orange")) {
+		if (strstr(data->label, "red") || strstr(data->label, "orange") ||
+		    strstr(data->label, "amber")) {
 			brightness = LED_OFF;
 			led_data->base_color = MLXREG_LED_RED_SOLID;
-		} else if (strstr(data->label, "amber")) {
-			brightness = LED_OFF;
-			led_data->base_color = MLXREG_LED_AMBER_SOLID;
 		} else {
 			brightness = LED_OFF;
 			led_data->base_color = MLXREG_LED_GREEN_SOLID;
-- 
2.20.1

