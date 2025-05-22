Return-Path: <linux-leds+bounces-4700-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id A6E72AC0DD8
	for <lists+linux-leds@lfdr.de>; Thu, 22 May 2025 16:15:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0D2747A8361
	for <lists+linux-leds@lfdr.de>; Thu, 22 May 2025 14:14:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6678428C85F;
	Thu, 22 May 2025 14:15:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=axis.com header.i=@axis.com header.b="UFLMoJpr"
X-Original-To: linux-leds@vger.kernel.org
Received: from EUR03-AM7-obe.outbound.protection.outlook.com (mail-am7eur03on2058.outbound.protection.outlook.com [40.107.105.58])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A246A28C5A6;
	Thu, 22 May 2025 14:15:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.105.58
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747923303; cv=fail; b=Yw4bqF8tsh0nukpCI+4mnIFE12hhtiodlEStxHgsD2gf5JdPM/H4j05B+UOLEeo+ymrC5qiG1zoIqrj2b8IZ2ycyETsUbCZrQu9Rlg5/n7AC3r631f4/kTMP1z/EJbSe7vMffVPTzesXd/I1/oCFNKh9X7sA3BNtPviF0Y+mEeU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747923303; c=relaxed/simple;
	bh=CcK7ocC778Eqgpc5Jtb46D//yva3DsVhDcio1XHbXy0=;
	h=From:Subject:Date:Message-ID:MIME-Version:Content-Type:To:CC; b=aO7PNgSihm99tXFi+aoyKiF+j4ZmYjxfhCX/qgdELDAc+yzRNfDrevC1AhDkkq5c8fOH2163vnP+zxKi5t3O6/UF8A2n6cuWulxRAut5UKenrA5/0n0+k4yj/zvVAM5opvWKOaGBWBDX4bxTE8x2NWVGU8GzsXza9rjvw5taT/8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=axis.com; spf=pass smtp.mailfrom=axis.com; dkim=pass (1024-bit key) header.d=axis.com header.i=@axis.com header.b=UFLMoJpr; arc=fail smtp.client-ip=40.107.105.58
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=axis.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=axis.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cxJn6QnWxTRXN2QeyvtQjDZ7mNaqMPJcuodpPcimqGyIYPzKMwD3QpQkyxp0sx4re0rDNlYUkfm8QaOV1x9ivSsN24OKn3+SEvhIZKVZtXHjtXtyNH5kchdENx63HPfNTpflm7s6qzgurU6mky2562vYfVrjpVhRGCvxrRdp55jLnJPXSPAllrpmoBnaJxKoq6v+KR9j8qBdV0i2yUpmeAMawgl4CGxxe9WCWJ5dJ+TujUj94/PzmolC3l2S18rA2/xz+AKWN1Gq8Zn+ywBaVXw9VaoWaNSp39PsOR+R/3xJ5hoLNvZ1V5d/Ebgt3r/NmK8lXTaH/QM0QojHH4l/gA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DlJ7DEzKXpMjHbvLOQsIgXkwcm4cQiH8R7CKHN1W/eY=;
 b=lIriajYiubaVUHIoC/4fxjMiKDDCdhq9P5xStFhN9J1d4KWhtIwM5sUFxStqJZ86vZPCV0jlw5WKBp/SqSUg7LsQj5A/JZBqRVVA71U3x663ur/ik7A381G7GzghveaYSUlLPmjVQUq2kzcz0W7ZAkKUqE6F1W4W4zxfznMQQzpuRdkXngsgfeEA0rwuQYYqPGd2B1S+yAxr3r6zzYbNxXbxp5FEPxaVOBAOpidhe5F/6nLFubr7u9Ox2GlLFBSMKIqyi+7cEhSzGcyUiHTKFxKIzKFxrt67pnp41hhqnL5oLYsbjC/CyAUxJatEElHtS+dVZrjF5/+uGVTRvltOjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=gmail.com smtp.mailfrom=axis.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=axis.com; dkim=none (message
 not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DlJ7DEzKXpMjHbvLOQsIgXkwcm4cQiH8R7CKHN1W/eY=;
 b=UFLMoJprSx/jwo1P05hYoDHWoP1ujyurob6N2ozXfgaWPsJms4oHNKdRgpYtfozhpQmHTAPxw1s1WQoHqqMsSv0Yfm7gUFUMShWffN7FiSIxvfFDQX6Xjp0a6DPHDle9i+oG5PCNShqjNQ8b63H5ONpBmUHkH73y/VZuqsBcCNU=
Received: from DU2PR04CA0248.eurprd04.prod.outlook.com (2603:10a6:10:28e::13)
 by AM7PR02MB6305.eurprd02.prod.outlook.com (2603:10a6:20b:1b3::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.21; Thu, 22 May
 2025 14:14:55 +0000
Received: from DB1PEPF00050A01.eurprd03.prod.outlook.com
 (2603:10a6:10:28e:cafe::35) by DU2PR04CA0248.outlook.office365.com
 (2603:10a6:10:28e::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8746.28 via Frontend Transport; Thu,
 22 May 2025 14:14:55 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 195.60.68.100)
 smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 DB1PEPF00050A01.mail.protection.outlook.com (10.167.242.43) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8769.18 via Frontend Transport; Thu, 22 May 2025 14:14:55 +0000
Received: from se-mail01w.axis.com (10.20.40.7) by se-mail01w.axis.com
 (10.20.40.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.44; Thu, 22 May
 2025 16:14:54 +0200
Received: from se-intmail01x.se.axis.com (10.4.0.28) by se-mail01w.axis.com
 (10.20.40.7) with Microsoft SMTP Server id 15.1.2507.44 via Frontend
 Transport; Thu, 22 May 2025 16:14:54 +0200
Received: from pc51235-2237.se.axis.com (pc51235-2237.se.axis.com [10.96.29.3])
	by se-intmail01x.se.axis.com (Postfix) with ESMTP id 58F3A2F47;
	Thu, 22 May 2025 16:14:54 +0200 (CEST)
Received: by pc51235-2237.se.axis.com (Postfix, from userid 3319)
	id 5DE0840364C8; Thu, 22 May 2025 16:14:54 +0200 (CEST)
From: Johan Adolfsson <johan.adolfsson@axis.com>
Subject: [PATCH RFC v2 0/2] leds-lp50xx: Support reg to set multi_index.
Date: Thu, 22 May 2025 16:14:47 +0200
Message-ID: <20250522-led-fix-v2-0-652046323ec3@axis.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFcxL2gC/z3Myw7CIBCF4VdpZu0YQKZeVr6H6YJSsJNoacCQm
 oZ3F2vi8j85+VZILrJLcGlWiC5z4jDVULsG7Gimu0MeaoMSioRShA83oOcFtda+J63ppA3U9xx
 dnTfp1tUeOb1CfG9wlt/1Z5Bo/0aWKJFaczj3RObo7dUsnPY2PKErpXwAaDth9J0AAAA=
To: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, "Jacek
 Anaszewski" <jacek.anaszewski@gmail.com>
CC: <linux-leds@vger.kernel.org>, <linux-kernel@vger.kernel.org>, "Johan
 Adolfsson" <johan.adolfsson@axis.com>, <kernel@axis.com>
X-Mailer: b4 0.13.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB1PEPF00050A01:EE_|AM7PR02MB6305:EE_
X-MS-Office365-Filtering-Correlation-Id: 4018055b-3dcb-4160-ecef-08dd993b06b8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|36860700013|376014|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?aURibHdaRDZJMjFQTUdJZitMNUkzenU3a1ZyVVdIclIvV0J1cndSSXdqcGxj?=
 =?utf-8?B?T2RFc3poWnE3bE51VTI5T3JoZkYyUTNtUmVnMnVVSzlIMVBDZE5MYk5kZGhj?=
 =?utf-8?B?TG1laU9Eek0yNkZNOC9WYW9BT3U4dXcvU0JMb25Zc2NaNExMbjMrMVZTa21s?=
 =?utf-8?B?eURxY0VpaVpJNmJGZlRhOGlWeHAxS0FFNU8rS25nTHgyWWZuOW8rcUFyd3hh?=
 =?utf-8?B?WFB2ZjJEbS9OYkpJdzZBc1YrUlVZaUxPMGIxcnVnQmhxQUpIYzZjbnNDOUFG?=
 =?utf-8?B?K0sxVmlTcG9xYVdIbUxVeXpIYUhTRFUwZER0U0JBb2Z3UWxVYU42MGx4aDNt?=
 =?utf-8?B?emdWdE9RZFl6bUg3M0VUUkFCUmVqSkRXa3Z4c3B3V0NLYzFFVmdkTGJ0MlI4?=
 =?utf-8?B?aHhMcy9HK2FBclpqeURUQjlWQkZ4ZXBVWDNudHVpSzdKOS9ESVhIVzVrWjBM?=
 =?utf-8?B?cTkybGZ3VGpQVmNNeTJNbkdTYTZiSVFTY1FFeFV1MFNvYzlIVG1RSjAzcHhW?=
 =?utf-8?B?dndTdjM0cnhjZVhFUkFuNTNoQXB6ODFmMXVsZi9idlp2MWhRVFA0RHJKOWlO?=
 =?utf-8?B?eVF2TjI0WjE5VDVUVXhNMFBndkxDdjJBd0N6dU10c2dUUHNSd2xOaDVqWnQ5?=
 =?utf-8?B?b2g2TzZzeEtLd0s5NlZReVVHeDRJczM5VHNNL29HeG1LUGhqM0dSQ3JQOHdU?=
 =?utf-8?B?QjRoQjNqdGF5Z2wzRFhkK2FPb1ZaNEtVT2p1aXpMMXZlM3JCRWk1enAzNDBL?=
 =?utf-8?B?bnVJM0p2UWJPaTBEOHp3MlNVdDBXdmRGVW4yNHF6MVNHemV6MVlYV2F5RkFO?=
 =?utf-8?B?WDhqUk0vaURESWpBME1MWTR5MlJTeUw4MXBjNy9Xbkc3TGFxckxNYzMwbFFz?=
 =?utf-8?B?UE5nMGxicEJWdktYbHhWZjIyWFRjaVRQbzdVU3ZDUWxTVmxNU2U5SDZLOFFp?=
 =?utf-8?B?YVVJV2hWQnFWdUNYMko0cTJZWGdWUndRbVJhbFRSNFdzWFNSRnBMdXA2bzZm?=
 =?utf-8?B?VUVpMUppRSt1NXova203angyamZEUDZpbnBhRkMzVElsQ0ZGRUt3anQ0VVhG?=
 =?utf-8?B?bzF0K1VJOEROUTZldUlNSUpCbFowcDlndEpTN2J1R1IxVDd4YkJFeUluTHlJ?=
 =?utf-8?B?VW80WHFmeWpOc0EzZFJHaVFjNVhMd2tWZDBBSDVIOFpNZCtBOU1tVFphQmJT?=
 =?utf-8?B?ZFBSRG1Sa0dWMStQY3JKYXpqc1RkM1ZocExSYUdiQmRDTlNyaGRLbzJEb0hZ?=
 =?utf-8?B?cDZuS21nNTQvajdDcHNkMnJIUmZjdHRWT3J2eHB0U3IycW9JMnBTQS9iV05q?=
 =?utf-8?B?Y0JaSEJEYnhCcnkydDJGS1FlRUpHT3RlQWh0eDh5eUdQU2ZoU3Y5cTFxRm10?=
 =?utf-8?B?WVR6Qi81MWVrRmgxL3JVTkRJRW0yMklCTWozaVR0aHlzTFBSdGJEanlCVnQ4?=
 =?utf-8?B?OVd1V1R5OG1CeEZlTERSSGJ0R3IzUm1tUzVJLytUN0h0N25kRVZsMEtpWFcy?=
 =?utf-8?B?UHdrUGNXUmdrWEVtMmhBalNIMU1XbkxyOHRCcGRpRHRydjZFbzVzMTVNVitJ?=
 =?utf-8?B?WHQ0cVZXcmhoaytiRGtndis0RGFYR1NodjVqZHhWVTZqZWtxcXd2RXZWdk9R?=
 =?utf-8?B?QzFGV0YrSkZsTVpYOWhxSE1xYlhyVDV2Q002Yk9PODd2REtFWngxcjgxdCtu?=
 =?utf-8?B?ZE1FVGtLZWVUTUtnL3RCZ0hBS0E4ZUt1WWQrUUIwQ29YMDk2cFpTUkVXQUll?=
 =?utf-8?B?bnFxVlYwS3ZZcUhxREttR3Z4VTRaRFk4dlk5NmxVVWx0TGlPVkp1YTBWY0RJ?=
 =?utf-8?B?WFdnMFpxSTRVVjdMZlBheXQxQXpET2NWelBENCtqUXJ0MVlRZXI0L1EvYVNj?=
 =?utf-8?B?d1Q4ME1RZkpwZDJBWkhsSFp4L3RlcWkyMFhldmlnUlRmczRLMTM5WExKNzBD?=
 =?utf-8?B?RW5ubWduWlV5T2ZnYmhTTUliU1lWZFk1a0hvQlpwVG5scElnS3FWLzloRnlP?=
 =?utf-8?B?RWJTMmxZRXpBPT0=?=
X-Forefront-Antispam-Report:
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700013)(376014)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2025 14:14:55.0889
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4018055b-3dcb-4160-ecef-08dd993b06b8
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB1PEPF00050A01.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR02MB6305

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
Changes in v2:
- Avoid duplicate assignment. dev_err and return -EINVAL on error.
- Update bindings doc.
- Link to v1: https://lore.kernel.org/r/20250506-led-fix-v1-1-56a39b55a7fc@axis.com

---
Johan Adolfsson (2):
      leds: leds-lp50xx: Handle reg to get correct multi_index
      dt-bindings: leds: lp50xx: Document child reg, fix example

 Documentation/devicetree/bindings/leds/leds-lp50xx.yaml | 11 ++++++++---
 drivers/leds/leds-lp50xx.c                              |  8 +++++++-
 2 files changed, 15 insertions(+), 4 deletions(-)
---
base-commit: 38fec10eb60d687e30c8c6b5420d86e8149f7557
change-id: 20250225-led-fix-444fb544584a

Best regards,
-- 
Johan Adolfsson <johan.adolfsson@axis.com>


