Return-Path: <linux-leds+bounces-8867-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id UbAQAYyvRmpebgsAu9opvQ
	(envelope-from <linux-leds+bounces-8867-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Thu, 02 Jul 2026 20:35:56 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id EE28F6FC20B
	for <lists+linux-leds@lfdr.de>; Thu, 02 Jul 2026 20:35:54 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=outlook.com header.s=selector1 header.b=Foc2Krfj;
	spf=pass (mail.lfdr.de: domain of "linux-leds+bounces-8867-lists+linux-leds=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-leds+bounces-8867-lists+linux-leds=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=outlook.com;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 3A15531172A5
	for <lists+linux-leds@lfdr.de>; Thu,  2 Jul 2026 17:51:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D3A4A381EBC;
	Thu,  2 Jul 2026 17:51:41 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazolkn19010001.outbound.protection.outlook.com [52.103.32.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECEDE39657B;
	Thu,  2 Jul 2026 17:51:39 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783014701; cv=fail; b=Jw6/G2rP37qs7UF7G/WzpNGOm7v9nC/lRyEKIArL36cW70OpzIpwnysOulxnwOPfqrXqeXw266r4x+9DmFZRdDnE3fAZYkCw62itDhAXwJ8YUHk0EyQPMfb5FOYcfkZy15k9mX80w4SdznF296Yj3Z7/5Syg5FhGU+nnvsogAXc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783014701; c=relaxed/simple;
	bh=pJM4g3b0pKnX+KBK8RPVB7hy3NqfVVS5TyxkY9jtht8=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 Content-Type:MIME-Version; b=cEmFqcUdLaf4Frg2VqLuzEk8E1hXzx8d3xUnL2LB/tapSQIT8mGdxBP8MOn375ji3zpbXqjHWilLpMahFx8R0uwQhQnN9BavjENifCrKwQzsoQo+hHcNV4ycipbvEtRHaAcILr247QKgAAacQYDtmVTa6ffS9U4RPuAo/QeCdzM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=Foc2Krfj; arc=fail smtp.client-ip=52.103.32.1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cVBS0Wi4Q4F56Cm0viLs/490EuBfpzXuDUxRuvKTHf0MnVjbm+KvUpb2eyc8elcG1kkBkTNGx3EOED5sWYd1u5VVXr5IYBHfWeGKIQehu9fp7cM7vyPL3foYtUMc5l1BDeb5fBPLP/h8zs8K26ovCfAUhjj88Qr5lVfV4WnGUlq/Z88LuqC1UjpoAvX8M0De7NgENBbH3Y2fBxqAmr0sykluw9RC84QGrisJvxtiJ5EkJwuwtINlAIluCeaklevJ7ci7lRpjwmOEM8PLV4KWTV1p5CXv3yKIUEUzFz//Yoqqgxe7DLzmI5uuSVv7Xu206c6Qn2yyIb+t4v5x0ziQcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZqPwqR0OTNHr5L5XAKkMfk5pHx5UeJCMPf8ng3vAG0I=;
 b=adHlYcy/opmU8rGGKGWpQhWX/F5RWId9fAGN/HPoaJhoZ/8ItX+3VOlw9xva6FHOHHlggHrdf8cUKM6Z79DlkZZBsUx/7SU1sokZlPp1ru0ANPMYBG93szhDnEzfdI2BMzicTr29wl/5uZtqkw2uQrtdupl14vtXgnSY26Kb4qtUXcpIjoTmDC/EVaJhWHoI0odZx0GiOUZ9dvs0WmDOwu0q0LWQgIqp4XIVOgQOYxw1sKMPKLQeRggTF215BvvhIzb6VItCx1dPWKvsfKMWeTsYmGKD9JQLGGBh3hmgGzF9ZKG6zwxA1GO6TRGdAYfoakBVL8hZ66iV8SRG1rR/cQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZqPwqR0OTNHr5L5XAKkMfk5pHx5UeJCMPf8ng3vAG0I=;
 b=Foc2Krfjne4GygkkIAxJVmNBCTQvvcJb1MLZZZlWMEj/b8zwFK19icQPqCp43BF2EcNAPneRy1IrVTl2ANSZco9rWCLjdNWGr/hlalWIpuc9izfgZRIMgYXhSswfFRLaQqB1CyO6kq9WoW/7sE4dWzHV56P0RLV8UxUyAJC35yUdEgZDrPF9DoNZUo/+zvGecEza56YTNfdTaYVOfVra9RSPZ7T83/enWkNri0ntPPDDAjaJfO7iasmFKImdyGCjN+P03uZErewWlMC0auc2wzv3nb6ZL6IJW+krFJMDVffUK0Hl/2t/TLlZsAZvca/s6uSLzmvhl4s9ZdnVZxlrPQ==
Received: from GV1PR08MB8497.eurprd08.prod.outlook.com (2603:10a6:150:81::22)
 by GV2PR08MB8121.eurprd08.prod.outlook.com (2603:10a6:150:7d::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.9; Thu, 2 Jul 2026
 17:51:36 +0000
Received: from GV1PR08MB8497.eurprd08.prod.outlook.com
 ([fe80::705b:d4a3:1c1f:b9a2]) by GV1PR08MB8497.eurprd08.prod.outlook.com
 ([fe80::705b:d4a3:1c1f:b9a2%5]) with mapi id 15.21.0181.009; Thu, 2 Jul 2026
 17:51:36 +0000
Date: Thu, 2 Jul 2026 18:51:29 +0100 (BST)
From: Manuel Fombuena <fombuena@outlook.com>
To: Lee Jones <lee@kernel.org>
cc: pavel@kernel.org, vicentiu.galanopulo@remote-tech.co.uk, 
    linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 0/9] leds: st1202: fix multiple bugs in pattern engine
 and brightness handling
In-Reply-To: <20260702135603.GP2108533@google.com>
Message-ID:
 <GV1PR08MB8497A2A52ECED19DE611337BC5F52@GV1PR08MB8497.eurprd08.prod.outlook.com>
References: <GV1PR08MB8497ABC8E6AEFF8AAA1AF883C5E32@GV1PR08MB8497.eurprd08.prod.outlook.com> <20260702135603.GP2108533@google.com>
Content-Type: text/plain; charset=US-ASCII
X-ClientProxiedBy: LO4P265CA0115.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2c3::19) To GV1PR08MB8497.eurprd08.prod.outlook.com
 (2603:10a6:150:81::22)
X-Microsoft-Original-Message-ID:
 <fe22b0da-15aa-4077-f329-6c5d96edd664@outlook.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV1PR08MB8497:EE_|GV2PR08MB8121:EE_
X-MS-Office365-Filtering-Correlation-Id: 30d7d6e4-5c68-4ab8-896b-08ded8628f89
X-MS-Exchange-SLBlob-MailProps:
	+b2+gf+2pHS9TYwzDM9SHHeXDGMmYsJh76w37/R9fUXD3uVzB4P8MSbx6fNthZpERoHwg9pWbXf0PYCwNF6Vf9rQYffpp4hvGBGnU2QjyLK6iemyWseDpfZlV76NcqtIwZQckO08MOZK8Ezj/I3Ris3ZuYBaDwMLOtrT5EiYZ42a0y9vO/izAzFuIcuEM/R5zjen2i5J2/1KY1RrpZUwR6zT9Y4pMHTjYfsDgiNpvR5jx87pfN1NlS7/x5Oxs5jx5xOB1k/qSJ5rL7tRR58JEiEimfrLMqwKrqN5lhjDWcXgThrDRRGGyL85il+2WrsRjzhMhshM+9lPzcBSd4IRe2bh69QrxcPxSoh9qUJiXgv0ne8ZFvN0vtQJKTibPoZlKXp9Th0phdyHYMVLV0EDu/T3fTjytmTS9SZxRSugJ2NBAHyqWQ13LhGEinBsT/gpYmlmCuglqC9yHvTqNuuDSvB7UzBJwLhIbxhk4/kkSWsYjAhhW7sNB/JZot8a/4PdX6bvQ/oaDW8qzj/tCSAQVpDHIpF7ALu2yQ2T6iK0aeALisiOdSMRNp7ytM2AiGpPGuRGyGVytoCAg98iOf8aOSyPFVVUq41PLDSadyWV1M+60mcoNCUM4CiHztgYZSF4hixRqjBuPz34Dq3mPwTFr+p97azwaw0Co+ObvnNbOKu/u5hkg3BL3wcGrQOoUcmc9cRdCYFWfo/gUQXIE5XEOtoNStyP8NHK5zyo+EV7Ear44Vyv/BeD1PgkrQn8dJm4fmiqjvBTPs+i5e8RBUC/UtN/wS8rDm4WBGZ34WUusjnz8XM3Hf6Gv3TWhvglOldC7YH23IA/bsXJwkboqvBJmFwLz6+ervNQu1j9YnP+c0fYP2th/DWySQ==
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|8060799015|19110799012|51005399006|24021099003|15080799012|16051099003|25010399006|6090799003|37011999003|23021999003|5072599009|40105399003|10035399007|1602099012|3412199025|440099028|4302099013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?5rVacsK5R5YUdWmk+oAitgBymD7GCzia7KO6ivqnbd1hU+wY72wKXvtcP5QD?=
 =?us-ascii?Q?cuk3zd7GiiIfKXOaVGslz8PkNFIgZrchZqFjQC1S5MiK0vb7ervAOzV5v7wj?=
 =?us-ascii?Q?cngf9L1lkV7QYGg0eMMpEuCfRfzHRJepYh13RhEfIGg8oxoOjhDH/51OFbCN?=
 =?us-ascii?Q?AdSWIrmz68r5n7v4u+emN7ZuY9MLC7pFbPlTZG1ATjIx/wI4E9qCikV38Enr?=
 =?us-ascii?Q?JH1gl+1nvhQtx+25fCGKKQOwrPlL6WuGUj0AyKncm9qv8IUz9ttdGcBqedd0?=
 =?us-ascii?Q?4Vxgl0lmw3qmFWS+FR7cKAcOtW+cZTPQrEPrGwpaZQV3yyOy98vYi9aiad2c?=
 =?us-ascii?Q?LQgXIYU6YapPBQgpSNjvBgeh6ZcosEn23y6DdBjs31q0v5Q+ZMpIPaBdE7Cp?=
 =?us-ascii?Q?O6Zaz0WmBwz3kWNUuBA4cyZL4APDtNcXtPBiasxJx11pP5ezhcews2M8r2E2?=
 =?us-ascii?Q?wbLdG1+9NeY9W0/zc/jkHRONsubloH/1CxkpXQINZnduMHbteByoxtg4bUfr?=
 =?us-ascii?Q?V6pmCV8/VZ/p8CIFazjxpYAixf0pT3+1uuSFWhY+SojjIBsCvVBh4EFMMr3f?=
 =?us-ascii?Q?tVzr4cgeN33/Fa3dBTX1CO15ohj06QowXB+/yr7/SJmHGGKCHcsFoJt8PIoU?=
 =?us-ascii?Q?4FUDxJI383VGMwNPA4XTZGBn1OG5vyi9M9fpG5Efjmh6A+oAicAl4UlTQoZE?=
 =?us-ascii?Q?qTCuOoWN9DdKm/gfpE82qn/oIQM9SicFk3J22AEjxgYXqH9neQDxwa+TiWwA?=
 =?us-ascii?Q?C2Ck1g+ummLSwzS58kcAEMhaaEo7+X8GqwdxTVWCbKkDZ5m7XE9S7yCEfbfx?=
 =?us-ascii?Q?NiTl4vm7pidxKIVrKvSopx5kBqhsmJ1TLeTFoF17nNA8IyRXS7t23CsX1HVH?=
 =?us-ascii?Q?5uhQjDDIykEBt0bYB6TpCP84redomRb7uqdc0aw6fxDuWWYMKTbJ2xPLltuL?=
 =?us-ascii?Q?+ZoQsHrmWyOYnCkiBCcS7nRCDdfepLTVhMDxrelGIo83bdHzdpHmK+6ysaOw?=
 =?us-ascii?Q?+WqmrvflcoJqQGVKbgu/UYVhdhVSNPRh31RWP4wlARSv2q+pntmiOBOAph4R?=
 =?us-ascii?Q?rBohGuSu?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?zFRgr0Nbp5l2Q2mV7/AIeT3gCFCikRU1H6IZVuhIv420GigpOX1Qh/OtDeeo?=
 =?us-ascii?Q?PaF3Sb2c3mjQbgDJD09UYVYLoykzH/SdILUFdh61DXCkIr1A3AIPHAeRjUkp?=
 =?us-ascii?Q?I1p3b5K4+7g+O2GpcVkHwNgW4vZQyX1kvR87+WAhz3HtCnwbjw8FVPBno/NF?=
 =?us-ascii?Q?sWLtUHuQNXmc6NqTS9JI1QZYWiT7aFac0zJbSVAPNecdEHOkrJid27nZxXP/?=
 =?us-ascii?Q?XjFN7Cr2DZ91929iDtjn376tzSbMpqpV5JmuB2NEpqa7ut/SWEPM/O7mzE9t?=
 =?us-ascii?Q?x0SjzsXyUqrHwd6yeFCD8ERpJdlWN/bjbvazkU0MJMWYVtVXTFxPfTqorOyM?=
 =?us-ascii?Q?QU84bR9Pnd2zFVR8B5kisuD5zUKP6UfcrBVTfHsrWPbQVM1zdyvlKI0gf3ze?=
 =?us-ascii?Q?8SURhsrPfyK4jcsqBglOlsNN71nu264cmvMPbsxXKJ3r2J2J/iVwU4wbqKnU?=
 =?us-ascii?Q?Fk4vyv4sVS8yQnkqqDSUA7jGfbXOuINOHzjoAplOn3ptj8EDYrWWXaPxZi5D?=
 =?us-ascii?Q?6jhohn3nirNna51BRFiOWQUPaVilPQLbsjISZkUB6VNdmPiD3VarWn0l3B/p?=
 =?us-ascii?Q?9sjQ5o7VUv/m+sSfSjBIP4unCVKuQw7aQ+ZTCxioGG92GqYA7oH19vVmr6+A?=
 =?us-ascii?Q?M3hSRYXiXE95pdYJ8ovpBieMzAr7H0UGyCH+zKzExtzK/DJwsdNwYEwiSBJT?=
 =?us-ascii?Q?oYoeNMhv1XVa0nVKy8oaNSK7p6EawvzaKfLSJF7ZsEWjWk1VpJVoy6y9IDJV?=
 =?us-ascii?Q?+RaebY85EywlpE5LdD7MgF2psmrCwsycKod1HlOIt6D/QXsCKdlncdp4DbVA?=
 =?us-ascii?Q?nHZLzd5nmkYeL/7pM7tMhl/poeJdTFCAweyVX82vuvbhzsIrCbIAfBeAfm9Z?=
 =?us-ascii?Q?CrM4+AozP1YlpJM5CtytWU6JFnfg3NhZlPQNLqjLTSkTyKxHuV4UeJtDUOhO?=
 =?us-ascii?Q?ndPMeerEPWuT2srDlrmq+FGR9Ozlhxpi9kvr6uERj54/YOqYuU6xmqDBrxKw?=
 =?us-ascii?Q?GLaJwDCp6napuCxfTFnwII+rMLOoD9I1kbZgbWPiYBeTsQ1ykIfWLB7K65gX?=
 =?us-ascii?Q?nCVO/rYI2hgT2bTlLhOl7b2gM9PWJs2FkP7mxapAyAMihnJXzI4hLHBmtt4p?=
 =?us-ascii?Q?/VJgwUFQ/jTBaWVyRNj+d495QgakjAPnJgYjot0nfqrc4Hs1AsC8Tu6sY0p1?=
 =?us-ascii?Q?BqH1w7HqQP/3bC1yoD10c5HWOZsmB4cCn53GaH1/jTfH0iOtNv0Z0FV2gGnR?=
 =?us-ascii?Q?FbLizS8BGy6RZ33rhoO66kEvzhDRGSUROhipOHYGqGHlBT3DEssrg4zuDJVW?=
 =?us-ascii?Q?FSBW3++Hchb3dwDA+VF3P2fE4wiJGujgMqmVMfr+cOGdOcrAgnqijCU50kf1?=
 =?us-ascii?Q?NqJrOWYPzEF8ORgryhVIQBVtCpZ1x4pVGE/Q0fRGkLfHS2ONJvlobrNBC0fr?=
 =?us-ascii?Q?BKNLLK/khg++e/zwWUOup+gksQF9xBbZ?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 30d7d6e4-5c68-4ab8-896b-08ded8628f89
X-MS-Exchange-CrossTenant-AuthSource: GV1PR08MB8497.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jul 2026 17:51:36.3217
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR08MB8121
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[outlook.com,none];
	R_DKIM_ALLOW(-0.20)[outlook.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-8867-lists,linux-leds=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:lee@kernel.org,m:pavel@kernel.org,m:vicentiu.galanopulo@remote-tech.co.uk,m:linux-leds@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[outlook.com];
	FORGED_SENDER(0.00)[fombuena@outlook.com,linux-leds@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[outlook.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[fombuena@outlook.com,linux-leds@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-leds];
	MISSING_XM_UA(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RWL_MAILSPIKE_POSSIBLE(0.00)[104.64.211.4:from];
	DBL_BLOCKED_OPENRESOLVER(0.00)[GV1PR08MB8497.eurprd08.prod.outlook.com:mid,sashiko.dev:url,outlook.com:dkim,outlook.com:from_mime,vger.kernel.org:from_smtp,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: EE28F6FC20B

On Thu, 2 Jul 2026, Lee Jones wrote:

> 
> Still a few potential issues highlighted - are they yours?
> 
> https://sashiko.dev/#/patchset/GV1PR08MB8497ABC8E6AEFF8AAA1AF883C5E32@GV1PR08MB8497.eurprd08.prod.outlook.com
> 

Thank you for looking into this.

I have sent a v6 addressing the Sashiko feedback on patch 4 and 6:

https://lore.kernel.org/all/GV1PR08MB84972A16ED557BFB96D63F57C5F52@GV1PR08MB8497.eurprd08.prod.outlook.com/

For the sake of clarity, these are the responses to the non-pre-existing 
issues.

Patch 1 comment: stopping the global sequencer in pattern_clear()
does halt all channels simultaneously, not just the one being cleared.

Response: this is an inherent hardware constraint. The LED1202 has a
single shared sequencer and, per section 4.8 of the datasheet, register
writes are silently ignored while it is running. There is no way to stop
it selectively per channel. This limitation is noted in the commit 
message.

Patch 4 comment: pattern_clear() set Pattern0 PWM to FULL but left
Patterns 1-7 at LED_OFF. If another channel subsequently starts the
global sequencer, this channel cycles through its uneven PWM slots
and blinks.

Response: fix in v6. Set all 8 slots to ST1202_PATTERN_PWM_FULL,
simplifying to a single loop from 0.

Patch 6 comment: brightness_set() stops the global sequencer via
CONFIG_REG, disrupting patterns on all other channels.

Response: fix in v6. Set all 8 PWM slots for the channel to
ST1202_PATTERN_PWM_FULL instead, so the channel outputs steady ILED
regardless of which sequencer step is active, without touching
CONFIG_REG.

--
Manuel Fombuena

