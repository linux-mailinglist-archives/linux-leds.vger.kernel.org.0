Return-Path: <linux-leds+bounces-8153-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YGgHOjOBCGo/sgMAu9opvQ
	(envelope-from <linux-leds+bounces-8153-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Sat, 16 May 2026 16:37:39 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E727655C1DD
	for <lists+linux-leds@lfdr.de>; Sat, 16 May 2026 16:37:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 0776E3007B26
	for <lists+linux-leds@lfdr.de>; Sat, 16 May 2026 14:37:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B93E43E1695;
	Sat, 16 May 2026 14:37:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="VTyF+6RP"
X-Original-To: linux-leds@vger.kernel.org
Received: from WA2P291CU004.outbound.protection.outlook.com (mail-polandcentralazolkn19012053.outbound.protection.outlook.com [52.103.53.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E44F26B2CE;
	Sat, 16 May 2026 14:37:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.53.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778942248; cv=fail; b=NeJfZNs7TyTNkJ4AIfJtEtOAKgSckXQkmIw3Ks/AHbbuoOVX9enJehIhwqb5GvW6D8MlKh/mgAeC03kn5wAJlai4R+epljo2WxBG1/kkhXtl2n01r5th38fXuRrQg5KY7f7kwdsiw8IgDewMexaaQwyby6qRrPYow7jDY5qhZqI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778942248; c=relaxed/simple;
	bh=VNvzNUTtvnHOBKD5w06AiFKXac6Th6rgylkwwG1WDoY=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=mfcDR34Gl/RqG3vsSqfbx7Ybz965e0ldJ2DowtI3Y9d5Wfy8aKGNzO0pNqwYt3Sik8XIC02EBYO62xEeejD9PXFZ9YV/aap5DzHqrerRKkVmPiO3/qV2mfY9nAQrqS6G3CKmGv+3F6fd/OfNwnJAj+7LXbEkZTQ+0h28tsax9pE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=VTyF+6RP; arc=fail smtp.client-ip=52.103.53.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kzIJA9hisutvNplZDmwnwBJ/lG+ItGTYhmv2qwu6orWQrWWDOiwiq/dNjDzchmPh4Vso/PIyiCwyugehd5xmHHQQtet226PpYVLqJ9+BkjtUdY/YP6fzuVPoJps/35GyZXc6aWbPAEk/6mGN8jBYDMNkiW9kTOUidMwr0p3dbwC9DP4gqbx5TRq/Z4sNOMajFiNa3a7JEPabubMKWGFK/rGgYU+64fs90UNTEgY42tXn7TGIYcvjIcjY1+fQWco7tpFAz2mamGZ3YsxWLl8XWAMAZlMEyosGyijq/PTl8tTdbchDe1bpVEKZB6AGwOoYRBosdGvH+N33722Rf6UNcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oXCyFmLyju/O94rKcLxnTz6g75LqzEfavOJy//oZ/FI=;
 b=ur3rdTpWatI9EwqMfRa9OgHhn9FjJc+uSGUyJRdHLAkNM2jyloF1tGE20Du2e9HxyTzyEsXS8Mb0HURTYODy3u3tJMmNSXi2tn9zQ35r8XodMeY7lEBaWSGsRs5/ZbJTfDsW6Bl4tyYPlWp6oFTtU+9a3pHrbq3w4sipawcznk6h0P6p0Mz+coGOq4PY2zAjvs5KYI2hh9BMcG4hipC6heUdT6bwl6lpa2ehqRMsBkcEoiKP64C8DXY0bl5EwGSAJXs87Nbm5UzW16eWnH+YMsitZfmiBnWplipIiF9M5Do7/Bggczl1ps4UXI5X4ukUTO3u4k1dbAEacd7xu1Mjww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oXCyFmLyju/O94rKcLxnTz6g75LqzEfavOJy//oZ/FI=;
 b=VTyF+6RP+4QHgx4un8ymnlehjsNa7goTHAbR44Z48WL2AiDGvPpuwTqd/8lKOmuAFLpqhf/MFbzTRjKajPkzmKe9VoGPXDca+6hZ9M0Hv1up3fcIHpamqWEYdxTCezyewA499K/5ZHI3Es1pRee1RhiSp1ZYvARfN3JtKEPqSZqdelKO/e6YMYOm5jm54SAKdq5vnx+JX2zqN4Bz8uMtVyfIZt/+/ZY8kuTXSE77EUNNxb5uExSHZ1IgNdrtC4zqwPYJxjKwqQwMFrhdl3UALLNRsmbx1bTUCTb7OPdNv/hQLXE3DFLrpnr7+WAhdi5722P7A4bOoCefvAdgtFnsFQ==
Received: from WA0P291MB0385.POLP291.PROD.OUTLOOK.COM (2603:10a6:1d0:e::21) by
 WA1P291MB0061.POLP291.PROD.OUTLOOK.COM (2603:10a6:1d0:2::21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.25.21; Sat, 16 May 2026 14:37:24 +0000
Received: from WA0P291MB0385.POLP291.PROD.OUTLOOK.COM
 ([fe80::84dd:c148:c19f:98a6]) by WA0P291MB0385.POLP291.PROD.OUTLOOK.COM
 ([fe80::84dd:c148:c19f:98a6%7]) with mapi id 15.21.0025.020; Sat, 16 May 2026
 14:37:23 +0000
From: Manuel Fombuena <fombuena@outlook.com>
To: lee@kernel.org,
	pavel@kernel.org,
	vicentiu.galanopulo@remote-tech.co.uk,
	linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 07/10] leds: st1202: fix spurious pattern sequence start in setup
Date: Sat, 16 May 2026 15:36:59 +0100
Message-ID:
 <WA0P291MB0385BB677EFA22D85EED8A36C5052@WA0P291MB0385.POLP291.PROD.OUTLOOK.COM>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <WA0P291MB03850F4E9B4EC7389FE89779C5052@WA0P291MB0385.POLP291.PROD.OUTLOOK.COM>
References: <WA0P291MB03850F4E9B4EC7389FE89779C5052@WA0P291MB0385.POLP291.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0074.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:190::7) To WA0P291MB0385.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:e::21)
X-Microsoft-Original-Message-ID:
 <20260516143659.1634420-1-fombuena@outlook.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: WA0P291MB0385:EE_|WA1P291MB0061:EE_
X-MS-Office365-Filtering-Correlation-Id: 2731c98c-8a3e-4aee-161d-08deb358a4c7
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|24021099003|5072599009|19110799012|8060799015|41001999006|15080799012|23021999003|55001999006|37011999003|51005399006|3412199025|440099028|40105399003;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?dsA+IkUhX3N2fDPsUVEjBZ3i15Hhz0KnypzxbJY3YX4GrZBGuisxYYkUFQbY?=
 =?us-ascii?Q?hj9ok4AWvopax6frnyLrmN65sMDyaWh3h7w2Ux1L3XOghxQTk+n33gz+EtTI?=
 =?us-ascii?Q?vHFi2uBphdaqMELQdWj2QHt9HQ8iOd3Vhc7reJHJNdeMp/IQVNwxCEESmfUT?=
 =?us-ascii?Q?Zsnmd0RoOVErvACIZjuEo++AiuGf+ZtQBH/yWkJEa6h+yHxUKuAhqVz2V5Wr?=
 =?us-ascii?Q?73oewuvySxvcp6BoVdTHl+ogllm2yC+5jrWv1IT+UwAp8ZsNmKuUTB+ro3tk?=
 =?us-ascii?Q?Wn9nAhfYfM4at4jb89GBs+q8qUtSa6BQI+hCmTqmrQ9dvGtSL/lu3XAj5+Z3?=
 =?us-ascii?Q?L2r3gygtKrB/fEKF+RiJh++HgPysosJeprBGwtEOEcQ7sxjDOmYvFsfB1a/w?=
 =?us-ascii?Q?X16SryhHZrHJDCor8At1ExiM5q6wx7P39cKTPeoWuxeSrIcCuoX/BqX64soR?=
 =?us-ascii?Q?SFvBkrmxrkYs78X48tXVn9pReaACw21tv/J4+t7OjH4hBodkBm8RYB1o8BTx?=
 =?us-ascii?Q?II79AyGVEfgf0/Xhwm4UPIgnU1K2+wio58BJGdbLDx874VoZcT6ORWCzF+Nk?=
 =?us-ascii?Q?CJdOhlilLI38Rns0gG4i+rTA7znvMr4tVpDtdjaSXEIjBc/rP24J1PpP6Ywr?=
 =?us-ascii?Q?im0eH8FtFl6vhogJnD2smRh665p6/7iq78uweninRXxTytyWupMKEHSMIgMg?=
 =?us-ascii?Q?Cps/Gb4JBlvBp/opmOc5s3dC/TZIrYu9q9cv86Ku5cbbXOeKjbfDVh9c9bKi?=
 =?us-ascii?Q?/bYf0TFasx9FY/i3Zf++6ptzEi2Yr7GVwLNsAzeiR2blZZce4Gyhue4x2g3A?=
 =?us-ascii?Q?4Vf8Mkqx2IaIE962GFJvUYSP3ADkXMo+eNreEa0JX6izsRYxxWUW5A8c90Uh?=
 =?us-ascii?Q?ylgs+JsTU85x3LsWdB5g4XZ4pEquFUuSClumduYtZTZsxgasVqedG71pXvii?=
 =?us-ascii?Q?r6jUCcSM1NHJDpBOpU/i208TxjzgnXa2CCvNbzjp/dYAkgRy9rIikr5vNqxV?=
 =?us-ascii?Q?pHp+A6aCoRXcHuQNZBOi2ey5FZXdDsYz4gdMlJj1faKd3n8=3D?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?e/xYGo/8jYPK0ICVY1m3sTfBJu4jiNPbtorAEM3Ix0f1yIyVA5ff4cibi45n?=
 =?us-ascii?Q?/8H24uaibRg9nkvFyJmrd+hXOjPv1R+5NCqp9X9/qqmo2MwtTkAmGptvZT3k?=
 =?us-ascii?Q?0aq8usC2El1iXEOnuAMIw04oNl4k9bzNt0TstSl9KsVFnaAahPZdd75Cv+dd?=
 =?us-ascii?Q?vZKFfMtiMG4yvSybtz3xQTrmqKNhF/OAuUdMx2wQHETulyLhuER4pVLZp/Jz?=
 =?us-ascii?Q?cVXwVmkluGj6Z0IcdKqVxsHpHHIXmuzTBd9xjEGhxoxiR8adYEYU8IQAR0UB?=
 =?us-ascii?Q?dppcn4WWjszbCDYcia2bhv4gXSBAiSXYTXdjw4BGEPHm/KmmcdT5pF1m8fbM?=
 =?us-ascii?Q?NNrW9JifOUipTZKEjGMowV6ijWYDH3BspEJ0zYZqI+vIqT7K2uMsHcGSWwy6?=
 =?us-ascii?Q?NqJBUSuBwVH78iM3qET2M/5h9K9upaeVE5XVFzO1ZTCnVtoYBQAT0GK6KpAJ?=
 =?us-ascii?Q?kOW2V+sdG0S/ipII+fWS2/jbPIXAHpV17sphD9Le3KjVpYC6wNsMjorvK2yD?=
 =?us-ascii?Q?t0XDHcQeI6x14yw9rojSoAzoRcHzyEa71tb+71ZJAffplVHzBF4EqkMASBCr?=
 =?us-ascii?Q?NrUjfbnjF5poz/3J+wu5AP4hyzTxWx0TXLP/dXAtcpHxp81CKNswThdnaPK9?=
 =?us-ascii?Q?+gWVUkzLd8UEtf6jENbOSHRbFW6FHm5xP5fVOlt8I+HVMYsrsDFn1gXZSyIY?=
 =?us-ascii?Q?HmvJl2pDmxlGvoUJwigpVrP2TX4ypO4xP0+tWeWgUi23QeFu/us4M+Hm9Jkq?=
 =?us-ascii?Q?g7CHChj0UgmyWZFGuonq8oDx6HIGUfGvNhDdT2KjymEERJw4XSP4BS2MjUFt?=
 =?us-ascii?Q?7wTzsiGt/lDu6ovymy1adO/Y/dxW27JS9nxUST3ki2C7H+ZM2rX3B2UQlaSq?=
 =?us-ascii?Q?hgbU6xwhO1KaISpO9QDR79VpRUaXfVGABXerk9lTljkcOgiXDWCseEkVilhG?=
 =?us-ascii?Q?R/wl69qh9JvvinBk/TSqLGgIU5+5mmb6CKEgMcjFTA7FD8WDZy8rMNqMVn7o?=
 =?us-ascii?Q?vAQqoLm/hmPeqevQGCSZ6bcBP6bq9DtBKb4gIImidU+XlvASqHFJOGhJ/WdL?=
 =?us-ascii?Q?DtFwCvIai/9PsFrQ5AJ0p2WZwaziagHKNgthTU4gr+Mvyvx2ELSuJ9hsB8XP?=
 =?us-ascii?Q?XFqZ3CGsoNtiZhQrrvtb8QVIJUpmEH4/p2Oiem4E1f8iT0+lUZA0JJ7zmGM5?=
 =?us-ascii?Q?1DjsAl1oF8i9ffGNVbaIHTT/q0XTPo/AC2ymP4zBuVNlDuRZuwYT7xqzYS3z?=
 =?us-ascii?Q?jI5MwVnhE58ZcsVNdO1y1fhgIvvgY3CBUuD21Hog+A9Pqib7BfhUBuvTXzdA?=
 =?us-ascii?Q?HUtiJDiRbOCxShYuPb4299CdOeXTrrU/jxCK8U9dTbUpf9FYi+YZkfbtcsa7?=
 =?us-ascii?Q?yE5Vud+D4PSq5dzYnJ+0/jGltbXK5AuNXICzJr0P75xwKiWiaYSLcq8EfLar?=
 =?us-ascii?Q?UAA8WnGX0vkRnUhMgvqOp9j3d6SjeSl+?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2731c98c-8a3e-4aee-161d-08deb358a4c7
X-MS-Exchange-CrossTenant-AuthSource: WA0P291MB0385.POLP291.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 May 2026 14:37:23.8827
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: WA1P291MB0061
X-Rspamd-Queue-Id: E727655C1DD
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.34 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[outlook.com,none];
	R_DKIM_ALLOW(-0.20)[outlook.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-8153-lists,linux-leds=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_NEQ_ENVFROM(0.00)[fombuena@outlook.com,linux-leds@vger.kernel.org];
	FREEMAIL_FROM(0.00)[outlook.com];
	PRECEDENCE_BULK(0.00)[];
	DKIM_TRACE(0.00)[outlook.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	TO_DN_NONE(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-leds];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[WA0P291MB0385.POLP291.PROD.OUTLOOK.COM:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,outlook.com:email,outlook.com:dkim]
X-Rspamd-Action: no action

st1202_setup() writes PATS and PATSR to the Configuration register as
its final step, which starts the hardware pattern sequencer during
device probe before any patterns have been programmed. This causes the
device to run a sequence with whatever values happen to be in the
pattern registers at the time.

This write also has a second unintended effect: it overwrites the
Configuration register without the SHFT bit, silently undoing the
phase-shift write made earlier in the same function. As a result the
phase-shift feature is never actually enabled after probe, despite the
explicit write intended to enable it.

Both problems are caused by the same write. Remove it. The device
reset at the start of setup restores all registers to their power-on
defaults, leaving PATS and PATSR cleared. The Configuration register
correctly retains its earlier SHFT-only value.

Fixes: 259230378c65 ("leds: Add LED1202 I2C driver")
Signed-of-by: Manuel Fombuena <fombuena@outlook.com>
Assisted-by: Claude:claude-sonnet-4-6
---
 drivers/leds/leds-st1202.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/leds/leds-st1202.c b/drivers/leds/leds-st1202.c
index 933c50c317c1..9150b92ccbac 100644
--- a/drivers/leds/leds-st1202.c
+++ b/drivers/leds/leds-st1202.c
@@ -341,11 +341,6 @@ static int st1202_setup(struct st1202_chip *chip)
 	if (ret < 0)
 		return ret;
 
-	ret = st1202_write_reg(chip, ST1202_CONFIG_REG,
-				ST1202_CONFIG_REG_PATS | ST1202_CONFIG_REG_PATSR);
-	if (ret < 0)
-		return ret;
-
 	return 0;
 }
 
-- 
2.54.0


