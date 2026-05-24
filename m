Return-Path: <linux-leds+bounces-8304-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eAXPA857E2ogBwcAu9opvQ
	(envelope-from <linux-leds+bounces-8304-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Mon, 25 May 2026 00:29:34 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id A84FE5C4930
	for <lists+linux-leds@lfdr.de>; Mon, 25 May 2026 00:29:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 8728B300231D
	for <lists+linux-leds@lfdr.de>; Sun, 24 May 2026 22:29:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 99C5D335555;
	Sun, 24 May 2026 22:29:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="F2KtJORI"
X-Original-To: linux-leds@vger.kernel.org
Received: from WA1P291CU003.outbound.protection.outlook.com (mail-polandcentralazolkn19011024.outbound.protection.outlook.com [52.103.53.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D4EF2E424F;
	Sun, 24 May 2026 22:29:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.53.24
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779661771; cv=fail; b=dnfagbJ8i1hVTocxG3FxfVqFotIqBr4uUZF6Ye5Gfn9vIj2MvDqna0bfJ4JY7KNvVoyl4sUstEUH8tL/vUNi3kGi7MbHP17Au2kVHYOu58prNku7ZjzwzMvNlpYLm6HVdfinfsC/qGlavEiof6wwiFQPrrWsNnPdX53wk+sWVdA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779661771; c=relaxed/simple;
	bh=IjU/5NoDsHu0wqkIBcOHVEJ7ua0ZbfajlDgpoCw7FYc=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Sdt+TxtO15r3pamz9kg7kzRwEsIEcjoT5GnwfhrzxUo+ExHvWHxMq2c7ZTk3riKa2dphjigvNGY2rtRSYCbDUywVk3BQlCbJjR87me1J3HzxwGzW85W8A4GHnmOjyWYMl80iIYEG7WCCTxoFW5JT6K322mq5qNSxBDbg4tyTGmI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=F2KtJORI; arc=fail smtp.client-ip=52.103.53.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lcxQZ2scLQjOtO9soLHQUkInkZRZqVpcyF+CZvB6vONJ5nfRElCjKPucYIzh1uZDi9O/tooEcER6NkWMgHNRgy37NGuCTVu/ZpyO23HlU8rlSBcj7T6Yu4WTn1US1kcQczweG/mL9ZxxEhvYSAdobB/wN9QVLs6fYNZGjZDU/1cmnpQtcleGfly70ob4V4Xm0i7NKxsOBJZjvyjXrCc3T2FIwxKVsMuLsDiyl3JQBCGPhaWn5BJ7pUTc/hpIOM8ve0ulIxQzps7GpNEXehiM/JfFixIF1x7kPltQrr/+ch0MVvYga8/cGMCy/mbQYATnCAYn2FhSUiUUxyEHPwmPjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CY0VMFfykmTzTfPtWcJtPdPeUmxqvQzrE1ueMYuVQU4=;
 b=JafnQuXBcfKVMIdbKpkW8XaoJcm6AXs7/1Oi57xC274jngJnHD0jH+DI2nUBVQ/6zVmmu0YAwXbCkYaLfaXeLPMNvgXWy/gBf7MneWESfLviv6oeSScD0rczH4iBn4HXFbIMz6WTYejSFp4+yjuIYIY4w5NPY1aB0zmizXgADYklw1cMBtAs3HD9H7+Qj1opNm2F0L/k94a4TZLTOsko86z0lKbdJIaduA/cnKfU9qKVsgMC1ljB4WUvG4b/OAL2aC6fLTaIZunzlaH+wuWqSf3yyyXcFyQNbUzzrmWaseFkKEAViJvCnxbp3MzBfMahTfQsUvZaG9GhcmiojGWZjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CY0VMFfykmTzTfPtWcJtPdPeUmxqvQzrE1ueMYuVQU4=;
 b=F2KtJORIXcYhbts68lyoQRyebqRUQHQPh/vFQ1YBQ5qklbhlviPesAzC8UsB5Iz+3jw3kWzvr5fN0dPs8pZaizKNTQrm8zujBZYc4fW30URIaUVp4MBL5OZKsEpUREwzUxWwuTprUBFjDXZzKJr/Jch1ikpnPU4vDl0hCVqB7r26ZHzQ+/ilGeMPFb00GBfD6JTPLFPZFe7qB28knYBR9nhJGPjc/RAbF19f+22YR3hmrqiqRxP3t80Ju6gOeC6ABMWpugMW6mgS4hOyOTG+J4tzJfe6ppRFBlyUdl0mkPRwbc0s8/TssjCof8Q4Mvs1trZHP8tNjHwIn+FcTOv3cg==
Received: from WA0P291MB0385.POLP291.PROD.OUTLOOK.COM (2603:10a6:1d0:e::21) by
 WA0P291MB0169.POLP291.PROD.OUTLOOK.COM (2603:10a6:1d0:5::14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.48.19; Sun, 24 May 2026 22:29:26 +0000
Received: from WA0P291MB0385.POLP291.PROD.OUTLOOK.COM
 ([fe80::84dd:c148:c19f:98a6]) by WA0P291MB0385.POLP291.PROD.OUTLOOK.COM
 ([fe80::84dd:c148:c19f:98a6%7]) with mapi id 15.21.0048.016; Sun, 24 May 2026
 22:29:26 +0000
From: Manuel Fombuena <fombuena@outlook.com>
To: lee@kernel.org,
	pavel@kernel.org,
	vicentiu.galanopulo@remote-tech.co.uk,
	linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 08/10] leds: st1202: fix brightness having no effect while pattern mode is active
Date: Sun, 24 May 2026 23:29:14 +0100
Message-ID:
 <WA0P291MB0385899401AC70DE2AFB68DFC50D2@WA0P291MB0385.POLP291.PROD.OUTLOOK.COM>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <WA0P291MB03855101311F0506B6448A8EC50D2@WA0P291MB0385.POLP291.PROD.OUTLOOK.COM>
References: <WA0P291MB03855101311F0506B6448A8EC50D2@WA0P291MB0385.POLP291.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO2P265CA0053.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:60::17) To WA0P291MB0385.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:e::21)
X-Microsoft-Original-Message-ID:
 <20260524222914.388300-1-fombuena@outlook.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: WA0P291MB0385:EE_|WA0P291MB0169:EE_
X-MS-Office365-Filtering-Correlation-Id: 381ac0e1-75b6-44ae-e46c-08deb9e3e9b3
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|15080799012|51005399006|37011999003|5072599009|23021999003|19110799012|8060799015|55001999006|24021099003|440099028|3412199025|40105399003;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Zja4KhyLbDG2MtnUX5aAu2P9FupFVBCD+xipWymzbyA94hJ2qOS/YI8WNz/G?=
 =?us-ascii?Q?4o5Dy00Nu77t7vzvR+R1zX2D0xJLAYk9qWRTbHZh9aq2TuvOGuCdKMVhIKuc?=
 =?us-ascii?Q?o9UyLAw2YpMsGRLUABZVMVpZ3sahCGKIUKJYUB1wh4XKVW9BKst5snWiwDZh?=
 =?us-ascii?Q?A6afEIlrdGbA6XzF+IdbbrrbCAAeXtPsBg5SaP6H9LWnGxqC1r9la+wYEAWC?=
 =?us-ascii?Q?CIL1MnmO0PVqylN2LDSCl2apyCnXGSPqTnS8sc8IZeEfIOgt90fRV5/9KF/X?=
 =?us-ascii?Q?ikXKCi8Q3JfgDulPTMxIB1cAbxg+BWTlsiF/OTarSZz7Ep7D8hchhNybUHoe?=
 =?us-ascii?Q?CEXdwnfvuXQuilPgmpnX5BGXeK99v0w6yxdghKYpxDyv9GlewZ7gLnrndBva?=
 =?us-ascii?Q?YhQBaa6jIprgnBQbB11RSRgicWjt60w59kI2C/mB1eMvM0R+MBuvB3sMsMgN?=
 =?us-ascii?Q?BAs92ToV0/38eFAM5lqFUUWGz9McT9pFcrkroR5wz7LUBNbCwVS3gHocjHwQ?=
 =?us-ascii?Q?e8BquewDmgHiQVJaR8W+ASyy1sSImq4IJ/SyptDbOl+tMIFJyxSgqozcG4Zf?=
 =?us-ascii?Q?BpKeGa6CZMOt1EmL+umue03yVSVNeEjReUurThPxkDNubG33eeD03fsRQBH/?=
 =?us-ascii?Q?aKwKgTsRKipWtnEO80c+jqyXunbVzLH2SwGBS6FWhSOxzanYfQfyYeX/K+tb?=
 =?us-ascii?Q?FMnW6j5hk4U6XCNC7Pf6qMTTV5zlY1N+9YewXDNSY0hqGDteKP485R+/xMxb?=
 =?us-ascii?Q?CRalT26/pB6bxcMhw59dAZwIlPh1D8QUN5NYzVNS2MacC4K1maOTZcPfdiqh?=
 =?us-ascii?Q?EeCpAu8dxIFjU2L1H3MMpQZiLmZnOmaRKG+606RO4o5Dob+7hz6ZGAD0DYKw?=
 =?us-ascii?Q?KLepkha6ZqeJSAzPk9sB7Oy7o1p0aG+0cvvPfysI6yrp2xcyHKhVPjZ+mWHv?=
 =?us-ascii?Q?zcxAVO0DIvuMsf2Ka4GtQz76K+goltfywB8QIvtmUE9gUqx1CesmGMIg2689?=
 =?us-ascii?Q?+4ME?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Mrh0rkor1wu28vovl1NGSlaQ7UrDTM2uFfrz/61AOEEgMMiXfC7k8N8EfAax?=
 =?us-ascii?Q?TbHBfcbjsG/U8UzQTNwPvpT01H/3DrcaF6eV7Fms0NQXIcZ7xpHEvrLhQktn?=
 =?us-ascii?Q?ySTaR66I6l8ms5kNF6jhKluKL+SDs4u68uH1QtTOHzXhYBRVtEp1m78NpkSQ?=
 =?us-ascii?Q?7ZqfM3nkNvGnOTlGq0VRvECnr6WFER4CDFhPtpUin+W52LMB8NLkrHhfYUXd?=
 =?us-ascii?Q?tTbwYN/iBlTdqyg/GjmtLPBAAwo3vm3CxcB2OcRWih8vGSrLvXDZLoUkNkeJ?=
 =?us-ascii?Q?n1DCMS9fufPSGM+32BlqubjJfW00Ey60K/34rIBuoE/17T9gpvOkj/dprGTW?=
 =?us-ascii?Q?T4dUSF5wHgtSiNhXwjKrD09OtMSWJO9A+JC39FjHkqhk0+T8/O0I/RH+lfMN?=
 =?us-ascii?Q?G7bw8SGRYskac+1EQExEv37TMnR9sWAtzxxUfY1dDC/ICwvcSqFlT3n0wtoH?=
 =?us-ascii?Q?wQ6DRC7LyMGfroUhF2fCpALoTVwZiPJzB3RT/cahaYlknkEh3qSJhd7cePXv?=
 =?us-ascii?Q?KyPpUOT3DQmCL7X0Y9lSg0tNUcdoO40uOzw/F+Ur9T/j9LaibBbtGybd7+Mm?=
 =?us-ascii?Q?ru0w0E31Sq6ktyzEqUhsf3Wo2v5hAFy2e0m6y+u8kEJpGBzul64sEBXAD3Fy?=
 =?us-ascii?Q?kB12oqsy1noelb90/B5Am49ClkN7/IExaGvpxAedISeI/gYnpntyZ5olUFyt?=
 =?us-ascii?Q?qJsMzLx9ocRreF0/jL05LAO654aOEUzxxu8MK0Z5jRwlHENY+4kpkAHQow8q?=
 =?us-ascii?Q?zb7PIkiA/cVc7Jabn+q8SWT5o/dnlnrHTLy3Z2xRQyzIy/AC0GsKpnOCtKBU?=
 =?us-ascii?Q?Olg0kscNPr7LUQgxDSLIUyrnLjWX6Cn1lxOYTAm7tCZHVDnnIi9sJhJhGIr7?=
 =?us-ascii?Q?hIv/cJW9wK5plY260QYhoLn+q/zYlJ7fCEzjlmDwpFgUlxd4D6BQxtXipY2U?=
 =?us-ascii?Q?LzzP6EmH/raD1EdyxFGxOiny+hg3lDnN3yTIm02R89/g61qRrv+d3mdjdYHL?=
 =?us-ascii?Q?0PGeajou7Q2r9S4mbjKtrggc9QVQU8Tp04qAntBteGMY0qLRAK3G+4mSn2xo?=
 =?us-ascii?Q?3nI5+KbpGpbjqQWGZNDu4bFZb1gyIXnDT+2tgqldKl5R4X1s0tPWdpwEmcLO?=
 =?us-ascii?Q?Bbu+MksMDutVNbNjHmagmJ30Z1FnrjTlTSG63J5AuRNDq2cySDcXAEpSLyrh?=
 =?us-ascii?Q?IBdQ2BggXRdjxFJyw59zQnAF5fVu4sk1hQUREPhpRYKjk4HSJpNGoOJvuSHQ?=
 =?us-ascii?Q?zLk0CfSwcI4E0DhtN8A7PwO3Y913u26vQ2trl1KsrZ6rC1Rnomt/w9xhNLIX?=
 =?us-ascii?Q?06nzPWe+56eQ+Ly+KSFoJQvBR6/MPKUP8Jw0wUqDqHVNZ894UcONMOKtm7Uk?=
 =?us-ascii?Q?ualzvpW9o2efTTqsvlhZc5HXtprTNQVtFNdL1ALPFHRV8bQ/p/2EK6xdseKt?=
 =?us-ascii?Q?BJ/nT99efXMo2tV227meCDBmCRyMU/Sc?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 381ac0e1-75b6-44ae-e46c-08deb9e3e9b3
X-MS-Exchange-CrossTenant-AuthSource: WA0P291MB0385.POLP291.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 May 2026 22:29:26.5313
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: WA0P291MB0169
X-Spamd-Result: default: False [0.34 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[outlook.com,none];
	R_DKIM_ALLOW(-0.20)[outlook.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-8304-lists,linux-leds=lfdr.de];
	TO_DN_NONE(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_NEQ_ENVFROM(0.00)[fombuena@outlook.com,linux-leds@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[outlook.com];
	PRECEDENCE_BULK(0.00)[];
	DKIM_TRACE(0.00)[outlook.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-leds];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCPT_COUNT_FIVE(0.00)[5];
	DBL_BLOCKED_OPENRESOLVER(0.00)[WA0P291MB0385.POLP291.PROD.OUTLOOK.COM:mid,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,outlook.com:email,outlook.com:dkim]
X-Rspamd-Queue-Id: A84FE5C4930
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Once a hardware pattern is running (PATS=1), writing to the brightness
sysfs attribute only updates the ILED register. The visible output is
ILED x Pattern_PWM/4095, so the change has little effect and the LED
never returns to steady static operation as the user expects.

Set CONFIG_REG to SHFT (static mode) before writing ILED so that a
direct brightness write always produces a steady output at the
requested level.

This also enables basic LED operation without the pattern trigger: with
the trigger set to none, the brightness sysfs attribute fully controls
the LED as a simple on/off device. Previously there was no working path
for this, as brightness writes had no visible effect unless a hardware
pattern had first been programmed.

This is safe because software patterns already run with PATS=0 (making
the write a no-op in that path), and the hardware pattern engine does
not call brightness_set during autonomous pattern execution.

Note that CONFIG_REG is chip-wide, so this clears the pattern mode for
all channels on the device.

Fixes: 259230378c65 ("leds: Add LED1202 I2C driver")
Signed-off-by: Manuel Fombuena <fombuena@outlook.com>
Assisted-by: Claude:claude-sonnet-4-6
---
 drivers/leds/leds-st1202.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/leds/leds-st1202.c b/drivers/leds/leds-st1202.c
index 9150b92ccbac..bca2d9a80b63 100644
--- a/drivers/leds/leds-st1202.c
+++ b/drivers/leds/leds-st1202.c
@@ -136,6 +136,7 @@ static void st1202_brightness_set(struct led_classdev *led_cdev,
 
 	guard(mutex)(&chip->lock);
 
+	st1202_write_reg(chip, ST1202_CONFIG_REG, ST1202_CONFIG_REG_SHFT);
 	st1202_write_reg(chip, ST1202_ILED_REG0 + led->led_num, value);
 }
 
-- 
2.54.0


