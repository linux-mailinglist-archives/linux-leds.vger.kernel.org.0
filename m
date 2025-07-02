Return-Path: <linux-leds+bounces-4956-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id AA91BAF1477
	for <lists+linux-leds@lfdr.de>; Wed,  2 Jul 2025 13:48:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 688621C28147
	for <lists+linux-leds@lfdr.de>; Wed,  2 Jul 2025 11:48:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 899C52609C4;
	Wed,  2 Jul 2025 11:48:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=leica-geosystems.com.cn header.i=@leica-geosystems.com.cn header.b="am2MosiN"
X-Original-To: linux-leds@vger.kernel.org
Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013049.outbound.protection.outlook.com [40.107.159.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A47612C9D;
	Wed,  2 Jul 2025 11:48:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751456892; cv=fail; b=dRw1RY9sCh/1WoEuQtBSOmGn/OcjU/sg4m4iEgG+8QG+mP5to5Bq1f66wYr7Jgj2axK8KcdgG5QzbYJvBwMH0v4C/ZASaK0zKx/WUT1Oc8oZb9MTZno4cslYdXS/FcRQ3ogtGB9mvntGr3X5UGQRBs7SVFS/uH6jdmX2n3xS7/o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751456892; c=relaxed/simple;
	bh=wVH+8cFtNx1V2ck+eDdeU+T+XxWg44sUrFzbRm7B5gw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=CsUD+ey+xLsPzcwyUAJa+yqfOgHjHKCJJ67TdxV4d3ECmth9GbGOY8g0hUN+5tZzvRULy/jo6qTTQFm9+f9WvkpR/6UUsi+1abiU5D7pqf1PComY/I75ZjyqWRJRcTXxpKr5rf83KPeF/kntRe7H679NPgabyDkb2bDcoHLLY/U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=leica-geosystems.com.cn; spf=fail smtp.mailfrom=leica-geosystems.com.cn; dkim=pass (1024-bit key) header.d=leica-geosystems.com.cn header.i=@leica-geosystems.com.cn header.b=am2MosiN; arc=fail smtp.client-ip=40.107.159.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=leica-geosystems.com.cn
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=leica-geosystems.com.cn
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KgnGBDAkMYk6EpKZjAd+WJ2Ipl+uJSfLl4h9yf9nJKYk4U3WEJnhu5YQ4eWJYUXfMrCcipJcP5Kn6Jq85RKAOV4zXU2iTgsICIDXOLSTWOrIEnouSNU4r2wnhE0M11IQa1ZVvYXjJxVnBDfgq/vex+JPWKcJuo4Jfl7F3x/Cj+94FFuW+RwBeNMxJpT17yQXKuWpCReDGdUs6dU/cUx6N3E8bDCgKXtPuQuwysbPmLcjdpZSIe2rwkyXwlieArTsp0Wo/JhKwZ8JASVFGAqqM4KY5tSr5jm1yALT0KLHpdHOm1eSH6iqnO+B+AVXs1NMJ3OJueWqkHKgMNV0RntTNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xo9Z+XK34hJZczwAcldIfvykgztqu0kNKu1iXmcDtFY=;
 b=Sdkh7JnK159FROSq8TPrlibbFsSnwNfKDESnlLX6r6Vp91Olxzal72BXY7ZgFplxliQhLUGjNvxPd8V+6jseY7NC+y+HtLh3gH550QE/etEAk6VZaluAOs3VvXr5WtXw0R6gF0JVDR/yCKSRaiXB/+sLXWNcnWHLZL0yxwBzR7nxKjgg7sTrs1bkVLeTgBXHJR85hUIxibHqZATWHhycjyZ4yv7lAi8j4BnRRiWXffgfbpvYZneX3sE29ZsfiWFmBiZY5DW5XwOeFr1Y0PbletnxY6PwaN9Q+Dia01wunxyEgCxGlkC+Jz2mzXrWzaAzJKM8FS+BxJWECBmh99ZJMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 193.8.40.94) smtp.rcpttodomain=vger.kernel.org
 smtp.mailfrom=leica-geosystems.com.cn; dmarc=bestguesspass action=none
 header.from=leica-geosystems.com.cn; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=leica-geosystems.com.cn; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xo9Z+XK34hJZczwAcldIfvykgztqu0kNKu1iXmcDtFY=;
 b=am2MosiNRoy4wCmmrGhntARYXU+MXy7voDnC/lGqO0WOYIXWTNXqQKEwd20J+4xP8iRh8oTFHk57+l+WvPINdGKcWwJIfcBd+/NoJpzLV5Wo9xy+6mTSIqMI/J3jEeofHJV3vClUNfkzpH618JUOs7J/038Ls7y6HCEiJoPa1rg=
