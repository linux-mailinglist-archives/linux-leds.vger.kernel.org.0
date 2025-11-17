Return-Path: <linux-leds+bounces-6161-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 73683C62731
	for <lists+linux-leds@lfdr.de>; Mon, 17 Nov 2025 06:45:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id ECA723B262C
	for <lists+linux-leds@lfdr.de>; Mon, 17 Nov 2025 05:45:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CBDF730F7E0;
	Mon, 17 Nov 2025 05:45:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=leica-geosystems.com.cn header.i=@leica-geosystems.com.cn header.b="CIjdLtMv"
X-Original-To: linux-leds@vger.kernel.org
Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011063.outbound.protection.outlook.com [52.101.65.63])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B52830C344;
	Mon, 17 Nov 2025 05:45:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.63
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763358322; cv=fail; b=uSH27rNY3x715/uGpeM+/7bkCEMc0P5ewl1AEewahturh4c4SDCUb/rmqlgHeMFwqOr2oFJ/51+W5TlHjoYxr2a84h5I5CqCD8lhIFAMyW3CgI2C0rfunBaehTIS+0ndskSr+XB4ELtIzZmIJPO+rL5kuaSjnEu+L4VNtqqS3FA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763358322; c=relaxed/simple;
	bh=oYfwm+2edq5AB0/ahRxgKUjwsN89t+6SzS0Ze9i7tkY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=PRF0yTldb0XSEGsMAWAC0WCee4k0QNE3VW++6fgUqqQQCW+Ms0Pizwr6d+eoYLiZOkWCI66z6iHOh0KLQhV7bMixXtqlgAIvQ6YGjzsn/DSCa9n7rmmaR8mEiVt6G2JHzGHmUWAy3PMi1fOhrAUjWITZ5lGphpXpySlYQMrLbnE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=leica-geosystems.com.cn; spf=fail smtp.mailfrom=leica-geosystems.com.cn; dkim=pass (1024-bit key) header.d=leica-geosystems.com.cn header.i=@leica-geosystems.com.cn header.b=CIjdLtMv; arc=fail smtp.client-ip=52.101.65.63
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=leica-geosystems.com.cn
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=leica-geosystems.com.cn
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=W288LXuiDbZa5YvyJFDegq9GI0oaW1QLv1j4SHfWTLZWrbr0topMb02YEqfOwIng/s5UA3RBZxDKFBFa0+dN7jNgq3D7+tVU1VlmVpgdWoY/9A48oPI1D/cNeKiwHftnMGCk4bKP5Vixg81fh6wZ2gEjOm8NSAnDNxdlX8G+T3L0X6elmaSUhOPuxlhoYvb5pQXD3FwwnOllvnFO8XWULldDwDQ+2T/4AYdFZIDneBN64XhThGRR+31wGEcjVZwt6wSXNjkSMQvnw3WiGP+gUv7+ppGwm8nupHMOPVU1p9WTJ9979A85tlJdtEG7MwdExiroTm+7nN2IzcfjCGuTlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UCGekY62HkyNk88T7V0W61jgRiWU31Dy7Oo8hUV6NYI=;
 b=E0hxxdvQEh1qpIzm9rNxNwRKVsNgRVnvOxTXTHMZQA2RTtpo/vcWTBArIVTgn7Y/icq/N4QLGANdkRHxJHLpfII4ACh/a4FCPil4lKu7s5/yUwZzdbSLVCysq7CWhDZ7RHjKoky15VL0Y44eDB0bA+b53+nnfCdIHGEoJ+1IZUMRhlpDtvCni4iUg3MWEDuy6MOsPjGacs7Nrz1tNsOoFGjVtIt1A9vyx+XuhJhU4y9+sEGT1HGeOtY62kIOPx+8jgHT+YUwguDIrfussuB45S+KyJ3EE13OAo7o+XcZUVNch8azec+nMnf7ROyLXQteToLZPoxDea3px6X/GT4vHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 193.8.40.99) smtp.rcpttodomain=vger.kernel.org
 smtp.mailfrom=leica-geosystems.com.cn; dmarc=pass (p=reject sp=reject
 pct=100) action=none header.from=leica-geosystems.com.cn; dkim=none (message
 not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=leica-geosystems.com.cn; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UCGekY62HkyNk88T7V0W61jgRiWU31Dy7Oo8hUV6NYI=;
 b=CIjdLtMvSFd+s6d6bSNupi/sUIq3/6MqfKbidkwyB2tHKGp52IWBndnpNzjYt65NSATzSDZwulz/vLpWYt8DqSo68Og92wI48uGbjjM7azdHgSdmjk6OtM+JvRayoIenh33LdMpMkgQyaohC0bLydTnGoIGvRZVBM9VN3Pxcwwc=
Received: from DUZPR01CA0049.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:469::9) by AS8PR06MB8070.eurprd06.prod.outlook.com
 (2603:10a6:20b:3c7::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.22; Mon, 17 Nov
 2025 05:45:14 +0000
Received: from DB1PEPF000509F9.eurprd02.prod.outlook.com
 (2603:10a6:10:469:cafe::dd) by DUZPR01CA0049.outlook.office365.com
 (2603:10a6:10:469::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9320.21 via Frontend Transport; Mon,
 17 Nov 2025 05:45:11 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 193.8.40.99)
 smtp.mailfrom=leica-geosystems.com.cn; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=leica-geosystems.com.cn;
Received-SPF: Pass (protection.outlook.com: domain of leica-geosystems.com.cn
 designates 193.8.40.99 as permitted sender) receiver=protection.outlook.com;
 client-ip=193.8.40.99; helo=hexagon.com; pr=C
Received: from hexagon.com (193.8.40.99) by
 DB1PEPF000509F9.mail.protection.outlook.com (10.167.242.155) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9343.9 via Frontend Transport; Mon, 17 Nov 2025 05:45:14 +0000
Received: from aherlnxbspsrv01.lgs-net.com ([10.61.228.61]) by hexagon.com with Microsoft SMTPSVC(10.0.17763.1697);
	 Mon, 17 Nov 2025 06:45:13 +0100
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
	liqind@163.com,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH V10 1/3] dt-bindings: leds: pwm: Add enable-gpios property
