Return-Path: <linux-leds+bounces-8683-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id FXqZEdxXNGrLVQYAu9opvQ
	(envelope-from <linux-leds+bounces-8683-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Thu, 18 Jun 2026 22:41:00 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 49D316A2A2D
	for <lists+linux-leds@lfdr.de>; Thu, 18 Jun 2026 22:40:59 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=outlook.com header.s=selector1 header.b=MQQ1beGx;
	spf=pass (mail.lfdr.de: domain of "linux-leds+bounces-8683-lists+linux-leds=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-leds+bounces-8683-lists+linux-leds=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=outlook.com;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 8F980300A25C
	for <lists+linux-leds@lfdr.de>; Thu, 18 Jun 2026 20:40:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 726843403FD;
	Thu, 18 Jun 2026 20:40:54 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazolkn19013072.outbound.protection.outlook.com [52.103.51.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F1AA2DC76C;
	Thu, 18 Jun 2026 20:40:52 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781815254; cv=fail; b=WRA13TqB7Eb7Dxj3L2DfUjTBvLMnnKBemqZdzic4DNyheDAJAJFHjVYPXT045sY2X8MtZGXDrW9uS2Hdk6FhTvLYIdbqxyeWILdL6jJNQc+T2md7a/xCmBfIBirNSK1tTqeEwjOFniQ8/S8gLLXxLjcIM/vZAMpBFQUEwuNiIf4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781815254; c=relaxed/simple;
	bh=DbORjcnhJw6q3rM5QunV9lLowgLZ8iqVAJtJmmZfZiU=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ltm5tcSwwh5TR3iD/QK9TpxTJuCmKZoMelzuuWtWrd9k7YIhJchfPhAC0dUnB0hJOXNpc+A8l1ePOz/lKDXvajWIRdoFbxO460Ixm1eaox4qqR1PrD/sqvmqslyCu6CrdDGVNWhB7QlF7KK39xA/5jlw9Ckshf7zj8bFT+NqW5Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=MQQ1beGx; arc=fail smtp.client-ip=52.103.51.72
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=A6/9uHo8lppjHkhbYujtTA8GPXOUp4IEOUFnhpJqTbiRT4ppq8YqzlmDNOBG2KKWAK3/rzTTRi8VFoHwM8x8qgUD5s14fqnG12JlzqnWObZiT3GRl5lo22scttYqb1tkSxKO2RUb412XsQoCNLzI56oQG1ilAB057/hMO+kliv5n9NAgXpf7+XwcN+OZyBFvmXI5hE0PH48dIVxXhkBU2vmZlpYh6anDCsoyu6ROx9eIfK7wKRUMlOjx6lUn326Vlon7e5NVu5CvC1DIsfRPZxvg8TpDoUotbeOC4LNRh+nyYPFpsWb3+acnubSAHSoCAO7dbWXQirAIEiM24uIf8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pMApAJmfoqb+B0Q2NwKY5AbpKeLZG/s7Fp7OdotjiFI=;
 b=T+S+P4OAsF0OCtiSrGE/7FXTf7eIk9WVt5e6XOrJO0JPVGeuhr/qhWYbHFRLk64mjLNsgek0Tr4w3UdTTx+wquqbuV6UoIPJeXamjuWAb5OidxKIMf1o04p+/ZqV5iNb72wrtrY6LHVAQuzU5P7DperyYgBDEq9S3vQiOjnXa0P7AJAvLuIXAq/0l++fiIVDA9Yy9AXQxpVHTnbjC5YikeAuoRw5mWHtjiTNMKvyQ0LtwyXi8hn+k/Yxlu/pSey0XY6iSV57MRz5tcYFmSqPNBPSDcG2Jhw2fnHscufwB24YlgUNLtBE5jVYeWNk104omHD6cSyeXVRyCzLQkpLzSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pMApAJmfoqb+B0Q2NwKY5AbpKeLZG/s7Fp7OdotjiFI=;
 b=MQQ1beGxJektSbAGuw8icp+uGgt+5Gm1KiztUwvYk0quZCbS/FHpu9e9KqHx4SynpJQAuIYooP6/Q2eKY52WDmIFbmTKr1v/OFbF01JkbvSOX3G06zhpn52iQsOqAfkXLKC0Fjs2TsI79LPhIYCxoKxTrgkIAETZwH1CkzvjmkFr8An1Ilq5yZO2swo80t2jLFourSPen3vzj/RsKzwAFoz3cYQn6v3hVhljJOq27R7s8pueClKwCKKO2ilFZtfZA9lVOOr1wAgDYq7IQ8QyvNfkVZPpSBIiHqISKOQ0mvUMuX3pjcjWl0PvOvyaKlGuVUUQE/NU7w6fRWalbqTF6A==
Received: from GV1PR08MB8497.eurprd08.prod.outlook.com (2603:10a6:150:81::22)
 by DU0PR08MB7812.eurprd08.prod.outlook.com (2603:10a6:10:3b4::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.11; Thu, 18 Jun
 2026 20:40:50 +0000
Received: from GV1PR08MB8497.eurprd08.prod.outlook.com
 ([fe80::705b:d4a3:1c1f:b9a2]) by GV1PR08MB8497.eurprd08.prod.outlook.com
 ([fe80::705b:d4a3:1c1f:b9a2%5]) with mapi id 15.21.0139.009; Thu, 18 Jun 2026
 20:40:50 +0000
From: Manuel Fombuena <fombuena@outlook.com>
To: lee@kernel.org,
	pavel@kernel.org,
	vicentiu.galanopulo@remote-tech.co.uk,
	linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v5 8/9] leds: st1202: validate LED reg property against channel count
Date: Thu, 18 Jun 2026 21:40:37 +0100
Message-ID:
 <GV1PR08MB8497D4D074E6EE657D685984C5E32@GV1PR08MB8497.eurprd08.prod.outlook.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <GV1PR08MB8497ABC8E6AEFF8AAA1AF883C5E32@GV1PR08MB8497.eurprd08.prod.outlook.com>
References: <GV1PR08MB8497ABC8E6AEFF8AAA1AF883C5E32@GV1PR08MB8497.eurprd08.prod.outlook.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PR3P195CA0008.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:102:b6::13) To GV1PR08MB8497.eurprd08.prod.outlook.com
 (2603:10a6:150:81::22)
X-Microsoft-Original-Message-ID:
 <20260618204037.3348102-1-fombuena@outlook.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV1PR08MB8497:EE_|DU0PR08MB7812:EE_
X-MS-Office365-Filtering-Correlation-Id: 81d1a1d9-46ea-493f-3b10-08decd79e1c9
X-MS-Exchange-SLBlob-MailProps:
	WaIXnCbdHrO+2YmbT5jW+WUSUt4IT5vRABAnnZkaloX5c4/Et3+qtahwJ8F1ooGH1UM/4+o7TGsyNWpp2bb/wz94XAf09ZtICGptdDU7yc9w2PdPZAqr/td03WX47uYjDYTkXGGGny0EpBjydtNvErvGRyjsBsWftrFtt1fmqepw5I7IYsjGNzP6rlN8yFzPMLTrNE2ME/2reLCuksYwOblF4b3mH6OH17XD4r5yA11V+0zyTGewsEt7CSmk5XmFud+B8PGfFYwMxMLnZFsvT7+gzKDRR83MKFg5iw5kS8mRn+Y5pWEKNLDSNhRbK0xkWkPfXMwOKRzrSParwDSNlvUQ3qM4dDuR1kxcwkTPCP2aOyLUXAex6c5TBNOgUtC9FB/sNJhKgi5ytJUc8RZM7xRhCjglIjLHs83g4kZB7XoByVBgvqwbA0FyyOGXySuE6sMRfYPUaiPM91eLzHrKwCrVs3d18c+TMe4dG15N4rxRf/pj93dtkr04LEtTOL0FVFxP7cl4ALjz1w5yuSonsCHphL7Yr7mD/tUNqwoQTnRiCr8ODn0CHZvvk/0EY8nTbm3sOdbrwN12XKn+3grn6tNK2gsbF5Blo2J4o8E16AA/0sK9rFcQYsi7sDGXPssSt7VFt9RlgqO2TScOoqxcF0kfag4hP7SBgeQrXdY7BkJ//KKtr3DInld1ikCrJuCLYdVjl7ZgxiicZN++ElndbPdpAbvvXzOloRQYlY7z7aAwjcC1lVFLekT20EYHeVvboxshepaGtGU=
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|19110799012|5072599009|37011999003|15080799012|23021999003|8060799015|41001999006|24021099003|51005399006|40105399003|3412199025|440099028;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?+666OxWtt8NBnZu7nuBhEmEXFdG+MU+ty6p5YxAMVAUQlsKF/6hphqMnGJke?=
 =?us-ascii?Q?a+qScfck5afQNW6tLLLgp5D1ip9o2oPfP1irBohDtErz01DiDIWoS9EjfZKB?=
 =?us-ascii?Q?XPaGPWcjfChykJqM3YNcKWIamGeLYciUUEBo3Rf+M60mERgUGgSc4RF0bYpa?=
 =?us-ascii?Q?+c701L8hm7oQDqwtSSrpcYwRfyAp11Y7c71aCKLrIyqiPXacHDsh/sMaeNXv?=
 =?us-ascii?Q?r+YlZ4p0pGDgAgxQ+lP3buGS3rL5E8bAr3CHWrfdoByDMzgeacGl/wDuw+Z4?=
 =?us-ascii?Q?QF5LYdl2BHIBb0vsDvDa+YKfKu+hskQGI9XEmE0xqrYIG1s0U9JdyAmGtYg4?=
 =?us-ascii?Q?VpXFvmzyeFDtRqd/wnSjnn+AhQIgk9vzF8mG+t1w7KUVa9wgijbNmyPw2Ttx?=
 =?us-ascii?Q?fqRZ4EzYl9PZ4bhXGV41qHpCZmqIl9l7D0K7XrGBsVCuB+Dgc6cLoIiLlpgV?=
 =?us-ascii?Q?7m/pmcvvmFbvDSD3LzjXKY6bJVo3UiDM2/Jll4FrD0wfsEYescS1cD29WP0y?=
 =?us-ascii?Q?53GiXBN4dnOCGAVE8XKZv7dK/EHvocMzWdc1HtaFebb/PtbLjXYBB99o4j4/?=
 =?us-ascii?Q?PsoFaYCa0bzSVMyE/uLWFAi4+RjPCSrX0lwC/OMiG3rAi+ypTZZulXVeKO02?=
 =?us-ascii?Q?D/zHXF1Avc0CdHyc+u2NitRGn1gHobndZ2uQYjfhj7C5nC1Gnhbi98acRIfZ?=
 =?us-ascii?Q?zEKCD5WW3pQTnXMNDXGThC0HkGOLkCihd1oiH/R6jhekL9YjfLIHLV39PSD9?=
 =?us-ascii?Q?E3e9rWKq9F3f6nYmQaSdlShTDOHjP7hz7xh5WOkoH5lYdk1iIXNgNEvlR9kS?=
 =?us-ascii?Q?lq34Y7v1GoDLqn04I00zuty5bEIK5hXxvlpjKf4KOPUEky4vVu3Sa+V0ANkf?=
 =?us-ascii?Q?TidqT/vgqmoqv7IA/2CBcu8cuPOARHE9GOL23a+P0d73VLP9ZhUTc2Dny3QF?=
 =?us-ascii?Q?iojJwhB8LkO/viMPCBULk0EsMyqSM9oGyUeltGAJM/qNTPOD8ng8dVIWZrHX?=
 =?us-ascii?Q?16NV?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?GjKBh0lrBOs1vEQ0lWDeD5Qsm9wNhKpRraXQrNWApP5lTpoKd0AynIbN6kr4?=
 =?us-ascii?Q?UE7anOnykGrmLh/Qd3gSmPB7AUi/6hVN9+pM0xUvCopRLvk0W/HpSSST/HEU?=
 =?us-ascii?Q?SdehmbtHWB8ciQVQiCISaFfoOxD5aaKsJj1eI52xQGcFOr7rWnGss94VUClk?=
 =?us-ascii?Q?USNFnHJUEukVyJKW24L6a0XSU5G/m4xwvAyZNtMCigx9HXf7wmlPGAijvEMX?=
 =?us-ascii?Q?DCvaqloIdMR0CE0eW4jk9E13LB7mV1o8RTcW3B8iGPVPMnXudZKVT/cV+zaT?=
 =?us-ascii?Q?gtEDJ4WAuwROntKuL2uCclimfuuyFyVZBYtfObkwbGfiQZtgHRLAmBrE3aR1?=
 =?us-ascii?Q?Fjok6A2IwzHD6ETOQoZBjvueYHRD6CEmmBFQzspbD0xaDprd12mZoAZdE20f?=
 =?us-ascii?Q?9vRWXUpzXR+sArEjJuNVWON+nIwImCyEDmawPQta1hClSSU8MU7OyJG2WkXS?=
 =?us-ascii?Q?th+fr66Ml+qR8QtW16ZWXH9tcDJbGZ/vJ8smYbarcr9SrSH/2RV4wwEukWXo?=
 =?us-ascii?Q?V9OJ45KUdbAaKqASTuem8AaYnFR2+/gIVWQZfOj8vg7PobJdUK4d/S5xjZ2O?=
 =?us-ascii?Q?AvZrbp6+DWOGv4yd3uKW4LGecX4gFuts2MmfhP5to3JjNJTS8JUXSFEkIbo1?=
 =?us-ascii?Q?VuL692NBdMy8aby1VYOr09fP73NFe4ggNP9WrhElilXR5cHuopI6RyBQyJAC?=
 =?us-ascii?Q?wI4aL/BfYPtJsNJnvEqsi3MG3roq6W8NrGLea9+c5dMfimFPO/cECaUTKbIi?=
 =?us-ascii?Q?OmzqmX9MdY7J01hqnyH1pfIVfctIxjoPHlpeu6E44ipKaan8OBfu43Th3tBf?=
 =?us-ascii?Q?jCKAn5gsHYQeL7JP4gKASpI92YSIGy1MR+RocaEc5MyyeHXrDo9mXXgptllb?=
 =?us-ascii?Q?zATpcH9PDwOQfL/GEjAb/rtJ13ra0BP8IwHn2TvkDLIoyVi0YfkP/HQgWnEh?=
 =?us-ascii?Q?auaRQ+d4G+//g42sQhImL9ASIDjic9+zzRONT29KIN6HEUBOZgEbtHYHZ5Wx?=
 =?us-ascii?Q?/fzK+Q+JeFy5+2QgW016kNXzDGvJ6RIi3z3Wf1eRKAmDCcOFPh6a+o+eEUEK?=
 =?us-ascii?Q?Zf8taQYPJO+8BWLvquiDb2PBKGYMIDnF4QIPgjhyCMGYu3CFZO0uPioVxeug?=
 =?us-ascii?Q?WNNJhCzu8vCyOBRUqGhHUBsgJZg+AcyRm706zuH4KlxR65aR791/+Q0y9qHW?=
 =?us-ascii?Q?I9GGv9WWDLIv86hHTRxTxdEzMQNJZCTm31DAFn70GznYEzwsC5I0cichjcgv?=
 =?us-ascii?Q?WzttATlnErVdYoS0OoYvJii6N1z+TK/AGcnds8L7SurycFm20qov02kQNE5x?=
 =?us-ascii?Q?7KwzctFYLZCoQ92SG9cYyNC/aKbo3XotEhoUELr6Ml/IkWJolJyjYud8qRWz?=
 =?us-ascii?Q?b44EznOwhDX6CdT7F4mmbGMlpuMry5I2rsE0VMMXG0jauMKHQUEg6wgjY5Ge?=
 =?us-ascii?Q?e2+rTxSYpdr5ta5OW4+QqIFD74AxdYe8?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 81d1a1d9-46ea-493f-3b10-08decd79e1c9
X-MS-Exchange-CrossTenant-AuthSource: GV1PR08MB8497.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jun 2026 20:40:50.0033
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB7812
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.34 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[outlook.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[outlook.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-8683-lists,linux-leds=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TO_DN_NONE(0.00)[];
	TAGGED_RCPT(0.00)[linux-leds];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,outlook.com:dkim,outlook.com:email,outlook.com:from_mime,vger.kernel.org:from_smtp,GV1PR08MB8497.eurprd08.prod.outlook.com:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 49D316A2A2D

The reg property from the device tree is used directly as an array index
into chip->leds[] without bounds checking. A value >= ST1202_MAX_LEDS
would cause an out-of-bounds write during probe.

Fixes: 259230378c65 ("leds: Add LED1202 I2C driver")
Signed-off-by: Manuel Fombuena <fombuena@outlook.com>
Assisted-by: Claude:claude-sonnet-4-6
---
 drivers/leds/leds-st1202.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/leds/leds-st1202.c b/drivers/leds/leds-st1202.c
index 0610d4bd191d..615034a3d37b 100644
--- a/drivers/leds/leds-st1202.c
+++ b/drivers/leds/leds-st1202.c
@@ -287,13 +287,19 @@ static int st1202_dt_init(struct st1202_chip *chip)
 {
 	struct device *dev = &chip->client->dev;
 	struct st1202_led *led;
-	int err, reg;
+	int err;
+	u32 reg;
 
 	for_each_available_child_of_node_scoped(dev_of_node(dev), child) {
 		err = of_property_read_u32(child, "reg", &reg);
 		if (err)
 			return dev_err_probe(dev, err, "Invalid register\n");
 
+		if (reg >= ST1202_MAX_LEDS)
+			return dev_err_probe(dev, -EINVAL,
+					"LED reg %u out of range [0, %d]\n",
+					reg, ST1202_MAX_LEDS - 1);
+
 		led = &chip->leds[reg];
 		led->is_active = true;
 		led->fwnode = of_fwnode_handle(child);
-- 
2.54.0


