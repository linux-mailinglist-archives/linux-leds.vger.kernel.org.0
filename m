Return-Path: <linux-leds+bounces-8878-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id OpkvFbrhRmpdfAsAu9opvQ
	(envelope-from <linux-leds+bounces-8878-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Fri, 03 Jul 2026 00:10:02 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B9256FD260
	for <lists+linux-leds@lfdr.de>; Fri, 03 Jul 2026 00:10:01 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=outlook.com header.s=selector1 header.b=b6q4KGu5;
	spf=pass (mail.lfdr.de: domain of "linux-leds+bounces-8878-lists+linux-leds=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-leds+bounces-8878-lists+linux-leds=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=outlook.com;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4D70330107CB
	for <lists+linux-leds@lfdr.de>; Thu,  2 Jul 2026 22:10:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4668C3BA236;
	Thu,  2 Jul 2026 22:09:56 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazolkn19013084.outbound.protection.outlook.com [52.103.33.84])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFAB13B5851
	for <linux-leds@vger.kernel.org>; Thu,  2 Jul 2026 22:09:54 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783030196; cv=fail; b=qsZJwh9G94mcRCry5FGIzjHBaUd+vDMPT4HZm8sgPPUL7c5uXuPRkk/n9eZsimSkxyoi13ZHG1R3zIwiw8aABwBD97pSCLAvN0UWNTht8uKp4pb1gKujrgqs+mG2Rn/xiacBKjUpgzUfXp6YE3JeIvqshbuVT2R/HTW+aRmZzRA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783030196; c=relaxed/simple;
	bh=p2lp8GDXYYtHj10O9yWKRB+i5tOq2QmoqCXHb71h/qE=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 Content-Type:MIME-Version; b=t/JPEbucp/GTEmZimuF5LQVTbdAix8s0Z5bNuwQEzTx/4jbRk1tqMUtSOHe2+Ae+fKj+R5J/eQJLz4SyAGob8f+ypq1/5bHHVRKBprbgpo8EjkNXGDHRF95Eb8W5Hz1e6ZShElrHcp4YL8iPDck+cOdGIvWMj1xrTz5hQ1AIb48=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=b6q4KGu5; arc=fail smtp.client-ip=52.103.33.84
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eFOO/zdTmChpqznvpMKsIcGBwKCdd1Fmgj1kxu9SbX1DLlvTtjiEmCtOYZfDHBB3vZHjh0gAp2XRB5mw+gpLUZqJghzn3XfkVDPSiR9PnZUPqbcBzMhsXmA2+CaUTSavAXpYL3b5p77EB1MTWvBanY5Gcg57rfvm6bQN4ChNcCZUwAiglXBqbvOLn31IMLJorHnuBwPY2mw6McMSmav5hxm3XHlq85JSQmjScdIB46c4oxMWcTVZ7kcyZ2aV/HYYsY8Q/mDMuORfSGmRYrVsUW485voEk1a108sKxdzoGt8pb3iH7IAhaAeqXtPWnJy+KUt/WNQBcrhLEjRiNgmigA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p2lp8GDXYYtHj10O9yWKRB+i5tOq2QmoqCXHb71h/qE=;
 b=pq06YRIidQO051BgQFbeWHfflH+0SscaNqL2u0w+x8no/1E+VVS25ZUUgY3fncGfUguBQdstcHld09y3I3gDWYLEjKS2oqCjtbiBaFE6Vq9GE01Qe7zwatHRL2DDIjYHticRRKqg/qjCdZAjljyeOX2ccEJ0fOG6Jd0rY1eng4BplZQKK9LxvmFTqX4gJ70pPxmTUUfJIpt0apXv735YdPVxH5vTYILJIg0+ZpixmgKhiOgBBZwIUAwAknEiAPOZ52hXmFafBPw7qVnedcQLdyElpZ+RwJJHxOC16M3fwetNaTD6XCkzgOfNFOg6LOQZINZarhPzdsATxds/fISMTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p2lp8GDXYYtHj10O9yWKRB+i5tOq2QmoqCXHb71h/qE=;
 b=b6q4KGu5A55101t/+lPxF9IOgtxA2sjzOfsxD/6Z5GNdKbUMCCpE5jDHNKzm/yc/1Tz6azxiMrPn14ps1u+FsF2soW7OX8VngyL1749dPOcxBQDOgfTGJqbV6lXXNBe8n7mI/z3hs0UxhbuV8/13OlORPtlSvaRg/emiefWxhV7wlWyrst4FbGFgB4F9nHgRfxnooUEpMdT0d3hzDI/txauAG7TSu7p2GL7EqiYu4MMcw4HZ/4TZQbRWtyeUyQyZaiPXVWXQnJ7A5ecbkqYxKEZCoru6J9CjVOAXMnsrIlTL1itYeJ3K4keSP3JCTA/LUyQOnknv5+riGSPAEaE7oQ==
Received: from GV1PR08MB8497.eurprd08.prod.outlook.com (2603:10a6:150:81::22)
 by DB4PR08MB7936.eurprd08.prod.outlook.com (2603:10a6:10:378::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.8; Thu, 2 Jul 2026
 22:09:52 +0000
Received: from GV1PR08MB8497.eurprd08.prod.outlook.com
 ([fe80::705b:d4a3:1c1f:b9a2]) by GV1PR08MB8497.eurprd08.prod.outlook.com
 ([fe80::705b:d4a3:1c1f:b9a2%5]) with mapi id 15.21.0181.009; Thu, 2 Jul 2026
 22:09:52 +0000
Date: Thu, 2 Jul 2026 23:09:44 +0100 (BST)
From: Manuel Fombuena <fombuena@outlook.com>
To: sashiko-reviews@lists.linux.dev
cc: linux-leds@vger.kernel.org, lee@kernel.org
Subject: Re: [PATCH v6 4/9] leds: st1202: set all pattern PWM slots to full
 after clearing pattern
In-Reply-To: <20260702175516.A03D21F00A3A@smtp.kernel.org>
Message-ID:
 <GV1PR08MB8497980BBEAD073B4043535FC5F52@GV1PR08MB8497.eurprd08.prod.outlook.com>
References: <GV1PR08MB84972A16ED557BFB96D63F57C5F52@GV1PR08MB8497.eurprd08.prod.outlook.com> <GV1PR08MB849765352C4031BD2D800207C5F52@GV1PR08MB8497.eurprd08.prod.outlook.com> <20260702175516.A03D21F00A3A@smtp.kernel.org>
Content-Type: text/plain; charset=US-ASCII
X-ClientProxiedBy: LO4P123CA0377.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18e::22) To GV1PR08MB8497.eurprd08.prod.outlook.com
 (2603:10a6:150:81::22)
X-Microsoft-Original-Message-ID:
 <0e66ef67-d356-53c2-6e47-bb315981ac46@outlook.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV1PR08MB8497:EE_|DB4PR08MB7936:EE_
X-MS-Office365-Filtering-Correlation-Id: da1bc707-e801-4e87-3e24-08ded886a3af
X-MS-Exchange-SLBlob-MailProps:
	gMiuAN0LASL4Z831lB8tpzpdpKMUIXWlCXUJfRmHBkDCuRBSF7kwpXfXZZdfLaO0AGymeGAFmXD2V4UrlvwC3xvOCqutneLnFyg8T8arfv8XKamicJjEE14pL4ntRZwkvp5+ro/cSiOZAU3ntCQRw4QMfP/Wt25h5D38zk1BOub/RrQmx+5dCduHg14FEYNXYwwytxaA2HUps1sZGvJV11qlj6n5+6oeOwRFZJ2pazjS6ZsMwzWL+I75DswEpF1hdFZ6EuXhv+Dkvc27JsIR1T8hdS04RShGKHNtdkMMrnWr4vJOQgC4YNNWo6Q5oNDWHORjFos3LniJn7EL2PqpNh/XRsKNxdvGBoJMHLyTV7fFyesKDeKcWIsyCm3JVTZJgtF1VHoe4JbQF1AUVhZ19akvHTXLtwSGbrhiSWjt39GDgiheRov6nOf9WfryIs7Hc8mB5tPzuwLu5ZZnlA/WjmhAhIWa0Nol1D8q0uveoXewsHrunqaec1EmYDaIRmDOyH/mK9yjXzYfstjqCFMHlgPhMi7eQUt3qkb++aCCTp6160WDeLo7VQ0jSWiJkQcIACCLxcZ2c88H2uVr/7R3aj1yOSR/Pl2j7lihX9KDgXUkuExwNbTMrBIaD4BtW2jxxHWyltgUcDrY2QWWa4TBWsKX9e7A1PNGBBO47G94al4mDl9kvqzbQqRAJeOUJU251l4N3LUZUFKAQ2SJMCuNhw==
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|51005399006|37011999003|8060799015|6090799003|24021099003|19110799012|15080799012|5072599009|25010399006|23021999003|40105399003|3412199025|440099028;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Ez6UGLKs3I3c67ykqK1XwocpOhIKcMdosEhQ58gcouE4GwlU8mXVbtkxI5hw?=
 =?us-ascii?Q?JuP2E8LniaGaud/LEczI9ujP4TKbZwC7xLZaMP+ldySfNoC2dh16yvI0rbBb?=
 =?us-ascii?Q?/L/CTUmX3Nlv3/JVd3lfLJ4qNZQ4F3z/G7ilQ7+FIL70BmH0gVMzAop12pMx?=
 =?us-ascii?Q?MI1RCCWLxdw8BMdbWCUXrLOO51lq4OzhgkbZCqTwoV4khToaY0Z6hLFMe+nR?=
 =?us-ascii?Q?Hi7f2W2voXVpK+CiI1GusxNCblqjbGvxuGN9N/1XRMSNEj/z5HWiJN0i4fCn?=
 =?us-ascii?Q?M+ILZhXT4moxQ8ikE50yOFkhRzGziNe+vjsHgmHkEssENeXrJxNLYfeOSuzK?=
 =?us-ascii?Q?wMuTWQiK+LZal/MGhEiESZUxyFBNlKPA600BvgLiYP6eFgUzU82KipW2OVQo?=
 =?us-ascii?Q?Mliqk1yBbEp5zfuFJ6lyQ/YvACBFsXWC8SOW6zpMC7JnsucrvW29LuM2YBWY?=
 =?us-ascii?Q?HE/qFqgkMxfwPceqAydSvFTDS9G0g1ypZrk7oM3libDNbfMVFHHvlG7Bl/sI?=
 =?us-ascii?Q?rqsMU5lR+tYVfk+q4yqimmihAgDr4zmc8w8xLpabDpd/w3b41+MkxPHipVdh?=
 =?us-ascii?Q?Jb2o4VWa3f4In5kWOAolLJ+L1/88Vjsxz4UZN1AcYuhdHnI9159aKmN0/rbE?=
 =?us-ascii?Q?Em1RJvUhNC9aFCP1DTxguuMzs81V1XIoDADRqJjqgLQ59BtBmimWDH6MTEr6?=
 =?us-ascii?Q?U4KJMbKkhtI8qTAg9MJhRXQ4FqrheD9awJZ4MisiCHAj2/BypUDAVstvaUte?=
 =?us-ascii?Q?fpgx/HMxuo+WQYMR8b2bZdvKA1eWNqSCUFMi/oBIJMfnqUx80l0DhZNIMKSj?=
 =?us-ascii?Q?xbOpQb/MRmohV78GTtQL2Op3bCmYKIY9g3NfuLXf5M2NlMal8DK+8G42zvTh?=
 =?us-ascii?Q?g+1sR8ku4Je9jgjPL8dH05T0ghq74y9pG2pQoHepBt5LKndVJzv/tSswq4s0?=
 =?us-ascii?Q?TosZFg5T70eaQG+u7ldOI1OzPGrbvGLGOQCY352z8tOMlj6eHV6RbfFJCbbN?=
 =?us-ascii?Q?7AOq?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?xYNadb2sgcF2mHgr9IVrgMOkJeQ22Wp5enw0+Ce1qbn2610/O5JRPp/PZQkX?=
 =?us-ascii?Q?hyWfd74cPiiRualc/1hAbadPkfenzNUvqNDUeJgefiz02+N24+n/gC5HFRwW?=
 =?us-ascii?Q?syDX2L7w+LLRL6APEYKLOlyJr/jDkSPrCpcJnkMm7C8uMicuodnyKvKE2qLV?=
 =?us-ascii?Q?K9Jbfz62i5dIxC5cnms6Atr4i7VUjHfDL2cv9bJjpsjEpHGe+NcynxBS/7Nz?=
 =?us-ascii?Q?FSdWQfHTK+2wdy1TnyH2w6DfPSC9maUBPJQB/vyyV+Hs48uyfyRCy2k8Klqp?=
 =?us-ascii?Q?ZDi18LdwPFkkNgkzGLBJeC04vHeNGsXJ9Pm1xBy3MOEkwiQmk7VNgVdKmDuy?=
 =?us-ascii?Q?6Y5AkBt71dTgbiYsnCjHv/7AyeV/f3bpM02OcTJZKlu+Q3BvbRkIgJskQ4q0?=
 =?us-ascii?Q?9J/YpZk/pSzSk8XzTv+VC/ps4AKGKYMmmxyu2MsvmJT8fVC/fmtl7GpVMG7E?=
 =?us-ascii?Q?y3BXSIj5ATaWXI1Yuekk8MKMt+eEOsF+3iOxbNT5qKOf0H07qtIK7BpAwIQ3?=
 =?us-ascii?Q?vRJMRASJLpw7XwxfADi8ZXnrr/oUPwSiV9v33BImhw/lx595qbBLMpUdVVw6?=
 =?us-ascii?Q?FQMk4Cpr5VNuBt0pfL7Rn/OFQf4MkhBp4OZvr9VfteK1vfjcc+nM3AeRPgGH?=
 =?us-ascii?Q?r4AlEZvSDflJGZXrv4c9IGWC8DtgRWn5MH6j8TMwBvIjVTbsSxh2Kh4z4lfb?=
 =?us-ascii?Q?sbxLQOlFH39DMi25crt/hI2tOu/lT+Fek6q5brSnXWuddt9my71N05GX2wAa?=
 =?us-ascii?Q?JpvjQrcHOUNY6NbBIwc3IRG+06cqgDlXwYw+50xU+m4+YYz7imrKUM/vJQ6N?=
 =?us-ascii?Q?i9qfeiaBwY3i2I3sUcWHNmOrbCs4HntUxrMzULRKbNIX5mAOSZFZ5ych9iY9?=
 =?us-ascii?Q?PyGL1sOSawCRox8zT5HOLkJAahMM4DQuNRwSKvI7S1Cs331dO09xXYTDfuZ5?=
 =?us-ascii?Q?39EbBIJcHVTlz1Mpg7oGb/7TWVDfTE5OleW9rXhDuuYbEZsncQwwB4++cJk2?=
 =?us-ascii?Q?vQOEzA4v5FoRlGAX0Ttz/upXsEB9bvCUMbFFuNGcca0KEFGQwDr/5gE6SWqy?=
 =?us-ascii?Q?6Ee9hvBxDHYaLehUedfIkXv5Gsd6TI7T8Wq8hkqtwGWhsWevJyOD7gouJXs0?=
 =?us-ascii?Q?bJS0qSyCSQG18yjzafJ6FULMQBHtOL3B6ctwQkHPRR/f603wBvi+ANJxIRcx?=
 =?us-ascii?Q?9uK2vWe9s4m8hAK+1Te5q6NP7Tus07wggIykXwDXEwb6HJS/pOj7qtfd9Dnv?=
 =?us-ascii?Q?vOGbQOwUKGv9jiJvtGyejaZWPI7r9Lf+s+Oy0Ts+9Zvy5cfykfyTHFby9Bvl?=
 =?us-ascii?Q?5ix4Tbc8nNkdhDwHE3y4Bhk1EFTsHSHC6+yiBSjK/1QFYxglmviGQ8FWKqkM?=
 =?us-ascii?Q?+Bj+6YkhckJrvI9xSPXWnEPdIfC83XEtTrkj4J7HU83BpPxYlIjpTE+keLKQ?=
 =?us-ascii?Q?Gcad+SslneWVscark1QL1MYFt4Ha+r3W?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: da1bc707-e801-4e87-3e24-08ded886a3af
X-MS-Exchange-CrossTenant-AuthSource: GV1PR08MB8497.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jul 2026 22:09:52.0145
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB4PR08MB7936
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[outlook.com,none];
	R_DKIM_ALLOW(-0.20)[outlook.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-8878-lists,linux-leds=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[fombuena@outlook.com,linux-leds@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:sashiko-reviews@lists.linux.dev,m:linux-leds@vger.kernel.org,m:lee@kernel.org,s:lists@lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-leds];
	DBL_BLOCKED_OPENRESOLVER(0.00)[outlook.com:dkim,outlook.com:from_mime,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 9B9256FD260

On Thu, 2 Jul 2026, sashiko-bot@kernel.org wrote:

> New issues:
> - [Medium] The commit message hallucinates details about the baseline code behavior, falsely claiming it previously restored Pattern0 to full duty cycle.

Indeed, the commit message described the previous behavior
from v5 and earlier iterations of this series as the baseline. Fixed
in v7.

--
Manuel Fombuena

