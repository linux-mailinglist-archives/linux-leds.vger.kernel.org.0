Return-Path: <linux-leds+bounces-4712-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id AB21FAC41DA
	for <lists+linux-leds@lfdr.de>; Mon, 26 May 2025 16:54:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6BFAF171DAF
	for <lists+linux-leds@lfdr.de>; Mon, 26 May 2025 14:54:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8845920E710;
	Mon, 26 May 2025 14:54:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=axis.com header.i=@axis.com header.b="eHx+QQXP"
X-Original-To: linux-leds@vger.kernel.org
Received: from EUR03-DBA-obe.outbound.protection.outlook.com (mail-dbaeur03on2086.outbound.protection.outlook.com [40.107.104.86])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A3CA6F2F2;
	Mon, 26 May 2025 14:54:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.104.86
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748271251; cv=fail; b=Yqhb1BIRD9IhGQ6EkNjDIs6/w3TRFRdPx8Hm4+bt1fkN+AgeIa6QQ7CqN2hHUI/Yq6IHSXPXDFkFKSd55p5pHrzBbmnEvTR+VDW0alUIyVGNnNEcTHK/0MeR9hk0hQPF9Hk64axwUdbjhHvhiVVmA/lysHr1BCkdugSASCO0SRs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748271251; c=relaxed/simple;
	bh=tAo3kTpL/K5SLo8tFVZ/ZOA2aNszk8+1hFZ8ofH3l3I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=CuoLO6yjWzP8zGuxFOdb/kYiNiKg80jHZFvWhXOLjsi3YodyEQk+f2yB5o6N6READHOD+q1uH1PU78oWRHo5t+EOgilxMWdmZ3t5tTSAYss2vNm5IolanGrc1NA4T74nulvE4vILrUYioYF3nae1QolAG3UwayQOU6F+r+h7p5I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=axis.com; spf=pass smtp.mailfrom=axis.com; dkim=pass (1024-bit key) header.d=axis.com header.i=@axis.com header.b=eHx+QQXP; arc=fail smtp.client-ip=40.107.104.86
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=axis.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=axis.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NwiRD2kLUyp6AT/vx7g1r6NOsSLtXc48ophWESrMOFaH4W5aFZDEuI+ztc/3FkP1TlNvATxd7U17hRSw9u7KbtnHDmqhk2Y0aKnVqnMftBrU6/TpP9CGCSPYI9uAKEcg7lXiQDRcQIWFKk0YcS0X+aE5mcy7MpvAGcaG1TzP8g7jD5FFkkgoGWM0TJyuqLE9Wwn1iXNbscs+PwPCSY4W9f0oe47F0GAxAlkOPLEwWZqpzTlQSMW4uR+vwsoYUMhZul7cp0+iuo8DhFUvgS3Woax/ZUEJhtuGR4oyCFlTiEMkhVWqUgth8sXoOzNc0dK+CPQfLD3yKIy8amcjCRS6rA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ihjC4ne/Ti+iDFOMsC7LEOdMYvyoE98Hz/Nrmnif4T4=;
 b=pceHh3w7MbQCCOuPTg/7O+kT1AXMm6UQYylh5oP4VlihpiOtTjiLSlQCo76pl+GTzKHpdoL1z1ISBTfRBc2p9j4g0yACoS5DNVqJSX/ALPv8cFXFxC8xcZLLWi7z1yZ+xTOmMXq5xuqD+WmUyjwcFTB4+NZPkasY+7nWCS9aE9piZ2dHEAFYAfmjx1+Op32vQu2Ur7+jWMUjEGFhxd4cHRBF+Qoxs6T3IPwe0dO79waXbRTuuSlS9lxC0aTkHIF0wG9e/en0Da2K68crjUsQddYAx0NOPpmRvooonP+3l8cIVX8jXWgVUrwfHZIPGjY64xtoQpJVdCUk9Cj1v/KVXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=gmail.com smtp.mailfrom=axis.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=axis.com; dkim=none (message
 not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ihjC4ne/Ti+iDFOMsC7LEOdMYvyoE98Hz/Nrmnif4T4=;
 b=eHx+QQXPxwl6GTjuJZ4JtzN8isUG7R2El3awtlUe8iEVo8beEHbZz60Usqy1xwAtwizan5SsXN7KfCoyKMzlrqX0HwY1+sISi3Y0gZeSDOLF/QXB/2G16JmGhArdU1WXRD0UPQ8g2PYMICj4rVYKA+PNPV2C/aLWFEZqNRG7hNk=
Received: from DU2PR04CA0011.eurprd04.prod.outlook.com (2603:10a6:10:3b::16)
 by PR3PR02MB6378.eurprd02.prod.outlook.com (2603:10a6:102:72::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.23; Mon, 26 May
 2025 14:54:05 +0000
Received: from DB1PEPF00050A00.eurprd03.prod.outlook.com
 (2603:10a6:10:3b:cafe::e5) by DU2PR04CA0011.outlook.office365.com
 (2603:10a6:10:3b::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8769.18 via Frontend Transport; Mon,
 26 May 2025 14:54:05 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 195.60.68.100)
 smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 DB1PEPF00050A00.mail.protection.outlook.com (10.167.242.42) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8769.18 via Frontend Transport; Mon, 26 May 2025 14:54:05 +0000
Received: from SE-MAIL21W.axis.com (10.20.40.16) by se-mail01w.axis.com
 (10.20.40.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.44; Mon, 26 May
 2025 16:54:04 +0200
Received: from se-mail02w.axis.com (10.20.40.8) by SE-MAIL21W.axis.com
 (10.20.40.16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.44; Mon, 26 May
 2025 16:54:04 +0200
Received: from se-intmail01x.se.axis.com (10.4.0.28) by se-mail02w.axis.com
 (10.20.40.8) with Microsoft SMTP Server id 15.1.2507.44 via Frontend
 Transport; Mon, 26 May 2025 16:54:04 +0200
Received: from pc51235-2237.se.axis.com (pc51235-2237.se.axis.com [10.96.29.3])
	by se-intmail01x.se.axis.com (Postfix) with ESMTP id 25ACB4295;
	Mon, 26 May 2025 16:54:04 +0200 (CEST)
Received: by pc51235-2237.se.axis.com (Postfix, from userid 3319)
	id 2121440364D0; Mon, 26 May 2025 16:54:04 +0200 (CEST)
From: Johan Adolfsson <johan.adolfsson@axis.com>
Date: Mon, 26 May 2025 16:54:01 +0200
Subject: [PATCH RFC v4 2/2] dt-bindings: leds: lp50xx: Document child reg,
 fix example
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250526-led-fix-v4-2-33345f6c4a78@axis.com>
References: <20250526-led-fix-v4-0-33345f6c4a78@axis.com>
In-Reply-To: <20250526-led-fix-v4-0-33345f6c4a78@axis.com>
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
X-MS-TrafficTypeDiagnostic: DB1PEPF00050A00:EE_|PR3PR02MB6378:EE_
X-MS-Office365-Filtering-Correlation-Id: a904fccf-6d08-465c-b0a4-08dd9c65291a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|82310400026|376014|7416014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?UURFbmZSUVM5WmxmUXNKdmszL3NBaWRkL2RQUWtPZUFLWnpvSmh0QzBBcnF1?=
 =?utf-8?B?UlR2V2pmczB5YjQvWU93VUt3MkJkYVAxYkxabjV0S254Z0hwUTBXR3lLc25h?=
 =?utf-8?B?bEM3aklxR24vTkF3aGNXTnl2eVJ5bi9sK1RORXVNVU96Uk1BM0R5MkVPbEJB?=
 =?utf-8?B?K3JBblpnNjVpZjdzTlFTcjNjd1p6NlIyNG9tUWJndUc1TXhIT2p1K25ucHZS?=
 =?utf-8?B?cWh0STZYSTU4VlhsTC9NaXE2OGFEY1YxcDAvTVRmR25EckY1NW00c21lN0ta?=
 =?utf-8?B?N3ZjV09yMkxnRmtVOTQ1N2N5a2UveUtDN25BMk43MCtHYjI2VUM5S3A1dVdK?=
 =?utf-8?B?c29Ld2tua3VzVFBLR2hZMTNSUGkzVGNhYmlJcWhXdkZKVWFaeWlLSy82cEd4?=
 =?utf-8?B?aWs1d2JrVUtaSzg5UDU4NUhaSU15UURQdVRqZnpFMStqbXY1eE1yV3RsMzZt?=
 =?utf-8?B?czJxNXJOT0JhNis0S05qYTRENEpVMHpiUlNaUkh0ZHFLeFk4cy9lMlljN3Ay?=
 =?utf-8?B?RGpWU3VtTDZXcy9ydGNmRW1rc3VyUDVDdHFVZE51b254TC9IUFM3a3RBU295?=
 =?utf-8?B?REI0eDVYOXZlY2x0Mm5IdVJYR1BNR3lCNU10R2JSbzNMUnRRKzliNENrTGFL?=
 =?utf-8?B?T3Jod0hWRXZ2eDM0N05iUTMvcHNsdmZmZHdmVFlvbnZOeUZsM05GSUdxaklj?=
 =?utf-8?B?TWNCSEtCUFJsVThTeXBub3IyYkJiT3lKUE5pbmpmdk5IR1hZS0kyQWprSFNQ?=
 =?utf-8?B?VG9ta2J4MndYL3FFSzhvUmhmRkJOeGxwRk5UbjJCUjFCUDBrOVM2ZnZKbDVo?=
 =?utf-8?B?SzRSTG1DR2ZiMS9LSW1tcmg4aHhyRzJlY3BDdUs2YVBWVVFDSE5DUVFob0Rt?=
 =?utf-8?B?ZE9yazVnSmJRT2s5TERFZnRDd1FuNkJia0c3dmdJU2J2RlVTNTNqVXgvZm42?=
 =?utf-8?B?a1VvcnNZZW50MTUvei9OYTByTEEyRHB2cU5rWHVpa1ZhTzhscjQ1MU9rRXRW?=
 =?utf-8?B?cm1OUHkxZ1dNc1NpdXRZN3BpbERDQ0h2WDJxRTNqSlFqVWFFNUliTlhuN1pN?=
 =?utf-8?B?MFF6ZnRDUHFQQUk0cU5zVG1BUHhHUEFsb1RGZFhsdStvSmdwanBGRThodlVU?=
 =?utf-8?B?MS9NaE5OcmxhTkRLTVY3ZFlvL1lBaTVoNEkrSXNMWmVIaVYrWXkxTm9mRzRV?=
 =?utf-8?B?L3FxSDhNR2prZXpkdHg2KytPRkZHT2xibSt3ZW1Mdk02dis5U2NTSmZzaWpo?=
 =?utf-8?B?Z3NadDRhNkpTRWFwTXN2QXBScVVSdGxxMmUyOEJacStBRVBWRmNJazgvaGFv?=
 =?utf-8?B?K0I4SWU3SHZpMUtwT3hoVjRXNG9ieHAyaWlvS0llR3Rwc0hrRGFJdU9WbDB5?=
 =?utf-8?B?WEh4VGlvckViQmh6Wi9UUGVHM25yY0lHdWRscjV6RmlNTTBrRFY1b3BRV3VR?=
 =?utf-8?B?V01mK1A5T0NTWWZ1UmVRNXJRd25STmxKaWxxbUVrTFp5QW9FbXNRY2orRzJN?=
 =?utf-8?B?ZHF3N2pUTitnckdTdnRuS2lmVi83Syt4VklEY01UV0h3Vi9VdzdRbldXRmJI?=
 =?utf-8?B?TDFtSVZxUm53YjNCSVFLUUNaNUZ3cVk0M2wraFE3dzBlT3ZxZWlDbkRaSUd0?=
 =?utf-8?B?L1hMdFplNGZDUmh0SDBjUUxxRG15dVpBaHkwVFZlajZIR3ovUkVqSDNFTVVO?=
 =?utf-8?B?cE1ld1cwdmtxMjJGdmVLN0MvQmRsVTVOTi9wY05HK3NRbGk3SG1xQXplZTdJ?=
 =?utf-8?B?aituTEQ3TXBIOTRCeU9IKzV3eXZvS0JzWGVxL2xYZC9nSjdOem8rT1M5VjNn?=
 =?utf-8?B?aUh6VkYyYm02cStINVJpUjdxSWpydVNIdkUyZk92OTA0eWRzSEdrUm0yUGJq?=
 =?utf-8?B?MCs2S1pPdXNKQmwrU0JCTWpnOXREN0ZHQlFNc2lwZ3IyNVBtcWtncit4amtF?=
 =?utf-8?B?aTIra01mZHpPcTJxNnl4QzlZNEh3UjhwODVUaSswZXozaHdwRUdaSUk2MEg4?=
 =?utf-8?B?NEp2SjBsZXM0b2FVVU9jWFlHWDNpcFhVdHRQQVU5cEZOQWJvTHNLRWNTcElp?=
 =?utf-8?Q?vzFGR1?=
X-Forefront-Antispam-Report:
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(376014)(7416014)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 May 2025 14:54:05.1199
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a904fccf-6d08-465c-b0a4-08dd9c65291a
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB1PEPF00050A00.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR02MB6378

The led child reg node is the index within the bank, document that
and update the example accordingly.

Signed-off-by: Johan Adolfsson <johan.adolfsson@axis.com>
---
 .../devicetree/bindings/leds/leds-lp50xx.yaml         | 19 ++++++++++++-------
 1 file changed, 12 insertions(+), 7 deletions(-)

diff --git a/Documentation/devicetree/bindings/leds/leds-lp50xx.yaml b/Documentation/devicetree/bindings/leds/leds-lp50xx.yaml
index 402c25424525..a7b2d87cc39d 100644
--- a/Documentation/devicetree/bindings/leds/leds-lp50xx.yaml
+++ b/Documentation/devicetree/bindings/leds/leds-lp50xx.yaml
@@ -81,7 +81,12 @@ patternProperties:
 
         properties:
           reg:
-            maxItems: 1
+            minimum: 0
+            maximum: 2
+            description:
+              This property denotes the index within the LED bank.
+              The value will act as the index in the multi_index file to give
+              consistent result independent of devicetree processing order.
 
         required:
           - reg
@@ -138,18 +143,18 @@ examples:
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