Date: Mon, 17 Nov 2025 05:45:08 +0000
Message-ID: <20251117054511.730246-1-Qing-wu.Li@leica-geosystems.com.cn>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 17 Nov 2025 05:45:13.0928 (UTC) FILETIME=[5860D480:01DC5785]
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB1PEPF000509F9:EE_|AS8PR06MB8070:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: d17ea725-3fd6-4593-a0ee-08de259c7b19
X-SET-LOWER-SCL-SCANNER: YES
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?6MYfwOw8FvgudoiPaA5dhUDHcyC34+BZe+uyQRIuGn7IuT2LYv3zxVgL9Es2?=
 =?us-ascii?Q?tWe5MdU/9GhxpCHD5G7hd5LohICKbcCTWO9reG59ng3L9Ewj0PcKP2eIobXd?=
 =?us-ascii?Q?vJ9ZUlQLTt0gnlx5vguzTGua6y8bc+g1yqPVOhFaa5D+oqwwLVG22lBZuXga?=
 =?us-ascii?Q?rGjXQb1VsJDzbBzcq7RhLifCm6vnn4MU4E7gBTRoGBuobX5guyTAGdDZwnta?=
 =?us-ascii?Q?0XjiOQWjZCRAibToJ59LmBOwDa4RI3609/8JymaXksZN798vxtaGRqkroa7Q?=
 =?us-ascii?Q?l/VHV/jt+qIiaHIJ/gh4EGcNjt/3M/oLFmGAYEj5KBZvuJD5xVSroAIWbskT?=
 =?us-ascii?Q?hcE479QEw/bwkezGP6GGzhf3ZGngWq+noEs+88Uf3dlG4Xh1MGBOij9mneI4?=
 =?us-ascii?Q?FGUJSSwUJDeAcZTwEewm+uBmxqt1b3BdbqGZ0Kbxt9f3GaQJuuKx5LNl6uSt?=
 =?us-ascii?Q?l3PzqU5a9qG4Z5vWX9UV0E+zahbht/dTkZHeiXtegC8+lGbUkavYq3DS42UC?=
 =?us-ascii?Q?eL3sWxAP+8AX1BSfTEAej5lEEL8TEUEsqkHS+dmthD0UVJahPsameKXNJfAO?=
 =?us-ascii?Q?GS7ZQh3c69cwl8JEcx2FstmjmSvO3IwmgR3Qmsf3fDjMN1Zmybb8fl/jTRqx?=
 =?us-ascii?Q?sz0wJnUwzmx5otMC8ybb3iFPyNaFazlUDpD3nL3M3I1UxQ+2GUSWV1+Hw7Rn?=
 =?us-ascii?Q?GWzWXlSSO7bzvHznAyzNDDLLxJyl5SwXMw3ydCOfScFI0hh/UntlJPVwS6gI?=
 =?us-ascii?Q?KiwPX/WA1hZt3NPveuenB/Ni2A74od4rPsM1kUTS4+02DcCsgPLI/xv5GuvW?=
 =?us-ascii?Q?1KFoIXa3mqPGfjKUkCoZ6gUVRg1+b5rX1CLn12FTHWlzV4oAICvHds38b6i/?=
 =?us-ascii?Q?OPFuPTGGaheR2RGibXk09Qpx/xrSY0AcbMZj5Xe6jMgSbMgUeZJx1HZuVb6B?=
 =?us-ascii?Q?oiBoZFuNApvcda94XssLhf+at6hWLr+sNvGfHXOnEu1C6daEWsKWORnq4RiM?=
 =?us-ascii?Q?qC5WMqmjExeUfrY8KQI5Jb1jN8piXK8QKb9s5gTftKp5sY3q9VuN+r+Ck0NT?=
 =?us-ascii?Q?jUU1pADJq2D/4KqNheYmtY2fddyHoAQcihsHSYIykufMkbOAXdD6CRVG1Ce0?=
 =?us-ascii?Q?UvhLtZ1WnbU0M0+3oBH+L8AZ7snOS+qUcouKqI82ExJgcdPqhxqcdidwf8LR?=
 =?us-ascii?Q?oFQ8ee6S+5JBTD6EvVUqb6VlKSoJqI7xOcPJgJXrwXpCdOIVdwxNVvvVwIOh?=
 =?us-ascii?Q?RsSw4NhpKlAU5pTVx0wPo8X+WInIT27o35A0H3vbwWnLY4UpmOC5vhkuSo3w?=
 =?us-ascii?Q?0virGSe/66u0tjOAlbCopIL6BAp7Y8/NR1RysPF00O4eimolA2BgIYNs8WmN?=
 =?us-ascii?Q?UtpfZRAvcq6cJzZ7QQY0z7BXr2Bd6RrFcee8kTWfJDa6pj/mmCJH1ugahnSy?=
 =?us-ascii?Q?Zraoi4McEGswY6oxwqoQ9o+noSVWZ06J8mN8M/DUitnaSUiXM8XBbmzXV4DL?=
 =?us-ascii?Q?+khWvX6025PIfxu/NJexn0ge+NYVhduZrLjjecwFpHj/tgACo2JjMJx5eZKv?=
 =?us-ascii?Q?KMWXsfqZL7JeUEr1RHs=3D?=
X-Forefront-Antispam-Report:
	CIP:193.8.40.99;CTRY:CH;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:hexagon.com;PTR:ahersrvdom51.leica-geosystems.com;CAT:NONE;SFS:(13230040)(82310400026)(376014)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: leica-geosystems.com.cn
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2025 05:45:14.2187
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d17ea725-3fd6-4593-a0ee-08de259c7b19
X-MS-Exchange-CrossTenant-Id: 1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a;Ip=[193.8.40.99];Helo=[hexagon.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB1PEPF000509F9.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR06MB8070

Some PWM LED driver chips like TPS92380 and LT3743 require a separate
enable signal in addition to PWM control. Add this property to allow
device trees to specify such GPIO, which will be controlled
automatically by the driver based on the LED brightness state.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: LI Qingwu <Qing-wu.Li@leica-geosystems.com.cn>
---
 Documentation/devicetree/bindings/leds/leds-pwm.yaml | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/leds/leds-pwm.yaml b/Documentation/devicetree/bindings/leds/leds-pwm.yaml
index 61b97e8bc36d..6c4fcefbe25f 100644
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


