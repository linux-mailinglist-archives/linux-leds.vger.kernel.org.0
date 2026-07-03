Return-Path: <linux-leds+bounces-8921-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Tc/mG9OXR2ojbwAAu9opvQ
	(envelope-from <linux-leds+bounces-8921-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Fri, 03 Jul 2026 13:06:59 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A0357019C7
	for <lists+linux-leds@lfdr.de>; Fri, 03 Jul 2026 13:06:59 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=outlook.com header.s=selector1 header.b=QO0glkfM;
	dmarc=pass (policy=none) header.from=outlook.com;
	spf=pass (mail.lfdr.de: domain of "linux-leds+bounces-8921-lists+linux-leds=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-leds+bounces-8921-lists+linux-leds=lfdr.de@vger.kernel.org";
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id F2FCD3038A30
	for <lists+linux-leds@lfdr.de>; Fri,  3 Jul 2026 11:00:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1BFDD3A5E8E;
	Fri,  3 Jul 2026 11:00:36 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazolkn19013086.outbound.protection.outlook.com [52.103.33.86])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D253736E48B
	for <linux-leds@vger.kernel.org>; Fri,  3 Jul 2026 11:00:31 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783076435; cv=fail; b=LDAkhJRJuaxNq1oe0pQzIwh9qUY+EgWa0Q/v2NL13GEhhWTWEhAWqnODSzZrRPnKbCoNy0XRFfTa4bLMQs8teUmZBuxwRbDbZX5zduDOkZ2E4DVpCpaaDVOj99QnABumOnwiL1L/psQNANgN5fSSrNJbJg2G2huLoa59MNoPwX4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783076435; c=relaxed/simple;
	bh=oMk0vavhlMo98MfD47cc/dLsV7GHJm+hV8K7hckd75U=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 Content-Type:MIME-Version; b=Rm1m4zZiSZA4MRazc9E1Ni3KUY21a02aut4kqU+IsRSqk1n7OZpNgyYuOwGgc6Tfbky0PvyYThYccM33j08i21Ve+10ciI82S62YaMRbCeE65s99njAxQYnih3yl7ecH/v+MiYGaRo3E5+OBAWOfPXXGSAuCg2JMEeW6QZMLJjM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=QO0glkfM; arc=fail smtp.client-ip=52.103.33.86
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VYuupt3WiSQDv1G6dCutOVJan3ZyiEkQz+FsEe40RkKt70D0PwzQe0xMWhGrm0STHHyQjOpjnUiCF6Jx/udBxxo29oqVs1hLHEfCWRfxpt4dmrMU+neTkCrrSkIjK23UP7aJUPkqMZZvTWfQam3Xz+TrHuveNHGRANmydYL4KKQRC+iBM7k1PQBbRW1LayYsrLHchnuAube17LGJrC/RLJvvWp15pcBbV8HOvhHEjVdTgoXi+qBdj/ONQOL9rBVeOXuxIAamr0KsMg7NctZQ20OW4wxgQ4o4eKrNdTU8IxJoTwvx7xlqfLc/imrj6m2vPFaIkMUFQ6tifeYVsJRbIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oMk0vavhlMo98MfD47cc/dLsV7GHJm+hV8K7hckd75U=;
 b=Us3N24+Oz9prGqOEIPAWA9SZA/xpTmSfJxHNHs6TdLx0V6uK+xfcUgGX528zRlI1t9Nbsq8p0z9wm8aeqRGKguXRuOoF+sViubqW6lrfnaG0f/9T4xi3MszlTZYJ+JuYCJZhfU6Bn7XA3e6i7D2hqpCzMaKPtzK2WgCpZp3FjKEHhAsuduZ030TZJ33dVPr2IodzhDfv0UbmwIcyG1pJmQLa4yYvWE8YkFYqfoL1iXHTiC51CV9l+IECFVUM9HkLf6Xs2WNcBNPm03/ONF46xzGIN9BI6unDKgEzSHG6YQC79aikwqs5cJlKYmBxvqmYXsMrlMiyF5KCDtPfCRORrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oMk0vavhlMo98MfD47cc/dLsV7GHJm+hV8K7hckd75U=;
 b=QO0glkfMLVvbo5xMZGhi6c+9g4tNiYL3fZKDLCO9J2nFKjduqxcroqlmBezER9V6LHk05DqHg3FxXs8el9juvn+sItJ4vayTPZhy5eDhwDE+NyVhCfUrQLm6h59nyEa74PhXeXcj4ZTil98Zc9saroJ16SPwlL3rXL/VuVAzFct3YuU5ZsOmBQhamaXd2axHk965TyftOnsi/YdBoaFEDAeaB7kxPie52uV+W+nVwnpiZ0bP84GN7qVKl5QDwjgv7EwFT6IjGt58LXz0juA+YOZFLoyQcsoiXQqx3oQnmS+8SZlaIZVGhiOH4/ir/TZp9xcN7MfYuseBriYrNEQL8A==
Received: from GV1PR08MB8497.eurprd08.prod.outlook.com (2603:10a6:150:81::22)
 by AS8PR08MB9838.eurprd08.prod.outlook.com (2603:10a6:20b:615::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.10; Fri, 3 Jul
 2026 11:00:28 +0000
Received: from GV1PR08MB8497.eurprd08.prod.outlook.com
 ([fe80::705b:d4a3:1c1f:b9a2]) by GV1PR08MB8497.eurprd08.prod.outlook.com
 ([fe80::705b:d4a3:1c1f:b9a2%5]) with mapi id 15.21.0181.010; Fri, 3 Jul 2026
 11:00:28 +0000
Date: Fri, 3 Jul 2026 12:00:21 +0100 (BST)
From: Manuel Fombuena <fombuena@outlook.com>
To: sashiko-reviews@lists.linux.dev
cc: lee@kernel.org, linux-leds@vger.kernel.org
Subject: Re: [PATCH v7 7/9] leds: st1202: disable channel when brightness is
 set to zero
In-Reply-To: <20260702224741.EC7C41F000E9@smtp.kernel.org>
Message-ID:
 <GV1PR08MB849714ADAF4EB55C6E63A77FC5F42@GV1PR08MB8497.eurprd08.prod.outlook.com>
References: <GV1PR08MB8497C0B898789BB73ACE6EE3C5F52@GV1PR08MB8497.eurprd08.prod.outlook.com> <GV1PR08MB8497F11B30FE7D74CAA25135C5F52@GV1PR08MB8497.eurprd08.prod.outlook.com> <20260702224741.EC7C41F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=US-ASCII
X-ClientProxiedBy: LO4P265CA0073.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2bd::6) To GV1PR08MB8497.eurprd08.prod.outlook.com
 (2603:10a6:150:81::22)
X-Microsoft-Original-Message-ID:
 <1bc0dc3c-90cb-f3d2-6180-8233b60215a5@outlook.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV1PR08MB8497:EE_|AS8PR08MB9838:EE_
X-MS-Office365-Filtering-Correlation-Id: 0b9621d9-c450-49b4-68ac-08ded8f24abd
X-MS-Exchange-SLBlob-MailProps:
	WaIXnCbdHrO+2YmbT5jW+WUSUt4IT5vRaYQyYvC7i6Frr+s60071C6r9AkEVRMjm1t+gz8IumzaPHIi2bwCR3kjLHFwUjA9dmclKMswjrwa5kKr52Hi1XFylNLteexPalJ4V+JIFb1YTzru/EMBC4izbVM944kHfOxcY5agMwQdDzNw+7SzLF+LGmhwaJ5D8L9cp7Gy9v8W+F4Vr3EpX6oLcD2Wi2lLZlxHXPHhwvb+VuRmTCwaS8/bTEXWwhRqI/PcJaDTzKal3278lNLQ3ISfPiR9AvzmjsuWMHyWxJyeVbV9DuP5muj8MhtjtmRdROjEB0PHDA8n6D1GjfCuaLtYxuVJlt2lGk7bfltLJuxH73a3mfUaM/IaG6Xq05MEUeuw+Mw30dpYQf3BvyafCxK9C0gTNtUd9FB6PjtG3f7rCJMfXJ2uJ+BL1DAoKrGTeK+LfnhkfJp1qkbBAD8csaAmaNGFm3n3hpsth2IGW3Xqe+LGjtUeIKfAp8ksfdbOXF7Bf1LwjfRgsoI0MOSR1odJxeyf1Lm8nWZknKkoafziOnjouGa9kwhwwJHtX0JAwpGNAwc2vXxI0FoQgm3LFf0sptTdkrCOdVvcHi6NlJK75yoWMavj026viPKPMItefDOm3rSaO3CtVBH1ZwbXJmF/i64VqpEalk9hJyThwZSakVQvfSp/ZtHRbDjste7ZwQ2wFjyAU8YGrEZxrkqwByTTKDJBDo1RCH+bZ3INZl4PpoKjIMAmEZrHwle28xg8W9GYj+4lRJAc=
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|5072599009|23021999003|25010399006|2604032031799003|37011999003|15080799012|8060799015|19110799012|6090799003|24021099003|51005399006|12091999003|440099028|3412199025|40105399003;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?43kxzpyDZiKxrSqNDJ38fmFwybqm3kiGVa8e9sSG79SrNlVkc5KU60m0DOL+?=
 =?us-ascii?Q?VN39byvx0y0cSD/vS+0/KZCNJNidzG0ewPHFBn8Y/e58lU+qfK16GtxZ4B3T?=
 =?us-ascii?Q?dXjvW38G+e2xo0yOjxAlcGnfrpfI5Kh4fwf73REuVi2+oVWAh2dNKl1GEXfJ?=
 =?us-ascii?Q?WRlCBYWZsXCSiQgZ06Gi7W4fhxNfB8puWe+dLW8msyKgEI//FYwJV8iyK0m5?=
 =?us-ascii?Q?tOPYwyvftbvMZI6YtQA+yENfEH3820kGE1h+yrojH9B9Cf5WIrkyuStJ7XEO?=
 =?us-ascii?Q?ETDHk44uXBr1jvDqoep8ZxO6TpkmZ4D8y10sjP4OpidfSsl6ornhNC3JIlTc?=
 =?us-ascii?Q?n3GujzMQkBkGvdlX88mhuXBKnaUgI8NcOo+6E6Gg1WbTTQb9GNoMhiNKWmQX?=
 =?us-ascii?Q?V/8koDo921Q3XE94bybRtJApQ4unNTwHNa9st4HqKZkVDzgGUBxwYK0yOSEP?=
 =?us-ascii?Q?VqZcespCndS5/dTu6VYeHQLuwPpF8KVZhe9hXdn9+4CBmPjgKZw5lM31fe1z?=
 =?us-ascii?Q?T5101PVdwpXfw8amu2D14dHM5gwrkl28h3H8z1bEWPmubjNWPr0kTO7LmALP?=
 =?us-ascii?Q?/rbl4gFNhEykWC+5Zw2mAcjZeeYrldTDC3X6I0pnga8aSW7g/7xsYf/OWB+V?=
 =?us-ascii?Q?tbX/XNvh72t7GhT4QcZB0V5jgB159+51F6Kr/vD83/bOi7M7IJBzXelEwLfF?=
 =?us-ascii?Q?Sxzw9FYBTMuUBkWPlK+N32X+xUUpHrJFYvJ6m1AOc3RSTRGAqdoctUKjRefC?=
 =?us-ascii?Q?9HHlyOmpyASeLyCumYznFZnh0bRAYikuPJY1VxAAM8vXWs9/pP3HmoSC55V8?=
 =?us-ascii?Q?RTz2m16NsZcGcGrOiR7l8Yj15eNemblpgFU/klMvTexNpJBUx8Q8p/0IZIfb?=
 =?us-ascii?Q?2WQsCicCUqfHP6nwDSZRsVaciBXjw2Suk5eKFk5dReFZ/MlhEoe3FUCDvMas?=
 =?us-ascii?Q?aIVh8y8vjwuqLFcwoZGRzHcNEa/eBIthK1C0mZdPu/MkCOktimP57Nu4RH1Q?=
 =?us-ascii?Q?YgnsryH7Gm2zsm7fMoRPa7c+5Krh58OBuy3k982cQ7Qh3Yj8dyff0wVfW6Zv?=
 =?us-ascii?Q?JzZxOInCQvSaYIbzwO2xTtsW9zzdwQ=3D=3D?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?cqLMOfF34jZ0smARgLYBLPijc1XFJzbHYcP+8B8O0vfUgcJ5iAts97Dbvy2i?=
 =?us-ascii?Q?yN8LCVaHcftRKp3VNxZFjDD2k7MAkO89ABoIUeTXviIJFC6Y9Jv2I7Z48ymT?=
 =?us-ascii?Q?hgtAHQxWLjs/cvD1u52LpQpimWF39WiqnQLc0g3YekqbMPgu9J60H2D9H1AE?=
 =?us-ascii?Q?l7/CvCAyykJKTxH9vymdv5GDbdGvGmfKVaV0Pbj2drQwWNuVKsvJl63JeHSH?=
 =?us-ascii?Q?pMRpEbjCT/MwAGqGKsS5VwG3vV6bBboNPWshSAip6MQSwOA2LTxJuYI58jus?=
 =?us-ascii?Q?ghilgfbVKtg7TD4j1ZxFfxyDBTSVhfxYGRELDuuJkVhYZIanzwhPUPQ7Mvid?=
 =?us-ascii?Q?RLQgBnaBUZpNuCtiw1/Qe945lrI+kxB76NmUNXCyhlCcVR7AKAi2O5QUlID3?=
 =?us-ascii?Q?DnWFTLyPXPqIXNhHl3AMy/K5ZNh5bOt6BZaom3LHxG0nf2z3oWJIcKpl6/k3?=
 =?us-ascii?Q?s3YuULmHvgvjPkKeuad6F/YzLAqYpRHUSH7Md/xs2hHL9bz2z5PMERu+PMBX?=
 =?us-ascii?Q?vkTZxeOA+pxU6JWzCzYOom4pLSY5+B7kzsVV3Xgl90neqIz8TbF8OCtsNdR2?=
 =?us-ascii?Q?myvv44lH5buTZ/fbhFcAGG2qkVarBJ7wFsxtRgsGr0cPb+Dg6Ii+jttKP1aA?=
 =?us-ascii?Q?tZSf74b51tu/YhzWkA5tThtgbRdTAG5e8jmY/YPIYQ8C2XIIutJh2E1oP9Mx?=
 =?us-ascii?Q?M/gm/3QkMECMghMpsbWJVttZaVhs0bc+dhxg0/pEu1OC8qWhyW0HlPtcQJkf?=
 =?us-ascii?Q?551zn0HuhawJ+5W5szoatbuLWi/jYXdoiAbDXRZQeD6PjjRxuCS96NN6Mj8i?=
 =?us-ascii?Q?nVYYTLsAfTcPgXlpsCwtP0Uc93wS3jXwdJFFFMdnBnTCCMRuRIRi31Qxm4te?=
 =?us-ascii?Q?8cm32HpJNa6WSucbt/B4IUORPyUi8KatP5TiSu28aoo7kHmWo/akiW1lXFjA?=
 =?us-ascii?Q?ZgK7OJS0V/71y2PdnpK3xbu/SwLSiofh7zzan0v2Ndu4unEiCmSl2/6Af6ZI?=
 =?us-ascii?Q?eAtqhi7bLzrXOO3ITG60MIpcfgn/7llB2mNgn/lV1u2PgUUtbGrsgBVIp7Og?=
 =?us-ascii?Q?BjG4lR1Zpgn9tAQdxFIDU7JGyxMoPzpLYm0jLKpL7EZxN86ushCnZPNG+vOc?=
 =?us-ascii?Q?owI//qORG75Gv47i/UeN6njzNbBLTMTWwQZA5Iizgj4ZGo/XCaQT65zshQbU?=
 =?us-ascii?Q?8IdJWZd54cq66V6807Zqm1JTIQxmAITkZeC7qzcn8phnfD1qDS1XCfVRyG9g?=
 =?us-ascii?Q?/2eXOmNRhLtWFU2jUVYsDoV1v/cxHWPoa+fkUjIAhpeIQ7HACe9iMq+mdNQt?=
 =?us-ascii?Q?bhGzx2PIw21bLPM3qqaEmPrik1EI0p1I28s3wWxmT9byckx0XFGDfLUZHqm5?=
 =?us-ascii?Q?2EgkEay520sgYjzoKASbpcqEudpUSRyv5rc696Xcbypim3YEIck/OFXvFlCK?=
 =?us-ascii?Q?5BzVE4qgFNzG9D8MaHp3eBnyzuphXIBd?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b9621d9-c450-49b4-68ac-08ded8f24abd
X-MS-Exchange-CrossTenant-AuthSource: GV1PR08MB8497.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2026 11:00:28.5097
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB9838
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[outlook.com,none];
	R_DKIM_ALLOW(-0.20)[outlook.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-8921-lists,linux-leds=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[fombuena@outlook.com,linux-leds@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:sashiko-reviews@lists.linux.dev,m:lee@kernel.org,m:linux-leds@vger.kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[outlook.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FREEMAIL_FROM(0.00)[outlook.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[fombuena@outlook.com,linux-leds@vger.kernel.org];
	RCPT_COUNT_THREE(0.00)[3];
	TO_DN_NONE(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	MISSING_XM_UA(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-leds];
	DBL_BLOCKED_OPENRESOLVER(0.00)[GV1PR08MB8497.eurprd08.prod.outlook.com:mid,outlook.com:from_mime,outlook.com:dkim,vger.kernel.org:from_smtp,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 0A0357019C7

On Thu, 2 Jul 2026, sashiko-bot@kernel.org wrote:

> Pre-existing issues:
> - [High] The driver assigns the sleeping `st1202_brightness_set` function to the non-blocking `brightness_set` callback, causing 'scheduling while atomic' panics.
> - [High] The `st1202_led_set` function assigned to `brightness_set_blocking` fails to write the actual requested brightness value to the hardware.
> - [High] Saving `fwnode_handle` from a child node without taking a reference inside a scoped iterator leads to a use-after-free.
> - [Medium] The `brightness_get` callback silently drops I2C hardware errors, resulting in incorrect brightness state reporting.
> - [Medium] Global hardware duration registers are corrupted by per-LED pattern changes.

All issues raised are pre-existing and outside the scope of this patch.
They will be addressed in a follow-up submission.

--
Manuel Fombuena

