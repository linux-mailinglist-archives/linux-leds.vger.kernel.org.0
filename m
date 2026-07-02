Return-Path: <linux-leds+bounces-8859-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id G/cGOTGuRmr7bQsAu9opvQ
	(envelope-from <linux-leds+bounces-8859-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Thu, 02 Jul 2026 20:30:09 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DE3016FC0D1
	for <lists+linux-leds@lfdr.de>; Thu, 02 Jul 2026 20:30:08 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=outlook.com header.s=selector1 header.b="o5w/BTRn";
	spf=pass (mail.lfdr.de: domain of "linux-leds+bounces-8859-lists+linux-leds=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-leds+bounces-8859-lists+linux-leds=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=outlook.com;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id AE18E300AD7A
	for <lists+linux-leds@lfdr.de>; Thu,  2 Jul 2026 17:37:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D6E83612E0;
	Thu,  2 Jul 2026 17:37:32 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazolkn19013083.outbound.protection.outlook.com [52.103.35.83])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C65CF348C6C;
	Thu,  2 Jul 2026 17:37:30 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783013852; cv=fail; b=sKl4iwtz3RlPflfyA0nYOeIp9F2IHqnUfUJGUutxvkDZWgzpeXW6b78Tpia1EoGNmaBnAFQZ2jqJzGw3sQTbOZBKlPvZRBTeO0c+ELp+yAoFv/DRfffrcC188YqRmj5Hg+7m+ZvGXzX3YjLRsDkUsCWQVpB2atwnxLzMkRaIg70=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783013852; c=relaxed/simple;
	bh=gv4S24SIfmjccWXfFDobqSUttsQ7GCI5DqUviOBJC1M=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ZPk813iHYR2d4rLN3WREi+/Yd4H1IM9d0H2Uphyl25diFVYxex9i3niabU8x2UEP9irC1u/FQPMTefxYW3sJiesSNFNEs1mQPgo8Uq1f38hnNYro09jACZ2KzUGAKHuPwCDkHy23RMWM2LmY/TGEYkvEGfvGTOA2uyiMH0TvmdA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=o5w/BTRn; arc=fail smtp.client-ip=52.103.35.83
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XSjlKtIESEtZwpQXLB9+VXmd9BJDll85nPPfin90Q+SKlmpgmdikekuXmkM3C8sZIBazv0hd7dBOXrEZHWQDgRUQvxkdiKoRlrw3vZFBG/XP91aQEygJpVyJmYPIf+GEZBJzPzpL7o9SmrzgYx+5EYVAXFJmcQUoFhrT5Sx6/RsENHjRuNcvSUeysFt+Lo5rIMFomV/eie6jkQ/kpZaIXQmJVSmNaW/RPmmRMeUHbRPHWQSiUB52biED+w+qSBalyBSJg3ivx31FWIP/xds9AmuO8lfw8JVR3zDAKcdMMdmgRAinaNqFBKIkl2WDg3CLLbLqK1s2lvCMnTS0smZw8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UXd9sCub3s9fxyymvd2aGSdaHCMgbPfgeRI25qe9tMg=;
 b=d81nIrb//rFKp166MT0wva/Ln2oNKvGcSUY1snmf/qyuJDyBSJwf+DaQorZXHkF8c6I+LgWS4rExTM9W65/WFKUDD+YRM5ehi23QT14ModEgO5JZ4kqgpShSsUt+b8arB9Sx6382jtyTM/ht+JSBad5TlB53Hi0R4ko44jo66iiJrTG4Tu7lLqra7cnmj7WXkctZbJ+FTGfJjmgZhtzKtBMtbQsLriY2/iHLBKfgbGiAGdfmtZ03SPkEdiPiW8ZjEH6qa0A/by2aO++2tnfIUSHTShhnygAcAnDiprpMI5/FpQDx5VdIeFUzcoIWPmrbjFJmcDZ/AEGgu/JRLsCupw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UXd9sCub3s9fxyymvd2aGSdaHCMgbPfgeRI25qe9tMg=;
 b=o5w/BTRnrM6Qigutenww6k6wipfkekx1/xncJIBRTaGQo0tDPD9wI/DlCyM+Q0jgiZ0QJwp72vCA60TZCSa887lAV7IrDyU/0Y6jtgZMW9r1n/S1whTKx6h6x61F4ozmTRMPZAxC95Q7+IczZ5ch54GbZVbhC6pDa1Thxf7VWBSL9+H3PPdxI+boAAx0vW4qYwkLAF2N1jpp+tMCI6C+/y5qPbOBOOux1ZAAYF6i3VEkKOer3jf0tWNywoim27gsJBA+NEQpNKpo16oKGMNRStJSythgFnlrjQ0yVT0Z8zVOwue/StOlONz+woD9w7iDTyLFrWTvFXZurmfUw8CWgQ==
Received: from GV1PR08MB8497.eurprd08.prod.outlook.com (2603:10a6:150:81::22)
 by PR3PR08MB5769.eurprd08.prod.outlook.com (2603:10a6:102:91::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.10; Thu, 2 Jul
 2026 17:37:28 +0000
Received: from GV1PR08MB8497.eurprd08.prod.outlook.com
 ([fe80::705b:d4a3:1c1f:b9a2]) by GV1PR08MB8497.eurprd08.prod.outlook.com
 ([fe80::705b:d4a3:1c1f:b9a2%5]) with mapi id 15.21.0181.009; Thu, 2 Jul 2026
 17:37:28 +0000
From: Manuel Fombuena <fombuena@outlook.com>
To: lee@kernel.org,
	pavel@kernel.org,
	vicentiu.galanopulo@remote-tech.co.uk,
	linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v6 2/9] leds: st1202: validate pattern input before stopping the sequence
Date: Thu,  2 Jul 2026 18:37:15 +0100
Message-ID:
 <GV1PR08MB84971EE254E4D7A3B0178039C5F52@GV1PR08MB8497.eurprd08.prod.outlook.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <GV1PR08MB84972A16ED557BFB96D63F57C5F52@GV1PR08MB8497.eurprd08.prod.outlook.com>
References: <GV1PR08MB84972A16ED557BFB96D63F57C5F52@GV1PR08MB8497.eurprd08.prod.outlook.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO2P265CA0501.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:13b::8) To GV1PR08MB8497.eurprd08.prod.outlook.com
 (2603:10a6:150:81::22)
