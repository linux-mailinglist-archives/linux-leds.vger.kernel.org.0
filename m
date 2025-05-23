Return-Path: <linux-leds+bounces-4706-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 39D31AC2661
	for <lists+linux-leds@lfdr.de>; Fri, 23 May 2025 17:26:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1B6273AC4C4
	for <lists+linux-leds@lfdr.de>; Fri, 23 May 2025 15:26:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 97F1C22127B;
	Fri, 23 May 2025 15:26:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=axis.com header.i=@axis.com header.b="CcIwvqzU"
X-Original-To: linux-leds@vger.kernel.org
Received: from EUR03-VI1-obe.outbound.protection.outlook.com (mail-vi1eur03on2051.outbound.protection.outlook.com [40.107.103.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2753128819;
	Fri, 23 May 2025 15:26:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.103.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748014002; cv=fail; b=bM2fnbch88U/9ngyuhUYJNJWbJ+0HecddnYaX3EtMLLOJ5n7JvC0NKCi6mkWXpuv3Oy/UwMs040OWQpjuyajAIdtuE/uzIVhm8ZmqjY/5efrTSqXNMpyyJ/tcQdVghqXWG5L3jJhasHqwJ74BJ+dFL7e5IjO/QtnuoN6wAmg+P0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748014002; c=relaxed/simple;
	bh=yVQk/aDCqy3+ve1iH0j2cGrtfFjTKF7BBOA82Z9gW/U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=Jm79927AhhErkdNxJH2gvEEr7tvYg0bfaoHxrLWXh8LdpO3YlV+/RfdURQD3sbiyvt17FjKJzfKXwTY2UrmDNtHwy839Z1Zf04tEYJVrLouxQ3dbUFe8izPpA1gWHEFBW4iTY1cjs38mnt2a+UYo5EpFPNK4OYUdN24DHLceu9E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=axis.com; spf=pass smtp.mailfrom=axis.com; dkim=pass (1024-bit key) header.d=axis.com header.i=@axis.com header.b=CcIwvqzU; arc=fail smtp.client-ip=40.107.103.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=axis.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=axis.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kImDf22JxGO6TMuKG3cVKdD/uZyFs9rMZxUECcJ5mHGo5ahyE1hp62YAcqzVm3tUIadPK60ohdBcDqlMehBiduZDu7o8dKg9drnOyplS8BcwC0BU2osKEU0aRTxsUpCeeBXZvyXGuSexejsKypx+sziJtbfzLAVYhDvCyN7tlVnbUgUClhnrEVqDi2WonmWW27xwB+bhlZSLtaiMXj+QqSDdRvzbKArPLQbHNdNA0/bMdI0434ajYPth44DBfXnFlO8CKvIEbMZ3Ih4MnJCeLoyXSOMU+Hs4ogJb763kgT1Jxu5bXAa9ZdKGcmVIq5/i8rjet930MzBRf8/XR/EUQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MhdbDi+aRHt7jsxtxO5J6n3+C61wT+1ITJLlT9AgoDY=;
 b=KDK1Ar2hLErL/ruKNSCGeT+TIZndhj3JSoB2OcLcgvQCS7sfG5Kmep2P4n9H/FW7EglURbRc83Wc5wsFEwnSP8vmMRYOauRsGWu2ir2ubTUJqijG3NFsGmAHGMexfa7pQv/VEXUTrClB04gRRhg1kauBJlXcVdQ/rDgT2SQRzCLoy0iHIfCynIgPu5DX5HsRKXAejzcp0VHQR4eqtB904F8hC6+iKCXrYcc8L8iS1YFzHN3EdmtQkLGGiejaO71zb4TQ/ZlQAtLTEulqXHfc+5qCpp9rHZ0lnpXy8I5H1Udd8psIxplPijyFppzup6NJwk8Q+TDHoHPD24/+Q+Vyww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=gmail.com smtp.mailfrom=axis.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=axis.com; dkim=none (message
 not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MhdbDi+aRHt7jsxtxO5J6n3+C61wT+1ITJLlT9AgoDY=;
 b=CcIwvqzUIoW1/1jNNb8cekx/cab6sZI+Yys3whdIuznWOwl1JUMFhhaBRgpnj/9ve4XRKpOr23DTetJbAkaSkoJs5we2oNtWoB4rkoiy/GFjq7UjeSUTf5PvhGld+sfmqXSpfUVy0r8Drb04cnPewWyp/ApctE+LkGmX4ofw6X0=
Received: from DUZPR01CA0018.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:46b::6) by AS8PR02MB7336.eurprd02.prod.outlook.com
 (2603:10a6:20b:3b3::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.26; Fri, 23 May
 2025 15:26:36 +0000
Received: from DB5PEPF00014B95.eurprd02.prod.outlook.com
 (2603:10a6:10:46b:cafe::45) by DUZPR01CA0018.outlook.office365.com
 (2603:10a6:10:46b::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8769.18 via Frontend Transport; Fri,
 23 May 2025 15:26:40 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 195.60.68.100)
 smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 DB5PEPF00014B95.mail.protection.outlook.com (10.167.8.233) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8769.18 via Frontend Transport; Fri, 23 May 2025 15:26:36 +0000
Received: from se-mail01w.axis.com (10.20.40.7) by se-mail01w.axis.com
 (10.20.40.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.44; Fri, 23 May
 2025 17:26:35 +0200
Received: from se-intmail02x.se.axis.com (10.4.0.28) by se-mail01w.axis.com
 (10.20.40.7) with Microsoft SMTP Server id 15.1.2507.44 via Frontend
 Transport; Fri, 23 May 2025 17:26:35 +0200
Received: from pc51235-2237.se.axis.com (pc51235-2237.se.axis.com [10.96.29.3])
	by se-intmail02x.se.axis.com (Postfix) with ESMTP id 701DD2921;
	Fri, 23 May 2025 17:26:35 +0200 (CEST)
Received: by pc51235-2237.se.axis.com (Postfix, from userid 3319)
	id 5D0EB40364CF; Fri, 23 May 2025 17:26:35 +0200 (CEST)
From: Johan Adolfsson <johan.adolfsson@axis.com>
Date: Fri, 23 May 2025 17:26:28 +0200
Subject: [PATCH RFC v3 2/2] dt-bindings: leds: lp50xx: Document child reg,
 fix example
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250523-led-fix-v3-2-86d2690d2698@axis.com>
References: <20250523-led-fix-v3-0-86d2690d2698@axis.com>
In-Reply-To: <20250523-led-fix-v3-0-86d2690d2698@axis.com>
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
X-MS-TrafficTypeDiagnostic: DB5PEPF00014B95:EE_|AS8PR02MB7336:EE_
X-MS-Office365-Filtering-Correlation-Id: 585ab02c-e6fc-4cdf-555f-08dd9a0e34d8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|376014|7416014|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?aEJ5MlY2WVdLaDk5ZDEwcHF0VE8vUExOekdKbW1mVWRwQ0FHNmI3V1cvMkwr?=
 =?utf-8?B?bWFBbStWRy9xd25GZEY0SWk5b2JUVGhsVmh1V3ozNUVNdnFxOTVYS1Zqa24y?=
 =?utf-8?B?MFlVRnluRjZ1UWRDM3NpeFhPZmNTWGVyT0ZRKzdSVlQ1ZDdMVU5EUHlRbHJn?=
 =?utf-8?B?eXE0QVNQQkRrRno3bG5CT1RpaGwyOVNDU25RUDZTZnBIOWZvZHJTVWY5bVZi?=
 =?utf-8?B?TkhJNXpZbkE1ZTJzSVlqcG1WcWN3dnBjVXNvVllZTHNabmY4cWdVV1RpZGJN?=
 =?utf-8?B?eHJ6Rnl0aitQZXg2Y3RXaUVKOVNlMXVWRllYbHhQUDZRM1NaQzV5NHIwbTJZ?=
 =?utf-8?B?QlR2OGVRZ3JRTmpzcmdldU54NjVnVXBLNkcyaUprWVlyYXZGUXdVNWhSNDVJ?=
 =?utf-8?B?ZTRjdk9hbTA5Vm5oSjlxNDl0V28wbjljYU41S0xVUytpclV0dXdla1lNVTUy?=
 =?utf-8?B?cXdkalBGbXpWZjNvUVRWYmRWdXR3K2ZwbFNhVmV4ellLelowSlpGeXd0UWVI?=
 =?utf-8?B?WHozMXFRNnEwYW9ucldXV2RBK1VlSzFvbXZvQmgwdG1Xd2N5aWFRbjlDUXkv?=
 =?utf-8?B?UGVTY0tJN3dtckhRSC8wNFkxRzNwbWNkUklTdEZRTmlBWFZ2b3JleUxMYlYw?=
 =?utf-8?B?Yi92YjdLaEVNbXF5b0RTR2p1VGtVdklDWlJ5ME1rVHozSHFpb1UzR09YNTZq?=
 =?utf-8?B?a21rYmdxcEJHWE9WY3BVV3E1WlBmYnJ5SWtLZjVSNlh1QWFQS1VwQVAyOWNN?=
 =?utf-8?B?dktrVkJSdTNxb3I4Y25KSXhnbnJ3Z2JkZExlcGllbUo1MmZ2UFhYellobkpk?=
 =?utf-8?B?UWtXd2lXSElpZDI5d3NLeXV6amErU0N6VW1MWnZ0UTdROTdHOXZtUldpbWxm?=
 =?utf-8?B?bnQ4WWNlSE5HblhRMjlnK0dsaVFUUWFJeTE0WEVnUUNpNG5tZ0NtWEJSSWpK?=
 =?utf-8?B?RkY0QzF2WXV3clFrSThZTXY0K09kc3JGRlFYTHZaTHpVMU5tL0lycW9DSkZl?=
 =?utf-8?B?TTdOMndCSmh3MnBrNGhISXFYM0tKbDBXVXRHOFlHME5aZmY5VURaMnpNQmVL?=
 =?utf-8?B?SVlsSHo0eXkxMzgyT01rNnQwbVhWcHBseUJYcXRtY0xNbDU5WW5GZWFjb054?=
 =?utf-8?B?S3ZPU09MTnhjcm1KeU9ZOThNVkI3eHk2d1NLRDd1SXZEOVdQVWV0eTBoaGpQ?=
 =?utf-8?B?U01BUDY5aVRNYjN3ak4ramFWSjU0aHExOERRYmxoV3VxNUJPU2tzcnlhUlhG?=
 =?utf-8?B?N2UwcjdMUm9IN1NUQ2lWZmxtaDBEdUpFL3JGQVJMaHgyTFV0YlVCcXRhZ25X?=
 =?utf-8?B?d0FIbDZVd1dEanhSWTZuUUtvSEFhbW5janowQ2xsbklONlMzeE55M0RwVXZ3?=
 =?utf-8?B?dEp4U1paUHhXbkZLVmhQQ3hzMnJicUlNaFdROTI3eVBJaWI1VWx2elo2cHNW?=
 =?utf-8?B?bWVhQ1l1VE1hbGFHTXpxRldraEplV1RuUHl1MW9mMnk2RWJRODF6US8yN0xr?=
 =?utf-8?B?a1ozaUVmaGhUTi9veVFRQTlIdElLMjZPbTEyTGdmOG11SXhiZ0l5TEo4K1ds?=
 =?utf-8?B?OTFUdGt2MkUybVFZVVN2b0F0c2VFVkZyTXVhdE9QOXNURWVhYjg0Mk1zblBJ?=
 =?utf-8?B?T3BkaFN0RVdBYmZYSFRDV0RYUGJnUXFFWDRxU1FNMUd6RUNFeWMwMEhrNitT?=
 =?utf-8?B?STVoaG1yV1pDei9pT2MxQ2pPUGw4Ryt3bDJXNk5iNk5QWnVLQ0V4NlUzdUx5?=
 =?utf-8?B?VDFNNENPSFF2b3AxNHoyMkg3a1AxVVUrd3JFdS9qN2IxSDQzNnE3N3AzeFli?=
 =?utf-8?B?MlB4MmRWMTk3aU9uWWNSSzYzdm1CQ1prOTZQeVlpVGlPbHlZUUlRU2xrSXRL?=
 =?utf-8?B?cE9qTzRaaUxhVVlRa3RHK01kRHAyTy9sVXFqUEhuUkNERlZYbDBja0NFT2dl?=
 =?utf-8?B?OVVIdWdWLzV4eEkxZG9JR09pengzNE9WZHU5aktSOHZlN3M1L0svdTF4aWlR?=
 =?utf-8?B?M0JEbVRINHBKWmp6Mm1rZGtwVEp3eTg3dU90Qis0bE5WVFFsTXFwYnJGTGFv?=
 =?utf-8?Q?c1YwUo?=
X-Forefront-Antispam-Report:
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(376014)(7416014)(1800799024)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 May 2025 15:26:36.2771
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 585ab02c-e6fc-4cdf-555f-08dd9a0e34d8
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5PEPF00014B95.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR02MB7336

The led child reg node is the index within the bank, document that
and update the example accordingly.

Signed-off-by: Johan Adolfsson <johan.adolfsson@axis.com>
---
 .../devicetree/bindings/leds/leds-lp50xx.yaml          | 18 ++++++++++++------
 1 file changed, 12 insertions(+), 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/leds/leds-lp50xx.yaml b/Documentation/devicetree/bindings/leds/leds-lp50xx.yaml
index 402c25424525..15dcda96e867 100644
--- a/Documentation/devicetree/bindings/leds/leds-lp50xx.yaml
+++ b/Documentation/devicetree/bindings/leds/leds-lp50xx.yaml
@@ -82,6 +82,12 @@ patternProperties:
         properties:
           reg:
             maxItems: 1
+            minimum: 0
+            maximum: 2
+            description:
+              This property denotes the index within the LED bank.
+              The value will act as the index in the multi_index file to give
+              consistent result independent of devicetree processing order.
 
         required:
           - reg
@@ -138,18 +144,18 @@ examples:
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


