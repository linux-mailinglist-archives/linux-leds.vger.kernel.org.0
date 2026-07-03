Return-Path: <linux-leds+bounces-8916-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id pSC3COOYR2pvbwAAu9opvQ
	(envelope-from <linux-leds+bounces-8916-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Fri, 03 Jul 2026 13:11:31 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 71539701A76
	for <lists+linux-leds@lfdr.de>; Fri, 03 Jul 2026 13:11:30 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=outlook.com header.s=selector1 header.b="GhLK//bp";
	dmarc=pass (policy=none) header.from=outlook.com;
	spf=pass (mail.lfdr.de: domain of "linux-leds+bounces-8916-lists+linux-leds=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-leds+bounces-8916-lists+linux-leds=lfdr.de@vger.kernel.org";
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C90F03049FD1
	for <lists+linux-leds@lfdr.de>; Fri,  3 Jul 2026 10:53:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 088E13A7F7E;
	Fri,  3 Jul 2026 10:53:28 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazolkn19013080.outbound.protection.outlook.com [52.103.46.80])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A50CF3AA1B8
	for <linux-leds@vger.kernel.org>; Fri,  3 Jul 2026 10:53:26 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783076007; cv=fail; b=OquunnEPg7Od4JE4DvTWvAiI+3H8WqxLBzLuNt9CmvKojWety2aW623R9HpqkZw560Jsdw9JnVr0nRDhLWeTk8tfqXPn+7EGq7Q+pDitOM5K3wCTC276wQOLN3q9cmxK4fsiM7xpUPnxFL4yZOp0talbaluEQNRmHowMK+cYsxA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783076007; c=relaxed/simple;
	bh=Pv/Kg82MC3ornOKqMZsroYdayO0x6/wAlT9fFzK7fi4=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 Content-Type:MIME-Version; b=m1cbaEkjiD/4/ZAlC8+qwC2Cp9mFRTvFG6MN9yf2HjoZS5ZudcmHyLTtSO/byhEnueR1gvvLvzFuG2eoW5stFv+orWWbBTxz1OVYnBIF+wiIzRgM9sJj3s/7Xp6rlN1xHGYjgXjwtPd9quXhl0i9Kkvb91UvLz57Z67oUblnEp0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=GhLK//bp; arc=fail smtp.client-ip=52.103.46.80
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=H9/ggbkgLjsbFYLdXsOUCRwhVBsKSmW4CWGEwqc0rXXHTted2Qwp6+LEgvxLVmqjIZNEghnA1eXs7VK28LdLA20tKatUWNG3tloosZyENxyN5gmrLq9uqzBQeV2dnEnG8qyzlybabPaTsZroh6XHUGNLA7+K1tL6NEz2GYxr51lE5os8kSB1lb4mKKcsJmBqheKy+bmyLaYGQciWkQAGfW4GXjfMIQSbZPf/eYL8MtLC3/sjxyM5ecsCcR4RBEYT0ZJa0ge0kAl/v9jfm9SEkvozwJMNxjCwKQ6eqzI6a/a+85j8HPELfzt8MPgjhYwzDS+M5fhMH05vqRIHBM+qcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Pv/Kg82MC3ornOKqMZsroYdayO0x6/wAlT9fFzK7fi4=;
 b=gWfX/MCy8biRM5AVdwowW93OgsczJySXS2tVg8WZBtQoIPxiLB4RjOrGEycFz+pekWimPIgAeUo/5Gr/idQ3z8NHei8lzOzhe4tYjT7AADN8BUCPODHkNNE045lju9z6sTt0TsXxn7y+6A3uuxUdR9OUMa7rqZgCjwB5WSfny4my6yC28sxu1fx1aAozgarBXUGLEfKzrrdJqvCSLWXabvMm0JjMPn1W8/0mt8F6wS21FEh5Dh80nP2tV1TL6ihQaRDsNisn7fhsr8THXiVp8Q/gTJyQxSduNmrayc/yMbWzdY0WYExFTilndHi2RpEDgxc4j5ycsdE/aMD3k37rwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Pv/Kg82MC3ornOKqMZsroYdayO0x6/wAlT9fFzK7fi4=;
 b=GhLK//bpqp6ynl2Ijcse8d29WNQpfbJJ4JAcSqPXj5/lQGIZWr5uvnWMCF/WEJNZJ/CzGzo44PImXOZMM0O9FfCjq+F08ezzx3DIooibaAHqeZ7u8xI15efB1LtEJX/1F34nGHvnSZ4L7yPtXiKupNT/HZH6BnqWYAIBxEIbmtjbjdvt4OkZjvuMkNjGj5UCNbTP3x4sf/MC1gA/BfCTkkCi/jlFRoNAGrrAddEnrh40WHbpu4Y5btRAdxCIeZkf/Xgw9DI2YupduFjUz4HY7P1Ks8V495LCySLcMfn4pjdOJBCgBzbUrkDWDWI5RTBi61LawVw0b0sBvoYXRKn5xA==
Received: from GV1PR08MB8497.eurprd08.prod.outlook.com (2603:10a6:150:81::22)
 by AS2PR08MB9737.eurprd08.prod.outlook.com (2603:10a6:20b:607::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.8; Fri, 3 Jul 2026
 10:53:24 +0000
Received: from GV1PR08MB8497.eurprd08.prod.outlook.com
 ([fe80::705b:d4a3:1c1f:b9a2]) by GV1PR08MB8497.eurprd08.prod.outlook.com
 ([fe80::705b:d4a3:1c1f:b9a2%5]) with mapi id 15.21.0181.010; Fri, 3 Jul 2026
 10:53:24 +0000
Date: Fri, 3 Jul 2026 11:53:16 +0100 (BST)
From: Manuel Fombuena <fombuena@outlook.com>
To: sashiko-reviews@lists.linux.dev
cc: lee@kernel.org, linux-leds@vger.kernel.org
Subject: Re: [PATCH v7 2/9] leds: st1202: validate pattern input before
 stopping the sequence
In-Reply-To: <20260702225006.E20411F000E9@smtp.kernel.org>
Message-ID:
 <GV1PR08MB849738669F7FA8FE3BCD7882C5F42@GV1PR08MB8497.eurprd08.prod.outlook.com>
References: <GV1PR08MB8497C0B898789BB73ACE6EE3C5F52@GV1PR08MB8497.eurprd08.prod.outlook.com> <GV1PR08MB84975929B6ED7CDFBCEB7D76C5F52@GV1PR08MB8497.eurprd08.prod.outlook.com> <20260702225006.E20411F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=US-ASCII
X-ClientProxiedBy: LO4P123CA0484.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a8::21) To GV1PR08MB8497.eurprd08.prod.outlook.com
 (2603:10a6:150:81::22)
X-Microsoft-Original-Message-ID:
 <8b6e0b0f-b158-3df7-0e1b-74ced26e3b8f@outlook.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV1PR08MB8497:EE_|AS2PR08MB9737:EE_
X-MS-Office365-Filtering-Correlation-Id: 4108936f-3918-4dd0-bd86-08ded8f14d9a
X-MS-Exchange-SLBlob-MailProps:
	ScCmN3RHayHq8QFbWW6Ra03gxaeZK6u4thQP0QDwvd0JtP4KA1PkjLi6sxh5OpGi4tqae9Ts3KzJYb+bj1vp/Yh72lpbIXKbassMLMtAAYYmo9hPsi6R8lHCgs6V5R6YrXx/bV05Qg/8g4H4fF8uMh3021Cyl1r7a5FUvE4e4ojiYEI+dQat5D+dPURK3s2CAKNj3sXPCyIvUuuHynl2IfgU52Q/wRrI+L9K2fY9cnvxTCKH0wRy/Mkhz6Q+wLqsoKVPWFuEP5K3fQNOOfY4w6yFUG6NDY8hBLo1YZU4R81HQ1CO42QnT1mT4x7I3rEbc+6D6xZB383olqJRUEd0LhCsFkPq8Xj/pqNZwfw70wZnThhULj5lwUuk+P1tX6oRZOvY0iVZpFhiDWV5QPqew6ksl0qALBDV7ym5k5pwKXx9EB55MLBBV6NvJCooWbDPapYhnXIHQazEQOH2QBZv4gUApcDgIkzhfM1WyYXBMnyTB6yCujz0aFyCOgYU4QzjsOTtn6k2iHmMmxFofU7+hLIzCeq8VmyoJ8Vitp6ge7rND4fVI6BKoQwdqSDcQHzuJ2NQRV6fm+eFrnNOKfQ/e4nWDPMc7dbaVczFnaL3haYyAszTQmkxbkQYdNIiQAyItd6ZMqe682Bvw5v0JgzAV3dxyJy3NLJ61TtVIYgnjkF1Ig0Cftb4I/IhgBERnFHVc3MVCpbqZJr9VusUzXKUN+DHGrjluXGIkmTceN4l3/8=
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|25010399006|15080799012|23021999003|5072599009|2604032031799003|37011999003|19110799012|24021099003|6090799003|8060799015|51005399006|3412199025|440099028|40105399003;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?17tICk41pzdQPhMYHUDMBi7YQchHTPTQ50castqIBIR9Hl+tjemcthUuyWC5?=
 =?us-ascii?Q?3PhmQXxzYDG1mr3s3viFHpdsoYMzLi0O6esyYu7ed9bjNTpBxicZgREkCebr?=
 =?us-ascii?Q?N/4vB9zCLmBUMTFopkQrCTKSuHGwFJ85nlqPgKuK5XUuT/UtiiuQsYEkGtR+?=
 =?us-ascii?Q?+DVzjENfoJd/D6c/b3kb74vR2ZwmMqlP7f3N9Zfwq+XNfcyVereY11n6XMr2?=
 =?us-ascii?Q?KHEf7R9kdwAOGKtLV7WAfzPzVUkiCdZuiYPNmOKebR1UijNI5HMUmmKmqxFr?=
 =?us-ascii?Q?YUV6uTuYorNHi4Uxgf8CaVmhD8o8kbFysGpuhtp4UKWcvx1eKBdEZQw4Ut4a?=
 =?us-ascii?Q?Zd6mTtL3gz6yDifdjPYBhdc7A8LNbBfnB54qhn0jgtfRIIaivG9/D+oi0g7r?=
 =?us-ascii?Q?LRAjKL9f2YWLvpiX8ONKGs89MLTJlbkpbV7G3Tl0MtOxtt6gJDy1dwnnIL3W?=
 =?us-ascii?Q?tTKL7jQhtIal9eYvAc+hedJxNxckQFhEmP6+AAbHAJbo5tkfKK1lao8aOuKU?=
 =?us-ascii?Q?b5vUdoWbj1S1/zSWxv1DU1hFDbMJbP/BN5q0REZKkYIyQS972dxT4TYkWPHP?=
 =?us-ascii?Q?aOgBZswmqiltHYsjaQJ/bQUp8v3fl9Iaf/kgiNRzA9oL589D1UQwcAAt0mkb?=
 =?us-ascii?Q?O84s8dbjJJsW4uwC6GWfMpmL98XJl3VoUmvDoZ0DXkE9c1QTsDwAN5/qtIOO?=
 =?us-ascii?Q?wgnr2NCEg89CDDPL5o6inmV9ifEBgf754B/LPMFReHfruTTrWAvlNx8NRye+?=
 =?us-ascii?Q?tWAbVBy2TMFaR31Zi+bPzP6HScrA9h6qhZmx0O33HKpGRoIMSy5n+5v0yojF?=
 =?us-ascii?Q?wlUQqVWC3FRdXZ+J+deI9llYet/gTRpKyMOqincsMeiFcMTIpoWvzjCU3ODo?=
 =?us-ascii?Q?cVwUubTAaTLhLP7NIeIbExYlIZ1OxJAHAxH4d9hvQfKqsyrBeCCaM6W1I1Yl?=
 =?us-ascii?Q?URtkUhLVLSXoDsCtDDSWaHj7LGv+88FqCuzovUNiy0+ZxvB/a1MLs1vjsOP4?=
 =?us-ascii?Q?zIZDbbXtmgJqFzojAyg+lJWEjRJ30/4S4CGVsWbmmWrLBhw=3D?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?6UbrNqY0mHu/CdKBGpWs3yiN28WNIwqC0uHg1NmKsta3cygI/NgorN9863u9?=
 =?us-ascii?Q?HDNEPr4Dj2niKCEQoKgsz5cPHjY8m1ZmhSZGpa2KzT9VzlaZOAnb2El66CGH?=
 =?us-ascii?Q?zdRPzC/9T57rlE/l34ebMQVMUbO4riXqV7W+g7pPEBDQ6EVHGchIsm7BdzvC?=
 =?us-ascii?Q?gIi3vnjDC4h+zzJMbyDZ7eSyRBHJT0QhqjobKuyX8EvINm60+lX1gXxGWn+j?=
 =?us-ascii?Q?tH90Ad3zw/HVfE5S+mJZwe1lVouFLYUkhZitTOajUazunVA2+6uJISK+uyVk?=
 =?us-ascii?Q?pFUg6L2WQGFstJhESjPNYBUHChRTj0xIe47BJklKBJCVywzuP99LDM49TSqs?=
 =?us-ascii?Q?3rbgBxGR9syIiPgKkL/d8FRPoVN8oK2C1gJM3fetBNgCkSb92ltWZUb9WfEf?=
 =?us-ascii?Q?IwtitIDK38tdHr+kalSLB6Y2LFnTGzFYFRRUy8+g32WxLEE1Qu5PhtygVwUg?=
 =?us-ascii?Q?sMnIKymct8w5dUraKKDdrwWfrT6ZINMbJXrVnMKs9R0glZWJu4uXQuhWt+4s?=
 =?us-ascii?Q?Zt9ZEXq++W9kygodd+IZrYtoSYBYMDD83W42ax/5UhPQCyLNX/G4VGNJgu2x?=
 =?us-ascii?Q?EHwkDvSP3HcEolMpCBsXteMnV8R1Ulc7KTOnzQHVY8Am0Tq51TrFhbtqHBOi?=
 =?us-ascii?Q?d2rn3n1e9QWqzwykZb8Vep9WJfOKqKn6bvOWsD1gZ3XNUImwI9yvHztxfPz9?=
 =?us-ascii?Q?UtYYl1H3OpMJEhqUpTgT9D3oQfI/E8qbSkIE63k9FAeIccHuGEzddDIint03?=
 =?us-ascii?Q?YHHuCvDpyvd/s+uydX9K98fzV7LzUL3z7xFw2d40zjUcvx5YaqpaVP7lVkAZ?=
 =?us-ascii?Q?SQiVoqkHNgY2L9loR7El0aeTYsmkkAHbvCYO9N1VanJz4b0QFfyp7JM60XFB?=
 =?us-ascii?Q?M485YcRSyycWo7Gmv1V3yXAJW+6Ity4ryyNifEFK4ntkLT/gTO+gjluHzEOu?=
 =?us-ascii?Q?WYJ2TacaHZiiZPFuXFL5fLqeGtmt7Lj+7YvwgzMJIR0RCuTiXojCF+taXvVR?=
 =?us-ascii?Q?9AwGxfYZ5fFDQW56W0ThLxbYE+cwOpg974Vm1pxqdJzMCDiNvfS5tsYaZTQ2?=
 =?us-ascii?Q?ZXB0eTqRIilsQlsu6g1cK9iVqa+TdyknsVUfxWp/GUe9Q5TXa1OLg/nPyVcg?=
 =?us-ascii?Q?BJWNpq5dNVEKrvyikj3JdzlmfiSwWTzg297ntdpX/tijQF4aIn9OqoSvPBPN?=
 =?us-ascii?Q?3I3gg3Aw2UEjCW9cwA0QoQZJqsqovyAC2f2zpgKY4GrMpmMit8rkS0Ff+fcH?=
 =?us-ascii?Q?2mFn0EOYqddu/BueuczbtYcwrseRVp9kDCBrRyb9klBGXSQ8egGOSC2jBpF2?=
 =?us-ascii?Q?w3YjegyptDzAvOExh+5zx8Exf7VOihq0Dt0/JEaLCLNJVyGa6mpA43l8rZMD?=
 =?us-ascii?Q?MDsTb83ZTFFVfOU6WGuwvES4yiv6rDi5UbKt7ilckveiLeKfGS2nk8z3V4c8?=
 =?us-ascii?Q?ActFwrDGnUFjdZ1PMo5vVkNpXzU29wKF?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4108936f-3918-4dd0-bd86-08ded8f14d9a
X-MS-Exchange-CrossTenant-AuthSource: GV1PR08MB8497.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2026 10:53:24.3113
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB9737
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[outlook.com,none];
	R_DKIM_ALLOW(-0.20)[outlook.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-8916-lists,linux-leds=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-leds];
	DBL_BLOCKED_OPENRESOLVER(0.00)[GV1PR08MB8497.eurprd08.prod.outlook.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp,outlook.com:from_mime,outlook.com:dkim]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 71539701A76

On Thu, 2 Jul 2026, sashiko-bot@kernel.org wrote:

> Pre-existing issues:
> - [High] st1202_led_pattern_set() fails to clear or mark the remaining pattern slots as skipped when len < ST1202_MAX_PATTERNS.
> - [High] st1202_led_pattern_clear() unconditionally zeroes the shared global duration registers, destroying the timing of active sequences on all other LEDs.

All issues raised are pre-existing and outside the scope of this patch.
They will be addressed in a follow-up submission.

--
Manuel Fombuena

