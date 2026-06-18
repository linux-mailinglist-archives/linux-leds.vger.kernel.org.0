Return-Path: <linux-leds+bounces-8666-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id xW72ArQENGrRLAYAu9opvQ
	(envelope-from <linux-leds+bounces-8666-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Thu, 18 Jun 2026 16:46:12 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E55F6A0FE2
	for <lists+linux-leds@lfdr.de>; Thu, 18 Jun 2026 16:46:11 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=outlook.com header.s=selector1 header.b=orlCMWDX;
	spf=pass (mail.lfdr.de: domain of "linux-leds+bounces-8666-lists+linux-leds=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-leds+bounces-8666-lists+linux-leds=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=outlook.com;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3D941303AB4B
	for <lists+linux-leds@lfdr.de>; Thu, 18 Jun 2026 14:45:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B99E22E8B64;
	Thu, 18 Jun 2026 14:45:56 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazolkn19011034.outbound.protection.outlook.com [52.103.33.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B48F286417;
	Thu, 18 Jun 2026 14:45:51 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781793956; cv=fail; b=RCVPVoF+t3ML+gZ5FbdJNEpDMtlMEIFI5zk3vEOJsGzXo3MnU0CXTKwVC9Vk/wXqd6xoQ6paa/ATAnNjz+S9JOEap7BG5XYGQPP82iOCfOlx5F2y+ENY2DGhTCtJzEFzgS/0KErqfDTjJaFlEZHpJs5esX+yW35peTMFj/0rjwU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781793956; c=relaxed/simple;
	bh=jkn8GXE5PLoLZ+WqjKVfE1sf5jRh0K1N0VTcoWDWZ0s=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=rrWixWUAJxX6Q+3OkZex3LhrcJgIji4Odd9ta6Q1ItBZetm9ZoNml1u2tYlQiwwfUYd6Dar9vHquEyTgvYsTlQaPz2BC0lXHgt+eat01591c4vFKqW4kHRxp82x/szDIz0HKYe48RQZxgHrCPJaoF8wlsBm8yISFy6J+Oh/E/Co=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=orlCMWDX; arc=fail smtp.client-ip=52.103.33.34
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=f27vn4dwptvKxSQK7++2BcQ1f7ZL/bDPuby23nj8syxfSztV/VB6rJvEWQhTxr1PogyeOAOftPSrFdImhNz75QQZYcvscK2D1FkG5B26pRCb/+xDFQZhT5lMZSPGRMwfXu01JLLkY82yGYwGtRuvyVS6cG/p7DoUJNxmuNhZPPQAjH5c8hAFNgWw3ng2KHXTO1/+uCch1fd3PISm/myh3fZvv6FGf+hUdqBv9bRst4TukmgX1hn4+gHDnp9xWL5G5u+1yqruH4LOzPGNMuWLldQeYZBXfKQruUbBZyPYaz28K36aKPYrpL7wCzABriSs1KaQZ/zplxG3rPZZc43fAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SIiipihmmgSJTCzdJx+mLzByzv1iR+4oE32XBRfDSjU=;
 b=maEez7tovfQYCgiNQ2zCki+jLTetIg7PKL0dpNRiPFab9dodK4yWKg6w/HYwh3WKiF2XWLYHwGsBZ+EJRBX8VE+AZt3UyykB2mAisvudIudQhQ0O2MLFOn8HQ5MOUxyHdvgCGoOG1t7XbsKku5Q1WWqmIelz27oL08S1tgRwGWtcOAieAb81Ks1J3Mgy/3546zL0jRmrem1BRbHMYYBpzd9F53bF0LedNOp3TYy9KE5MHRTMZSpJYvI5znqJkhRrOjp74tnZW2X8D4CCFO797iDh2UwSBg1bBDJv1jua9C/t3s3oQkJxDh+tuBRqJ5GnP9qyvQ3aX8ieV5hFzTULnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SIiipihmmgSJTCzdJx+mLzByzv1iR+4oE32XBRfDSjU=;
 b=orlCMWDX6jgZJZDmnK7iDxP7Ol9tnWp1jaicUqrvoKPR3acn/2voP+0+s0I3srKD6oZyakGtgmj9l+nfDEs0zv0Rh0IOUvfaICGns8PO5sphxVCR0IXjNqyB295zxc2I+qPbVsy3esxF3NtgxejiKGWBiW+WbgOcOZ512XGlnB2cF4ZHWZU1e2Yr714aDZXlhavsQq5bCfWfUgONiINkYozvTe49Qrsaj3Y8152hnNFCeQS2LdJN+TAokyryi8Y4aVGkuCHfhgpWDhO1X9F5AZgb5SqujTe2qoH6h7ZPFLTgc6wMP3sTqO0CIMLmE89g3VcTOmm2DvAD4aqv8L1dBg==
Received: from GV1PR08MB8497.eurprd08.prod.outlook.com (2603:10a6:150:81::22)
 by AS8PR08MB8923.eurprd08.prod.outlook.com (2603:10a6:20b:5b3::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.18; Thu, 18 Jun
 2026 14:45:49 +0000
Received: from GV1PR08MB8497.eurprd08.prod.outlook.com
 ([fe80::705b:d4a3:1c1f:b9a2]) by GV1PR08MB8497.eurprd08.prod.outlook.com
 ([fe80::705b:d4a3:1c1f:b9a2%5]) with mapi id 15.21.0139.009; Thu, 18 Jun 2026
 14:45:48 +0000
From: Manuel Fombuena <fombuena@outlook.com>
To: lee@kernel.org,
	pavel@kernel.org,
	vicentiu.galanopulo@remote-tech.co.uk,
	linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 1/9] leds: st1202: stop pattern sequence before reprogramming
Date: Thu, 18 Jun 2026 15:45:36 +0100
Message-ID:
 <GV1PR08MB84970FBB12A8D90F1BED27B6C5E32@GV1PR08MB8497.eurprd08.prod.outlook.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <GV1PR08MB849700625A78304DD5FFCA3EC5E32@GV1PR08MB8497.eurprd08.prod.outlook.com>
References: <GV1PR08MB849700625A78304DD5FFCA3EC5E32@GV1PR08MB8497.eurprd08.prod.outlook.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PR3P191CA0056.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:102:55::31) To GV1PR08MB8497.eurprd08.prod.outlook.com
 (2603:10a6:150:81::22)
X-Microsoft-Original-Message-ID:
 <20260618144536.542531-1-fombuena@outlook.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV1PR08MB8497:EE_|AS8PR08MB8923:EE_
X-MS-Office365-Filtering-Correlation-Id: b16fc2b1-ca32-4b70-ee24-08decd484921
X-MS-Exchange-SLBlob-MailProps:
	ScCmN3RHayHq8QFbWW6Ra03gxaeZK6u4IAaVwzmNYz3j1POCPJxJrOEA+wlz5dg6sXvr+3zOYdw/w+tcyhisgnyh3xn/3JwAIHq8/5ZwBLCPvCAwuDXj96ZzwlFcaRrexzgR1U34ZU6Mw3CN6Q0JYoKggHT3ZI6boiTLsD8EmfOKGOuInb9AjlWfA8D0/EfcrO2oDglVRN3SPR02XvEcfjtlPjuK2wuXZtRYF+sq2J4VkxeGtvZ0+BTpPOLBsUhFvIJFfW7ZCPLHCyj7B4U+Z8NhH8HY+q0uWfdU49YKGbMcQ5lnfpcFh04qzghGotKD5AWcfgCw3C+a6s3lsBwAju7h9ygK5/U2/Eov6UtDIBXbekRbEWsyn2Yt2TRCDJFt51NlNjK4RyFc/DB4f02y8E8umfUHRHM0yn+4GSUgQXq8il80C28oG+gzsSD//us/ZyxHS/62dAj4X2KgozmuMECz06k58zWclmciANhDoabQN+6jD5v00LXUD+Q+H1VcpmUCGVrrUTCwlnssgryKcfC5c1nWGO7yczTOtrEDNwgatyseyAuYpyq2Ck85VS5OtSXwdfxowRl6/72bIIk+W0pbo1DPL9v3bq0ahgMnYx1R0Z0q4vhfLvm9xnLQwDGMr0bov1lxm8rF8KEiGLSHwbKHNUpnrpzx1TB3OKVX74k16i/UQftzIZfs8B5AzeuTRS7SnZvLNfr8gx2/VjYbd2m+nlDKk8i6ZTZ9JwDBh0k=
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|15080799012|5072599009|41001999006|23021999003|24021099003|51005399006|37011999003|8060799015|19110799012|440099028|3412199025|40105399003;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?JFD/SJiXp2Zr+J5QmT8qkqY4R1zjOKI6dOWcKMqy6N8q76j7fIqjhkG6KZxz?=
 =?us-ascii?Q?WtDFZQwJlAfH6FxdPwH8TU43XXPLafss6jU8DV0MfIIB6EJA1/amF46MiT6/?=
 =?us-ascii?Q?1H/xiqjZ0sT/w9OCrwTFr3RJQaTFQqO+1N6iqcmlL7dtRmQqTcRBRdaR15r7?=
 =?us-ascii?Q?e8+CBnIXaXWogltw60GJ6AOYADCBNMzp/qJeHilQFQ9PZK0trpK44VEkdgDm?=
 =?us-ascii?Q?3xb5hsz4W87eKElVpMsZhmJujaIyZ5EnU35ymqv3OXTALWqPI87XJG5ZotiV?=
 =?us-ascii?Q?pwz2/DcoVZdE1Ma4yaBP+5Yjolyz5bHdtvLD9z51lkHM5YSIK7upTlVgCZr8?=
 =?us-ascii?Q?xm+5+Pzregz5EOy+RPFpdTz248MkL/raVZiNmGlw5loAvPnPB2USJH4+TlD2?=
 =?us-ascii?Q?rPLqNfztFuz32AW0TRXeC44qAdIxzECIMETx1Wg9Yb4A2MD9qrzSwb/hXcbR?=
 =?us-ascii?Q?GbCKJ/TgEYACdlm5rqnW6KQ1bGVxnciNn4itnyAWRnN171mlu23XIomfzpv4?=
 =?us-ascii?Q?zJW6TOzPUg7IyyPXBEBYY5tjndISJkwlnmjkRPjvINZgbuOOS+nbUiTeUBqD?=
 =?us-ascii?Q?/vfVo/Hpt5xGvBDNu8+x8Gc5CkF/9VE3fshuXT2EtDSI2t6jxgEBxG4mrdsu?=
 =?us-ascii?Q?RHdmxDX7LlwMBJUOj+aGsvYYUSgHz7s3GR22prH7OLWguQNXbrUomnrKSEeW?=
 =?us-ascii?Q?1X2wkFm6Co5FZL01KdtaA/+4cjm0m7wtrjCZPrnqMLigJIE5eQLRnWXcZ59D?=
 =?us-ascii?Q?NoqOkvSNaLAR8XkOKkDOESp4P0/UYVK2hleZo23WLojAga3YWB2MBRoPZatA?=
 =?us-ascii?Q?l6lOWKTcnA7TShhlxtRHxfNE1eq7P/BaRbX17JdBRyW85Nk6yP4swln4lD4s?=
 =?us-ascii?Q?Hmd++UDihKuFnsL/ruZscHB/+cFdsPLpUOejCC/IWzYt7Iw5dME9Ny/PpXM9?=
 =?us-ascii?Q?wTnLp4p+iiHeocm9XVk34UmDPweR4aqagqUkRB933tNYnqJTuLmyL8rY+MJX?=
 =?us-ascii?Q?4diY?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?cD+gtn92MeiMkeNlcPqN1zo67kc4cosBBJ/u6+mIkNP2xL04EbiMEyUKIpVp?=
 =?us-ascii?Q?8bOh/ioT+OvVkN0jv+lxM+NSSqgNoHl6/eMplBimfTcJUF7yiR8eDO9um+pR?=
 =?us-ascii?Q?HQwcw1O1OZujAwQKx63D5OYZX1rJZa7d/moesmhMlCKdiQhEXjMuLv4fcpIc?=
 =?us-ascii?Q?jm3BueVx9mqzYeLJqXqZpvdOdMyWKi7o3DHneZd0RJ7p6E12kqsCLS+DjOye?=
 =?us-ascii?Q?06Y0Iv41cqR2Ct3UhvDl3czNZUBMHnRkmjZdzKgfquhMn2d2iINfZyZ2bZHt?=
 =?us-ascii?Q?gCS8TEI4w/swq4CXoPxjMTZdhwdJl2a8zYHWQmpt2G09xaXmxAn0F2g9+Q7D?=
 =?us-ascii?Q?/ehtT40wcwWtDMw65l2ybo3AbvOFw1TM4R/9F/HVPfOIWMO9bCqpsv48hTXz?=
 =?us-ascii?Q?f8Xhk2Rqy2saYi3nD/ejdPSIWBQr5juX1QMIsWZsdfnEI7RvtJT3+ove332Q?=
 =?us-ascii?Q?c0M07ugW7WC29DMazCQvjCoKGSyV1EK1FjBTWwp6+7HL6ZPwOjDnptJp8mzK?=
 =?us-ascii?Q?PJtUvpSI7fOuPYTbmO77KbyAnVwp1p8OPp3hxEXb7jCBDF2t7LZ3iV8Stnvc?=
 =?us-ascii?Q?GUmdG+CC3MigAALXGS5OPMV3CnetEyoO0DiTtwnmwEdsp5zyl7CJPH38hMSx?=
 =?us-ascii?Q?2TU/bDG/jalB2x1Ld96o362eM2fC3LcwP/kOVh3se9iWrdHPRaJD5oy2pKur?=
 =?us-ascii?Q?IJcwAiz1diDQKjnUE1Rs5vHZU+ehSoaQYrtvULSWezhWFjyg8xU0j6mHb2Zw?=
 =?us-ascii?Q?P6TVQRIak3OBpTRQf8gBaMevsIEvVZeDzYbAyduD0cg9JgjlmjIIYeDkfO+z?=
 =?us-ascii?Q?WmaSjmA/bVW0D7AbifIdj3MLRMiga5OzqhzoajpgLPLq7uX1xXvQOBHl+HoD?=
 =?us-ascii?Q?p8jYrcQ87NFk1L36NNFKp6IFRS6HqLTk8SfBLTckJyYPMSbD/nkhkDFl3vvw?=
 =?us-ascii?Q?m3p+caonkdy64X/QKXXq+DYWtvxXNMqiUblDN9QMiFVAAmmSa9Rg+AGK2jcP?=
 =?us-ascii?Q?MZABWseYt9wh16/VJmK8C+4rdvspO2hcJ8qZA6iS1LigcnpFk7L7BaNYzo3d?=
 =?us-ascii?Q?pR0xWzwMQAjChhRhmY3uC8mlnEN+2Rj3T0G9EyplRxTIufL3oMGFI6z+M+eA?=
 =?us-ascii?Q?6eGqm2YTBF9biUw/Wpef3FP+C4Z+2Ac68xRtNguFumy81Q6lZDvGWtarB4qo?=
 =?us-ascii?Q?tfA4NK0szPA/W/tLpYOcekIE41OUSVkAfeYS0Rgqg0PwoVj1PVpDCLWiz6TB?=
 =?us-ascii?Q?L8HTioWr3MrRDjvI66+7QZ4sZDhecVdXKkgDs6B1yaBmuyUvVOeMDvWWn8/m?=
 =?us-ascii?Q?eVvyrAA+jOP4h1BvsQoHRerLH+5+rMAyNf9Nhh7tZFM/c/jpZQXZTpMUWfqK?=
 =?us-ascii?Q?Ue/PMf8vONRgT/VHTEq3iFZNyhL1NPLjeoXEFehFL4M480xRZaxnVWz9ayzz?=
 =?us-ascii?Q?S5VyMUd/mj6owERMGktHisxfkKCUolvt?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b16fc2b1-ca32-4b70-ee24-08decd484921
X-MS-Exchange-CrossTenant-AuthSource: GV1PR08MB8497.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jun 2026 14:45:48.5803
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB8923
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.34 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[outlook.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[outlook.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-8666-lists,linux-leds=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_NONE(0.00)[];
	TAGGED_RCPT(0.00)[linux-leds];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,outlook.com:dkim,outlook.com:email,outlook.com:from_mime,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 5E55F6A0FE2

The LED1202 datasheet (section 4.8) states that modifications to the
Pattern Sequence Repetition register (PAT_REP) and pattern duration
registers are only applied after the sequence has completed or been
stopped. When the device is running in infinite loop mode (PAT_REP =
0xFF) the sequence never completes on its own, so these writes are
silently ignored by the hardware.

Neither pattern_clear() nor pattern_set() stop the running sequence
before modifying pattern registers, causing any subsequent pattern
reprogramming to have no effect when the previous pattern was set to
infinite repeat.

Fix this by clearing PATS in the Configuration register before touching
any pattern registers in both functions, ensuring the hardware accepts
the new values immediately.

Note that the LED1202 has a single global pattern sequencer shared by
all channels: PATS, PATSR, the duration registers, and PAT_REP are
chip-wide. Stopping the sequencer in pattern_clear() therefore halts
any pattern running on other channels. This is an inherent hardware
constraint; pattern_set() restarts the sequencer when a new pattern is
programmed.

Fixes: 259230378c65 ("leds: Add LED1202 I2C driver")
Signed-off-by: Manuel Fombuena <fombuena@outlook.com>
Assisted-by: Claude:claude-sonnet-4-6
---
 drivers/leds/leds-st1202.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/leds/leds-st1202.c b/drivers/leds/leds-st1202.c
index 7f68d956f694..316ed8eb054f 100644
--- a/drivers/leds/leds-st1202.c
+++ b/drivers/leds/leds-st1202.c
@@ -200,6 +200,10 @@ static int st1202_led_pattern_clear(struct led_classdev *ldev)
 
 	guard(mutex)(&chip->lock);
 
+	ret = st1202_write_reg(chip, ST1202_CONFIG_REG, ST1202_CONFIG_REG_SHFT);
+	if (ret != 0)
+		return ret;
+
 	for (int patt = 0; patt < ST1202_MAX_PATTERNS; patt++) {
 		ret = st1202_pwm_pattern_write(chip, led->led_num, patt, LED_OFF);
 		if (ret != 0)
@@ -226,6 +230,10 @@ static int st1202_led_pattern_set(struct led_classdev *ldev,
 
 	guard(mutex)(&chip->lock);
 
+	ret = st1202_write_reg(chip, ST1202_CONFIG_REG, ST1202_CONFIG_REG_SHFT);
+	if (ret != 0)
+		return ret;
+
 	for (int patt = 0; patt < len; patt++) {
 		if (pattern[patt].delta_t < ST1202_MILLIS_PATTERN_DUR_MIN ||
 				pattern[patt].delta_t > ST1202_MILLIS_PATTERN_DUR_MAX)
-- 
2.54.0


