Return-Path: <linux-leds+bounces-5988-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A8F24C34166
	for <lists+linux-leds@lfdr.de>; Wed, 05 Nov 2025 07:50:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1142118C1C1A
	for <lists+linux-leds@lfdr.de>; Wed,  5 Nov 2025 06:50:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F2F2C2C21CC;
	Wed,  5 Nov 2025 06:50:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=leica-geosystems.com.cn header.i=@leica-geosystems.com.cn header.b="Nu6iUWPf"
X-Original-To: linux-leds@vger.kernel.org
Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010047.outbound.protection.outlook.com [52.101.84.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 037C02C0276;
	Wed,  5 Nov 2025 06:50:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762325422; cv=fail; b=bmNgTIbajSGVrJ8QmI5sbsv/aoRZxuVvHSlrZF3rBjDFfR7PASgql5+adLm6OzgR7xGkdRc3iKPX1vZ+opmStfi4t29K5dE+I3QRC18DjA9LSbukZ6nRgZBqubvbglRwP2LduC3uRI7xKxPcJgPusk0R6VFlo0ub38no9qhzO+0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762325422; c=relaxed/simple;
	bh=vV2w4mP1Nfqhk0WLKbDe/z7+CXzwC3x6YxVOkf0QYz4=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Z4XMPG/+rRKCGf2qYda1IGYnJX0Uq3LVTnGldJbCOEySe2EDurgQZ6m5I76NxbTfdV0q8BZeKeRNBOkPuQQzWKfPKKJU0iJ53tY0kB3dzuJA+VR3gIZiEHLWIhUPTa8O6A3qri99FjBVfniHfZxCZl/dDLn3xe3I5Sr39i2Kb/8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=leica-geosystems.com.cn; spf=fail smtp.mailfrom=leica-geosystems.com.cn; dkim=pass (1024-bit key) header.d=leica-geosystems.com.cn header.i=@leica-geosystems.com.cn header.b=Nu6iUWPf; arc=fail smtp.client-ip=52.101.84.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=leica-geosystems.com.cn
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=leica-geosystems.com.cn
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TVOkGkR3IvQXI3WyQnaFQqP5GC2o5NLE3V1zs3rjd+fT/Ayl59JHhNgrcScV/zwh2knv7VQuaETQjJ5NAWipL4eNdrB6pOZNl/93a8QF8mXb2rQNk4tyXk5sPIIkohI5tV+ZBRNq+rAcCqjpcQvvFRzHFOiGwykiS4mQrqEuAmOvJBb7Bd7OuJr0fPMBxqYJZnP2ex28ZV6ZMGpn58jOvx0QheQ8kgSZMVUv586IgLn7+gJSSe0IjkHL/Jj625Ldh1AfxSmN0Dzb9H2qDReABJ64RxD8Lt8Mre/QSgOtdLaj3Xg22Sd99VjhbjkXwhtv2qBD2CQ/3jBfTOhl69h2qg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=luA3N5y/jtsGzIED+hRemABSANcggBu64Gf4MLdoLdA=;
 b=JciZxxvUGJw4Mr9BXWYfSnI1d75AV0q/jVXRvxlJ+0ouoBM2R7H4h3COxSUh0j3y5ZR4soU+GmCLlpxsK/vGOCVyJus19rNh8A8EiGxzwYPMG+scgl67RhfGBIQ+skdN8iZlcijnnKR4d7fCMSpGaA442/P9gNBtLMkaywRVeW/d8jObWFYrMKNWlI5NKBHNvdfq/HfMC/utiw40tRcuJYG4xwTInayHaluTQxSBKqeesOtovkpKcxpYakyy16QLg/rRWbtv7GxMMcgU2NLyj3a0XSDMpRvzFviUpd1TDLfzRmodmOX7Mg+DyIhNbWO1CFj+7yjDziKeDB3GEL/pzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 193.8.40.99) smtp.rcpttodomain=vger.kernel.org
 smtp.mailfrom=leica-geosystems.com.cn; dmarc=pass (p=reject sp=reject
 pct=100) action=none header.from=leica-geosystems.com.cn; dkim=none (message
 not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=leica-geosystems.com.cn; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=luA3N5y/jtsGzIED+hRemABSANcggBu64Gf4MLdoLdA=;
 b=Nu6iUWPfH5bd6tgJZ/CqKNFKgiiyO0HikSE91qu+JHEeKmPXqsfqpzKvi97mSZWen2f2laV05xWHRqex8b+4tojHfs8WNOmV95alLIt4w/ueUlAMFNQPN8je/Jgmmt9PbldGv+vhf3fOIW+1o4XGocTzI+wCC1YNleRjipEzBUA=
Received: from DUZPR01CA0063.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:3c2::13) by DB9PR06MB8057.eurprd06.prod.outlook.com
 (2603:10a6:10:297::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.8; Wed, 5 Nov
 2025 06:50:17 +0000
Received: from DU2PEPF00028D0B.eurprd03.prod.outlook.com
 (2603:10a6:10:3c2:cafe::3f) by DUZPR01CA0063.outlook.office365.com
 (2603:10a6:10:3c2::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9298.8 via Frontend Transport; Wed, 5
 Nov 2025 06:51:09 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 193.8.40.99)
 smtp.mailfrom=leica-geosystems.com.cn; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=leica-geosystems.com.cn;
Received-SPF: Pass (protection.outlook.com: domain of leica-geosystems.com.cn
 designates 193.8.40.99 as permitted sender) receiver=protection.outlook.com;
 client-ip=193.8.40.99; helo=hexagon.com; pr=C
Received: from hexagon.com (193.8.40.99) by
 DU2PEPF00028D0B.mail.protection.outlook.com (10.167.242.171) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9298.6 via Frontend Transport; Wed, 5 Nov 2025 06:50:17 +0000
Received: from aherlnxbspsrv01.lgs-net.com ([10.61.228.61]) by hexagon.com with Microsoft SMTPSVC(10.0.17763.1697);
	 Wed, 5 Nov 2025 07:50:15 +0100
From: LI Qingwu <Qing-wu.Li@leica-geosystems.com.cn>
To: lee@kernel.org,
	pavel@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Qing-wu.Li@leica-geosystems.com.cn
Subject: [PATCH V9 3/3] leds: pwm: Reorder include files to alphabetic order
Date: Wed,  5 Nov 2025 06:50:12 +0000
Message-ID: <20251105065012.88796-4-Qing-wu.Li@leica-geosystems.com.cn>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251105065012.88796-1-Qing-wu.Li@leica-geosystems.com.cn>
References: <20251105065012.88796-1-Qing-wu.Li@leica-geosystems.com.cn>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 05 Nov 2025 06:50:15.0156 (UTC) FILETIME=[70BBFB40:01DC4E20]
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PEPF00028D0B:EE_|DB9PR06MB8057:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 4a485de1-ebdd-40ed-5c0c-08de1c379480
X-SET-LOWER-SCL-SCANNER: YES
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|34020700016|36860700013|82310400026|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?B4u2K0MM46wRIH71xknVMAggtihebnrhUFqVkmdPQ5pWviLaXCrNHmGN1s99?=
 =?us-ascii?Q?Khyp7tPRVaxJZLDXXV1u2fMu8T6nHXDV524U/4H/MiXhYz2Ner4kks4Whjs8?=
 =?us-ascii?Q?9XDh0tZoYsF+cavQ5QeDt3g1HbILxyHIHANLwWiwQ7nP1mh0BSqFktR3aCd/?=
 =?us-ascii?Q?twTQefknSsNVeqqskZjIp8o1PNivvm2pBFe1JOcK2KB9eFYe2AJQm917H3Zm?=
 =?us-ascii?Q?TAizbUkIuolyuX0S7+jPS8YqF7tgvAYR7YxdITzTlG0DaklVO/G9VMowkcPi?=
 =?us-ascii?Q?NCjGVZ6OGhSzU6O9PQqywYzSlDhjbAEg0jcl0DbiOnhDt6j5ixtGe4h9NQZU?=
 =?us-ascii?Q?a5wTKvZk9TWDZGDTV7lXVZXPBbuKcmvEueEjiruCVDzgqC2tTqtRb1HSuwXP?=
 =?us-ascii?Q?heti9Xb93nIAFlJxbKDusxq2NisGaCLByzXS8LIhAekJrRhE9SMSdvdNiTgY?=
 =?us-ascii?Q?3SJj6PwNjifC+aoD5KsUh8E7tYMIByVTt9AnhIsy1U+bZk+pgoq4cpBWFX7s?=
 =?us-ascii?Q?3WjKJx0PS2KpghDFz1r3xFIARKqAZTYQ3SBdHkeaMMtk5tmqySkohs+xnQzs?=
 =?us-ascii?Q?hFyOf/Mtv3hBB6FmkuJF11bgeZkdoiLenBqT4Sbbj+uzEoUw3ViHlomEM+gz?=
 =?us-ascii?Q?tgmgmFA++vjIqnlMGTKQQqU7fh4x8F4njhWr2xhQJqk4cEOYYBG42YLErpch?=
 =?us-ascii?Q?byvzW2qfH0+MexuEo9wg8KzF8P5OiBA7j+cV6rUXM9IQOZ82opa9zXJ4NbGz?=
 =?us-ascii?Q?RmzXCABpEn/tRTzzoQZrK8nBxUID9EHGC8EQQ54wiIf+eWyJdRbhmSMhZW1C?=
 =?us-ascii?Q?KmPl3lnU1cWXxX0FuRqYQoe9l4+YmeNNprj18sQVKYlV2sMSupOaWW+3fxQZ?=
 =?us-ascii?Q?I/nCKyY3NKVllNjNG0sQXt2dIGA11kiAC5sU4tUkxsoVrLLxJvWpYO36Cv2u?=
 =?us-ascii?Q?mG0pINrT9CahZEY0SMmMKLOMVoTOcEUVBSeFyBvIUbpzw5w1c23Mul/Yempx?=
 =?us-ascii?Q?q6u+HjzFIHqJAo+K21KK4Swi1zYmumUFbnPrxyak4AdDcRlBw9mg2eCvoC3q?=
 =?us-ascii?Q?b1n7FN8ivUIbF1rl/FBpxEoNhbYlzmIu8IDg+nEnR4y8LlliucJSMLAfY4DV?=
 =?us-ascii?Q?9gNf0JGdtkWILZtgpdIFDJ6t0qdUWlIjSsKJuRySPEZwMPgIRzAI6Pwk7bpp?=
 =?us-ascii?Q?ZIfDslbqEjZZulED1jvJV7TGUgn6tdrhKbrXYSmiaCUrD3Z1BvLv9Ge5ViXk?=
 =?us-ascii?Q?Z+GC0lsxMEtt65m7GlnYmPnEptLoIkdoiEN48gAsOE2WQXY48738P0pLNeru?=
 =?us-ascii?Q?87zt9riHt5Rbwxdog+zc2wpDdQRss3dVNz4XuOQlxCKClklLst2/UtU4sFNh?=
 =?us-ascii?Q?WTSniGAvA/SSTWzTRE9vw8kGm0gt67WxJ8n34kxgir7KFU1Ji1QWM5vCvt2x?=
 =?us-ascii?Q?sUHHL7yJKA/oNvPxRjetkjjTPmXRfsRVyPdJBvuwJwrDT3LHYrwwkWns4lXD?=
 =?us-ascii?Q?aIISHALMWM3bTWBLsRtTCtGGxxlOJm1baRg2lL/r6DZ+gx+tWLb/oxesMefZ?=
 =?us-ascii?Q?i9l6tCJNjB2W516SwcU=3D?=
X-Forefront-Antispam-Report:
	CIP:193.8.40.99;CTRY:CH;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:hexagon.com;PTR:ahersrvdom51.leica-geosystems.com;CAT:NONE;SFS:(13230040)(34020700016)(36860700013)(82310400026)(376014)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: leica-geosystems.com.cn
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2025 06:50:17.1960
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4a485de1-ebdd-40ed-5c0c-08de1c379480
X-MS-Exchange-CrossTenant-Id: 1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a;Ip=[193.8.40.99];Helo=[hexagon.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DU2PEPF00028D0B.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR06MB8057

Reorder include files to alphabetic order to simplify maintenance

No functional change.

Signed-off-by: LI Qingwu <Qing-wu.Li@leica-geosystems.com.cn>
---
 drivers/leds/leds-pwm.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/leds/leds-pwm.c b/drivers/leds/leds-pwm.c
index aa9e14d912bf..dc68f993545a 100644
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


