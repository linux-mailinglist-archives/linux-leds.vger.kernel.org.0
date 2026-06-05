Return-Path: <linux-leds+bounces-8498-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id S466A4jXImo9eQEAu9opvQ
	(envelope-from <linux-leds+bounces-8498-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Fri, 05 Jun 2026 16:04:56 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 08826648B55
	for <lists+linux-leds@lfdr.de>; Fri, 05 Jun 2026 16:04:55 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=outlook.com header.s=selector1 header.b=IGhL9AKb;
	spf=pass (mail.lfdr.de: domain of "linux-leds+bounces-8498-lists+linux-leds=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-leds+bounces-8498-lists+linux-leds=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=outlook.com;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 0AD80300443F
	for <lists+linux-leds@lfdr.de>; Fri,  5 Jun 2026 14:04:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A4034351C17;
	Fri,  5 Jun 2026 14:04:50 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazolkn19012009.outbound.protection.outlook.com [52.103.32.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 546CA2BEFE5;
	Fri,  5 Jun 2026 14:04:47 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780668290; cv=fail; b=XRg3LWCtelD9EtSy4xW29GZ+stSwdu7iN/kFD92DmuyncQvlQ3uRl/Mztt+4i61E5CT3eYa4zf374p0HJ1NjOyyqyzO453W1f+4jg5MWUI4Y+z7EM7wT3P1vFTypyZd5PBPcEwIi+x/gvkb+sFyZB8ICHPFzOePNuRHwuF8KVZ4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780668290; c=relaxed/simple;
	bh=MZHou7e4nBm13v+EHD5RZjAHKBD12CFWkQ0tAVtniqs=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=MGfyAqO4ryNmHBtXF4ULxR+tTRA5Wdbtbn4KSA4ZqTpB55tNieKGRjTATjed0obUnF1xcGS4HKPN/BpL/UUq1cUjR5ASPllfY2s1SifxbvmCMiQxm341N1mKoHuAqq4sD4vuBz6XJNYzyE2JVocxEH2/ayE4oMfTD1oHwq63au0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=IGhL9AKb; arc=fail smtp.client-ip=52.103.32.9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=q9lqRflKKGXfRLUTHWnBimNa/zsRdumo35gN3gWQC6AUDjad1yDfX5iXpCHmwUNs/YYQPCq75B3srX8sMg7w+L2AJE1bQfSRcbffTK9MTyQS8TxASaHxyVROknTizO4rMJE27YW60AgNdjvCpEGtZkM6Y09W8zyIPmjHv85U++y4ukJslRuNaEpoWCKcc4Xl+7A49sj3+cwTpCbZW0vPaIEjbSPaCU3cHegczuAIBdPHz1wKauVJbZUwyLkUqduh1fpmmtd9sqoTIY23yFSFIE/ZNA4TIS+hzLFnM+/aYgm9vCmBFYw4dWWJ/OWqCkzlQJsfCCBUZwZzitaGSb5Caw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3y1duXiTmQqiDM7fRmEVsTgMdl6vl5ewNDfio0OFOXU=;
 b=jdMbHHXlAWq1URSnNB3Bl62S5dFAO/quxY+terd8NvOeCie9fyaquHpUVwBq//AyETw8WU6LdmQTWrOmtRtWbCQod8sK4zTsb5iWjG5XuxKJ3bnkHwfLzPN7jq5GjE8Dx764FL8m2jkjcI4HAHCv79nvnfWhjg9pqRui+f0ixDudcyjrJI7V3GS+3HuCraU5J93AgFfTI7/wYJxzbXG3m5bShxil1+mXHPj6OiRtCH4EvUyXPWmV1r57RgBbYtOJ42pmZwc/7B6q/Fz2dc3ImD/jWhwOrnpJ9pBDBKKjq4tcLIiK8FxKoRJKgPH1SDu8VE/Ymio8ewC0T/iDMvxDPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3y1duXiTmQqiDM7fRmEVsTgMdl6vl5ewNDfio0OFOXU=;
 b=IGhL9AKbIF80SZ7MnSqpHDQjD+3+RUI9XXhi1/KbF1l0cnBfgbpYY2A0ANc58K3HHg+mr/Gl31fzCwKf3nhNnzRtIEOFejKUJIuByRXnN6wIcRnUxpmYg5ghVUSz7RH/XjqhCsqm9h/tPcN7u1B27j3xELJ/7iQ2Mae02JrRMV2W8/Sgj0YyYHOVlrpMM66UqMnq43DcmI7hrln9OjA3MEsoRmAql0kkTdusiq/IEDlF5m7zBgLsb36R4nTMF8fFJqxlB8ZkZUFLbwT9bsaMoJyCYK3ehj5k+neCArW8yoIVU1Fe2sdvBUCB3qKmdWD3OQP86LAvMJ0Xc4tvxtF5qA==
Received: from GV1PR08MB8497.eurprd08.prod.outlook.com (2603:10a6:150:81::22)
 by DU4PR08MB11573.eurprd08.prod.outlook.com (2603:10a6:10:626::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.8; Fri, 5 Jun 2026
 14:04:45 +0000
Received: from GV1PR08MB8497.eurprd08.prod.outlook.com
 ([fe80::705b:d4a3:1c1f:b9a2]) by GV1PR08MB8497.eurprd08.prod.outlook.com
 ([fe80::705b:d4a3:1c1f:b9a2%5]) with mapi id 15.21.0092.007; Fri, 5 Jun 2026
 14:04:45 +0000
From: Manuel Fombuena <fombuena@outlook.com>
To: lee@kernel.org,
	pavel@kernel.org,
	vicentiu.galanopulo@remote-tech.co.uk,
	linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 2/9] leds: st1202: validate pattern input before stopping the sequence
Date: Fri,  5 Jun 2026 15:04:32 +0100
Message-ID:
 <GV1PR08MB8497FB698D75B3C60344ED06C5112@GV1PR08MB8497.eurprd08.prod.outlook.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <GV1PR08MB849762937DA5B82DC89F1CC4C5112@GV1PR08MB8497.eurprd08.prod.outlook.com>
References: <GV1PR08MB849762937DA5B82DC89F1CC4C5112@GV1PR08MB8497.eurprd08.prod.outlook.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO3P265CA0028.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:387::11) To GV1PR08MB8497.eurprd08.prod.outlook.com
 (2603:10a6:150:81::22)
X-Microsoft-Original-Message-ID:
 <20260605140432.1438637-1-fombuena@outlook.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV1PR08MB8497:EE_|DU4PR08MB11573:EE_
X-MS-Office365-Filtering-Correlation-Id: 57130d49-d850-4cbc-cf0d-08dec30b65b0
X-MS-Exchange-SLBlob-MailProps:
	WaIXnCbdHrO+2YmbT5jW+WUSUt4IT5vRDHdeyC1gU1gCypSF7nE2vrCzfhO4hOKm8vV9HU9EwTXsOgm41Tl8gPyNI0X5DhcM+g2K0coVSkoDT+patoaO9Zk9q9WF0CGv5gCgK+7MehYiAMj9Oe+WdBSlnQv2Uaocp+wsavyeHDvrH8lLLAl1Nzl/csMf3lzBfuuImP/25T3vwlGNYRiZS3+enc8oucIl9LQJ5/HpSAZ6WsWzbVMTuaxT3r9Yt0lCIr2KzZ78dYQxHBKkSBijs5Cf2vd60CPYG1uSiJ+9WSDgCxE/eITEkbsclvTycAgKBKw7F2ZT8RFX6oCA6Yp6kZUqPnAix9+HJaDVcb5ECLDSufqiNL2L0bV4ucDgHZhXVMUVGv72wgZ1+P+8/J2J1G9z0Ch/nIo/8lUIR92bNXnwnEFZgt49IyzqyiFPbgNng59GRklmTXDT9zBF4CBFbYrCAiOpWjLI5E8dbjdI4OzjRe7Y4TWPsaSJrnBzaMnpxY26Sk1aqiijfyBVrhD93erjEjW0bvtFvae2QuYOCJjMjHmD+VWadgHGoGd8cJni2zGAoBpoUkMbqgqJDj+XyzQTFPbeMr3/qeOX/Jn3w1frJ/pYWzyi7Sw0EOpG7bLZruW2xCQdbL94WnXV7h4KC5OTC3EhDo827FUc82ArINseE24wVpbV0vq6unlWTyBddeDcEtSzLlhRaGkaT7IayfCQF5Y2kDUiWTlkhUgBuhpvGDzFI9ebxm4OmgMOuiUfWx7jYUDOFxw=
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|24021099003|23021999003|37011999003|8060799015|55001999006|19110799012|41001999006|51005399006|15080799012|5072599009|40105399003|440099028|3412199025;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?XUp73lHpi+0nhnsd25lpf+Uq9QIljPiS0sbykox3DlE+V1YIi0IjjrWpx6rP?=
 =?us-ascii?Q?NK+xEk2sbpSuO3HbuSzFePyBw0xVNmAzCpdg6Rk+DGmrBxe4EpNsvAxHg7xK?=
 =?us-ascii?Q?Ukm0VjnjK/z3K8LMs70+bvm5PKWU5Tq1GLAIzOFobg20VNpgDQ+zKJAPrR1U?=
 =?us-ascii?Q?TdNg8NIVVkYsQYwtOKFoFfO3fuOv1M62ikFFvV90NmOjKUkPPmZheIzmvLNG?=
 =?us-ascii?Q?uZpz2LCTR2gOhoLPang92NA+0aE1BGUsyKUilRXSoL+9EQs5JnEvjIHg33Fi?=
 =?us-ascii?Q?RjVqp+KSWF4fo5w0CmI1DkbbCRt0p7rf59Cv1XvQQj9eqVamBTCPBsPl4QS2?=
 =?us-ascii?Q?Pid7ykvUmraGABkXhaVIWm9KZ1DEJQcDkHTKKRjaJTwZKc7t5niRNXxj8SYr?=
 =?us-ascii?Q?qaltTMGOz/EoHOqvXmzlFquhpBC42wY9oEG170EBW/Of2F9/Hvqg2J10mSvV?=
 =?us-ascii?Q?aX6/ehL77uQTPZb8nJ46LJ7CA1nFe6wT8ggMpDPnLQ8pb0tttkE9nCLZTFRB?=
 =?us-ascii?Q?r3WceVSQbxWjleBqrvkl5LBCEdMJyqdPcfFgiklv1Su3ozfE5vYMn3SP/nFj?=
 =?us-ascii?Q?jc1fjrT7TWAOPTTQ8lMlJ6p+DGfwNoaPKDjuM6qVDLrU1P0y9p3bsZQW3Hlb?=
 =?us-ascii?Q?CRMbwKowxltq2PhWKJqbvZS/6NC7QIkXn5Z/Ied0ZvoBNCLIKQ84doYT3T+0?=
 =?us-ascii?Q?Bhcxe+9ekhfLnTuY+viedYBRjXkjObhiA2+PJXkIkuIgywMAKOH3hCz1ZN9I?=
 =?us-ascii?Q?CvRf6jKOgvR74G770wCsNxaNEcxy1j0UWbLwsoBRyEMBBQvITduE96qNXYRx?=
 =?us-ascii?Q?3EyZruLovjMbUXYK+wzzHi3p4nRyKh9oUV2XWm7Q8EN1q+OxHMl5oeqGhPSg?=
 =?us-ascii?Q?Z+il0//xHVLw1zLKhYeDWTEhqSZHjzTOA5ZKCKp3P5Ya3VEaj2PmEKH89X1r?=
 =?us-ascii?Q?Dj0bPiwlGJrfapV56YLE6QCcubGUsYVqkSDptzxsf1PpOz6am7KdzkkQSutQ?=
 =?us-ascii?Q?oEFkH7fVDSEqpA5u69UPrSGM3w=3D=3D?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?QpeZEMIXD+T3Vy2wtJy0A0zNtU5GuhSjQiUsls/XG4JScRvsGWEwHjhTE8LI?=
 =?us-ascii?Q?IgGu+F2Op+IF54v0MmQObHgIHGbGD9IYt5AlPc6VB05VpXlFL35ZjMs0OXlx?=
 =?us-ascii?Q?35CHEEplKaKDVUF+nXNViLHyr+nAMQSC46Xfo2P/zHnAT5KAy9cVZmMRji65?=
 =?us-ascii?Q?y3wN2PM2quyfrfWji8vNyS7ovrtu0qpKIGFNC6ixxpnBE/9nsztBbKGLmPKj?=
 =?us-ascii?Q?SWurzaVfMtX6zQ2rJQiAMF6eRwW6kfiX7LMi3bQ3xQbneONApmO8UH6xazSv?=
 =?us-ascii?Q?zqmNPVNf2kG/dZ8pC0thXw9/tHmAnasslJnCAzQd3YcDs7zUpl8vyRAFTJ6e?=
 =?us-ascii?Q?kwTmKomOyCRUnlm/xn4AAFgHksvZULH3e7LPywWNgXZv895ugPHOAYU7v+88?=
 =?us-ascii?Q?FySfYPQkwpwxpaej4RalYosVmyWmlEtDIdcnF43/9S42wqKKsgCmKDZIXRuB?=
 =?us-ascii?Q?wTInxbO4HhA95UvpvTiI09bTTRkqZbZJotrQ4YvUj2flb7WzN6XVX4imiUiq?=
 =?us-ascii?Q?JR+PlR3IcoGD+t3zXjv441f0hmRbjcuBbl6h3BuDc57gpO1MpggVDGJAeaTD?=
 =?us-ascii?Q?0iEpkkiM/IvqOr5PnSW/qC9r1H1Cs/mvIvt7+rbSDJXuQvxCRP3Kfn5CmdKN?=
 =?us-ascii?Q?iN3JRzj4S/p5Shr1kIa+SbcNkWyiXuUqwZTc8Zyyx71ACF2BYaV1wbNVF6gP?=
 =?us-ascii?Q?oNXdyB7VX9obIi6FejLoxRidYlIokGg5BcYHNnLtzyZH+O32Fjxn8XZTPXNy?=
 =?us-ascii?Q?s91Grwe6L+mpKj0mqE+mz4vUAhGaOc+L1PIv5nPyUTZayubMr/QmHNPuIr93?=
 =?us-ascii?Q?BOPonwTHtkX/rBpex3xznb2MMp1xYuRKr7P8Y4QI5DEdLSs/u9FzqfoK160S?=
 =?us-ascii?Q?/X+1wSJTwbDagPJGH0SlFpRyy1jBe8GdpFREam3l2zcK/1nw4AW1NPyNvoCp?=
 =?us-ascii?Q?tV1DExH9Ci6jjOklKxJJkgttjLdhDxE94cGPrLoRbBjaEBtso/P/xP5J7SnS?=
 =?us-ascii?Q?CQ8OEjTQXC2RUw3GD+7YXc2CJs2HIRv0EpBI3jY8crT9DCQ0U3rj82L6i2ia?=
 =?us-ascii?Q?dH7OoGgBqs/ZUHdVUtoqCN+ow/XbvbKTeN61IBtjwhuM72ISlw3CaN6J+piC?=
 =?us-ascii?Q?dUnhIlieOdcY9JfoAO+mm39jaAtV9pCtSsP2oGx7GtLJ77h5ij1hdvC4a+lw?=
 =?us-ascii?Q?Qaya26RKAbPMZAuZcMMPh8OfWR1W9msYI+0QudQ3M9vh2ADLutF/Klqysr5s?=
 =?us-ascii?Q?32BFpeOWHBWVUbvHNDqP5XsxgIPdH75fV5SmrbnCEi5O0w8nuuI3kphojjN2?=
 =?us-ascii?Q?H0vUOjVWgw0qWqXnX/Z09X3wJie6jebqPnM+FNqmcRlT73TpcycQycEe8R5h?=
 =?us-ascii?Q?Bl0K2DTVn9GDJbNCIl9tPSbF7yrBytL8trbSKSpLS4U8BwAf5oqvA3OKcNmq?=
 =?us-ascii?Q?qbDOcKjffor4Ng7NUubEbFEgedR+gDln?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 57130d49-d850-4cbc-cf0d-08dec30b65b0
X-MS-Exchange-CrossTenant-AuthSource: GV1PR08MB8497.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jun 2026 14:04:45.4399
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR08MB11573
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
	TAGGED_FROM(0.00)[bounces-8498-lists,linux-leds=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,GV1PR08MB8497.eurprd08.prod.outlook.com:mid,outlook.com:dkim,outlook.com:from_mime,outlook.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 08826648B55

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
2.54.0