Received: from DB8PR09CA0028.eurprd09.prod.outlook.com (2603:10a6:10:a0::41)
 by VI0PR06MB9634.eurprd06.prod.outlook.com (2603:10a6:800:216::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.31; Wed, 2 Jul
 2025 11:48:05 +0000
Received: from DU2PEPF00028CFD.eurprd03.prod.outlook.com
 (2603:10a6:10:a0:cafe::15) by DB8PR09CA0028.outlook.office365.com
 (2603:10a6:10:a0::41) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8901.20 via Frontend Transport; Wed,
 2 Jul 2025 11:48:05 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 193.8.40.94)
 smtp.mailfrom=leica-geosystems.com.cn; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none
 header.from=leica-geosystems.com.cn;
Received-SPF: Pass (protection.outlook.com: domain of leica-geosystems.com.cn
 designates 193.8.40.94 as permitted sender) receiver=protection.outlook.com;
 client-ip=193.8.40.94; helo=hexagon.com; pr=C
Received: from hexagon.com (193.8.40.94) by
 DU2PEPF00028CFD.mail.protection.outlook.com (10.167.242.181) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8901.15 via Frontend Transport; Wed, 2 Jul 2025 11:48:04 +0000
Received: from GEO-W5CG2253GWB.lgs-net.com ([10.132.33.182]) by hexagon.com with Microsoft SMTPSVC(10.0.17763.1697);
	 Wed, 2 Jul 2025 13:48:03 +0200
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
Cc: bsp-development.geo@leica-geosystems.com
Subject: [PATCH V2 1/2] dt-bindings: leds: pwm: Add enable-gpios property
Date: Wed,  2 Jul 2025 19:47:58 +0800
Message-ID: <20250702114759.223925-1-Qing-wu.Li@leica-geosystems.com.cn>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 02 Jul 2025 11:48:03.0931 (UTC) FILETIME=[2B4E2AB0:01DBEB47]
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PEPF00028CFD:EE_|VI0PR06MB9634:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 26cc3d51-b585-445d-e778-08ddb95e4e21
X-SET-LOWER-SCL-SCANNER: YES
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700013|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?x+jAomRRfUGpcSylmI73WZZQtciOjycDoVtB0RirbNiiJPAZyjeEkZZhfwjl?=
 =?us-ascii?Q?jbyWqB+L2H2pBZd+LcksPbjdeQR5kKsrDEHTN/SNHRbPI9paVeKXavWUgSBd?=
 =?us-ascii?Q?K7CV2Z4eAlp0WurWMC1FwR6NW/LytNig83MOzp/7ForyEcS0pylOOuo1iv4f?=
 =?us-ascii?Q?oyhmDd8CFH2Zi+yxNhpJRf1lXh+XYW72X39uWNeQUvbeRtuwm9xN+NPIX4qU?=
 =?us-ascii?Q?5C7mbjansi/45DmQHiMYCg6sDZzsrX12XlAoQpTtw0MBe56oYMmlqE8yhgLE?=
 =?us-ascii?Q?yE/Ppyq/sOXEzBaiGh3v6ZvxdPsJ9mYYh0VknyH5SOBzzJWbqkXb5fnxxwr6?=
 =?us-ascii?Q?2BVsenn4kbJkxtTtG1urnknEBYWSB13GcG7UdwZreLnPkPPQeKE1ItTNQTjP?=
 =?us-ascii?Q?QL+ptd9wK50KsupN5Q/IBx4H8mxA+TAO99COO0FM9MUYZE4+E7iJldt6naTm?=
 =?us-ascii?Q?xplbhQUpZg+hqY70G+odrIsTE5MVTYQ2HZ2Z/Tnr1TaOuOlqFAo8Xf8AWlp6?=
 =?us-ascii?Q?WvrT/q0iKoy8XMTwHqrWUK3YDloafdBR6okFcLkRz0Wt6WazrA4MzbHZPsmm?=
 =?us-ascii?Q?GBENuKKfhwZvm1BSQcxE6vFDDwE4LNw/dO2Ry65BmYreqT8VWEW8Ms8VI3cO?=
 =?us-ascii?Q?obcOSdkCszJVNX9noJLS/D1bJ5ht+8Jp0ZT6aM7OY8MOs+PnNJybGudXQdpq?=
 =?us-ascii?Q?nUpQdeUO5pkBg9wTuYYS6diGtM+trBFwGLf7WVy9ilfef4s4YQ2rLJihM/zR?=
 =?us-ascii?Q?q77UwUc1vN7c6OtTMaopQcsGgpRfE43wKlsmDHR56uAGQxu85DXU+y25kPdC?=
 =?us-ascii?Q?yzJjuA/ZwghGYHh3EgMSzspicAwE6gwb5aI5ergeFckzVxMqmyHVAyx+ExuK?=
 =?us-ascii?Q?mrZKCC6a2kGRAbk79lq0OZty+kT/4WWSQ2SsUHM27qCYWg2FYXUY+NR3BeCI?=
 =?us-ascii?Q?hr2zEVtnKMFRbGNOjEXT3VIWlTwsnJOq6ksUrU5IDu8s3frq7Ep/1QnHx3pL?=
 =?us-ascii?Q?zuEiDFRyv0XdBYaCgK3BHyk0Nq6nx3gd5waYgYxgidfxnKxwU81Xfq2Lq1aN?=
 =?us-ascii?Q?B8q3CHoJ1xiJmOhLcdYVcx1NzLBj2HkXVPgnSWQ6qHGtPBsVPyw86U9Qcsux?=
 =?us-ascii?Q?k/6aDa5xvJHkYdX/7RiNh4AHoFphzoPlYn8nkyeivxSASSh+cWgG5aSLUL3l?=
 =?us-ascii?Q?T1b4XWAQ+tTMWSR6P1j/0KBWke3Lo9T61ZdedeWa5qc7Zjxw9zaKQ6AA3ggR?=
 =?us-ascii?Q?W6aWhUoMYdRXsRI6mZHX/dv+FhWUGm0MeKnK5vM2tSe0mSmCUReGGNX2yVM3?=
 =?us-ascii?Q?bUrJJ2y+eOVPzE8443O6hFqVV1HhLZ3XRL3iDLNdDmKZRHGyOrdN9WxCBu45?=
 =?us-ascii?Q?P85Qj6jt/IuGOxaGnqt1tRqTHQIXq2WGRDPkh1EFoTjRDOAbK4ZCmZH+qopl?=
 =?us-ascii?Q?KqLlAN6HoX6OjOTMaVhJBNaikM4iBXTEuPm9VPH05grxhBoU8x8AiRG82TzO?=
 =?us-ascii?Q?/CG1lMqQIUebhYpBDbbDDxs7jqg461JTWk6D?=
