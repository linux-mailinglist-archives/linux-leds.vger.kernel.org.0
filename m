Return-Path: <linux-leds+bounces-5989-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DF9C1C34167
	for <lists+linux-leds@lfdr.de>; Wed, 05 Nov 2025 07:50:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 428DD18C1D6E
	for <lists+linux-leds@lfdr.de>; Wed,  5 Nov 2025 06:50:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D41D2C235F;
	Wed,  5 Nov 2025 06:50:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=leica-geosystems.com.cn header.i=@leica-geosystems.com.cn header.b="OZjoEA3T"
X-Original-To: linux-leds@vger.kernel.org
Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011000.outbound.protection.outlook.com [40.107.130.0])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 675612BF011;
	Wed,  5 Nov 2025 06:50:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.0
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762325423; cv=fail; b=r2zPE8vjI7Opez+oj6P31TuFbqXDLFfZz58s06JUstOfnX3Vn4ElGj0Tl8pUoIuO1T8hxBAZ4qHG1YZomgFN+i1a8x/Co/HQXx2gDesFiH+j/710Plb30OdpzYAExNezNr7xFfWUeONfbJSFwkqFdfJ/E/vqIv0Q23FZf284paE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762325423; c=relaxed/simple;
	bh=oYfwm+2edq5AB0/ahRxgKUjwsN89t+6SzS0Ze9i7tkY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=eTPODM7fYZ736Lf9/TlNSRVIzdtmEh/bXxmKGuaa9LlSgeFWf58WfXa5WnYPDVkWW4I/XKZJ4DCj/hVG2q7oiBXtLp5fOOyfuQMKlZUUrGvYssUrN9/RdjTJjI6/ITFqLAAq/Slyvpn3r7lEV0EefR0RLGWm0tLbd3JsgMerVx0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=leica-geosystems.com.cn; spf=fail smtp.mailfrom=leica-geosystems.com.cn; dkim=pass (1024-bit key) header.d=leica-geosystems.com.cn header.i=@leica-geosystems.com.cn header.b=OZjoEA3T; arc=fail smtp.client-ip=40.107.130.0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=leica-geosystems.com.cn
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=leica-geosystems.com.cn
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YtYek4pBjLJ+PlQEaPqUrpjbaq77c2lSPlBdC16Q+a5oviQNroY27ZLKn+GAZ/WmLqCRnT6jkaq7u+gIWYUk1l2AMijgYQPkJzEHDQhXZK7+EEE3SxOBzFbryBYfhZ/hRbNtpvcViHHmfScZzCQkSTKG0oCzkhR8T6NA9ev24VH7+9dkfo5TjonEKoAwoYjdaoIm76ZGmKUFYXQy39zemnGKz7SeLrbZDA3YMr9sLYfQR1qT18lO8fpc0p6VceOd1tu74dCziugq94nd6d/2NPXGGeX4qCkMBj9DMsZQz1djw9iVlPJbW+vhgvSlWFlQ69FcmSfS8IyHhZglLNygGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UCGekY62HkyNk88T7V0W61jgRiWU31Dy7Oo8hUV6NYI=;
 b=U48nmkFTcvp4hTuGEQFu+XlL95eQFUaBuKA9p50Akl6ZK1mSvUDkkEY0IAqPz0ATAqSyRiPAV1S9Lc0idhvNppW43GtmTIJkDE5zepCtdXrput8mgFvHlwKhMHJ5Wb97QCHVPLT1pn4Gpe1jGjFlCYWtvPi5Ysu1s5BH6zAkP06TASOrIR62K4zeZmJOfZkYWrtxOCawJsQvIL/ORV8JuJxprLVHqCJCijmS77EPAJ2fCMJDX+DVa66cf20+meMNdpR4NHFA+W3hVNUiv9eo4yrfDVcdg93voK2YqnK32fQ0KI5XPcl+KOo7BT18Mu2vwQcBxxHTMbnEnB/obSgaZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 193.8.40.99) smtp.rcpttodomain=vger.kernel.org
 smtp.mailfrom=leica-geosystems.com.cn; dmarc=pass (p=reject sp=reject
 pct=100) action=none header.from=leica-geosystems.com.cn; dkim=none (message
 not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=leica-geosystems.com.cn; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UCGekY62HkyNk88T7V0W61jgRiWU31Dy7Oo8hUV6NYI=;
 b=OZjoEA3TfY8f5O/vffReOnhemOtJU2gI72aVHUMdkpPMs+Wrxwb4cUrj9Gh7/IpJ9AWO63aKkBw0UgfOlekebef7nYmGcXiDsaZWY6QCA4VR6Vy3PN8Sg3/OrEENw/PrfNhffdBp7hUSvdSnvDRlZgjR7R9xksKQUS8sRBFHcDk=
Received: from DUZPR01CA0069.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:3c2::12) by PA1PR06MB10144.eurprd06.prod.outlook.com
 (2603:10a6:102:4e1::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.16; Wed, 5 Nov
 2025 06:50:16 +0000
Received: from DU2PEPF00028D0B.eurprd03.prod.outlook.com
 (2603:10a6:10:3c2:cafe::40) by DUZPR01CA0069.outlook.office365.com
 (2603:10a6:10:3c2::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9298.8 via Frontend Transport; Wed, 5
 Nov 2025 06:50:26 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 193.8.40.99)
 smtp.mailfrom=leica-geosystems.com.cn; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=leica-geosystems.com.cn;
Received-SPF: Pass (protection.outlook.com: domain of leica-geosystems.com.cn
 designates 193.8.40.99 as permitted sender) receiver=protection.outlook.com;
 client-ip=193.8.40.99; helo=hexagon.com; pr=C
Received: from hexagon.com (193.8.40.99) by
 DU2PEPF00028D0B.mail.protection.outlook.com (10.167.242.171) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9298.6 via Frontend Transport; Wed, 5 Nov 2025 06:50:16 +0000
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
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH V9 1/3] dt-bindings: leds: pwm: Add enable-gpios property
Date: Wed,  5 Nov 2025 06:50:10 +0000
Message-ID: <20251105065012.88796-2-Qing-wu.Li@leica-geosystems.com.cn>
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
X-OriginalArrivalTime: 05 Nov 2025 06:50:15.0062 (UTC) FILETIME=[70ADA360:01DC4E20]
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PEPF00028D0B:EE_|PA1PR06MB10144:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 999ef44e-035c-48d1-e022-08de1c3793fa
X-SET-LOWER-SCL-SCANNER: YES
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|34020700016|36860700013|376014|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?KFqgLDS/pA0J/eKTzEA4Es17lEdNbTxrTqbYFcG6ob9Hkj3lyiSAyPscE0yU?=
 =?us-ascii?Q?eN+KRSblHpjZuBkuuFVotvOdjNzHltd1k4JZQct7izLvx7YiXRxO+h46oewQ?=
 =?us-ascii?Q?+w9hvMw/khpQ52zVqd7BN21rJyFd3GMoOt7EREhlYHSJUwbMpy9gmGqHFFgd?=
 =?us-ascii?Q?1B5NNZ/Ximpq7M/VVW62zQtk7CVCNRd5THyvzh7wrmF2orQNK9fjONjvf4Kv?=
 =?us-ascii?Q?kIPOQtDY4vwUdVrHnnPmOWweyMWuFBiAY+7aTNmDJJET/rq1hrGj81Di9wwG?=
 =?us-ascii?Q?+kGeNKfaqgi5CCzT/KTqYI8QMThL4KBlFGDbJEZ7JbsM9AchPVQ3Tl8P3VM0?=
 =?us-ascii?Q?u/LjHXQhdZrrNk3kSbV5SMQzTewEsa21MEagT0Cf5PTlk940pWpWmHsqM7iT?=
 =?us-ascii?Q?AG9QEiWYtEaOdM0ju+kmyvqNtSqc/NKvtbWrBGfgiVTUg8vQxZMVDZ+HrKmy?=
 =?us-ascii?Q?8kAb88PdSVBhoRGK1tG8m4ydCmkcraoyRxu/sR8kG7McwNsFT8xde8JLHzP+?=
 =?us-ascii?Q?w0Lu3yWFF9y04rSE5a6XaGQElLQ8IZedt5dhk9BC0bSZEIf/1ETe1Cklf1qU?=
 =?us-ascii?Q?l26LUBzOvoSAi71r+OSV/fosJqY84UmV4jInUAM5AlwX7W1hkg4ivK0je4aU?=
 =?us-ascii?Q?2rbbLoqE8M/vtL6Etg2l/jOkULafZMmlE3X/JxDkuc5NkP0iUWJMqTnwMFuT?=
 =?us-ascii?Q?gRFo0vjs2HF+LalABt+BLy+2/Wdo9ezJ/Rjj9gLMZOyHuHRE+B6S582Lg5iH?=
 =?us-ascii?Q?RFEWG8rxddTfJl4KPpaF/OmcRTAMQgMimp0VxWLzXvv4lsnlxmuWxJf2ZVZo?=
 =?us-ascii?Q?QpnxYDg44B3xhGj9SxRQMNDmiLAGzp65udyL/77IkQ4vTpdF5BLyxgwlOykl?=
 =?us-ascii?Q?a4jNkpeKg71m9r8ytnZWDqLFmCDIxAp/8zPD4fG4Znelby7/UvHExNs1dlWP?=
 =?us-ascii?Q?P/K0kuK98vxa/Gu4g+6ldMJx63xXnRsOiAPfaamOfOtP3vDULslVObNp0FMN?=
 =?us-ascii?Q?sD1ZldDrQpb5TQGJAZOqyoICcThwbV55n5rAIitWlG2jDDR08MSndMjwAThP?=
 =?us-ascii?Q?CA8PfPZNZYF6CY2K/z6N74n/MomJw+ijvNBv4/0S54WUjPWoDXwRxkt57x+o?=
 =?us-ascii?Q?2Jl/PhfmuX+NstKADqVYO9CganbwFt30NFna3XkLUMKojg53tkVYv46+WM54?=
 =?us-ascii?Q?CmIkb9hf2wY99kpyZPm5qC6Bf/AcMfDNYMViVBRxPRhGN2cnOhv70sJc7fPH?=
 =?us-ascii?Q?hIni8essdltouvOPcRYq4KmLIC2jeDO3zV9iJfb8A2ezff18Ih4MJgz+OmT/?=
 =?us-ascii?Q?hWfx9EeeGKByC7T3FfLVBWdGfstsgiVVXC2I5gFiOTl3DSWvA9piP2vXih8L?=
 =?us-ascii?Q?75BWqib+1/SOdGUcA2SJt1lT1QFVgS/iwMr5wCMiH1OEX1AvqgjhjUtZYMCG?=
 =?us-ascii?Q?rflYUDn0m4DDJMWhP74HoY1jm4T1CozP1UQux3Bk74vqYLaNLwM7idyt3Tao?=
 =?us-ascii?Q?HIszOErHnt8W5BbQjQWrbos+JBVvJ3h7L8sfAEJflbmcUzqxIdHCg3SVWUPE?=
 =?us-ascii?Q?JmvuqIH1jyDzRULw02o=3D?=
X-Forefront-Antispam-Report:
	CIP:193.8.40.99;CTRY:CH;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:hexagon.com;PTR:ahersrvdom51.leica-geosystems.com;CAT:NONE;SFS:(13230040)(34020700016)(36860700013)(376014)(1800799024)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: leica-geosystems.com.cn
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2025 06:50:16.3252
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 999ef44e-035c-48d1-e022-08de1c3793fa
X-MS-Exchange-CrossTenant-Id: 1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a;Ip=[193.8.40.99];Helo=[hexagon.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DU2PEPF00028D0B.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR06MB10144

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


