Return-Path: <linux-leds+bounces-8679-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id UacwG7BWNGopVQYAu9opvQ
	(envelope-from <linux-leds+bounces-8679-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Thu, 18 Jun 2026 22:36:00 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E9BD6A2946
	for <lists+linux-leds@lfdr.de>; Thu, 18 Jun 2026 22:35:59 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=outlook.com header.s=selector1 header.b=qfS3uQ40;
	spf=pass (mail.lfdr.de: domain of "linux-leds+bounces-8679-lists+linux-leds=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-leds+bounces-8679-lists+linux-leds=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=outlook.com;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 7BD06300F632
	for <lists+linux-leds@lfdr.de>; Thu, 18 Jun 2026 20:35:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F0E230E82C;
	Thu, 18 Jun 2026 20:35:55 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazolkn19011033.outbound.protection.outlook.com [52.103.39.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4925030E827;
	Thu, 18 Jun 2026 20:35:54 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781814955; cv=fail; b=s3P3Tf2unBiXThzCx8gDyt9mRT85rpEW+g63GJmilAPB1HuSsLMHgt2JQZG2WP0bkGvBvDpFphWhga0FD2UuZr+c3Kg5GfRolyCkTm8HQWySJsDV1fez0CQYpgs+ezRBh7MiFxrwIWha7b0GORb7o34OAZWBAEaDzoztyJ4VD3Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781814955; c=relaxed/simple;
	bh=oCo2ixX6M1voCit2pQ6M0xM3DSanXpOkSZAboxgM0Gw=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=NB2xE8f+y84u/JfFX4mm2VszDeFGIZUBhH8LQwX32elTUPuaGz2drpAOc7WT6qRpLDPGmh/9nYT3/1uuJG+bKzkbbjsCqUy848HfWmMllyMPo9mRq3PQyAFHbV6qUUjCCS+/7sClym1i1hHJMwscbsXd4h+Tgxw8iWqZe5xIvu4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=qfS3uQ40; arc=fail smtp.client-ip=52.103.39.33
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=O8CWD9Jt4/6cKsxRaY2DdgMcqFfim+fthAvv465ORtu1LLaNPsniN1notk6yyLNCBTyWIoA6uvkSTP/u6cEbBFFs8dX5Pi2cw2rneT3LvAbKhRsL6b9Ww+z9EIAko8Ng02FPEiT/dinrHVB/sC8Fum7Tq+4+b2BsTsJnHG5b5vECD38PZTnPB/mHrOBc1xYgQngg2r5MLU1KTnXn5wBeaILZ2lyvefOnBDaYPofoTGL1zdBO4zktJ2J4AlC4yyMkLYXaO/J54gn0mIR0BpcuUx3KftJK67zwn7BbpSknuYy/ud1FDV3vVhyi8AArNsNGfJCVe6jDsPq1WFOpkaPhNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Mi5vJ4TcdH4tdZU6ts9NxFRN+tuYLjuJtfX3n5Tcf3I=;
 b=q5IYJ8hQDRP3rLOK+d9YKatyEWcDFQx/G0dfYMBN97gqyL6v4rqB+9mnGC79wfbFqMI1CwSbNmvWCheHpuTf/uQRTZyPhveKfv831cSe2F/zo0ZeoWgEgawfaSjZKecUSOF+LC/fk0VudUen8/TPGldT6hS4YSdvSDnB+kRANngArix381eXOHWDQ31Mgiwl7vAu5dhm9Q0JIAqJWL84E7AFrYiOxdoH6xEN8dMfcDy3Zb6ezODRwxb4C6P2qfo76G6WG8ypuaMWaYc/lXDB5fHK+oyaWFZvcBbQLzy+opEskFzNrM7tbQvjtuWcaqgP8ugTn9d9unCz8WowBT9q5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Mi5vJ4TcdH4tdZU6ts9NxFRN+tuYLjuJtfX3n5Tcf3I=;
 b=qfS3uQ40WS09WWdrYfdTtNFMOrRvYFm5MI6J8+lM5ioV3d+uoVc/pNQnjhvSkrCQYWgGDnaHDylIMx+lCQI+tKGnbQJBUeraJWUxrK1NVGdcSYPK+pcmj1k5JdM4A4MbNSceolrrZKuYcJdinyok689NX5KoMcutKP9nMrU3u5IA8r/mmFgbHn3huq+P6jbbGBQXZZ1+eaqWljhwWWBy2XD8QbRfbH6zq055aQSOV6FdHABKscm/eAOFcBwt8TuUitTANrw41NNupYHgLdnOkQnN7FlxKGwgcOVxFvjF3FM7TeVXNl0kubAcdbk/S5RVq/DR3BzyzR7osMKSK/ckpg==
Received: from GV1PR08MB8497.eurprd08.prod.outlook.com (2603:10a6:150:81::22)
 by PA6PR08MB10545.eurprd08.prod.outlook.com (2603:10a6:102:3d3::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.13; Thu, 18 Jun
 2026 20:35:51 +0000
Received: from GV1PR08MB8497.eurprd08.prod.outlook.com
 ([fe80::705b:d4a3:1c1f:b9a2]) by GV1PR08MB8497.eurprd08.prod.outlook.com
 ([fe80::705b:d4a3:1c1f:b9a2%5]) with mapi id 15.21.0139.009; Thu, 18 Jun 2026
 20:35:51 +0000
From: Manuel Fombuena <fombuena@outlook.com>
To: lee@kernel.org,
	pavel@kernel.org,
	vicentiu.galanopulo@remote-tech.co.uk,
	linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v5 4/9] leds: st1202: restore Pattern0 PWM to full on after clearing pattern
Date: Thu, 18 Jun 2026 21:35:39 +0100
Message-ID:
 <GV1PR08MB8497BE987FFEFFD1EFB0BA36C5E32@GV1PR08MB8497.eurprd08.prod.outlook.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <GV1PR08MB8497ABC8E6AEFF8AAA1AF883C5E32@GV1PR08MB8497.eurprd08.prod.outlook.com>
References: <GV1PR08MB8497ABC8E6AEFF8AAA1AF883C5E32@GV1PR08MB8497.eurprd08.prod.outlook.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0105.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:191::20) To GV1PR08MB8497.eurprd08.prod.outlook.com
 (2603:10a6:150:81::22)
X-Microsoft-Original-Message-ID:
 <20260618203539.3318981-1-fombuena@outlook.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV1PR08MB8497:EE_|PA6PR08MB10545:EE_
X-MS-Office365-Filtering-Correlation-Id: 7abe9931-966c-463f-bd33-08decd792ffd
X-MS-Exchange-SLBlob-MailProps:
	WaIXnCbdHrO+2YmbT5jW+WUSUt4IT5vRDol+aa/HrhX52SoKuK3Xn1aBSI3c5u8WKk4VB8DysXPUoBj/IXinulhVTxGRQ3Ii1lyYYA7Jd1whqSI6173IJK6UlpHJbzd5Hoajdkx3moyhKvqN6vCHMd2I3RJ8isg1z4vw8TbA8zvZ09marVNIOzTsGxIOCv+3aE4t9gZqSwAsuNa2UHoHr0A5wi7YZV21rmIFx4gVFpj10xzXrt8x0TTE10yi800EWOKmpDY7u/NrUFDWQoVlbPnt0Wwop6tJY5iHjy8nUarubRrAxomLRr2ZUxDlFaed5xnouKUGumMgggrrgZzKeCR7DmLLjeFaCVwUlJtUS2IwiA5Ksa6iKFC+8qHTDjg0dq0w/PbMSlE9ug6687ghHPCVVe2GCJgkgVI/RA36fuZVuG2ykikEzPPj8/fNoY+4LZHB9kyVkR9EiFjrz8kneBpnwOdhWVHN3yAbmLXbhvHlgnuWWT+rfE5Cv07aPSPyO9/o2SvTffmoZSO0QqV1m/zjBAJtqEabOS2neCgS96qR4JCHQW4ixqlXaHJm3wn2zU0lgNl/dztX7S0rtuVA244Q9/2ImHMaPtmFsR4k/l0MB8ddv7JDWokZzD0O4SULqL7pdo+2H6vup8onBXGNuuaa8/TIAk9Z3oOmm2xJq4GKT1w6W6/cv/h7Uep4Fzl4eyBJNED6lBk1cIZjZ32Jw5CVhEbPpqnOve5SeCgViFMPHrsjk66Rndcr2MoliwRwxVp2tuJ2k9U=
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|24021099003|5072599009|8060799015|41001999006|15080799012|23021999003|37011999003|19110799012|51005399006|3412199025|440099028|40105399003;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?AGNOdyzueTFETFlrA8sr7CYTfGNSikVwnVhDf/6ruw2TKCDSygoTsXk0seXL?=
 =?us-ascii?Q?CdjaDaxAShBWlRi2LapkWnwKLGyxtRwPmejuJjovjPSJJg5hDcc7fot/6m5G?=
 =?us-ascii?Q?hx3eR7rUlusC0UUvNAgZ9UVLKBhRvfVt5LJFwpPUFiR0smRJI14c8Bq8rRx5?=
 =?us-ascii?Q?eJ/pvJKmDP3VtBzoY1OTXf9EttpXYLkAZxK722rJ785o7byAvRwy8I4eACI+?=
 =?us-ascii?Q?D51ubKE9QVplei7HUa2jwmcpWgG3RG41OpN4KEXP8UdAY3+CT7Z8lA8oHvQi?=
 =?us-ascii?Q?LiCnqAcDYgln2W/o/NE+XnwZje+/cXwkbUQcapx7zZjiSKSlRNvbegRBV62J?=
 =?us-ascii?Q?sYLEX+wia/ChT7kQLJIrHSCLabH5nXoSvECoG5jtON1uABNjRcK2F8D1/9My?=
 =?us-ascii?Q?xR/e+ce7V0btN+ldlFLLPZLvBcU/yr6Do3Whtu8ksVnhC2Pf6ZMcXPtvBAeX?=
 =?us-ascii?Q?Hb1CDCJfXV+HnFuAWLfIjCtV9BZM1+qvC7vaaP1oJalc4jI7cokemqSCk4wY?=
 =?us-ascii?Q?UnIwNzsRT+SeV92VltvjtWewXU/4DlARNRKRelZYierRoAtSmgBYXnnfU8fh?=
 =?us-ascii?Q?vyBD27bXkbhq7GIFRUeZss3ZnGdMiblUc5iAj6zIaUfjvBGLIq5JJVjd8kQb?=
 =?us-ascii?Q?bKMSwP1EqMSec2/UmwUKwB5OUz/4EX6NqR43RO1EHBIcZRZlqL1MGpitTZw9?=
 =?us-ascii?Q?4Z5atYlz/JKyL52/e80qw8YEV1SDNGI4ILYfp7Cqm0dfGvHKrDaOebRRVQD6?=
 =?us-ascii?Q?wwp0gntjAQCQdvjhNnV26Ot1JmzhUFN8bUb7PcWYDjrdMgKblNBUTGxYjy0C?=
 =?us-ascii?Q?0Vz7KbH9Wwn4L8Ydcvi/bFdS/otKvElDk0d6BPDWiGtTZ4l6N15iAORxlzJ3?=
 =?us-ascii?Q?9ZrR9ozOz3PFj4dCeyd7/TFhnBcYrT1RGLGzfbz91bneBlM3Jh4i3B+iAlY8?=
 =?us-ascii?Q?QPrLoFaRAeUF5jBaZiENNPiHLx01tFK2ZQJBU0XRWD+dq44fedRMWL8UcPcR?=
 =?us-ascii?Q?VIU0?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ZqZTtjMlzLlkP3eeVnraFNvZtqPlM28DnNepPjY55S+qJMxcQOu+TqW4ADtm?=
 =?us-ascii?Q?vPUl22dJ156Yy4fZLlV1rN7jGlyQV4SJIc3SgYj/yo2WCnd7jqJybf2NMnZj?=
 =?us-ascii?Q?QJ6bbbS3WScbWxiOeEPLzIncSGbGENEPe3ej3F2Oh6agVWzw0aOHwVAOxvkn?=
 =?us-ascii?Q?6iER6LlqOmgXuWTVlRUUyANW4DGPKkaI0pZ/qsswC6L8ok+Cy+p5qzB9X2Fb?=
 =?us-ascii?Q?jCpCzoG9bDU4HFJFCUZe1w+tY6w8oHYq4SWgm/OAHojt4QSKkmw/9xP+2s//?=
 =?us-ascii?Q?52eKg/Qvf+37ZZ+kpGr4EFGZKu1eT1xPTiOEolu77zz1/XFn+tztBs1VIJc5?=
 =?us-ascii?Q?dDUo+dpTP/g+UpxtJDT86zCw6LQb6+9yKvSTuhefCTYcFmlPN3wgD1nDkUaY?=
 =?us-ascii?Q?fs9KzMTUOWWPfiHMJ6az+5Xr3DpGdJDxzQ6hjHVYi+VK8hinZIoNwvpRAdQN?=
 =?us-ascii?Q?om2/8EQWsy786+jJCtUmQelUUZHfraDByp2XJz9Ccic2AmJ+sVt4LeZkNMTS?=
 =?us-ascii?Q?KFWCRAmooWcCGCsTq4LJPcunZYK5mIkMh/ev5jUoVWs4PYLR+F1xpjxhKc3H?=
 =?us-ascii?Q?jL/rgBlSlgNfjvH3cDb+z57WHI0itco68S1y0OvE9PwgOwudsGJDtZFSz3ut?=
 =?us-ascii?Q?VWLVoD36JhtGCY5pRtezp+4XuqlwK7t/FM3FjB+TifOdw21kFvf/zQ2e2Ztf?=
 =?us-ascii?Q?e6SLv0arqS7tIxABqAtsIjeQR2IM6gw1cAwgr9LFT6npcuUtFVch2EeeDDdC?=
 =?us-ascii?Q?JQVJLf4rHUssKUcESwrmsahezFtkV+4Z2nQb+lrSM3Yh03xc2Wp7+pXmsBO5?=
 =?us-ascii?Q?fE+6KMTmOqkuefB2Rx6OEAfKx2o+da6iVbxTfwezIiCFjHaAcl80neOViHD8?=
 =?us-ascii?Q?gxYU4/qRR9ACJc2CgHcg8x5qwU12QtoxgbN1fNvChMExoyee7cDSRRrl5UEY?=
 =?us-ascii?Q?ynkpajd/dyCSQW/U5BI3ypWU8XrFohTOk1d3Dhik1J1U/JfQ1xKMwPUNoyLV?=
 =?us-ascii?Q?rpZrS2nZcjMVis+YbWWdGnFcwKlALYtDAW2hyg3ezapTL0+tIqS587l7F8jN?=
 =?us-ascii?Q?CRhIexExu5KZQp3ujU/HVl55wsN1/jQ6R+J7pMQhZENoCV8D+rfpSHBRba2M?=
 =?us-ascii?Q?g1HHKE3nE3dKLNFZcZ5HTW4iy8sBURvxkhxskARwDs66W34SWMPy/9Qp6WQV?=
 =?us-ascii?Q?13x4G3hK92HOnr0Yvz4hQjBjxUTm+5D7/lhpFbtB7PFalWnhmi8q7Qm+Zpml?=
 =?us-ascii?Q?OpOSncsZT8XHQhMXLz3il85gaUpUDc30VvNgPY9DF2l1w99BwQd72vexb5Nd?=
 =?us-ascii?Q?A7EjGCcU7ZnU0oXO/960Y2htHvHtMID9U2qnJJFvuInKQP/SLHidK4NgwcE7?=
 =?us-ascii?Q?C0Gh25Dt5FTqjBIRAZUb1hIghG8KfJoMOX8INY+Rrmh/3K/G/uIR0ynF1XZn?=
 =?us-ascii?Q?djOo4BTi1MM6elcyLGLJYULJMCBZDt4i?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7abe9931-966c-463f-bd33-08decd792ffd
X-MS-Exchange-CrossTenant-AuthSource: GV1PR08MB8497.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jun 2026 20:35:51.6025
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA6PR08MB10545
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
	TAGGED_FROM(0.00)[bounces-8679-lists,linux-leds=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[GV1PR08MB8497.eurprd08.prod.outlook.com:mid,vger.kernel.org:from_smtp,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,outlook.com:dkim,outlook.com:email,outlook.com:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 5E9BD6A2946

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


