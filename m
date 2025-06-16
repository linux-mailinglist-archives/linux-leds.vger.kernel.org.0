Return-Path: <linux-leds+bounces-4804-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EF0B7ADA9FA
	for <lists+linux-leds@lfdr.de>; Mon, 16 Jun 2025 09:57:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4D56A3A7B61
	for <lists+linux-leds@lfdr.de>; Mon, 16 Jun 2025 07:57:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6A50420F063;
	Mon, 16 Jun 2025 07:57:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=axis.com header.i=@axis.com header.b="muqwbZSK"
X-Original-To: linux-leds@vger.kernel.org
Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010043.outbound.protection.outlook.com [52.101.84.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A21322040B6;
	Mon, 16 Jun 2025 07:57:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750060641; cv=fail; b=fKtn1Fquj00j4yefyqJSpDXkoMqk2WZ11G5FYKKaRvGk5m+v3Uu+iZUZ577ssT4CaENgqcc2a1OrzDHWdqS3IYbKpTVWwpTd9WqeC+3OQj9G9mw8Hq9A0m28QIl05fCDx11oWCSogokP3XYFJX6WKb6e4bc12lk60iKBHyK/E1A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750060641; c=relaxed/simple;
	bh=kgLVRavYalV0EGgrAwT/18x+npqJ4KaDeaw3sllHNeA=;
	h=From:Subject:Date:Message-ID:MIME-Version:Content-Type:To:CC; b=iPivNWIEqgo8OIVo6r6snB4SwgQ6POwi+jl41KkCXcuT9JFjqTouCi9hGTkiNqDgjwsf8EfPVkL7XSya0E+RTa0hQ/oljPehiFNocgdvNczGt+ThlASgzjTy2G9wQoKuCmMVC168FIey7SqBVogc7d/SI3UJITgfPxkOkWEkQis=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=axis.com; spf=pass smtp.mailfrom=axis.com; dkim=pass (1024-bit key) header.d=axis.com header.i=@axis.com header.b=muqwbZSK; arc=fail smtp.client-ip=52.101.84.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=axis.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=axis.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TFPjGjtPmY+CmesjWL0dZDcguFqtC2KB8EacPAFizw6kH1EwPmlqybSqLFKlNk40DMeJL40vPoFlXVj75XWikRo/Pj5Rj6mEomWNUWQdCZjxUfCI6ybwubJJYV0dkEGgehMmManLQERZL/9974urwZmDciBi0MMLBiPkC3VHez5FTq6gfEUeUJZ3UzAJ8lUhOB8ljfARGctn47YR7s/cYqw/zifxe6ezE7xpVgLycPr7zmHa9xZYBdC53/cc3/oMHv3Su6GZGG5eNTvqyxfj8yfCbiwtBCZsvlCAuvKX+E+b4/naOwQnhuztmaSl+XyNaCg2a++E9Nc3Utz45win4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CVUsI5a+TvWIMYjUb0bRNUkBeZO499jcYSIFcViURkw=;
 b=dZfKVusdidPFUWoBtm0/b7oKdheN6heexPzS8foDVe0JYZpItuSD11OmP9DrjeGETLP5Rogy14GBuDsG4TCKeNuMjNn/m7UWLNlwdKH6KufGCkqnZ+k/8u4I0UODHqJQ4wKkVid6CjPuOk4tdltJQ1qyr1E6TCLooHRNH+eiVdeAz1PQXYTldXzoieKClaWC3C71Gah/t45d8HMjZogobbBWT93F6YzyeaYoBof95DOyCrAXcjFFkNGwWp6tBE3wkRTcGm79Zpvi87cmRbKvHAsXAxAgtk6QtojZZQ1oVo/UwH9s+3oYrfK5Di2DupxNN7y0kYefKKilCcTeMlX7sA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=gmail.com smtp.mailfrom=axis.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=axis.com; dkim=none (message
 not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CVUsI5a+TvWIMYjUb0bRNUkBeZO499jcYSIFcViURkw=;
 b=muqwbZSK78ghSq2hPZyfTK5b8vJk9kW0trQG+7f8NN0IWv4XSna7JRuCJ/Xx1E30bMve9fsNJI1Oszdzx97LfSIXSeSsFNkfa46QQlokdllbh8Mu8N8NlN9wwgNbPVW65ZCRhxI4K528ekpiL2b/+EN4ETIWMu9hxWPqp12IG2I=
Received: from AS9PR06CA0159.eurprd06.prod.outlook.com (2603:10a6:20b:45c::26)
 by AS8PR02MB8493.eurprd02.prod.outlook.com (2603:10a6:20b:541::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.29; Mon, 16 Jun
 2025 07:57:15 +0000
Received: from AM1PEPF000252DD.eurprd07.prod.outlook.com
 (2603:10a6:20b:45c:cafe::6b) by AS9PR06CA0159.outlook.office365.com
 (2603:10a6:20b:45c::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8835.25 via Frontend Transport; Mon,
 16 Jun 2025 07:57:15 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 195.60.68.100)
 smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 AM1PEPF000252DD.mail.protection.outlook.com (10.167.16.55) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8835.15 via Frontend Transport; Mon, 16 Jun 2025 07:57:15 +0000
Received: from SE-MAILARCH01W.axis.com (10.20.40.15) by se-mail02w.axis.com
 (10.20.40.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.44; Mon, 16 Jun
 2025 09:57:10 +0200
Received: from se-mail01w.axis.com (10.20.40.7) by SE-MAILARCH01W.axis.com
 (10.20.40.15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.44; Mon, 16 Jun
 2025 09:57:10 +0200
Received: from se-intmail01x.se.axis.com (10.4.0.28) by se-mail01w.axis.com
 (10.20.40.7) with Microsoft SMTP Server id 15.1.2507.44 via Frontend
 Transport; Mon, 16 Jun 2025 09:57:10 +0200
Received: from pc51235-2237.se.axis.com (pc51235-2237.se.axis.com [10.96.29.3])
	by se-intmail01x.se.axis.com (Postfix) with ESMTP id 1101A258B;
	Mon, 16 Jun 2025 09:57:10 +0200 (CEST)
Received: by pc51235-2237.se.axis.com (Postfix, from userid 3319)
	id 0CF0F411E6D2; Mon, 16 Jun 2025 09:57:10 +0200 (CEST)
From: Johan Adolfsson <johan.adolfsson@axis.com>
Subject: [PATCH v5 0/2] leds-lp50xx: Support reg to set multi_index.
Date: Mon, 16 Jun 2025 09:57:07 +0200
Message-ID: <20250616-led-fix-v5-0-f59c740831ab@axis.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFPOT2gC/13O3wqCMBQG8FeRXbeY58/UrnqP6GLOmYPKcCFF+
 O5NgxzeHPgO5/dxPiK4wbsgDtlHDG70wff3GHiXCduZ+8VJ38QsQAErAJZX18jWvyQRtTUTcUl
 GxOvH4OJ6aTqdY+58ePbDeyke83n762Cl/x1jLnPJ2mBVM5uitUfz8mFv+5uYK0ZIGMDKQCqpG
 RRpBHQWNwxThivDyErdgK7UPMoNo5QlT1JkiEjcakumSNk0TV9N2oxjQgEAAA==
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
X-MS-TrafficTypeDiagnostic: AM1PEPF000252DD:EE_|AS8PR02MB8493:EE_
X-MS-Office365-Filtering-Correlation-Id: 7434294a-80b1-4b02-51c0-08ddacab68b8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700013|1800799024|7416014|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?d2NJOHZ3dy9PVmovcEpzM3dlR0RiQk9NT0JPbXRQemRZUWRFajNiaFpxQ1ZB?=
 =?utf-8?B?bk1wMXgycWdzM3M3MG93VWZyOHc0a3lxZkpQeS9UdmkwaHliRmhFbHNMVkpY?=
 =?utf-8?B?alZPaUs3ZTlLZDhNOHZ0bVJvZzIvQno5UDVCRmRuMGdhQXIxdWJqb2F3UzFP?=
 =?utf-8?B?dDVMR0xXV09MQWZSQjBxQ05Ubk94RWY2TkZ1UzVPd2lCWlVnZTgyT3hUTDBQ?=
 =?utf-8?B?aEdadTh5TkIrbllwN1huRi9Ubi8xeTJORGFKM1JuTUJWUktkTWtBKzlZNUVy?=
 =?utf-8?B?alNwb0R6NlE4YkhHZE1nSUFXd3FRLzB4VGMrelRzSDNhZlFsR3RyZUFTa3pk?=
 =?utf-8?B?akpjU2RheVN3WHJDSnArNHlwbVhBVmZZcGYySkFuV0dTRHk1RFFBQlA4OFlC?=
 =?utf-8?B?QXBGL292dDBoYjVjejRLY0Q5UWVqaTQ2QXNvck1FcGcydlhDajJHOWVPVnVp?=
 =?utf-8?B?Qzd5bUhmOFJPT1QxY0t4Uy8ycFA4VzJWc2hTaVhsRWVsSVpPQzF3UjVDSS84?=
 =?utf-8?B?bWZ3eDhFVHAreTRTbkhxajd3Qjg5dmZ3dE5RTzN3MTJ1RElNZFk4ZFpsRmNZ?=
 =?utf-8?B?d1MxcXBxaUVONEJhY25veEh1LzczaEUvMlFYTm81WmR3OXZaL0REa2RRaXZP?=
 =?utf-8?B?TURzV3g1eGxYYjZzeWpXVHV5bENEVW5kSXd2bjAyMm50dE0xa2JKWk11TUpO?=
 =?utf-8?B?YmZ4TWxKSVlnUVBzYTRDZSsyT3BINDR4dC9qcnRpMUdNL3FoMFdzOFZMa0xo?=
 =?utf-8?B?dUZvYlZ6blk1QmNrN1VWWDUrNHJjc1grM2RoNWpNaXhTT3B5b1JjZ3JsbWFW?=
 =?utf-8?B?YVpYMmpYSFFXd1JvVStIMVoxNGJKMHZyZGF4ZmpmSEZWYWdtZyt0c0NkQ1Ri?=
 =?utf-8?B?bkJLMGVxZnJBbFN4UnV0UjBZUlBzanh6VUxZV0ExYy9FR3hxL1pnek5ia0M1?=
 =?utf-8?B?WUF0dzA2V1dJNnNuZlpXSUF6THM4bXZuV3BRNjBDZnBlU0JCVUM5K0RwcDcx?=
 =?utf-8?B?UEZmSlZPTlZKYjRCN1JKemw1UWZvV3ZSdm90K2hEY3hZZEpOZXFMUHRyTWN5?=
 =?utf-8?B?LzB0ZDcvUmhGczVVS0d4VFVRSzd3dXQwME9kdmR1QzJhMld4TXlWbGdib29r?=
 =?utf-8?B?M0x0OWh2c2JiN2RtMGVoa0NsV0sxdFhVSDdIaDlDSDg5WlozdUI4S2EvRE1U?=
 =?utf-8?B?YzB2a0UvQll0MXU0cGk2bVN1K1NucU5sNFphQ3NnQWplM0ppUzB1YTRTRjd1?=
 =?utf-8?B?VGkreUJwUHVwcGozanA1WjNTZzNhL2FwSmJPdnRkM0pYS2tvUFppK0EvZ3gv?=
 =?utf-8?B?cHBTeEFJYkErRmpESHlDZ0tSR1lYazcyaUZoMDR2WS9uV0FHb2pKLzYxWmdM?=
 =?utf-8?B?YnZGblBaNkY2VENUVE81NGNNSFQ3eGdzT1A0bExXS0tpYnZlRjE4b0JmNXRn?=
 =?utf-8?B?dFp1ODNYSW5PNXVUZUkzMjNPSTNlN1dtL2ZlSUFER3d5a1N3em1RRms1Sk1B?=
 =?utf-8?B?U1pZWVFkZkR5VEcwang5dktsbXEzUS9XZjRxZzluZktmMzkyR2tNYWkraVJG?=
 =?utf-8?B?NFJKS2pyR3VHOXE1QVg5OEhLVnd2czhrMXkwb3h3S2NrL3MxQ0NoT2xGcnZF?=
 =?utf-8?B?M1NnZjkyZTc4U0ZJZWo3azJSTWdJYWRPWmxkWkRxbEZwVUN1UEY3bHQ5YjhK?=
 =?utf-8?B?TWM0aUVNTng1YzNCQ0x4RWlKSnhVSU43N1hlSWoyNklwa0Q5QmZVVjI4ZGh3?=
 =?utf-8?B?alVvdlJhSWVIK0NOanF2YThNZGptbHBVdVpDV3pveURTQU4zaStNd1Fnb1E5?=
 =?utf-8?B?a1o3SlJGWnY2dEpXZEc2TFczL284VzZWQjdwUG1yYSsrK0JmYnFjb21GNnhT?=
 =?utf-8?B?akIrWmZpbmJjTzFBTnBsUStyYmNuU1ZiZ05mTGRHU3BGbGcxQm0wcXZRMFFG?=
 =?utf-8?B?TjZVY0p3Z1JUZC9rVUhlUWx0YlBURTB3Y2pxKzZNaTVLZkVwTCsyRHkyNnVR?=
 =?utf-8?B?dXhBdXZ5ZFQ1TGdDaHRneThuMU5BNmx2Ynl4S2I5bG1HTU1jYlBXZ25HSTBB?=
 =?utf-8?Q?e138ol?=
X-Forefront-Antispam-Report:
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(1800799024)(7416014)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2025 07:57:15.2365
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7434294a-80b1-4b02-51c0-08ddacab68b8
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM1PEPF000252DD.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR02MB8493

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

 .../devicetree/bindings/leds/leds-lp50xx.yaml        | 20 ++++++++++++++------
 drivers/leds/leds-lp50xx.c                           | 11 ++++++++++-
 2 files changed, 24 insertions(+), 7 deletions(-)
---
base-commit: 0ff41df1cb268fc69e703a08a57ee14ae967d0ca
change-id: 20250225-led-fix-444fb544584a

Best regards,
-- 
Johan Adolfsson <johan.adolfsson@axis.com>