X-Microsoft-Original-Message-ID:
 <20260702173715.2618748-1-fombuena@outlook.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV1PR08MB8497:EE_|PR3PR08MB5769:EE_
X-MS-Office365-Filtering-Correlation-Id: db013384-c86d-4fcc-3b64-08ded86095bd
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|51005399006|19110799012|8060799015|41001999006|37011999003|25010399006|15080799012|24021099003|5072599009|23021999003|40105399003|3412199025|440099028;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?itVJqTy53wMwCHEz05wVrKHBG6WaJe1ZY6JLEl1jTrDBrAN4qHky39vlRoJl?=
 =?us-ascii?Q?UGYYcJNrNGLs3aI5CUWe8J2RHrQD1g/xLa5bdwvGDquq9qRJUSUnVD81X3gu?=
 =?us-ascii?Q?kFFjGxDuDdU0ByHsyqcRmxoPb37xLWFJEa/2cfk7NAbAW90hNSzXFsbZ1Tgk?=
 =?us-ascii?Q?TYC339Frbb8D4AI+oXUZct7acU+7rm3edj4ZjuTv/PQ78dySNTsKA7vsgCo0?=
 =?us-ascii?Q?Mm2EAql0b8S0vXSJ/zVvnL+fg8xInBWZvv84Pe2aWuR4/AYgEEdGBsXDP2if?=
 =?us-ascii?Q?qWWNeidVeICawDXgzeYrx9X3SdBaFDXA4BPvtP/RTQn2y2RatfXdRN1+e3i/?=
 =?us-ascii?Q?gh0edbQ7dNnHL8rM0o8Zq+BOmnU/WYaPqA/TZu5icWo57sCvqe6mAE8qMZrB?=
 =?us-ascii?Q?cGvjNC2sIWVAxPeV8Qs93ECJIOsoo7H8DbtIC+BRZEFzqJNBbnV7NdNCfZB8?=
 =?us-ascii?Q?cqzPumYH8W0TJnxwndmMoJhpDGkTa2TjZ29NyqO1iV/GFywnWC3gANXaoZY0?=
 =?us-ascii?Q?GlsIp1x8refOEn5d5yS1ME+g1mCWOwvM7hWwZqF4aifoC7VKrasl1cfzgbmh?=
 =?us-ascii?Q?6g+v1atC6yF/feUW1DtyRE0pjxfiaP21t6FF14m0KLTAbhKAR1DxnRi73O4G?=
 =?us-ascii?Q?9eWmKqfwpSjeZTndzmgNIF43p41Y/aR6j/7pNDH1TRBccY9AJPzMp1VreKD0?=
 =?us-ascii?Q?hZOtUfsXcMCBk1cuG6F2qLQZhERj6y9/A+c2ZjQ7ZL4J27+BdyCby7KnUCSm?=
 =?us-ascii?Q?wCDiWVTA0g950tjX1iFU2o/YpVLXHDzWkdFSrCmHZ6/2FbPCTIrl6J6oMVoG?=
 =?us-ascii?Q?oYU89IdY1nCGrHkjhhA83Mqaoi0wzJDbJVwefj5JGw83/psSwYZPpuRGdAs4?=
 =?us-ascii?Q?YWQ7AknS8CAYMFkg6HhEWgPzHHsStHfnALyaLdGqV/8UKnwevUV2sV9eY89l?=
 =?us-ascii?Q?kIZNZP+JMk5ir8u/cWrn8A/Axu4kcZ63DjZE/7tXjL+MU6usms2WuvXxtytr?=
 =?us-ascii?Q?bn0E?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?gTFv7dsgzbxLNdmKFkAzlHcZ4OQNmna4DGwDEvkmzdmxk2a8luhCVCVuvdZx?=
 =?us-ascii?Q?5ESIvd/kyTS4pq3YXhJWDFLD8b+PfY1HANNpfq4vRFjFW+U7jxBg5h9Rb9lD?=
 =?us-ascii?Q?z/vToIF97Jopk+k32a7DTc6aEisVWzz1FO5BSrIhr1eFsJB0B+7KFnA0tchU?=
 =?us-ascii?Q?kekLrNL9YIpGMRcdpWcO1hjCo55tC5bLqoWwyQAkR9wCZYj7PZTZrtav9lGR?=
 =?us-ascii?Q?4+pHYK3JEKAj0toVMP8JY3p8fkFwwID+WghhWiFWi8UqiBLalIaH5m0OC92u?=
 =?us-ascii?Q?y+pVq3zFjXtQ7cFbkgMZEUFVYxIyiDTTlY5grYhLQQq0ze7lKWZi3unuOYBt?=
 =?us-ascii?Q?spWapOctFkKbWRPhXd+y0hXpZSWRGrpB+49QuTu7GmOgH6MUHQ7asdpICJur?=
 =?us-ascii?Q?xK3bxAGhqQxB7khyGVPILgIinWrMp0l5ABj7krSLBQVIEkZN8Rx/Afv2Cej2?=
 =?us-ascii?Q?HQlWhFRKb7/wuUbnltP4AtW52ihFjq7lQ7t48vRs49Y1nARY6U6+T6D7Rt4/?=
 =?us-ascii?Q?IHXj6hDWAFYCpJpJob7m7ayGOXeQ2/2AuJKnCCiVeM8tsS2MRMAfwflU3dW5?=
 =?us-ascii?Q?lus8u0J6dKZBaBURA5UiP89/jJMhHHaLlvirysEDQe2UMOZXoUbyzViffJ7h?=
 =?us-ascii?Q?VvX/H3dkCe1wh3fkUjZdK8TH4f6K1CB20eG3Q2xm4uTjTnTLvki2kuaKEzjO?=
 =?us-ascii?Q?/pThKlqNlwMXjhjr5ytdaOXBwW8GJu5wvcpiGbguQYxVCxGjB1xkHMdhJCvF?=
 =?us-ascii?Q?Xi/ml6JjhjV0SNyAaCzbvxEtieK/1Hk6novfHFPQE4PgemJFWzRLN4PsR1Mj?=
 =?us-ascii?Q?ont8AXzeauDUZa2/A6dOKn1XKkQuRJ0yNL8bjScIVXr5sA8+926EQ1GDDtE4?=
 =?us-ascii?Q?7k0KPidUd4MJ9TEVklKV9Uk9+2cYB+1wPM6XqWC4JgjU3LM7J4LcioUub+Hh?=
 =?us-ascii?Q?CRNjRBsoJnIFaZU6FvVosakuUtmi9cCZF50SC529TxJLdybHPzpisbVCIRaR?=
 =?us-ascii?Q?zYidIEEIKQgHYv2AOTqKzk4JbS4wY8Z2Wy3gNbAY39cWfwnHV4O9sFzdSzzo?=
 =?us-ascii?Q?eJ9A/+231Ld7KTn8AlbPPeakLF6yhlqi7mq/buahEq/5iVJQJ0JktDN2TZin?=
 =?us-ascii?Q?dVe+C4J/XtCII+dRq/4whrTBio9GCtMUOIt9qCUTRu5CUTJmF8T8JAbj1eoU?=
 =?us-ascii?Q?ht5P0JD6dXVkZJ3YRkuly6bsAk521K/es75HMp/9RmTGp6mCSna7eHKDcPqe?=
 =?us-ascii?Q?ajn4b/bYgTVCGB4c8M3qN9OWd4d9J51DgaxUNgMCZBInEks3RTc9FvSXfhjT?=
 =?us-ascii?Q?Ke3nNRH9b556o3HAUsvC/QFCWGeIbaVicUajZw2pSIn/ciN89imj85vtKxSe?=
 =?us-ascii?Q?TXbEaCStcYPW81zxN51Ja2frapP6u5RWepG1vdkFHAgLm6PqbPiujwxYO5Ek?=
 =?us-ascii?Q?kCArn3JC9TzUp2yx7lxTDlyiJOck3gy6?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: db013384-c86d-4fcc-3b64-08ded86095bd
