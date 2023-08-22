Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 97899784869
	for <lists+linux-leds@lfdr.de>; Tue, 22 Aug 2023 19:28:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229511AbjHVR2k (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 22 Aug 2023 13:28:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43922 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229641AbjHVR2j (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 22 Aug 2023 13:28:39 -0400
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2053.outbound.protection.outlook.com [40.107.94.53])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3AD626159E
        for <linux-leds@vger.kernel.org>; Tue, 22 Aug 2023 10:28:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fnZf1ZDASftDPwOcgByK43vEZDvKj0hWraGbFqn4V49BlpT2D04yTVJ5ZWFHMS+mw2tZRLrehZEvZ25KY5Agyg6i+O5FgWw2vHAezLKv53Zz+v28HrQSctNbDxGxX3awVE/YdZp3JHLPe3a9RNX4vTALhLZsbiFUaMdXHbMwJwxwoWEZIcqKgCWzewlNxp8OoK/hqebzlxlUvggfFLVWuOYj7GDRTm6sZyOgv+1cSRZ0HSZ/HVfUOgeJ0CpAjqVBk20akFKNg7IykzzpOmyaElXlXuqF8eajYMCWOQIyRMF0T5aaMvaG//2z+QAHwSJmft2c4BD76j8yY3VgKwia7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4mh+THOVVQGftJPnkkl4pGnk+Vkw/Dw88txCx1b8m24=;
 b=QjPhtnoGdS8vv2/zqPmSDIjKINPaF3DPg+B/Vht3tlxljDxPPpxlC1+Cj5ijQT7OHbt0f1p0F4zYN1HbdPOEj31pcKYyJ+IHv7T0tieXNNIOsun3ZpwcIKjIEOmCBmQl57NhR1pAZY7Umpd2kr3BrSOvU7R9kO6fERcw9BixFoEsiXZq2AIKgVqO8HOqIp4KiYtYOGqdbq+NAPbfOfqDGlbLgHlg/AGAJN2xn6zdKra5orb/cyY+2SGIDv/8n1S4H+Zo/rr2ADA0s9v0bPxrvIqRrm7obL15WDxNot4EJvBGpdZkCS4c+O07+H+UR6pK81h6p1NfirFiQ7FJTj4EPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=ucw.cz smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4mh+THOVVQGftJPnkkl4pGnk+Vkw/Dw88txCx1b8m24=;
 b=qLM43knatAD3TimuqrHlVmDwokPVcgAUCwTf1PrDBjCs8BAAuF1aafNebek1kT08X26d+2E5r+6loCKbYHCwvbTRzBZv7CFzg2IBw9jqZcvaE/5ux0B/FF0AJ1R9RkDlh3Yl30w4PEOuERbc6FExflrE9nRX9VMozISQsgEBKFxEfklNR/GLn7z6v6OJOGAuS+Du6tJu5GWfBtQ2tkZ/azm9RK1zcpUrUctWktiUAbLauKqLBUw3GdQlHgYrfT065ifaxpqm6PxbI2PvG7e22Dop5N2ruP1SUtd04R+f35or2NRDDhT3hdTxTOXLNSeGNG5EF/n2I52op01sf9y36A==
Received: from MW4PR04CA0303.namprd04.prod.outlook.com (2603:10b6:303:82::8)
 by BY5PR12MB4968.namprd12.prod.outlook.com (2603:10b6:a03:1d2::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.24; Tue, 22 Aug
 2023 17:28:35 +0000
Received: from CO1PEPF000042AC.namprd03.prod.outlook.com
 (2603:10b6:303:82:cafe::3) by MW4PR04CA0303.outlook.office365.com
 (2603:10b6:303:82::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.20 via Frontend
 Transport; Tue, 22 Aug 2023 17:28:35 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 CO1PEPF000042AC.mail.protection.outlook.com (10.167.243.41) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6699.14 via Frontend Transport; Tue, 22 Aug 2023 17:28:34 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.5; Tue, 22 Aug 2023
 10:28:20 -0700
Received: from r-build-bsp-02.mtr.labs.mlnx (10.126.230.37) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.37; Tue, 22 Aug 2023 10:28:19 -0700
From:   Vadim Pasternak <vadimp@nvidia.com>
To:     <pavel@ucw.cz>
CC:     <linux-leds@vger.kernel.org>, Vadim Pasternak <vadimp@nvidia.com>
Subject: [PATCH platform-next 2/2] leds: mlxreg: Skip setting LED color during initialization
Date:   Tue, 22 Aug 2023 17:27:57 +0000
Message-ID: <20230822172757.60851-3-vadimp@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: CO1PEPF000042AC:EE_|BY5PR12MB4968:EE_
X-MS-Office365-Filtering-Correlation-Id: 4208a0ed-01b9-4346-181b-08dba33536c5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: QNi8aV2thtGBkpL3my7OQEGyLzLhtG/N8BuNP0NQXc39zvFrlXlbcSSMHnCKK4nEWxRDdIdu7V2qF1zQG/nsTig3QaFcQdozaoeSKVGo/2gnLTEw4FC3g8PKl/uxmUeUZYusdf8OU1BngFdM/smKlXoZyMTRcrKbLIl4vKzgP99RJAB3ceY7NOT7Krb8hRuac4zH2A108rdK73+89zw0uxjdnpp8PfPGv6ncHeat90fkTcdj8k9MZjkRQZGjKPXCEuSSXeYeMQy2N6h97CCtCoRi+N6QzsmufWf70jiHcSAPD6DtUH/iwTHBrSVAzPxPERuiRGQqmm7u4RsQecqPOcwpCq5RApt2Gh16A+144cJwLr7QnPFm19nFBAN/GhF+ozcyGhWqGxFH+aQ4pxBFBQEj80ddsZNHbcZxbHd949cg68CuoGR9HWUbHcgU76Ipz4EMV+wElCJ3KZW7/bgs8ElUPC/HqT+C01msYnBZWkWcTwsr7D1EoYX1H3HJ/a7lkZ0EAb9JV+TPlTBYAy+MeTWTgwhLe8E0lTI7VXdGYSM8fHgiGL8SsmgmM6Cg2Zs6KKYnCtoEDJGS9rgnTIkhE21d98YLe7ylDCK6/DmikeA64aN5+0lTCkwgXXrVl8f/Q6JALvCzbHC9N1sl6ovOJxz90lzARZllcNQZnZfSdFtkElASpuFWpuGE+figS3jC6eJ8++et+/uCq16HkeuZBWKeUf6SwIAj4oJNHyanofCAFD8Aqp/hDaHiFGbDh8jv
X-Forefront-Antispam-Report: CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230031)(4636009)(346002)(376002)(136003)(396003)(39860400002)(451199024)(82310400011)(186009)(1800799009)(46966006)(36840700001)(40470700004)(2906002)(40480700001)(83380400001)(5660300002)(426003)(336012)(16526019)(26005)(36860700001)(86362001)(47076005)(8676002)(2616005)(107886003)(8936002)(4326008)(70586007)(316002)(6916009)(54906003)(70206006)(478600001)(356005)(82740400003)(6666004)(40460700003)(36756003)(1076003)(41300700001)(7636003);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2023 17:28:34.9600
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4208a0ed-01b9-4346-181b-08dba33536c5
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1PEPF000042AC.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4968
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_NONE,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hardware controls LED through CPLD device and LED control ownership
passes to the software after it performs the first write operation for
any LED on a system.
For example, hardware sets "system" LED "green blink" during boot and
might change it to "red", in case something is went wrong from hardware
point of view.
The motivation for not setting LED during kernel initialization is for
keeping hardware settings visible for user, until user will not decide
to set LEDs according to user OS specific requirements.

Signed-off-by: Vadim Pasternak <vadimp@nvidia.com>
Reviewed-by: Michael Shych <michaelsh@nvidia.com>
---
 drivers/leds/leds-mlxreg.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/leds/leds-mlxreg.c b/drivers/leds/leds-mlxreg.c
index 916544e95e26..d4e08d243804 100644
--- a/drivers/leds/leds-mlxreg.c
+++ b/drivers/leds/leds-mlxreg.c
@@ -240,9 +240,6 @@ static int mlxreg_led_config(struct mlxreg_led_priv_data *priv)
 		if (err)
 			return err;
 
-		if (led_cdev->brightness)
-			mlxreg_led_brightness_set(led_cdev,
-						  led_cdev->brightness);
 		dev_info(led_cdev->dev, "label: %s, mask: 0x%02x, offset:0x%02x\n",
 			 data->label, data->mask, data->reg);
 	}
-- 
2.20.1

