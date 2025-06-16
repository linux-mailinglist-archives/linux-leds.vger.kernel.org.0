Return-Path: <linux-leds+bounces-4808-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D21BADAE62
	for <lists+linux-leds@lfdr.de>; Mon, 16 Jun 2025 13:26:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3E56C1710CB
	for <lists+linux-leds@lfdr.de>; Mon, 16 Jun 2025 11:26:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 87A8D2EB5A3;
	Mon, 16 Jun 2025 11:25:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=axis.com header.i=@axis.com header.b="DKwL57wd"
X-Original-To: linux-leds@vger.kernel.org
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011017.outbound.protection.outlook.com [52.101.70.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0E9D2E92DD;
	Mon, 16 Jun 2025 11:25:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750073147; cv=fail; b=ax7amLLl9IOKbAiPoQJxEjMUMIW4FfUT/BGkhHU1d9Upy2vCAbzfJfDj7YGv+EWjEaoSePT28wAnPGTTnkSo+FUPrRBI+PkQFCLGSRw+wHTLT6Kc2vfAxo+lONFQhr3HcD+xxdCiVsCF4uA1CRaRuI1Abmx46JefKpHqlEKHvqw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750073147; c=relaxed/simple;
	bh=LbKGeRZippCy0LpXKnLILYi9gX0RlBwo7NsVIrCpKwk=;
	h=From:Subject:Date:Message-ID:MIME-Version:Content-Type:To:CC; b=eQUzrXYbFav5oDtzFVwFLjDK5dXh/Fllvcir32XY1ZcmPBxE71Gj474ZVmpw7CMn45kcaYS0183zJ4QfnjhSjXvIL1OcSuQcZif7mtL0yhNgsn3xFlzDOGYhToE6IQ9Gpd2Ja8544mwSaH62hQ6NAxTmDUwC2gy9MhwIqVjruuU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=axis.com; spf=pass smtp.mailfrom=axis.com; dkim=pass (1024-bit key) header.d=axis.com header.i=@axis.com header.b=DKwL57wd; arc=fail smtp.client-ip=52.101.70.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=axis.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=axis.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YJKJZJlra76fT5OSShw+2yfK4M/K2RrmhpEYciOPhMQHx9zZS+46+m2aZ6yvmi8SIjpaVx0BU489SySBsQf+obg/fI5B8RxiRpvQuxalqpEDQJk22fVCoP7i3yuW+5wOa79gS8DqjThXnWeXm5p8MChiIlXabB2xOXvd5vrOKuj1hA00uOtCapkWNT0CRDZvW1g46aMdf7Sft1Kt7i4Qk44mSOncBqJ++JeE3zcKC5A5jz6iAy06ANQhyfuBtW5Mls1eACzuO1EHbTUdM1LUrJZMnto7cpVSE8vzXT3VBS3rff7DdTTo20+QtZ5fITSBoJNCVrUMcuR+VzJn8VlQ4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yfgC9/p+j/JonL4fiFSqMa6b8ryrOBDiNxlM54q7iFs=;
 b=j1k5PTj3uBu4wk8bqcRHx22z5dPQWAkqv7076qXjkQOxCHMF1sbp1MeLcjctBSRJUOlz07pAq2Dkly8em1ThkdDHeGiOgRvsyFyfZXpxxMzzDdt98WuX59IM8RKtkm8LobPrsnfK6pm5bjMtfmERZTID0a/32L6gTcUQ8XunQ6G3+Cz2reWlqwwo5dNjqU8FHfD2Pw83R9gZtwNz9aIq4VhFMOWsA5GbXYwTt+gg0QTuldIqtLk0Q6fSMLXacQdLqWFjBPWdzIoxnf90bOrZNeBbGebVBUYYdySNBAmXzYVpc3SWWMzwzmkMq1U6o7K0mQTEJ9MYzRMB9R3YtzM/yw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=gmail.com smtp.mailfrom=axis.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=axis.com; dkim=none (message
 not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yfgC9/p+j/JonL4fiFSqMa6b8ryrOBDiNxlM54q7iFs=;
 b=DKwL57wdXRplaRcRuIg+6duVZFSez7aLh19XIfRF6MVK2Vv6pOWNTQh1NtrylymHyFId5GDOt59LlukV3ttiJxEZz+VmJJlRTzKzfkj0LnTpnLSJoAmgqhpkKw3iNaf7TFCS77otqMJgKOZT7xM/06L+uM3w2nDYxcXTqFdpWls=
Received: from PA7P264CA0097.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:348::15)
 by OSKPR02MB11267.eurprd02.prod.outlook.com (2603:10a6:e10:9b::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.28; Mon, 16 Jun
 2025 11:25:38 +0000
Received: from AM4PEPF00025F95.EURPRD83.prod.outlook.com
 (2603:10a6:102:348:cafe::92) by PA7P264CA0097.outlook.office365.com
 (2603:10a6:102:348::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8835.27 via Frontend Transport; Mon,
 16 Jun 2025 11:25:37 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 195.60.68.100)
 smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 AM4PEPF00025F95.mail.protection.outlook.com (10.167.16.4) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8880.0 via Frontend Transport; Mon, 16 Jun 2025 11:25:37 +0000
Received: from SE-MAILARCH01W.axis.com (10.20.40.15) by se-mail01w.axis.com
 (10.20.40.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.44; Mon, 16 Jun
 2025 13:25:36 +0200
Received: from se-mail02w.axis.com (10.20.40.8) by SE-MAILARCH01W.axis.com
 (10.20.40.15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.44; Mon, 16 Jun
 2025 13:25:36 +0200
Received: from se-intmail02x.se.axis.com (10.4.0.28) by se-mail02w.axis.com
 (10.20.40.8) with Microsoft SMTP Server id 15.1.2507.44 via Frontend
 Transport; Mon, 16 Jun 2025 13:25:36 +0200
Received: from pc51235-2237.se.axis.com (pc51235-2237.se.axis.com [10.96.29.3])
	by se-intmail02x.se.axis.com (Postfix) with ESMTP id 0398120E8;
	Mon, 16 Jun 2025 13:25:36 +0200 (CEST)
Received: by pc51235-2237.se.axis.com (Postfix, from userid 3319)
	id F3CBB40D504A; Mon, 16 Jun 2025 13:25:35 +0200 (CEST)
From: Johan Adolfsson <johan.adolfsson@axis.com>
Subject: [PATCH v6 0/2] leds-lp50xx: Support reg to set multi_index.
Date: Mon, 16 Jun 2025 13:25:33 +0200
Message-ID: <20250616-led-fix-v6-0-b9df5b63505d@axis.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAC3/T2gC/13OTWrDMBAF4KsErasgzZ/trnqP0oUsS4kgjYNVT
 Erw3SunEAtvBt4w32MeKocphazeDw81hTnlNF5LkLeD8md3PQWdhpIVGGADwPoSBh3TXRNR7Jm
 IW3KqXN+mUNbPps+vks8p/4zT77N4tuv2v4ONvDpmq61mcdj1zK6J/sPdUz768VutFTNUDGBjo
 I0WBkOCgMHjjmHNcGNYWCsDSGfW0e4Y1ax6kgpDROIonlyzZ7wxsRXjwiJ3viHTonV9xZZl+QP
 loBfweQEAAA==
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
X-MS-TrafficTypeDiagnostic: AM4PEPF00025F95:EE_|OSKPR02MB11267:EE_
X-MS-Office365-Filtering-Correlation-Id: e8131a90-91d3-4717-55bd-08ddacc884d6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|82310400026|1800799024|7416014|376014|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Wm1Xak1FYUNwTVdwS0lXT280RDYvWmRDaW9DVmgzb2hpQnNLSi9CTGFsYUdr?=
 =?utf-8?B?NXVPODlUaGJ3alpaWGo4aFR0Q0oxbjBVeXB2NWFZUWpwL2hORFdiWjVOdWc5?=
 =?utf-8?B?SlgwMktpVkVFTGIzekJxM1I0NTc1VkpTeXV3OWl3bWhGUHFwUXUrSFhhYzJT?=
 =?utf-8?B?OE9YT29kNnBWOE90dlc2ZVh1T3VWWVZXMWtLV2ZhSXdJNmE0RDMrZmxYVjNp?=
 =?utf-8?B?bHRqWkNidlk2YlhIWUlUVnNrN2VURUlmYktQdk5QSVVTbVVnVTM0bm9xQW90?=
 =?utf-8?B?NFRsWTZnQ1JQMDRNQWFpbTBqVVVPVkFoTUNuQzMyd29iWDI3M1RIQUJjUlVt?=
 =?utf-8?B?Qjh5OEg2QjdhUkJSTHNMbGdSSFlXcXFNNjhDeDV6d1ZPT0F0VWpNczF3Z1VK?=
 =?utf-8?B?VmJvdkpXWXpGR3ZZRmZiMEVXR1ZtSGptT1BaZGVJZkhxQUhLc2hrWWdzMk1a?=
 =?utf-8?B?YW50bWw1UXNmdWRlcnlrUTJOcXFmdC9IZDlWcDlqMysvWU9EQjFhL0JLbEc1?=
 =?utf-8?B?bzlYcVg2VDdrY2xpVzVwb3k1WVRxczJZYXdWUktYTElGckd0NndwUkRxNHZR?=
 =?utf-8?B?ZW9TdUhzMmlRQU9LQnZmYVZGS2RIVkkwRXo2MXVJdnhJcEQxaUxZa1RHeldE?=
 =?utf-8?B?WW4wL2RGeUx2aDFSRVFmYmF1a0NOQmZBSlkzRmREN2ZoTzlWK2xnSWY3cVJF?=
 =?utf-8?B?ZlU4YTdBUjJ2NkdpL29LQjJHOXBHb1NtR05hZkJlNExFMVZzYXQ1aHViSXp4?=
 =?utf-8?B?UWp6emVmSC9EclNpTUFXdG50QjhRQitMU01ibFppR3Vqak81cnU1aDJldVVB?=
 =?utf-8?B?cW1rZExWT3dkTmhLNzg5V1hxU3VFVVluSUFvVW4ySEpwTUdYcUZsaXorLzlv?=
 =?utf-8?B?a2pQK1labmRuRkt6TDM1VXB2eHBub0U0MGRJSElCTmFFQ2VQWFU5U1ViRlR6?=
 =?utf-8?B?MHBPbDRPeURQQ2cyK1hOUGx0NVJNTXhieHNyc3Y5WTNvT1d6L0FhYWV1alBa?=
 =?utf-8?B?NkM1WE82SG1SU0xFV1hqUzYrK1RRTGpVUkp3eU5JRGpiZHp4cU4yeG82OVIv?=
 =?utf-8?B?SGtmRVJWMjlyNjM5dTB5ZEFnaW51bEJ0bVQ0TkVUMWhoRXV3bGxMRzBSR3Q1?=
 =?utf-8?B?bmptOUovTm8yTnR2NjZBOXFSM0d1ZjhYSHVBV1lVRStyWm1nWFpZNy9mazQr?=
 =?utf-8?B?TTc1TGNaSUJZcU5aOTBLMm90Ky9CTWVLWlRmYStOMWNCT3h3Vi8xbTg2Q0pF?=
 =?utf-8?B?bkNRSGY1aGY1aU9mNVREOWxsSUdPUVB4YVBYRFBOUEJHRFpqRi9GbTcvbFp5?=
 =?utf-8?B?ZW5sQTdhQ0dwS0xudnRBOENYUGV3OUIweGUyVXpveW0xbUY5bVdtOW44L1ZS?=
 =?utf-8?B?bWhuUzkvdU9CZXRyb3poVzNQVm55dUJhUTFJTisyNm9nOG9lNDd2amxzbWRa?=
 =?utf-8?B?S0k4OU5Fd1A2TXFQbnFTTm5WWSsxNUxGK0RwMm1mdElNUjE3S2k4NlNVa2do?=
 =?utf-8?B?aVZDVTZQSGVvOXk5QnFZU3h6ZVA2RlYxMmd1MnMvVStkNkg1OFpiYkkyZnNF?=
 =?utf-8?B?N3VrNzRGbnZwM29tTTk5MjQ2dUhwRXgwSE1Kb1B4K2VMVjFUYlJLUG54a3Ro?=
 =?utf-8?B?VkJ5VWtvek1zQXZlcFJnVU5POWZTM3EwOERoSlZUSUI2a1hobzV1NkcxSm9M?=
 =?utf-8?B?M1YwRkMxZlhZRWZFcUo5TWxNNHZiWkdtMDhYc3ROekxtemNMb25qbjdvOXBQ?=
 =?utf-8?B?OEJMUU1zVk1PVUsxeEE2aXZHUEo2MnZYQmlCRUx3d2lSL3V3UExmZmE3bjJX?=
 =?utf-8?B?cjd5MUpmRnVBcmczNVp0U3VEYkUwL21YRTZtb1d5OTJZRVJENStVeVBtWC81?=
 =?utf-8?B?ZUl3MXJzNUlvY1Y5cU1CeFVvOTg1VnhzWWgwUWd2Rlk5blNCbnE2cW5qL05q?=
 =?utf-8?B?WnN1dm8zdFFmN1NOVE53dDNOYUNqdFBIZm9mb1BqMVRlbmlnNjB4dkdmYWZZ?=
 =?utf-8?B?TkhJTFNuOEVXYVM0bmFsK0s5ajkxVjArZnRHTmZ2eVlLOEMvNUtGdHBaWUsy?=
 =?utf-8?Q?yYlogY?=
X-Forefront-Antispam-Report:
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(1800799024)(7416014)(376014)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2025 11:25:37.8123
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e8131a90-91d3-4717-55bd-08ddacc884d6
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM4PEPF00025F95.EURPRD83.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSKPR02MB11267

Since devicetree nodes are (sometimes?) processed in reverse order,
support reg as the actual multi_index index so yo get well defined
color order presented in the multi_index file.
Not sure if reusing reg for this is the correct way or if another
property such as "multi_index" or similar should be used instead.
Looks like reg is used for similar things at least.
Or should the whole "reverse the devicetree" problem be fixed instead?
Update bindings to match implementation, and add description for the
reg property.

Signed-off-by: Johan Adolfsson <johan.adolfsson@axis.com>
---
Changes in v6:
- Remove maxItems från devicetree binding
- Link to v5: https://lore.kernel.org/r/20250616-led-fix-v5-0-f59c740831ab@axis.com

Changes in v5:
- Fail if reg is not set.
- Adjust devicetree schema, use items.
- Link to v4: https://lore.kernel.org/r/20250526-led-fix-v4-0-33345f6c4a78@axis.com

Changes in v4:
- Remove maxItems from devicetree schema, not compatible with minimum
  and maximum.
- Link to v3: https://lore.kernel.org/r/20250523-led-fix-v3-0-86d2690d2698@axis.com

Changes in v3:
- Update To and Cc.
- Rephrase bindings descriptions, add constraints.
- Link to v2: https://lore.kernel.org/r/20250522-led-fix-v2-0-652046323ec3@axis.com

Changes in v2:
- Avoid duplicate assignment. dev_err and return -EINVAL on error.
- Update bindings doc.
- Link to v1: https://lore.kernel.org/r/20250506-led-fix-v1-1-56a39b55a7fc@axis.com

---
Johan Adolfsson (2):
      leds: leds-lp50xx: Handle reg to get correct multi_index
      dt-bindings: leds: lp50xx: Document child reg, fix example

 .../devicetree/bindings/leds/leds-lp50xx.yaml       | 21 ++++++++++++++-------
 drivers/leds/leds-lp50xx.c                          | 11 ++++++++++-
 2 files changed, 24 insertions(+), 8 deletions(-)
---
base-commit: 0ff41df1cb268fc69e703a08a57ee14ae967d0ca
change-id: 20250225-led-fix-444fb544584a

Best regards,
-- 
Johan Adolfsson <johan.adolfsson@axis.com>