X-MS-Exchange-CrossTenant-AuthSource: GV1PR08MB8497.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jul 2026 17:37:27.9407
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR08MB5769
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.34 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[outlook.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[outlook.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-8859-lists,linux-leds=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_FROM(0.00)[outlook.com];
	FORGED_RECIPIENTS(0.00)[m:lee@kernel.org,m:pavel@kernel.org,m:vicentiu.galanopulo@remote-tech.co.uk,m:linux-leds@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[fombuena@outlook.com,linux-leds@vger.kernel.org];
	DKIM_TRACE(0.00)[outlook.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[fombuena@outlook.com,linux-leds@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	ALIAS_RESOLVED(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TO_DN_NONE(0.00)[];
	TAGGED_RCPT(0.00)[linux-leds];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,outlook.com:dkim,outlook.com:email,outlook.com:from_mime,GV1PR08MB8497.eurprd08.prod.outlook.com:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: DE3016FC0D1

Input validation for pattern duration is performed inside the write
loop, after the pattern sequence has already been stopped. If
validation fails mid-loop the chip is left with the sequence stopped
and partially written pattern data, with no recovery.

Move all input validation before the mutex and before any hardware
interaction, so an invalid input leaves the chip state unchanged.

Signed-off-by: Manuel Fombuena <fombuena@outlook.com>
Assisted-by: Claude:claude-sonnet-4-6
---
 drivers/leds/leds-st1202.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/leds/leds-st1202.c b/drivers/leds/leds-st1202.c
index 316ed8eb054f..a750c95ef3f8 100644
--- a/drivers/leds/leds-st1202.c
+++ b/drivers/leds/leds-st1202.c
@@ -228,6 +228,12 @@ static int st1202_led_pattern_set(struct led_classdev *ldev,
 	if (len > ST1202_MAX_PATTERNS)
 		return -EINVAL;
 
+	for (int patt = 0; patt < len; patt++) {
+		if (pattern[patt].delta_t < ST1202_MILLIS_PATTERN_DUR_MIN ||
+				pattern[patt].delta_t > ST1202_MILLIS_PATTERN_DUR_MAX)
+			return -EINVAL;
+	}
+
 	guard(mutex)(&chip->lock);
 
 	ret = st1202_write_reg(chip, ST1202_CONFIG_REG, ST1202_CONFIG_REG_SHFT);
@@ -235,10 +241,6 @@ static int st1202_led_pattern_set(struct led_classdev *ldev,
 		return ret;
 
 	for (int patt = 0; patt < len; patt++) {
-		if (pattern[patt].delta_t < ST1202_MILLIS_PATTERN_DUR_MIN ||
-				pattern[patt].delta_t > ST1202_MILLIS_PATTERN_DUR_MAX)
-			return -EINVAL;
-
 		ret = st1202_pwm_pattern_write(chip, led->led_num, patt, pattern[patt].brightness);
 		if (ret != 0)
 			return ret;
-- 
2.55.0


