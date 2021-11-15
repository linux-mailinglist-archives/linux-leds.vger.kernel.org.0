Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8613A44FD72
	for <lists+linux-leds@lfdr.de>; Mon, 15 Nov 2021 04:24:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236560AbhKOD1q (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sun, 14 Nov 2021 22:27:46 -0500
Received: from mail-eopbgr1300111.outbound.protection.outlook.com ([40.107.130.111]:47017
        "EHLO APC01-HK2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S236556AbhKOD1m (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Sun, 14 Nov 2021 22:27:42 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eMuyPiJ7K6Ir8xMJphgkGjG2hqNHcLt5d6Y0Wwz+1t+zEf9ISFXgyu0q+Ei2Hx3Mhojqchf6bRnskDWHFMQlcfNsaupMh/Xpdg9OfrH+PZxJBGmuEDGKOpcyVeg4A11Qczx/+H0eK4oJMeyW4ESL9kh9tGrO2D1/sXYV13pN2cI1BZo1VPwEZayEJaLp/yvg73Tw+4C+YoCI7nZuZvYvjTWeAru2XDL4QfuvJbEb1pXxhsCJzc05BLTj+cOCW6Nx9dp4mvaP8nhvbkWmuK4oGcdrqkBn+B2r3gtWi26cfnkpV4bfmLJLiIkpxv0WUEyBw+LR+HYGU1nAimWBBfgjTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TY9FAXAEq9PFcRD3sRCvxdJhL/A6IxDjKVTo8iy+Ojk=;
 b=Mm3lWqTsdaiXk3Go3uliKG+jRkv3AkM6TPDnMg/Eh8MO9CU3+KC93ZLFFGLFPJB8gmawawmUo873TRtUEGHTjfzauHK+nObB5PcI6yEv4PyJzeg9P+esDlGH8n0xlj2tyTGeMbG+na8lTyY8J9dX+uFtdpvtpMQPdXnze5Ckq+1vDpXgr1eJfi+kzXVce44MA00lAv/pYIbkdVO5gXTqaTMvDTOPtQ9pxwjm2KHXOk88T/ChTdGpdSafloxyQp+krefktnqntGQRrmsjLhKiIBG/A5Xn2YC5JT3S1Jge9jZzySkrjJx0sDSD70TZhKJ1h6TrzknBpfouicJZxeWdrA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo0.onmicrosoft.com;
 s=selector2-vivo0-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TY9FAXAEq9PFcRD3sRCvxdJhL/A6IxDjKVTo8iy+Ojk=;
 b=joyXy7u3HEUeG5K1tUDY+agQrOvtNMG4yxpfDx9Qo4LG7zFaCjUrHEiVFCCyTayR6LsRjEfX2ptnzJb2x8SEm4adfyBPuF11DrnXEVMB6cuu5ITkBaIe8Ya69jUCpF7jDgRwGklEJBpKy0gx/IBTT+mtVkGKESxeNn0ikzPgdYg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from TYZPR06MB4173.apcprd06.prod.outlook.com (2603:1096:400:26::14)
 by TYZPR06MB3902.apcprd06.prod.outlook.com (2603:1096:400:21::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.19; Mon, 15 Nov
 2021 03:24:45 +0000
Received: from TYZPR06MB4173.apcprd06.prod.outlook.com
 ([fe80::5e:78e1:eba3:7d0e]) by TYZPR06MB4173.apcprd06.prod.outlook.com
 ([fe80::5e:78e1:eba3:7d0e%8]) with mapi id 15.20.4669.016; Mon, 15 Nov 2021
 03:24:45 +0000
From:   Yihao Han <hanyihao@vivo.com>
To:     Pavel Machek <pavel@ucw.cz>, linux-leds@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     kernel@vivo.com, Yihao Han <hanyihao@vivo.com>
Subject: [PATCH] leds: tca6507: use swap() to make code cleaner
Date:   Sun, 14 Nov 2021 19:24:28 -0800
Message-Id: <20211115032428.4379-1-hanyihao@vivo.com>
X-Mailer: git-send-email 2.17.1
Content-Type: text/plain
X-ClientProxiedBy: HK2PR02CA0181.apcprd02.prod.outlook.com
 (2603:1096:201:21::17) To TYZPR06MB4173.apcprd06.prod.outlook.com
 (2603:1096:400:26::14)
MIME-Version: 1.0
Received: from ubuntu.localdomain (103.220.76.181) by HK2PR02CA0181.apcprd02.prod.outlook.com (2603:1096:201:21::17) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.19 via Frontend Transport; Mon, 15 Nov 2021 03:24:44 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c84856f3-6320-49a4-d4d7-08d9a7e7788a
X-MS-TrafficTypeDiagnostic: TYZPR06MB3902:
X-Microsoft-Antispam-PRVS: <TYZPR06MB3902BAD05B254B102A82CBD3A2989@TYZPR06MB3902.apcprd06.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3513;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: nMCSjeflFKRsv1B645zb/BeNq8Ti/n108LrWMjVTqV/Y4Ak8QuvbAjYE+qLuYkhLPF6ef6zRUIckm9ngiqL6o9lZ1SMgx7EjB6wMc/hhk6YkQxsSOxXD4hgDtz0XZLaO41PAG21MdaVi72rWvCSAAzem6HqMW5cOkuQrxVyNlCifCmZ0I2w2iemfI/e8fI5fgL6SafX/cpNBFh5KgTaw3TRE1nB7JWtd8UvmOHdkBeeUhGLhyUM8rmpVVqXlcA5fyVU1z0bIwrN0REi6zEck82dDmziICV2s+bXILMy/iMFCXm39wCNUt7t97CwKJ6j3Ua6r01ewkUoqZeehEEnwt9/1tazFujaXlSEHtvK1qBZNx8CFtL9avDqse6eU6yxaU7rF8Sj7JtIx18yxTeb5fKYhjTVe4D/OjwFSKsbv0FREe+0qWGf3PX+lWoMvuvZPiQB60CRcRp8ey4A81b+ZtHPBYCxHHAbwQ1M4HGkciGUrdQwoLfCKblGkhYNmfE1PKPKADDZlcEyjg7YU1w5HcgK+cmzll72aFOxvLRcxqWd0WJJHmIkyWVUoXebP2tFCvnWlQ3bXUe/c9RmafJK7VuSuqCMijzCSnux5QPyEGHpHk2vnkt8VTOp6ZpC8YYN8cBgYLmssjtOBmsobnUpi9dcJTLBQKlVci6GnXVOMBAYIyH3ipkOOx432goc/vEM3dMFEF3DtBJ98M8V3uNwsoQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR06MB4173.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(6506007)(66946007)(186003)(36756003)(508600001)(38350700002)(8676002)(66476007)(6512007)(38100700002)(6486002)(5660300002)(52116002)(2616005)(956004)(107886003)(8936002)(4744005)(26005)(66556008)(86362001)(6666004)(1076003)(4326008)(316002)(83380400001)(2906002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?scZGJu6Q6MSNHDdP17KCA4DnYwulRgB4EAglpQI1yK3GEEUfHfogLcFjuhAs?=
 =?us-ascii?Q?YT8e7uBoQ07f8R748KKfHmVvCBtQd55UQ9cUP6LRf2d/3LP9QqDXNIO4cCPH?=
 =?us-ascii?Q?/RUn5lk3+8AuVKuS4wxoz/Hd6ITDpYeuSNrlD56B/EvXktnEUajStE3NFN1k?=
 =?us-ascii?Q?iPh2LaX9jEOB+USnKa8kCjJa/38IZXvajrQCqVXDzo6i/SWD9OIQnfd1/jtM?=
 =?us-ascii?Q?bonOzK+s5/Tne9DJeS8zVr/SKpJ/e1DS333ovcIQpPkcTqBdOcPB2AIDjOJU?=
 =?us-ascii?Q?ii2+Un6uwVtRQxK9rgV1wOuRysQuME/ySAsY8IzteQptgisiVa7C5bHkcYFF?=
 =?us-ascii?Q?YgepJ7xsdOy6ijsEwr3sufYpP4yT2V49Fj+e1OZ/yvn7N3gkwlojOhdcFaSd?=
 =?us-ascii?Q?IT/NgJKeKYmmdSf0A9ny3UH+gqeSDCA598RV4kzENicawa3vgz3fz0pFwYx9?=
 =?us-ascii?Q?yV0kqLC+gK6blFHc7TCdWYKHbS30zcUfy5r0x0wcHLCOjJEUBOZKSD06Pwyq?=
 =?us-ascii?Q?NMjIpYk0eDASJMqjfXM/EhnJeehsbBonZzdtbhJJC2i0whFHlRKBYFOcrmLk?=
 =?us-ascii?Q?x7oPht76DOG7qJY+j+Qp2jYjzt5to5GMn7MV/A+xtxGevHhnWPd/DNGGELC/?=
 =?us-ascii?Q?kDN711tSjchL4H2vodJyw5iZZ/fhJ8pGYgbLznGmdYgiW5xO2meOZG1ggeis?=
 =?us-ascii?Q?+lSJALUmdu+90Y5UOWXY2UWZit6LIvl9+VahnsstxYM9hLKmC1Lxglv0AbxF?=
 =?us-ascii?Q?M2y/mOjmi/UxWpFeQ2/bFHw10WBRYJH4YTWe3ok95zy+aA1xj5FieIBK1BFH?=
 =?us-ascii?Q?8VuVVgskQS0Qyg5GtiA/ndJ/GB/4SPgudzYzz4fr48HeckHj/AAQLzqoVFLs?=
 =?us-ascii?Q?dpom1X0WrPZZmXmHa0LqN7xCFdl/0Mkr/3UD6KxdYyF06M2BvDjGyb/Nmhtj?=
 =?us-ascii?Q?w++CPYtczP1ti2Zq9vjZRpy3VY9dZHIf9ZfxwCzGP5em6m4c2Bfdykv1XLIw?=
 =?us-ascii?Q?jEeXXFI8Gd8K3UsP4pDNRGEgSUtM7kz8UvAkNreQsJfSqQWX3pT6LvgbWJj2?=
 =?us-ascii?Q?hcQibrSKJ6q2uvKxnMIU+dZ49hkfsKc/q3bbi1K+kUpSvzN9FBwE5RlbKlYY?=
 =?us-ascii?Q?RDZlkvtS4Q2u8a0ieWq6OM5xzFKfojlze5pS3MdfDVzJhqS4X3Mmt/NYh9pj?=
 =?us-ascii?Q?9g52LU0Gy/XhCsCcjBYP+boD2/fKBSHD7PsOYJV0L2o0H8WnOyL1uKANC4l/?=
 =?us-ascii?Q?t/S+BbqRFpHCuQDHhxDhWxWlOrVjFCHHIvo94ML8oFIGb3+MwkP/dAC9lKGN?=
 =?us-ascii?Q?gpRCjZIHlC2odEKxOrAZBhH6eu23rnsJovENyqaTJdTPHCuTKS74TiYJmWxb?=
 =?us-ascii?Q?t3pRfjGsHvhUmcOKIuqOflCuV20BDVuLK+MyGbNMAY8G8+HOuEtfgD2o2Wn4?=
 =?us-ascii?Q?PhLRvIxf9luQOMH+ygk0lrcm+WDZ/y2CcPSGYbrFrIEgQegJcrRFM+pLAAhM?=
 =?us-ascii?Q?aL04XshkmNuCiz2cfLzolNSxfMdL7fo+EPveTV1rzcUqmM/BIVtfsQy/pC87?=
 =?us-ascii?Q?QwYohxleNj4ZkbUJFvbTe5gOwAe1xr+Z7KPD1vpwkaEA94enA3znOSpSywMm?=
 =?us-ascii?Q?8ezwcH9Ok/Ft6KlUH9VAjbY=3D?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c84856f3-6320-49a4-d4d7-08d9a7e7788a
X-MS-Exchange-CrossTenant-AuthSource: TYZPR06MB4173.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Nov 2021 03:24:45.2668
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: d5PO8x7a+ZgsR+HrP02Atcaw7axjrqSsu3j0+X81VYZ7TWd4dm9KYltpeyQwuuZUz8cxeYpvxZo8g/OF0XFqkw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR06MB3902
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Use the macro 'swap()' defined in 'include/linux/minmax.h' to avoid
opencoding it.

Signed-off-by: Yihao Han <hanyihao@vivo.com>
---
 drivers/leds/leds-tca6507.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/leds/leds-tca6507.c b/drivers/leds/leds-tca6507.c
index 225b765830bd..de8eed9b667d 100644
--- a/drivers/leds/leds-tca6507.c
+++ b/drivers/leds/leds-tca6507.c
@@ -242,9 +242,7 @@ static int choose_times(int msec, int *c1p, int *c2p)
 	if (diff < 65536) {
 		int actual;
 		if (msec & 1) {
-			c1 = *c2p;
-			*c2p = *c1p;
-			*c1p = c1;
+			swap(*c2p, *c1p);
 		}
 		actual = time_codes[*c1p] + time_codes[*c2p];
 		if (*c1p < *c2p)
-- 
2.17.1

