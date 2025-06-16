Return-Path: <linux-leds+bounces-4803-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 462A2ADA9F8
	for <lists+linux-leds@lfdr.de>; Mon, 16 Jun 2025 09:57:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6A35C188C4F3
	for <lists+linux-leds@lfdr.de>; Mon, 16 Jun 2025 07:57:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 410B920E334;
	Mon, 16 Jun 2025 07:57:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=axis.com header.i=@axis.com header.b="OcHdOYCM"
X-Original-To: linux-leds@vger.kernel.org
Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011013.outbound.protection.outlook.com [52.101.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65647201004;
	Mon, 16 Jun 2025 07:57:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750060641; cv=fail; b=W1Nf0L/4B09iu0b2exFVlFOTeVBmFFIu4jczOC9s5Iz0Omgy82vPJsn6MRmXC6oqg+fogQrJBR9aH0TH5hklGIw8FQ7p9uYWO3hRH3QeRV82annkV9dIvCdOcGkb9MFdgge42livI6ez0fGofQD7+nI1942PMwQKlmcenq2jqSw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750060641; c=relaxed/simple;
	bh=i7FzubbhA8SQCvUKiCCCNCTNxf10A2ZZqhENRBUSvg0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=BFWFV5pip1iaFqN4xeUQXLjWo6IcPnsYrX0d3cY2RrSbR1NJ3VJDHvNS7rTPcDKrPz8Qq4ntSuS9DsOc5SJNCpiSUtS6iN1P2rE5EV9MhfBl4Wttnd5LUxjm9OUufJ0ShhSe6k4mNpw/00bDkQV4E7NQA5JVOCiQ8uzZ94d9RL0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=axis.com; spf=pass smtp.mailfrom=axis.com; dkim=pass (1024-bit key) header.d=axis.com header.i=@axis.com header.b=OcHdOYCM; arc=fail smtp.client-ip=52.101.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=axis.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=axis.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SoaeaDT2W+R6Bec2tBWJaepa/B+aJa19J7J9Kkq/1NEhW3UQVSRR88bQBZ8fku5+iabDdgdcloA9SZgyDrmS6uzG45qvd3IYxufUzwf4huA2pnpHzjVpK66sdLv95OYddl3JE4ADvVEDN11Khmxe68zgbWMGXvaTQi512tGOGTDLPMlHUtBnZIgX+beT7Tf54p6JKg85W07rfJw3f04f/v+cVT69/fsNJMN5pyF0/JDMzdLrrUru9cGjaZYGrW/kZYGnNDKQ/i0iFWm01G07oEWB51OjMnFP7Cvix07povOCVy0dyYSbVwCXx5RZkC51QHPp1ti6HpOifgnr71RsOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=u36gVJ5uX9Hrm05xwjAYkkzlopngZEFSLVlVUR5aiEk=;
 b=jyWM8srMOe+9sSVrm4fF5E4ZHuaduEFobqKmytLfGmBvV0DAnu+oio6/zjen07385j1dU7++s/R/ZtH1UlFACzYD34n1OV9wsQW8e4iagjGIYy83SKPfoSDJqzeTIy41yKMX2ZPiD5/+gV+BXD32eiOwWL7zBLIE8fHFuWf1l+fVauADSt7H6emkG7p6/zbphLcOQDDR9/9mJJ9tm3VxW0NxDkKTzIOARQNwhOo43iNK+IHGOAWFrZxYXqNMTt8+6Z/croDbPNwQB5kdZ2XM6wH9R4/LHUglWNM7Aw2EwDfYaA3ZjvNeRQcwWN4NxWsUF5vD322TJ9201/YKdZRuHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=gmail.com smtp.mailfrom=axis.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=axis.com; dkim=none (message
 not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u36gVJ5uX9Hrm05xwjAYkkzlopngZEFSLVlVUR5aiEk=;
 b=OcHdOYCM3eJswsosOymKlgp6dkYUXI69xO54HzABIm14udJgHczmz8fYmw++RQx64U8h6wY6zoJGUTqFUSxlvWVyUWw3W3NUNmNOVtAWVJXmONlxX4EOQZfX2E81J1ImALGAPxHFJJtZv+XtJdXXhWXu7TfRKBjAtYvBClGqlKo=
Received: from AS9PR06CA0166.eurprd06.prod.outlook.com (2603:10a6:20b:45c::18)
 by DBBPR02MB10483.eurprd02.prod.outlook.com (2603:10a6:10:52b::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.29; Mon, 16 Jun
 2025 07:57:14 +0000
Received: from AM1PEPF000252DD.eurprd07.prod.outlook.com
 (2603:10a6:20b:45c:cafe::51) by AS9PR06CA0166.outlook.office365.com
 (2603:10a6:20b:45c::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8835.25 via Frontend Transport; Mon,
 16 Jun 2025 07:57:14 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 195.60.68.100)
 smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 AM1PEPF000252DD.mail.protection.outlook.com (10.167.16.55) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8835.15 via Frontend Transport; Mon, 16 Jun 2025 07:57:12 +0000
Received: from SE-MAIL21W.axis.com (10.20.40.16) by se-mail02w.axis.com
 (10.20.40.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.44; Mon, 16 Jun
 2025 09:57:10 +0200
Received: from se-mail01w.axis.com (10.20.40.7) by SE-MAIL21W.axis.com
 (10.20.40.16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.44; Mon, 16 Jun
 2025 09:57:10 +0200
Received: from se-intmail02x.se.axis.com (10.4.0.28) by se-mail01w.axis.com
 (10.20.40.7) with Microsoft SMTP Server id 15.1.2507.44 via Frontend
 Transport; Mon, 16 Jun 2025 09:57:10 +0200
Received: from pc51235-2237.se.axis.com (pc51235-2237.se.axis.com [10.96.29.3])
	by se-intmail02x.se.axis.com (Postfix) with ESMTP id 151CB2155;
	Mon, 16 Jun 2025 09:57:10 +0200 (CEST)
Received: by pc51235-2237.se.axis.com (Postfix, from userid 3319)
	id 0EC3B40D504A; Mon, 16 Jun 2025 09:57:10 +0200 (CEST)
From: Johan Adolfsson <johan.adolfsson@axis.com>
Date: Mon, 16 Jun 2025 09:57:09 +0200
Subject: [PATCH v5 2/2] dt-bindings: leds: lp50xx: Document child reg, fix
 example
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250616-led-fix-v5-2-f59c740831ab@axis.com>
References: <20250616-led-fix-v5-0-f59c740831ab@axis.com>
In-Reply-To: <20250616-led-fix-v5-0-f59c740831ab@axis.com>
To: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Andrew Davis <afd@ti.com>, Jacek Anaszewski
	<jacek.anaszewski@gmail.com>
CC: <linux-leds@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<devicetree@vger.kernel.org>, Johan Adolfsson <johan.adolfsson@axis.com>,
	<kernel@axis.com>
X-Mailer: b4 0.13.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM1PEPF000252DD:EE_|DBBPR02MB10483:EE_
X-MS-Office365-Filtering-Correlation-Id: 798fefc9-bd41-47ce-eaa9-08ddacab6740
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|82310400026|7416014|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?djlsYWhBNGxadkF0QVM2WmNtaUg3TzlwVFBFeE1ic0tQdy9zWlNQQlJkWFZ3?=
 =?utf-8?B?SFBxaStxdXdNSVBXczB2bVNLTTE2S012MllUYnhBYzNnajFJTjZPaW8rWGkz?=
 =?utf-8?B?NXFEZlorQmdxSFVuM3IxU3E0emdQcWdxY29YZkJyV0lQRlJNV0JtOXZXZWZo?=
 =?utf-8?B?SUl1dUdhaE8xc0RYand2YmU4MVhCcVBOaUUxRjZ0QTZmUG4wcXpLNGlGMTdD?=
 =?utf-8?B?dTlGRjVmeE16WXZMc1hLT0t2RDBHK0huUDhsN3FJamxwdFpjOWxvMlkyWUhU?=
 =?utf-8?B?dDZheWR4TE9LaVF0bXY2SWMwdUlCaXcrUW1hT0FKeDB1eTBqZi9LUFE3ekxV?=
 =?utf-8?B?M3QzdlFSb0xxS1EyRUpGdTEveWN6TXd1c015andMQVFxVWNYTjk0KzRYbzNZ?=
 =?utf-8?B?c2FQSkFlcmQ2anVLanZyeXpoeXRuRXdOZmp2TmE4VmhROTFxbzlSY0FYSG90?=
 =?utf-8?B?RlYrbFNtblloQWpwQkpoQXE0a1pHN0VRbHNFQnhOSUh4WFJzcHRhN2h6dWRD?=
 =?utf-8?B?MjFyaTlKL0ZKTTdiVHBnbUM5RG9vaDNweUhqOGVjb0VrMEpYR1ErZHpUVjVi?=
 =?utf-8?B?TkxsQU5YZFZRUDNiYy9tcFMzT3Z4SDNsczBzN1FxV2lQdHN3cnNtNUxncW9Q?=
 =?utf-8?B?VjR3TWpLNzYwNWxnOVZoVjFCY0xJTnd0UUNCNWx1SER3ZHpvd2g4QUdVK0R6?=
 =?utf-8?B?QlE0MlNFSmxNRlQxWVFLMUJiMDZ2T1BBUFJoS0tkL0cxS2NISkZNMmRBOXhq?=
 =?utf-8?B?TDd2VDl6YmVQNytIZTYwWWEwc3JEZll2b3N6Uk1xUVhTSDRWdGQweFNvK1pG?=
 =?utf-8?B?S0E5MTRIRUU1N3dRUW4rc3ZLN0NYTVBrRitieWJuUDBIQldtYVJDU1BOYkli?=
 =?utf-8?B?WWwxV21hZy9zM0k4c25Rd1pZdTdCd1JpTGpudGhUdlJ4S2JmUi8vUXBnMWRP?=
 =?utf-8?B?SEJwUFJSeE5tYlVocDFhZWFUeTlQUmVDS2tuTmNZdFZvWDFCTmg4cEFyN3VM?=
 =?utf-8?B?Q1lEVDZFSytUS0ZIdXJwbkJpVk4vMmxEWTF1MFB0UVVCcDhQb3BxbFMwU0Nx?=
 =?utf-8?B?WDJSMGt6SEtDZ0Myd0NmZWFKOWV4RXQ5eFZvakgvQndmaWNCS1J2NjQyRjJw?=
 =?utf-8?B?aFlyTmlweklqck50c0tPa3hJTVJuY3JCWk9xQTBZODVlNGpPMTMvaFZkeE0y?=
 =?utf-8?B?Qld4cmhaZ3hISVVKa3k5cmxjWUtlS0hERFF0N0tnemwxeVh1NXR1SDdOVVpV?=
 =?utf-8?B?ZkVXbGdFTmtyVHFEak9zem1hS3M4ZUJMMCtSbEYzUHZvOTc4T1VBUENXS3dl?=
 =?utf-8?B?aU5obUVHbHdoOEFCckFWY2ovT2hyM2VhYmw0cHNhRHZKMjltdlZYNld4azg1?=
 =?utf-8?B?VEYyWWxqQlVOMXQ1U2U1UFNFczRudUFKWk5DZWhUY0lVUi9VOFArczQvSk1S?=
 =?utf-8?B?SVNZRDhUK2hLOVhTZUh5VVFBMWxNVk5KS1BMV3d4Zks4clY1RUQ3L1hvZEtX?=
 =?utf-8?B?YWV4T052aHlRb2lwN2FrK2hKTzZpYS8rd01XRiswdUVUUHM0ZmtLTEJPWVhF?=
 =?utf-8?B?eThhNjBCM1Q1RFZtcXV1cSt6ZVJpeXRLRG0zeHNzWWY0T2hpeTlUT2dUbDIy?=
 =?utf-8?B?c015SXVlTHE5dkI5c1JUU3RFSXR1Z0ppWTMzb0NpUU9TN2cyVDdLOEcrSXBX?=
 =?utf-8?B?UjRvbW1LbXFtcVlDbi9KbGQ5SjFSNmU3UW5ZT1g2dGdtenNrL2NMNmZicG5q?=
 =?utf-8?B?SmVSa0NNZkR3VWp3QnNvRlQwdjB0M2lpN2I0ZWRIMFA1UzlGY1daUStObndm?=
 =?utf-8?B?Slg1MnhidzNZemZPWFUzWk03ZGxSMlVWWXBSWStEODlHdUpyN3Y0TDNwTFBV?=
 =?utf-8?B?MjZHQ245Rk1UemJFN1dEc3A2VS9tSkFoQ0hNcEtVVmhlN21UV0M2ZUM3NWs3?=
 =?utf-8?B?d2lueTlnZnRwSytMZHNZVW5DQTdVekRJZDFBaG9KNWUwYmp1ZnZpUGVTL01p?=
 =?utf-8?B?Rzd5amRqNGt2UGRwTkRQQ3NWRzJyNTNsNlUrbEpxNjI1azJ4T0lFeDNCWisr?=
 =?utf-8?Q?7/9nJw?=
X-Forefront-Antispam-Report:
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(7416014)(376014)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2025 07:57:12.7761
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 798fefc9-bd41-47ce-eaa9-08ddacab6740
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM1PEPF000252DD.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR02MB10483

The led child reg node is the index within the bank, document that
and update the example accordingly.

Signed-off-by: Johan Adolfsson <johan.adolfsson@axis.com>
---
 .../devicetree/bindings/leds/leds-lp50xx.yaml        | 20 ++++++++++++++------
 1 file changed, 14 insertions(+), 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/leds/leds-lp50xx.yaml b/Documentation/devicetree/bindings/leds/leds-lp50xx.yaml
index 402c25424525..edcc88db1ea7 100644
--- a/Documentation/devicetree/bindings/leds/leds-lp50xx.yaml
+++ b/Documentation/devicetree/bindings/leds/leds-lp50xx.yaml
@@ -82,6 +82,14 @@ patternProperties:
         properties:
           reg:
             maxItems: 1
+            items:
+              - minimum: 0
+                maximum: 2
+
+            description:
+              This property denotes the index within the LED bank.
+              The value will act as the index in the multi_index file to give
+              consistent result independent of devicetree processing order.
 
         required:
           - reg
@@ -138,18 +146,18 @@ examples:
                 color = <LED_COLOR_ID_RGB>;
                 function = LED_FUNCTION_STANDBY;
 
-                led@3 {
-                    reg = <0x3>;
+                led@0 {
+                    reg = <0x0>;
                     color = <LED_COLOR_ID_RED>;
                 };
 
-                led@4 {
-                    reg = <0x4>;
+                led@1 {
+                    reg = <0x1>;
                     color = <LED_COLOR_ID_GREEN>;
                 };
 
-                led@5 {
-                    reg = <0x5>;
+                led@2 {
+                    reg = <0x2>;
                     color = <LED_COLOR_ID_BLUE>;
                 };
             };

-- 
2.30.2


