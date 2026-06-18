Return-Path: <linux-leds+bounces-8669-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id DcGFK88GNGrOLQYAu9opvQ
	(envelope-from <linux-leds+bounces-8669-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Thu, 18 Jun 2026 16:55:11 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E1BD16A10A5
	for <lists+linux-leds@lfdr.de>; Thu, 18 Jun 2026 16:55:10 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=outlook.com header.s=selector1 header.b=CECUhhhr;
	spf=pass (mail.lfdr.de: domain of "linux-leds+bounces-8669-lists+linux-leds=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-leds+bounces-8669-lists+linux-leds=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=outlook.com;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 5C18E3019006
	for <lists+linux-leds@lfdr.de>; Thu, 18 Jun 2026 14:55:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A3C782DE702;
	Thu, 18 Jun 2026 14:55:08 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazolkn19011037.outbound.protection.outlook.com [52.103.33.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 456512D594F;
	Thu, 18 Jun 2026 14:55:06 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781794508; cv=fail; b=iJkIQC8jd0JeQb3UmeJxyJrRSag44nkQSzdROt9oLQ/lCKu27BB+tBBR41MgZOMcjAyynLqf6zVRVSpFtorZFOV8JpQZNQX+GGmaIUBrphlnOBOrxhFsk20ctAQ96nwj5touLFKrvpfl5HAfcq1Nvny4rUw+8tWnAdrfBd7xEQ8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781794508; c=relaxed/simple;
	bh=oCo2ixX6M1voCit2pQ6M0xM3DSanXpOkSZAboxgM0Gw=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=UpxBV/46htdqmGW1Ceb2Igz5buGLr3YHX4A6Dx3QFEuwN4/i++nN47bouNMNGkyFfjDOi0Y0p+GIKGjYHJCn7Tj88/G7Rxsy2uoIIHyQCy7Yr74Nsp4IXvgXyGexeyWnXC5v2qZfaBMuyabpEfmQoyk4H7mAwOh7NGMBZOhgXYk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=CECUhhhr; arc=fail smtp.client-ip=52.103.33.37
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xJC0IP09CVQ1wZZ/5hwk1sYW1inr3AL51Q+xPnu/BMr0nCM6bebXdQfzf2aAYMGMcrbqogx2iSdnwObQM35EC18zUl7rMO2Z7YrgVX6FEoa51/YPTBt0XrECRQY76CgmvY5X748u/xhxUaxjTT85y0kI+vNS+hJqq/t5Ce8clcT/K5KV4/5g3hsyEwmMH0PhQCMHysy1SGDQhzm1NKzJF4gwwJSW6C9LssFIASpeRUuO+iZgmjcwr4etN5+FLPsjMQfhFUbbr/HxK8fwr5evlf/zEVxcA7ykJyUmLUi0lQeB1i7sTKyFuE1snzXCd37Au36mNqvGhwdiIaoK0r70QA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Mi5vJ4TcdH4tdZU6ts9NxFRN+tuYLjuJtfX3n5Tcf3I=;
 b=yTN1qUgx+587ThbtMP4Xq6yyZgn5XSrGqAxUTiXzz8gjKORcaNqDAWg047e1VY06q4UJNfwHh5X5KAnmLPWz+F4pqWKREPGU4L3wRWJ2QrjktEVgV6XCM6MuGAUWnUcLhUYf5KnyATiL6UHhkI+EFlBrckl8/TQ1QFu+8hy3BjAv1NR/FODSJjn39nKjpgw6Ii4JafiqhxVrn9nQEp8E7hApT7e2SHm9ZA5Oqr0Z6/TsIVKy9PIMWMMmQhvVynzooB3ceF1fqovikENDfh6QQ/c8sbynL1Dqca9BuTqbfg5UiX5Q+RemNNcfdbs7sFbOu4xOe3bA2Cx1hY3YflbDIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Mi5vJ4TcdH4tdZU6ts9NxFRN+tuYLjuJtfX3n5Tcf3I=;
 b=CECUhhhrJrR3M47ZILWgxf0SMQ0C9CPcOWAui+YyeWSU+ldj1bnU0U7BHSBI8EnRk7peTWxmRAJuGf2ePLd3gYyDoqEQWKj5T/e0vF3RnmaFGNmlm6jLtey+mmfdGRurjZ6WpQGb7BTAnhlZQKmMyVXB4lgYOpTM2Kf3N/MbeHYMqpvVHXSZpLmOzP84GFAxVKdoBOQHIgSmNwS7M27/gHRkP5L4yVgDU/xtbLZ8gkWGGorwRktvxrZ17UAH7wiDuvC4dmN4U53WpacID13M5ArFM47qo3iJmqFa5KSIZxLLoRl6HH7hN3MMojJsB39ZDMKpVIXymPtJlR48SFPM/A==
Received: from GV1PR08MB8497.eurprd08.prod.outlook.com (2603:10a6:150:81::22)
 by DU2PR08MB10304.eurprd08.prod.outlook.com (2603:10a6:10:49b::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.11; Thu, 18 Jun
 2026 14:55:04 +0000
Received: from GV1PR08MB8497.eurprd08.prod.outlook.com
 ([fe80::705b:d4a3:1c1f:b9a2]) by GV1PR08MB8497.eurprd08.prod.outlook.com
 ([fe80::705b:d4a3:1c1f:b9a2%5]) with mapi id 15.21.0139.009; Thu, 18 Jun 2026
 14:55:04 +0000
From: Manuel Fombuena <fombuena@outlook.com>
To: lee@kernel.org,
	pavel@kernel.org,
	vicentiu.galanopulo@remote-tech.co.uk,
	linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 4/9] leds: st1202: restore Pattern0 PWM to full on after clearing pattern
Date: Thu, 18 Jun 2026 15:54:51 +0100
Message-ID:
 <GV1PR08MB849743A4C667CF4281632314C5E32@GV1PR08MB8497.eurprd08.prod.outlook.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <GV1PR08MB849700625A78304DD5FFCA3EC5E32@GV1PR08MB8497.eurprd08.prod.outlook.com>
References: <GV1PR08MB849700625A78304DD5FFCA3EC5E32@GV1PR08MB8497.eurprd08.prod.outlook.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PR3P189CA0007.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:102:52::12) To GV1PR08MB8497.eurprd08.prod.outlook.com
 (2603:10a6:150:81::22)
X-Microsoft-Original-Message-ID:
 <20260618145451.594928-1-fombuena@outlook.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV1PR08MB8497:EE_|DU2PR08MB10304:EE_
X-MS-Office365-Filtering-Correlation-Id: ead0af29-d03d-42b1-d642-08decd49942e
X-MS-Exchange-SLBlob-MailProps:
	WaIXnCbdHrO+2YmbT5jW+WUSUt4IT5vRDol+aa/HrhX52SoKuK3Xn1aBSI3c5u8WKk4VB8DysXPUoBj/IXinulhVTxGRQ3Ii1lyYYA7Jd1whqSI6173IJK6UlpHJbzd5Hoajdkx3moyhKvqN6vCHMd2I3RJ8isg1z4vw8TbA8zvZ09marVNIOzTsGxIOCv+3aE4t9gZqSwAsuNa2UHoHr0A5wi7YZV21rmIFx4gVFpj10xzXrt8x0TTE10yi800EWOKmpDY7u/NrUFDWQoVlbPnt0Wwop6tJY5iHjy8nUarubRrAxomLRr2ZUxDlFaed5xnouKUGumMgggrrgZzKeCR7DmLLjeFaCVwUlJtUS2IwiA5Ksa6iKFC+8qHTDjg0dq0w/PbMSlE9ug6687ghHPCVVe2GCJgkgVI/RA36fuZVuG2ykikEzPPj8/fNoY+4LZHB9kyVkR9EiFjrz8kneBpnwOdhWVHN3yAbmLXbhvHlgnuWWT+rfE5Cv07aPSPyO9/o2SvTffmoZSO0QqV1m/zjBAJtqEabOS2neCgS96qR4JCHQW4ixqlXaHJm3wn2zU0lgNl/dztX7S0rtuVA244Q9/2ImHMaPtmFsR4k/l0MB8ddv7JDWokZzD0O4SULqL7pdo+2H6vup8onBXGNuuaa8/TIAk9Z3oOmm2xJq4GKT1w6W6/cv/h7Uep4Fzl4eyBJNED6lBk1cIZjZ32Jw5CVhEbPpqnOve5SeCgViFOUFs82t0MjIcW5gncIT5lcy5/PwRBhUHs=
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|23021999003|8060799015|37011999003|19110799012|51005399006|15080799012|5072599009|41001999006|24021099003|40105399003|3412199025|440099028;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?gZbOCXcD4K5fl26WJ0P7E9JTpNB74cp+x5Gg3jzrtK38IYaxQPTeKoC7cC+L?=
 =?us-ascii?Q?rcTLf1c4WvEM+MlB9Q+24NgJM9IwxVvklDbD46C7Y9CUCJ8gitTP3n61nc5b?=
 =?us-ascii?Q?9KY8P4TncLMPC0U2iN0oDu/5qy4FOMTbiYzxAyCUSPR68g6ubgJsHiqX/fQE?=
 =?us-ascii?Q?ZsYJYJ+aELT2BVd/1hFE97OTtHyxojvdClPAulMdto4KxnCbuzVYNhX+xFD/?=
 =?us-ascii?Q?65fTV2uAVuiwqNh8JLTLVJz5Np5ZsTtybKjRIXuZpiwK3fY6PM347BTe4ODC?=
 =?us-ascii?Q?oiaItARpJgDn8gQA/ecDco3XVX08cbq1bcTqwD99jgoK43DncAQrd3mACgGu?=
 =?us-ascii?Q?tZmbEQeBjKJ26oAuwq8QQ04vg6FdwlwXTMb4+uasI2F6VfEAtOTR6nrFsISF?=
 =?us-ascii?Q?TQFUVC0Slhdc4I+LA9Y+/Jzy07LKtS1u2mDTIFenIgYRlBzDKhQlbXxg7TLk?=
 =?us-ascii?Q?yWiqwOESCFFPorHkl/sczJxoxDhz5bSyiFTF3Jeegkn6nnavo9888lKovaqt?=
 =?us-ascii?Q?Ncq18nMxUQ6Sv4IzzIY59VsjIXsXueWcwtUi+OZ+TmZU+AP6a6nqiPHhgnk/?=
 =?us-ascii?Q?Gw8AZ4K9TwMZg8NIn6w9lQzTkLS6pcZ8Zxi08dW4AVKuHKxghPhxfyHVO3aT?=
 =?us-ascii?Q?2yVmplgtlXDxPorSOWtxiNFQvLmzYgNTAjqAsEWykuIlYNwcphGUvpP99KeR?=
 =?us-ascii?Q?YPDHi8tiho+diawsj0o7gJerUxtLCK05qg2acsra6Wo/BeoMxBUjAmXlLGcu?=
 =?us-ascii?Q?+APteCnlY0tVoY9DwpBfoTYcohcf/RdJ/3IfKHbaFkxOzS5csGDatGperzGV?=
 =?us-ascii?Q?KETBdUSmoctYP6NpLgi/KST4joAayWAHhW8Kld/t65xuwtGSbp78vs69IQy5?=
 =?us-ascii?Q?Xk5NtHKlrcpCq5RrGK3nVu6r7mNGqJRGrzYEPUqMAJd9bOMFDixclOyy3BSr?=
 =?us-ascii?Q?gCBZ43swm8HTWtiqfv3+H1KcRi28ro1oVx5FunHFwFcNgtOcPnc59QW4ylsK?=
 =?us-ascii?Q?/vd3?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?6SPM6qt+cpV0+T5fBFCAEl/d3EIDph4ulSQUFGTvHO/w2pnJPgOHc/XW+s5k?=
 =?us-ascii?Q?Khwkmu6OOE0iBsM13S7FMKUFwsG9fvGCKCKWTjPm4zJ87ERUxuF3rMmq+PPh?=
 =?us-ascii?Q?HsW4xFkp+7dqpLCwnvgIysiJLXPBIrPf59L6HUqnD2mk8psxrg67Sbm/vVR5?=
 =?us-ascii?Q?UBVDAyMXHU4mp8k11vZ5M7GVOItp3WymK8KSgdGtbmHHOQ89aBly8xiUaVl7?=
 =?us-ascii?Q?X6i4pr4FsofFFHJs66BuS0LTjbIPHR84g5vv1LCekkvcP3a1FQoiR4P4VnJl?=
 =?us-ascii?Q?ILOZZAG59tZXRwjPz3i1YDd74rgYwy0SV6YVUQLG9w8bnc66nKw52aujvnb6?=
 =?us-ascii?Q?QQES6raL7p+jpvMDDgDoSKd0dZfaopqdxWOhaa80KdvNjef996G0YBorKUuh?=
 =?us-ascii?Q?eIxCPVxDkawycNN2aTqmkJXn8C64AgNWsm1VmSaeKRPK+Uahs2dFQ8x7ORdL?=
 =?us-ascii?Q?026PvBgJtJk/KlVBI++Z2Jb0ex6jHNI96us9L2I4pO3crYk3U9UJiSWxDbu2?=
 =?us-ascii?Q?VW94nD+MKTtEDXULlqLEAHSMJCW6gOH4N3ZnnpgGGLjrewePoPFnXHceB2hT?=
 =?us-ascii?Q?eUXblQN8qSUQlTurRug37YCDdIkUMTnBtb19xeR2htGMjNBobHBeFsF2wPLB?=
 =?us-ascii?Q?4Tl/E3uTvdMo8FWF+wpGcy9smSecnr8Od8CJguqDwamdodi5tC/NaE1pUXaB?=
 =?us-ascii?Q?OUG70fmoyVbsFEOxUkE9BB+rEqYY802uubujextId/0OqiGziJ+JN7AQ08Lh?=
 =?us-ascii?Q?DVH3Js/FEe5Jt5/9xAq6dMKRRW74vvkILxgA8Y+T8gp9ru40UsTnXeATQoQl?=
 =?us-ascii?Q?uHDaNOERo0O45n3eoU2UG9F1f9uK6OBUj7gaLcQ44Gy9kp5zpJmwek4Bye7q?=
 =?us-ascii?Q?pHdBqODEsZjjbu4bqu/ihBvi1+cW+zzqR6l93ZFhO8ltD2qvJNxa+rqIcCdB?=
 =?us-ascii?Q?eu8EubEgEvDRoWkfIQbWDLnqKFnBTkgrnndXWn0hk0qPQolhTUb/XJeD33Qu?=
 =?us-ascii?Q?Zxqrx3KDl8Rh0EfgK2/TTApa3j/PCVeh6WnqHjlt2/NqyjV4kAsAfiNztrIA?=
 =?us-ascii?Q?vTA1n6ecfxqK5bAD3/yuw+qp6wqIKn7kULZW2B9ToRuOIuGNj18hRxKPRSJt?=
 =?us-ascii?Q?ohFlBRCqftAvQYLkqv/pStkn47JX+vCY7qS3F9o9aNO9UUGugLi5JTFswCMK?=
 =?us-ascii?Q?1ru7cWEIBpS70Mr14icajzJxPyOLUzUi1b9H2IKMyNJ+ncmJ42iHJnua18ei?=
 =?us-ascii?Q?gmBK9CIeqpJI3XCPNAXcyaP26xk/ZDJphKpaQDeBquiwv5VXb5+11jYverGO?=
 =?us-ascii?Q?AfLhKWXaQ37tzbJzr5qrjoZ4xEhhKnTkLTdWVf4TaggDBzR1PzkTzsYyI5p0?=
 =?us-ascii?Q?WP/UlCcHqA9nmcUf2xI87Y6IIuqvx8QopkMXVFsd9hV+HXjbWfmhaSJ/jarl?=
 =?us-ascii?Q?q3fvckEBYgChuzK0EDJbpVxmU0YHGR8Y?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ead0af29-d03d-42b1-d642-08decd49942e
X-MS-Exchange-CrossTenant-AuthSource: GV1PR08MB8497.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jun 2026 14:55:04.0601
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR08MB10304
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.34 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[outlook.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[outlook.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-8669-lists,linux-leds=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TO_DN_NONE(0.00)[];
	TAGGED_RCPT(0.00)[linux-leds];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[GV1PR08MB8497.eurprd08.prod.outlook.com:mid,vger.kernel.org:from_smtp,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,outlook.com:dkim,outlook.com:email,outlook.com:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E1BD16A10A5

When PATS is cleared the LED output is the product of the ILED analog
current register and the Pattern0 PWM duty cycle. brightness_set only
writes the ILED register, so if Pattern0 PWM is zero the LED remains
dark regardless of the brightness value set.

pattern_clear zeros all pattern PWM registers including Pattern0, which
means any subsequent brightness_set call has no visible effect until a
new pattern is programmed.

Restore Pattern0 PWM to full duty cycle after clearing so that ILED
alone controls brightness in static mode.

Signed-off-by: Manuel Fombuena <fombuena@outlook.com>
Assisted-by: Claude:claude-sonnet-4-6
---
 drivers/leds/leds-st1202.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/leds/leds-st1202.c b/drivers/leds/leds-st1202.c
index b4adade49898..b32d8e716372 100644
--- a/drivers/leds/leds-st1202.c
+++ b/drivers/leds/leds-st1202.c
@@ -35,6 +35,7 @@
 #define ST1202_MILLIS_PATTERN_DUR_MIN      22
 #define ST1202_PATTERN_DUR                 0x16
 #define ST1202_PATTERN_PWM                 0x1E
+#define ST1202_PATTERN_PWM_FULL            0x0FFF
 #define ST1202_PATTERN_REP                 0x15
 
 struct st1202_led {
@@ -204,7 +205,15 @@ static int st1202_led_pattern_clear(struct led_classdev *ldev)
 	if (ret != 0)
 		return ret;
 
-	for (int patt = 0; patt < ST1202_MAX_PATTERNS; patt++) {
+	ret = st1202_pwm_pattern_write(chip, led->led_num, 0, ST1202_PATTERN_PWM_FULL);
+	if (ret != 0)
+		return ret;
+
+	ret = st1202_write_reg(chip, ST1202_PATTERN_DUR, 0);
+	if (ret != 0)
+		return ret;
+
+	for (int patt = 1; patt < ST1202_MAX_PATTERNS; patt++) {
 		ret = st1202_pwm_pattern_write(chip, led->led_num, patt, LED_OFF);
 		if (ret != 0)
 			return ret;
-- 
2.54.0


