Return-Path: <linux-leds+bounces-5002-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 48FD4AFA97C
	for <lists+linux-leds@lfdr.de>; Mon,  7 Jul 2025 04:08:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BEED218966D7
	for <lists+linux-leds@lfdr.de>; Mon,  7 Jul 2025 02:08:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BCD8B1A704B;
	Mon,  7 Jul 2025 02:08:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=leica-geosystems.com.cn header.i=@leica-geosystems.com.cn header.b="P4LyVKTB"
X-Original-To: linux-leds@vger.kernel.org
Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013025.outbound.protection.outlook.com [40.107.162.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4F5417ADF8;
	Mon,  7 Jul 2025 02:08:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751854087; cv=fail; b=mUlZf5xJN02tgOTxEACMT/NkdPZznk/6jVhrU1Xy3kSOWhD4WulXA7Cpk2F2tnXu3Mf1HJTNIX3UNAspgO7CFX2cnrb3oIH0iza1q9qu/HmwGj4FTrjl6wxLso1aynYkUMMV74NaA2CMsvNTYbs/1SQfK9vFzfXJnS6sJhs0VS8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751854087; c=relaxed/simple;
	bh=bQ83X71Qska3ops2U3BJlrKyom7kEyCVPwPIMyJRzmk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=bCwodGqB9LCEMg4AVY2dC/QGgr4uWleim3SPa2hLs+V4bMEPm6E4mIGAHU37ugmNX4wZoIYX8wVk2XRuXGqZIZSC1Bwsk5EZMLph4TSsOC1xoplZqIbylmWhJFsCIUf60Gq4zb4/AetenF7GH1nf3avjwTEyxSZaIZxJn40e3Gs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=leica-geosystems.com.cn; spf=fail smtp.mailfrom=leica-geosystems.com.cn; dkim=pass (1024-bit key) header.d=leica-geosystems.com.cn header.i=@leica-geosystems.com.cn header.b=P4LyVKTB; arc=fail smtp.client-ip=40.107.162.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=leica-geosystems.com.cn
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=leica-geosystems.com.cn
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XNm/KbHsMnwCvq8BJB/9qmOZ24gMbhQCLHvbpPolEJhXxbFcgwDInBqqmuc014KqDHhUhIw3EpQSkSpuYpP6Lyv6f8gujGX1cq7gCEOE0efXXjYxBJDdYfmIo4jRiQYJKUFCepE/PXZw89W3R6GVC3sAWWh9AL09UjTC+sP1IL20DMiK9+dJfBMlUA1xGJXb3AWQqG2pNXlphRwt8s8Qqdqfyit2f84N8cgAMBUVMJTt+crzIimyImaZsqPe8tnljAPJ6WNKw0nqVu2kkLDFem6ZeRQc2X6vGclA96yXzyXhLXBMnZAbZTQ9FfiAJQA9/21quIwDCOckXGA25ifSYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=n6ygsqB3TfCY66M0iwZWn/eEq/59e7DtAn8RxYrzgrI=;
 b=I1r88jw0S51Xm4xMPCBJEUyDJogtb+NYNpy53mX5nZQ7gOpkVSADJv51Nx8LCRJKfqXkd4RBBB10li4LKsHptxZ+v6QYOaNjb7bz/KoQgsO3B7PMQZOVoK2WJ/t/f8MFIpcu4MfabegrNR4s3ViB6zaCIZN76bLM07yLxBV0ngZLzSbKrWwbJasS5uhU2ObpFMWcY/7vprsfyg5tl/dSjXuoQOViXqb1jtS7KtS5etxUNfLMpzTMSOfXYZg+hH0pgCJxpxfANOLfW36Vz6cR9rB77heO7WuKBF+plmiXcsJ+2abtoF4zgl38saLo8l4xKV2+Nm4jWH0rD17WChzbCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 193.8.40.94) smtp.rcpttodomain=vger.kernel.org
 smtp.mailfrom=leica-geosystems.com.cn; dmarc=pass (p=reject sp=reject
 pct=100) action=none header.from=leica-geosystems.com.cn; dkim=none (message
 not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=leica-geosystems.com.cn; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n6ygsqB3TfCY66M0iwZWn/eEq/59e7DtAn8RxYrzgrI=;
 b=P4LyVKTBBRvda7vOkDQ2A0Ak7mTrp/nWRrKFTSWHC8l6nUWXD9cOFxyKV+ld6BH7btdHtMXNwLn7h1kt2b+F7sz10CSlkPzGgD7otvTGJrMi0IBC1ZeJWILPI4XRJ/rHIpkLl4OUARCQ1XrtHNlf/BDhXVbLgke1utLlu46UKMg=
Received: from DB6PR0301CA0068.eurprd03.prod.outlook.com (2603:10a6:6:30::15)
 by AM8PR06MB7667.eurprd06.prod.outlook.com (2603:10a6:20b:361::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.26; Mon, 7 Jul
 2025 02:08:01 +0000
Received: from DB3PEPF0000885F.eurprd02.prod.outlook.com
 (2603:10a6:6:30:cafe::e0) by DB6PR0301CA0068.outlook.office365.com
 (2603:10a6:6:30::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8901.26 via Frontend Transport; Mon,
 7 Jul 2025 02:08:01 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 193.8.40.94)
 smtp.mailfrom=leica-geosystems.com.cn; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=leica-geosystems.com.cn;
Received-SPF: Pass (protection.outlook.com: domain of leica-geosystems.com.cn
 designates 193.8.40.94 as permitted sender) receiver=protection.outlook.com;
 client-ip=193.8.40.94; helo=hexagon.com; pr=C
Received: from hexagon.com (193.8.40.94) by
 DB3PEPF0000885F.mail.protection.outlook.com (10.167.242.10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8901.15 via Frontend Transport; Mon, 7 Jul 2025 02:08:01 +0000
Received: from GEO-W5CG2253GWB.lgs-net.com ([10.132.33.66]) by hexagon.com with Microsoft SMTPSVC(10.0.17763.1697);
	 Mon, 7 Jul 2025 04:08:00 +0200
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
Cc: bsp-development.geo@leica-geosystems.com,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH V6 1/2] dt-bindings: leds: pwm: add enable-gpios property
Date: Mon,  7 Jul 2025 10:07:51 +0800
Message-ID: <20250707020752.713372-2-Qing-wu.Li@leica-geosystems.com.cn>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250707020752.713372-1-Qing-wu.Li@leica-geosystems.com.cn>
References: <20250707020752.713372-1-Qing-wu.Li@leica-geosystems.com.cn>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 07 Jul 2025 02:08:00.0755 (UTC) FILETIME=[F70FB430:01DBEEE3]
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB3PEPF0000885F:EE_|AM8PR06MB7667:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 5f488194-5f10-44bf-17d3-08ddbcfb19e6
X-SET-LOWER-SCL-SCANNER: YES
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|376014|82310400026|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?6bd5attAwry46dTIPNEHBB0WEU0nLgVTGk8gA12e/wcRUKihyz/CceGNdExJ?=
 =?us-ascii?Q?gjVM44JJ6TGw+IMdcXPViG1/9h+9mFJfpXGYfjDuWcSqCzSgheu9x5XeCIe4?=
 =?us-ascii?Q?L5jQWB5fHHgEk9Y/wd4qyaHlKLnJsOouqOdhTZfp9QyB2XPowTt72hKFF0a4?=
 =?us-ascii?Q?825ck5AkDv0qooyQ4uMrzNqh31ije3evnj8eb6DSazMR3Mg3VDzQ61UYHm0s?=
 =?us-ascii?Q?eAo6wJSSCqlhe2LpEN/KKHSlF9m2l1cn0eIZ3fP1C53/B+rM+bj3KHTI+AAc?=
 =?us-ascii?Q?sv7mKxf4/jvJWPCjk88TUkxAovqjSDCk/dr6sS7cStHVZU6RlBrNaUc28X0w?=
 =?us-ascii?Q?nG2Q28f6+JuM5YeUYmLwj4fGRSKYb16VYuNk5sNS8DADcwLAir7eNu88SYZI?=
 =?us-ascii?Q?70dCrCDFRhOWmSH3KNAZdxwN/u6UecB8gDMR2ivzeG6izpYCtEiQFFJMJUkQ?=
 =?us-ascii?Q?R9/AwG/3JK8JjE6b5P221o/cqa6hhRjhDFL8GHzkMOCFEoICvpTPw9NBbpCa?=
 =?us-ascii?Q?LA6+CJRFaw+zQjIGWSZmat7CPjcdSs/9yWEMjuSgWWGILs1YjnppqX7ZaYpZ?=
 =?us-ascii?Q?jy6JhraauzanCkATT72+BcTgKbmuiryOyGMl0qQqkO/PgJbhuaZyOQ/6X3t2?=
 =?us-ascii?Q?RpgPSmIHE3VSzhVLPCa/b0qZEo2OFRKJ0iuvJ25G4kxYq4tGOSYZXuoWba9R?=
 =?us-ascii?Q?g4zURnYvreYviKGR4pJURY6M8y+woFfFQRU0XqLcKQEdP4gSVB35G8fiuOSS?=
 =?us-ascii?Q?aLF796TUz8S5asyAUFFwUUGO/gJP9pIie0gpp2sBMWj0C4V8lue3w/x2697H?=
 =?us-ascii?Q?SeTuKr+Ff9F0N9eVunzQ+zxG1wLLsDe3sp/BqDv/aP7CG9Y+OIQTYHs9NJAA?=
 =?us-ascii?Q?Wh1s4VPC0agICAlvh5W55fMWcPAV4Xpb30lFO/uaFdfKsUgSsBDpaRlPgoGa?=
 =?us-ascii?Q?zyyW/wB7DBmgEkoyNm7lU7EKHBhSZ5nlmjdGFuQY1iL7LZJcw2B/3um8FCA9?=
 =?us-ascii?Q?zeJMcNUhGooxfKrmT/q4t1od3tFM+ZXUbnb+d4A3qc2+6JXbuVyBZmPv5Mph?=
 =?us-ascii?Q?p3FwB8glUBHeJ0NUKOHT6i7rhhWXPJOTMjmRrniVWSwMQzR40N8Knyu3THg6?=
 =?us-ascii?Q?bm+kZ2h59vojD6jA2oLKSXEjx5Rac5W5YbhAUch1ypcbD7TsdsU0ug8UO14s?=
 =?us-ascii?Q?BGsVZKIB8QDMD5N7lDhW8edL9W/PEAz1gYlZlgWsxD0xfU+xt1vLI9VySe/4?=
 =?us-ascii?Q?rkUJfUIeeC+RiZWoBQ+rghEfHynRckMnyoThrkltffRydSPPThQHVI0fxVU+?=
 =?us-ascii?Q?e5ACHv9ub9KVQrWjAAZcmiBdN8ePeDGuvf5B7HOjGDWqhGLnUn4e1iGJFkRA?=
 =?us-ascii?Q?+oHW9Lextcyqg3kRx33TruVP26pVZGc5Bb38EpWwwSx62IWxyO7xSb3abj1r?=
 =?us-ascii?Q?PJUIqTHG/cvx05Q5r3574Zj1NN3FVQ8saRLvgvX8NOVzzvjZ0B6ssEc3G5AT?=
 =?us-ascii?Q?eYvXCf6Mn/uci+lVsO0pHsn8H+H3hNHElETw+qX2LyZ19ORDRqzzPHPKKg?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:193.8.40.94;CTRY:CH;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:hexagon.com;PTR:ahersrvdom50.leica-geosystems.com;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(376014)(82310400026)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: leica-geosystems.com.cn
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2025 02:08:01.2352
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f488194-5f10-44bf-17d3-08ddbcfb19e6
X-MS-Exchange-CrossTenant-Id: 1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a;Ip=[193.8.40.94];Helo=[hexagon.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB3PEPF0000885F.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR06MB7667

Some PWM LED driver chips like TPS92380 and LT3743 require a separate
enable signal in addition to PWM control. Add this property to allow
device trees to specify such GPIO, which will be controlled automatically
by the driver based on the LED brightness state.

Link: https://www.ti.com/lit/gpn/tps92380
Link: https://www.analog.com/media/en/technical-documentation/data-sheets/3743fe.pdf

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: LI Qingwu <Qing-wu.Li@leica-geosystems.com.cn>
---
 Documentation/devicetree/bindings/leds/leds-pwm.yaml | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/leds/leds-pwm.yaml b/Documentation/devicetree/bindings/leds/leds-pwm.yaml
index 61b97e8bc36d0..6c4fcefbe25f9 100644
--- a/Documentation/devicetree/bindings/leds/leds-pwm.yaml
+++ b/Documentation/devicetree/bindings/leds/leds-pwm.yaml
@@ -40,6 +40,13 @@ patternProperties:
           initialization. If the option is not set then max brightness is used.
         $ref: /schemas/types.yaml#/definitions/uint32
 
+      enable-gpios:
+        description:
+          GPIO for LED hardware enable control. Set active when brightness is
+          non-zero and inactive when brightness is zero.
+          The GPIO default state follows the "default-state" property.
+        maxItems: 1
+
     required:
       - pwms
       - max-brightness
-- 
2.43.0


