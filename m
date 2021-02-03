Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5410730D549
	for <lists+linux-leds@lfdr.de>; Wed,  3 Feb 2021 09:34:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232563AbhBCIeD (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 3 Feb 2021 03:34:03 -0500
Received: from mail-eopbgr140091.outbound.protection.outlook.com ([40.107.14.91]:34377
        "EHLO EUR01-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S232489AbhBCIeD (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Wed, 3 Feb 2021 03:34:03 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ioeB6Z98SZ4sE0+mFl2CSJMipH+NkU8m3xO/PngH3ImB1wIaXLaYDf6i4aKkx80/a2uSYlMDo6U5c9O+6K69EZNfRwiJ5OD1CvGfrQBIxe5W12CTlqb2Bf30jSF5G+5VwUddyVIoObbi0Kui2assq1dzWFDvyOfVRa4A/ccYp4Y+NalNa1SAQ+UhHJ1r2X3CB4gHgW87uM7SdLAlHYvihE6dht7SaePyvR9WoAall4LQfeiY503OS9ck10NLu/y36h6YDiXVLtYm5YCUaNnIQGND+jO9ZktyAkbRhlNP+bWVCYdjXE1jdmQMxuldzxACG8haUal28LHasjIo49ySzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fIQ5aVc8j6wPONhR97VooRWUuupFHz58Mznm6W7U2P0=;
 b=Op/4FglAGIIciMPEJjybsrRsvGKiBJA/YUtImeC/6jbdsGGbwh2a5OYRZ1c1u9TVrdKzXwVqUxWHY2zgA2dtzOirephoiZ7LZlC/c6OoEkts+XoKFu57eLtae4TV51+HNXKeTlb/jbDOv24RUqxWAY9R8iDCbC6CURNTFZKEBxrCFwyp59ciiuYXFiYO/ih3gr7CFCEtBrLKHOYzWdlF2e9Bfx/rdRv0YcfiKYiAfqHOtOgovWKK8FW95y0mLQSaFpi2cvTRduMEkbKfwTOcoRkhaUxE/BAJ3ncEOn2UKyCRwRdHkREmMuxgNEXMvwdbGqUT+sfq2gpd3fL1qiVF1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 62.153.209.162) smtp.rcpttodomain=vger.kernel.org
 smtp.mailfrom=schleissheimer.de; dmarc=none action=none
 header.from=schleissheimer.de; dkim=fail (no key for signature)
 header.d=schleissheimer.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=schleissheimer.onmicrosoft.com; s=selector1-schleissheimer-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fIQ5aVc8j6wPONhR97VooRWUuupFHz58Mznm6W7U2P0=;
 b=CXax+oitaiFPJx0YyTVzghFpUHrBAYrR4hDy8AEyODEj0rupePp3P5NJo34p/xnQpZWIbcvJoV+SZH9wc2d0EYs0WpjINS8seQeyQHi/snnGMlazRkjqZdLdtAfO7fJVR6W0thZoy7yQd4DEom9sJ5/OAuSvdGm0K8eZGND3ZQo=
Received: from MR2P264CA0151.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:1::14) by
 DBAP190MB0903.EURP190.PROD.OUTLOOK.COM (2603:10a6:10:1af::22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3805.19; Wed, 3 Feb 2021 08:33:14 +0000
Received: from VI1EUR04FT034.eop-eur04.prod.protection.outlook.com
 (2603:10a6:501:1:cafe::13) by MR2P264CA0151.outlook.office365.com
 (2603:10a6:501:1::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3805.18 via Frontend
 Transport; Wed, 3 Feb 2021 08:33:14 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 62.153.209.162)
 smtp.mailfrom=schleissheimer.de; vger.kernel.org; dkim=fail (no key for
 signature) header.d=schleissheimer.de;vger.kernel.org; dmarc=none action=none
 header.from=schleissheimer.de;
Received-SPF: Fail (protection.outlook.com: domain of schleissheimer.de does
 not designate 62.153.209.162 as permitted sender)
 receiver=protection.outlook.com; client-ip=62.153.209.162;
 helo=mail.schleissheimer.de;
Received: from mail.schleissheimer.de (62.153.209.162) by
 VI1EUR04FT034.mail.protection.outlook.com (10.152.28.207) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3784.11 via Frontend Transport; Wed, 3 Feb 2021 08:33:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=schleissheimer.de; s=dkim1;
        h=Message-Id:Date:Subject:Cc:To:From; bh=fIQ5aVc8j6wPONhR97VooRWUuupFHz58Mznm6W7U2P0=;
        b=AQnUeJvp/h/4GaDUE/R67rWnf/1ghIDQ3ZfkaIZBYaZI3o3DKoYS5797Jm3YAFDKkmjNP/nWmEe3d8iWVEHNZe1OJhDALjvmmlb045z24ztNytscqxPblRD9W0bFlrTLlJnzAORdhewISunHNH3WvGZ0osjrySd5Hl46HZIsNmg=;
Received: from [192.168.10.165] (port=41936 helo=contiredmine.schleissheimer.de)
        by mail.schleissheimer.de with esmtp (Exim 4.82_1-5b7a7c0-XX)
        (envelope-from <schuchmann@schleissheimer.de>)
        id 1l7Db0-0001iI-2v; Wed, 03 Feb 2021 09:33:06 +0100
X-CTCH-RefID: str=0001.0A782F21.601A5FC2.00F3,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
From:   Sven Schuchmann <schuchmann@schleissheimer.de>
To:     schuchmann@schleissheimer.de
Cc:     Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        Rob Herring <robh+dt@kernel.org>, linux-leds@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] leds: lp50xx: remove unused regulator
Date:   Wed,  3 Feb 2021 08:33:05 +0000
Message-Id: <20210203083305.2434-1-schuchmann@schleissheimer.de>
X-Mailer: git-send-email 2.17.1
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
MIME-Version: 1.0
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: acd068d7-4c90-46fb-b0e7-08d8c81e574c
X-MS-TrafficTypeDiagnostic: DBAP190MB0903:
X-Microsoft-Antispam-PRVS: <DBAP190MB0903BC70BB547AC18510D43DD8B49@DBAP190MB0903.EURP190.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: DDzk/sbjWEKQGnSF1Ax83vSfKG/JqqCUvW8/hmUvo9PQioHqIhB7NwbbdvupTSHJ6R7IPpF39X8m5xFeGaXQBcu92FyTNXAEdhm/31fwk+ki7BKFQIl6SRTJXRDfPNie9RhpGZ1b0+VkgNb/msQS2dBO53Ez01D8pwZUoyqJqh/SJeIqOeKHmgJz243vcwWDhq/L4OAuXlWWL2hbJAvA8l52l2qzKWBqGKUNRPbac5SxDprXbQTUqkyLWSfw9CRv4K+y3yEyF3+2fFBvAVel0XPmUfIpnUxj/WQDvh8jsA8y4uZxE8HxSkHF1+P21/ylTwlYaf5o6kASFMZ1C502J+RFmjHnr9PIrqHghmxncrWh2HffHGJsKWAnqJfbQPCq1x9W02pHX3Oieib1EVuTW0sxJlAV+Y5uc5vVOSPOKpT+lcmDHmJ+hZEdIM6bCqtw6OrYBswVmDxNKwWI7iL7hVjlRLnFhrgDupOhux3lxpGj15h6vq3PtBFu0i9I99y8Lj5QvLfx+jLk02XdGD6VIbZygE+kj9/CbAD0YekiTgd37FBkYz4cbcB7SIOS3eAeMnlbKbwcLtr5Z9ZFu37bZpauRTXMTn0xJ/usLaGzuuikWJ6nGM/6on9szEXUQ9hEl1QnhL5c4jGG0Ywd/dj7hgPj4CT84rdu3B2/4Ifonjs=
X-Forefront-Antispam-Report: CIP:62.153.209.162;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:mail.schleissheimer.de;PTR:mail.schleissheimer.de;CAT:NONE;SFS:(346002)(39830400003)(136003)(376002)(396003)(46966006)(36840700001)(70206006)(8936002)(70586007)(34206002)(426003)(1076003)(47076005)(83380400001)(2616005)(5660300002)(4326008)(54906003)(478600001)(4744005)(7636003)(9786002)(26005)(186003)(82310400003)(356005)(7696005)(2906002)(7596003)(336012)(316002)(8676002)(36860700001)(36756003)(37006003);DIR:OUT;SFP:1102;
X-OriginatorOrg: schleissheimer.de
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2021 08:33:11.1393
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: acd068d7-4c90-46fb-b0e7-08d8c81e574c
X-MS-Exchange-CrossTenant-Id: ba05321a-a007-44df-8805-c7e62d5887b5
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=ba05321a-a007-44df-8805-c7e62d5887b5;Ip=[62.153.209.162];Helo=[mail.schleissheimer.de]
X-MS-Exchange-CrossTenant-AuthSource: VI1EUR04FT034.eop-eur04.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAP190MB0903
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
 Documentation/devicetree/bindings/leds/leds-lp50xx.yaml | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/leds/leds-lp50xx.yaml b/Documentation/devicetree/bindings/leds/leds-lp50xx.yaml
index c192b5feadc7..c20a81d13bfd 100644
--- a/Documentation/devicetree/bindings/leds/leds-lp50xx.yaml
+++ b/Documentation/devicetree/bindings/leds/leds-lp50xx.yaml
@@ -43,9 +43,6 @@ properties:
     maxItems: 1
     description: GPIO pin to enable/disable the device.
 
-  vled-supply:
-    description: LED supply.
-
   '#address-cells':
     const: 1
 
-- 
2.17.1