X-Forefront-Antispam-Report:
	CIP:193.8.40.94;CTRY:CH;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:hexagon.com;PTR:ahersrvdom50.leica-geosystems.com;CAT:NONE;SFS:(13230040)(376014)(36860700013)(1800799024)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: leica-geosystems.com.cn
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jul 2025 11:48:04.3996
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 26cc3d51-b585-445d-e778-08ddb95e4e21
X-MS-Exchange-CrossTenant-Id: 1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a;Ip=[193.8.40.94];Helo=[hexagon.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DU2PEPF00028CFD.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR06MB9634

Some PWM LED chips have a dedicated enable GPIO.
This commit adds the support to specify such GPIO.

Signed-off-by: LI Qingwu <Qing-wu.Li@leica-geosystems.com.cn>
---
 Documentation/devicetree/bindings/leds/leds-pwm.yaml | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/devicetree/bindings/leds/leds-pwm.yaml b/Documentation/devicetree/bindings/leds/leds-pwm.yaml
index 61b97e8bc36d0..2d38504f74c23 100644
--- a/Documentation/devicetree/bindings/leds/leds-pwm.yaml
+++ b/Documentation/devicetree/bindings/leds/leds-pwm.yaml
@@ -40,6 +40,14 @@ patternProperties:
           initialization. If the option is not set then max brightness is used.
         $ref: /schemas/types.yaml#/definitions/uint32
 
+      enable-gpios:
+        description:
+        enable-gpios:
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


