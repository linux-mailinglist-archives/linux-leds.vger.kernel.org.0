Return-Path: <linux-leds+bounces-6160-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 435A6C62725
	for <lists+linux-leds@lfdr.de>; Mon, 17 Nov 2025 06:45:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 29AB74E5179
	for <lists+linux-leds@lfdr.de>; Mon, 17 Nov 2025 05:45:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 866AE30DECD;
	Mon, 17 Nov 2025 05:45:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=leica-geosystems.com.cn header.i=@leica-geosystems.com.cn header.b="lEQ/owiu"
X-Original-To: linux-leds@vger.kernel.org
Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012021.outbound.protection.outlook.com [52.101.66.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19C5C1DE4F1;
	Mon, 17 Nov 2025 05:45:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.21
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763358321; cv=fail; b=PCaKclBmPQfD96fpU58o00dW22ePVLL+TjqRtIu+NhmLnH07ZBE0sqSUwbITIoAM7DFW/LQnSGKVh4jY4ETG13g9Ol0iij0iYX7gOEcFvqGChLmICld+9ZKk5uCV1xQFj7WW5d3B/9WeGWAFhdWrbag1W6H7I/N1d4TIX7C9wls=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763358321; c=relaxed/simple;
	bh=vACgHrfeFmVNItDW9lxdY/QI5yMLWjWZGAGbAyUC7C0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=N3XKabwCufV8XxUpJPLeyXFN4VnrWfS315ZmKemv0ZMUUiixgo5BamW17tvwcPcbVpX46kmT+2ol/SnFNnj32YS2HrkaO8V5I+SPvWnjJEvCQ7avGdrlfBjMmoDjna32iFzdrkuKbpOAfBniDNmDakLb/wIZQfTuuQ6IIZ2MI0Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=leica-geosystems.com.cn; spf=fail smtp.mailfrom=leica-geosystems.com.cn; dkim=pass (1024-bit key) header.d=leica-geosystems.com.cn header.i=@leica-geosystems.com.cn header.b=lEQ/owiu; arc=fail smtp.client-ip=52.101.66.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=leica-geosystems.com.cn
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=leica-geosystems.com.cn
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GkvHm0HZcXGxA3ZcmHK6sNoHTGtw3OiLJLfMjaHDZGvE1xosL5fWacnS3ovWKFEsZLtk9bHwpMfsE2PMWVhkjStuZXWCGq+794hWAmOSWQMTu+mfBcMSNHerOcZ+Xv+z0mwN/XrOpU6fvLAF0sH4QAszRSXxTvBFVCj38Q006oV1LBCH9StaZycoo4IYgqd6pJdMH6Z4/LCyUTxPuhxnvrkGKUqChiYzpk/k2KcMDcF1ROe06QXJ/mdP7Eg7o35/ghnJZnaDiuUbtDIgNrK6kLrtFbRKAt+dkpvWhDSJjU2QkeEEb4sPbq6GsTri28RJlu2Hur78nliDFaJdSLkCqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QZ/XR+f4VqNKi+VmcZlZaojbumXQIUwEtZaxu0XAUWM=;
 b=BLlLoh7A7ufnSxmp/wSeBK99jNORcYkm1k7uRMx4lzXtGY4IlQS2z6g4kp7iZ8SS1EkiXGrIcn0bkgYcTdgt/Gys7mgRuIj4wOEtxnukDQyLqP981BUhkfRc6IPHGuiUM8ujNO0VKVmynkioFmf7+tqixQqdMndu7bn0FPj8G9xHO8wANGQDL3mONl5Kf53mXDe2FTrqcy7YbH21tmeXRU7/A2tqWY8UMGnTOYUNMb0OGtlRULaIAa7yM2cyJRXxDbbdr/NfnvbxM+vdnAO2yzIIKxTrbiqXFiZ3EP2PltU6LYh8QT76WhZGjiPwKKUppanPJiuD89yXDEwhmIsJjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 193.8.40.99) smtp.rcpttodomain=vger.kernel.org
 smtp.mailfrom=leica-geosystems.com.cn; dmarc=pass (p=reject sp=reject
 pct=100) action=none header.from=leica-geosystems.com.cn; dkim=none (message
 not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=leica-geosystems.com.cn; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QZ/XR+f4VqNKi+VmcZlZaojbumXQIUwEtZaxu0XAUWM=;
 b=lEQ/owiuJWJi7qm6KtJJy5GrMMVBAg0dguZV/EVTcAF8OGCn3/Cd0J7tDv5dHKC5KNQUq5wcQbztSj3Rr2MGuozItTXD+gl1TusXGelprJnGYyB28K/tUCCvo/UwrFxjKv0uDK4F7bizJ/Yuc9r/dom0w8/HfA6XICpcgZW6Ez0=
Received: from DUZPR01CA0046.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:469::14) by AM9PR06MB8145.eurprd06.prod.outlook.com
 (2603:10a6:20b:3ad::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.21; Mon, 17 Nov
 2025 05:45:15 +0000
Received: from DB1PEPF000509F9.eurprd02.prod.outlook.com
 (2603:10a6:10:469:cafe::30) by DUZPR01CA0046.outlook.office365.com
 (2603:10a6:10:469::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9320.22 via Frontend Transport; Mon,
 17 Nov 2025 05:45:20 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 193.8.40.99)
 smtp.mailfrom=leica-geosystems.com.cn; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=leica-geosystems.com.cn;
Received-SPF: Pass (protection.outlook.com: domain of leica-geosystems.com.cn
 designates 193.8.40.99 as permitted sender) receiver=protection.outlook.com;
 client-ip=193.8.40.99; helo=hexagon.com; pr=C
Received: from hexagon.com (193.8.40.99) by
 DB1PEPF000509F9.mail.protection.outlook.com (10.167.242.155) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9343.9 via Frontend Transport; Mon, 17 Nov 2025 05:45:15 +0000
Received: from aherlnxbspsrv01.lgs-net.com ([10.61.228.61]) by hexagon.com with Microsoft SMTPSVC(10.0.17763.1697);
	 Mon, 17 Nov 2025 06:45:14 +0100
From: LI Qingwu <Qing-wu.Li@leica-geosystems.com.cn>
To: lee@kernel.org,
	pavel@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Qing-wu.Li@leica-geosystems.com.cn,
	liqind@163.com
Subject: [PATCH V10 3/3] leds: pwm: Reorder include files to alphabetic order
Date: Mon, 17 Nov 2025 05:45:10 +0000
Message-ID: <20251117054511.730246-3-Qing-wu.Li@leica-geosystems.com.cn>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251117054511.730246-1-Qing-wu.Li@leica-geosystems.com.cn>
References: <20251117054511.730246-1-Qing-wu.Li@leica-geosystems.com.cn>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 17 Nov 2025 05:45:14.0053 (UTC) FILETIME=[5873E750:01DC5785]
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB1PEPF000509F9:EE_|AM9PR06MB8145:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: b5fc64aa-c7e8-464b-2c72-08de259c7bd1
X-SET-LOWER-SCL-SCANNER: YES
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?hhC7m15OwPUZJ60Fnw/+iphO5f0Z7N3R1WP5iyfCXzP+WNh80mtPwAL/cCP2?=
 =?us-ascii?Q?blWri/iN/kL+Yr2DQggTpdnDnK5W8QbHcAPP5X0HTxKurPLprMCXt8t3yci3?=
 =?us-ascii?Q?RR0SFfMOFzXn7WeXgVw+Xrh2EHs+NWlzJ1E2rALo6LetxqcQlolYhEtWpz7Z?=
 =?us-ascii?Q?mceXY1Vi+vhnoLUNxbUjUpZeeO5sdWQM/5TDfTxqkAIJ3OjNNje/7yEVN/rs?=
 =?us-ascii?Q?9flJSaUrhWf0Y1CpEDy1jxwLX5End4jjVrRZfYC4tvUJUlS/jbYVMMAGrVQD?=
 =?us-ascii?Q?0iH3e9LUgb4kEgoMFSTkpQ1D4EOAEMNsr90NUaaq8F9YnmSY+gm5YTmstByL?=
 =?us-ascii?Q?GhVUM+LjGg0WRobzkdMLBfkbkjdLZ5h7utew1P1TuHMdYQ27Fa4r/b8x3Oqv?=
 =?us-ascii?Q?z54LKODKov5aF9lxMoMXcEvNDiciTvgmfxRQ6ssVboaKFWNwzn4Np1ApvAns?=
 =?us-ascii?Q?iY29yhX/rUB3TXHpV++K0USpwsDUQO8WvxpnSL+FxGwvdN3JaLf0hrkgdQnk?=
 =?us-ascii?Q?bDreQO/VRuTGTe4dhz4gZgW+DLpuzWIRQKBvF/QTizj7cYy8XD51vCOYcgy9?=
 =?us-ascii?Q?KJifZaNYE7qNxUWB0QLcRw3/LBBItNXr7RX2jgx2uryfvrhzxX8NwYRakNTx?=
 =?us-ascii?Q?9dbqnsWvmUOxiDCLp8xg7sCA2+mwUTj8vCTI/fVk45FJUt3spY3FFch7qOOh?=
 =?us-ascii?Q?nuXMwiHLPnKiZm0nwAvcGM/ou6u7/gSfxFzfKwFySlOhpL3hIw//FJry0dBf?=
 =?us-ascii?Q?F+u9gIh2+c87w8D928KzZ2xYXyLF/GCGo9Q5HOChp90u3ikHBSnIr2cuBHe8?=
 =?us-ascii?Q?4ZUGGh87DLuN0nbtPomeFgcSWlxGfPZxhgt1RKuxteYHIhC+NEuiV0wqKTxZ?=
 =?us-ascii?Q?3Q5ZF18mwwZAPee4lGXka5NlejPQFg7fqVUbUTyzwTlE8adY8KU/+O1S0roU?=
 =?us-ascii?Q?8GmAMvR5eh6vfvy9e3/C0CR01CtWG2fGILJLT8CDZjUR0uDI+4FVJicz2i5I?=
 =?us-ascii?Q?ElyIWJ2yddAMLIUT1xC+iJlHQjWEMlc0ofOmhOwixalden8be/wYAPP2mVj1?=
 =?us-ascii?Q?AlxZtwJWJPCItgEUpUiF0Xcrhx4td2xgkkCDDLbLbacHEH3w2KWz1VaYlzUq?=
 =?us-ascii?Q?GT55+sR05NnrhtpogQGtT1LFEcLJqmXGo/Spfk3xapmx5KKxERY6uK9ZAbky?=
 =?us-ascii?Q?vSRfUarlNDv0lJCBvx3MnBIEWfgkty00VCsOTCzanGtoCWc6OzZpwOXd+dk6?=
 =?us-ascii?Q?ze4CuvQXNyQ81AKDYSZHyInNjVg+Lh+YuZv+maVvpKSpkK2PoW1MAI1RL7av?=
 =?us-ascii?Q?yyu+Ivv6dW7fZya3UMvGydBSbFWsKtcHVpT7zffLi7UVGgnzOzHHsKD6ZbkH?=
 =?us-ascii?Q?r3m8dJN5KuGZLLRusOQcDlxHtaxEAmFnOorIV+uhhDKS3htkBeWrTqp+5Cc4?=
 =?us-ascii?Q?jz8zcIALNYgkXKwua0iIJsCuyoyLeQVNtxTuy/XwX9KU2+BGhhJRtxeWaTQF?=
 =?us-ascii?Q?a9YF3CjzmwmHrhFncbfNx2h6wYUsXy9mxSoniyFA69bTdzcdcrLJhyQmK4Pf?=
 =?us-ascii?Q?ckPsoVBKcN1LRG/tTsA=3D?=
X-Forefront-Antispam-Report:
	CIP:193.8.40.99;CTRY:CH;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:hexagon.com;PTR:ahersrvdom51.leica-geosystems.com;CAT:NONE;SFS:(13230040)(376014)(1800799024)(82310400026)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: leica-geosystems.com.cn
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2025 05:45:15.4198
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b5fc64aa-c7e8-464b-2c72-08de259c7bd1
X-MS-Exchange-CrossTenant-Id: 1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a;Ip=[193.8.40.99];Helo=[hexagon.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB1PEPF000509F9.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR06MB8145

Reorder include files to alphabetic order to simplify maintenance

No functional change.

Signed-off-by: LI Qingwu <Qing-wu.Li@leica-geosystems.com.cn>
---
 drivers/leds/leds-pwm.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/leds/leds-pwm.c b/drivers/leds/leds-pwm.c
index dac96d91e6bf..6c1f2f50ff85 100644
--- a/drivers/leds/leds-pwm.c
+++ b/drivers/leds/leds-pwm.c
@@ -9,13 +9,13 @@
  * based on leds-gpio.c by Raphael Assenat <raph@8d.com>
  */
 
+#include <linux/err.h>
 #include <linux/gpio/consumer.h>
-#include <linux/module.h>
 #include <linux/kernel.h>
-#include <linux/platform_device.h>
-#include <linux/of.h>
 #include <linux/leds.h>
-#include <linux/err.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
 #include <linux/pwm.h>
 #include <linux/slab.h>
 
-- 
2.43.0


