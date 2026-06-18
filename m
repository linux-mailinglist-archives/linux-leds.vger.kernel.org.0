Return-Path: <linux-leds+bounces-8676-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id WhP9LadVNGqgVAYAu9opvQ
	(envelope-from <linux-leds+bounces-8676-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Thu, 18 Jun 2026 22:31:35 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A0FE96A28B9
	for <lists+linux-leds@lfdr.de>; Thu, 18 Jun 2026 22:31:34 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=outlook.com header.s=selector1 header.b=sA4zKGmy;
	spf=pass (mail.lfdr.de: domain of "linux-leds+bounces-8676-lists+linux-leds=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-leds+bounces-8676-lists+linux-leds=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=outlook.com;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id C6A193012745
	for <lists+linux-leds@lfdr.de>; Thu, 18 Jun 2026 20:31:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 44BB9258EDA;
	Thu, 18 Jun 2026 20:31:29 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazolkn19012040.outbound.protection.outlook.com [52.103.32.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4B173403F9;
	Thu, 18 Jun 2026 20:31:25 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781814689; cv=fail; b=ixiABt7N9E1kzKpMw+ShqeFnAaD40SjVqnlNBRTpAKJgcYs+exya51f74fxiTK9xoZsxWe84F17Y1RHtUTzeiwsSzJytNHgBL47sF5u0wHQS9lnc9NgtsuVYNDLcqR64CAZAA9uFd8vWoLwNob4Hcw02o617vBr04ek308oPlmI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781814689; c=relaxed/simple;
	bh=jkn8GXE5PLoLZ+WqjKVfE1sf5jRh0K1N0VTcoWDWZ0s=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=IeidRhFcgvSC9JGQKaqNLvhErqIoDWJ8Hs8lFqAWqWVPdfKz/XDBRyhqFvFf9dqtOZSfN5uqxSCmfdcCRTxHc5irnn8cEA0uKZxh2YFrDIeHAsvvsCoNQ6y/GXJyeYg1B5Bbhfjv2cSsaYT2yYqK+7OmgbYgcW2/6vZgFhbui2U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=sA4zKGmy; arc=fail smtp.client-ip=52.103.32.40
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=khbDURq7Mi2RmlChTVD5y7sKqPxjMYiqDlL/xhuFBy4r2+fyHSQD3qzSWQn7Q7jdieQg6Ry+auLfp6kqBHNfcPWacgVjO2m8fjtuyEb2jL4UxYp6ENBy1uwlea1pwReNnJAF1pOrh9/ew4QamPzUYuFYqlwvmm6TAsR+q5Bz5dQaca1q+Zq/4zal6ffuEnUXjoUW1LATTc1UMwfL7soj6YMt8gr4gSySUU3eL0ve6FePIt9w887XsvWvEPe8AdntDx/WHzqEsN0DqQznjICozy6C4BteKHC5G+S9HVrNwY3BjEq2/5TJCKD5OJVZRLWqo/lTaRbHu9WgmfzHvY+QKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SIiipihmmgSJTCzdJx+mLzByzv1iR+4oE32XBRfDSjU=;
 b=obQNCNEEeTIOtgWvQu/KyK0ci2tpnbyneitFQ8NhfakXcIKVV5QetI0Z9g/+6R6cE3tIOq2LJXehEagAqt/5I0X+hYLAbhaLoe+JeAJ8KSlPGrqooWsKMnDxnFXaa51L/BvJ+h9jAJgJC3eUzLgmldfSLlOUdXRqK/Cwco+fZanC86IhfGF0InCf7GYrcHowyFnyC6UBrOSqTfZTz40BsMU0YfcgYVOHzMscW02joJxkxwzdWbWKh/rnjl+VN7iatKKK8lMhs5NWNKo00IxwcO/5SwExnRCJIXAWyu4INAFFBzVSxXAz8vK5V6nYCfd6JDKboUmsHBQOg9gdM4YDpw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SIiipihmmgSJTCzdJx+mLzByzv1iR+4oE32XBRfDSjU=;
 b=sA4zKGmyLizlfmVZQyKJ5U7GuTsc77ZvAWJ45Mh8R45qK6kPKuqknC7cWgkzmvALCf/xMRTceI3u6RPQFWfKISQrN63LQtTHWq2+U4AtWNazMSfaNmdB2AcCXDWnUq/YurCucqAitw2kISmdHbThfcK98c1NCJqpNApbgGkJVwNBETgR0RDnPn7ywS7rG0JSBkrPRLQwrOkv4HVNJsKPA4dSsuUJ1fxE+/612afeJo14Z2Z0RJfZnk3ZFA+kvp5lGYt8duwXsrKKuTA2z8IZPlJjOupmu1e5iTrkGbS7PdxuRa2hakzz9LhGLsalrT3Z04AJBRESwNf0zpqFF2RuVQ==
Received: from GV1PR08MB8497.eurprd08.prod.outlook.com (2603:10a6:150:81::22)
 by PA6PR08MB10545.eurprd08.prod.outlook.com (2603:10a6:102:3d3::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.13; Thu, 18 Jun
 2026 20:31:23 +0000
Received: from GV1PR08MB8497.eurprd08.prod.outlook.com
 ([fe80::705b:d4a3:1c1f:b9a2]) by GV1PR08MB8497.eurprd08.prod.outlook.com
 ([fe80::705b:d4a3:1c1f:b9a2%5]) with mapi id 15.21.0139.009; Thu, 18 Jun 2026
 20:31:23 +0000
From: Manuel Fombuena <fombuena@outlook.com>
To: lee@kernel.org,
	pavel@kernel.org,
	vicentiu.galanopulo@remote-tech.co.uk,
	linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v5 1/9] leds: st1202: stop pattern sequence before reprogramming
Date: Thu, 18 Jun 2026 21:31:10 +0100
Message-ID:
 <GV1PR08MB849783C35AD69A5AF7DA2BDBC5E32@GV1PR08MB8497.eurprd08.prod.outlook.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <GV1PR08MB8497ABC8E6AEFF8AAA1AF883C5E32@GV1PR08MB8497.eurprd08.prod.outlook.com>
References: <GV1PR08MB8497ABC8E6AEFF8AAA1AF883C5E32@GV1PR08MB8497.eurprd08.prod.outlook.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0012.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:150::17) To GV1PR08MB8497.eurprd08.prod.outlook.com
 (2603:10a6:150:81::22)
X-Microsoft-Original-Message-ID:
 <20260618203110.3290550-1-fombuena@outlook.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV1PR08MB8497:EE_|PA6PR08MB10545:EE_
X-MS-Office365-Filtering-Correlation-Id: 6f7789da-4023-4063-38e7-08decd789013
X-MS-Exchange-SLBlob-MailProps:
	ScCmN3RHayHq8QFbWW6Ra03gxaeZK6u4IAaVwzmNYz0V/Lt4TsLZQ1a4aUtgVDKyLvqsrH5vlXr6X+VfGFDN3WQDMGySuCiB2aeOYGj5JPXlp//qMJjr61YvSs/gGkQyianHk8R6xAXGCzItBv9w09g1evAm5oDO1GCQhLV14oATXgy92d/GbRaECP4DMxOEt3fGz44x0cEXRXfG3ddDckl/uTZ2hKt9qrok8ywMbR8PglhJDlHSs801gbiz+DHI85aGVUKL2Unq++DvOD3C4A0ob6gyKinjbEz/ZNvw6fsy4zFV7xRrPjmL7TY5CEJEMQOIPorgBoB3kdUJ/W6duPYMqagB6fT4c64MMekt4VOgQmupiusmDyordPIIWQBYV6H9MYSYhyOYozmKPTXW6POURbe13Z/3DSFGQbk6hbjW1H9iojkAFHsbndWzFMc+NMHtP3kxdvWxY7Ncy7ta7LX8/VACsdCw/wx66PrflDI/HUKnsnfWK6igitLzZ7BtvYV4/UwGMFnTsv+JG/O3WMMMx0lqT5VxCkGHBVaaHvKQvLdimG6SUkTayRVd1k9OtcPDNo8APdXWRZKx8AOjhEI2Fuay9ny/mRpSxMoxqDKIBK1tR4l8S+xilDPa/TfljVKXl+0fr2keETfj/Q23lGlpKN5gsMh8Q20TimJrTGLl9m7M7K728squw3IrMuQcPWiQsuWR3vkNPiRNKQRCqTdw7RK5TB2xg0T+KeNE4wY=
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|24021099003|5072599009|8060799015|41001999006|15080799012|23021999003|37011999003|19110799012|51005399006|3412199025|440099028|40105399003;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?ECiYVeoug+FqIgavLO1iVb5RsoJ/O4b0AAaqtn9sbxeg1HKCDvwrXJ9D8ZMI?=
 =?us-ascii?Q?hF7ZBtMfrYs5pgE2zNRFzvUZ/BgXS82KntymtdYsz7yvIn8dVSfE63+d2ORv?=
 =?us-ascii?Q?SKlxSy14iskHZQPNjLzsd2GqWCMYOV3aXrpkE3KSELfNMiyjK9aIIoXIU7/h?=
 =?us-ascii?Q?5S5/zCQY18Jf5H6H8o4zjdxPaiHwKZz8GitdthLeH6PJ460kYtzS52tHqRfM?=
 =?us-ascii?Q?vkEN8J7KdPa0teZclBrLQ5UgnF6IZUgiSliujYijrBaThj3FcTnki5OUFoGO?=
 =?us-ascii?Q?sFYtGjcVamQVeaEOcMjk96GMoGrjkCdw64LAJujTS/OdXxzRsPF8jISKvc7G?=
 =?us-ascii?Q?+q2Q86As2Lz3zKioTWo22fRDWVWyfTXZvOb/abJeD9slFVV8aZXOfD5NO0fK?=
 =?us-ascii?Q?X3JfANttx2PKsASDjwD4/Q6/ot/9J1AS0H5pEAm6lK0BLTXtBqHY7BmV49/Z?=
 =?us-ascii?Q?hXzaGCrgrq6W8Hm095u+T0OjYhjzlSHC3LiRdjCdTlamnuRFpA9ajz6HPpMa?=
 =?us-ascii?Q?bBjKRsRS+W+DeIZQDebeu3/hbuwdWBZeZGN63fGpYFXWXQZl7jTXC/ulIAZn?=
 =?us-ascii?Q?4dYnNe0W03FoxbxvvjFOUwGEMvIhY8xUq8BKvOOutOtjHEnrv6CYfU8owJ0J?=
 =?us-ascii?Q?yprx29UtUROz3g3EWJXPlSwJjb3IdzBTNwkVm/rHY5Jeidukhe5zfqYZLDqJ?=
 =?us-ascii?Q?MmEP6dfGj92CXbF5sGua/p3fMeMkIuu7AiSV/vRs6SsJ+vJ6fTqC56dTkNWX?=
 =?us-ascii?Q?KvCYzp0Y+4OQWPJKPwRZJ3tYwsPUUGPQh5QBVt0wOl78wKCtD9/4p6H+v1oS?=
 =?us-ascii?Q?QAgmVWP0wVObGhw62QtbUBHnQWYOYsYKCBL90etq7DfxD5H6TOLTbeyQ6L3p?=
 =?us-ascii?Q?Iv97qcfXtxT+hOD9Tth8CF7rlIzcYwP5oTRszk33znJxcJvFJHH5vYVIharP?=
 =?us-ascii?Q?37eHN60b0NkJ02dPWon7tVmoP/Y7rZRRVE6P7kHWq8EYlDGlfZU5gQ/k/Q8t?=
 =?us-ascii?Q?KkRc?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?9ywznvGdNUZ34bStOUgjezVJbnjj1QQOEOD3AQpFV5SLXPvxJQ5NxeactwAm?=
 =?us-ascii?Q?45FIxdbPXcejxkYZ++3qEJcZRUz6t72J5EJn/1dIgTzz82W0PuRcbupVzCQn?=
 =?us-ascii?Q?5vIYSs2UbyPirHZCJbwlFvd2MSkkRNXIcJyYQwbKLOPPJ4wuwYMifdgZBI5X?=
 =?us-ascii?Q?/+3y2k6BJTp7Ikr4/MvasSdBLhhfIahuv7gUM4hsAluNWQhwwgcJOtOOD8FP?=
 =?us-ascii?Q?Z+xbRQaEXsSsMQwPNVr1AhOQXTjrux4l+EwLyXP36dQpkiJug8vmY/6pEU0d?=
 =?us-ascii?Q?CsOOer6cSyfSGhMAHxvz9tymVwwLnGi6CRAkRtIDmFXeUaOzQVYdVM/ibbO3?=
 =?us-ascii?Q?QKn4HWepXY4bX/gp4DukDR2ksiLIJRUltC+mA1wK43GFEU64lxieTOZreei2?=
 =?us-ascii?Q?uNdf/aK9dSYHxUA4x5iSiuuC1ofrp/3F9tFGEv2AERAAZlFCs/JIiIWZQczF?=
 =?us-ascii?Q?gbrE6X3Mn13F9tsjciJ4xeAf4zmSHWsMgihmyY99IpQJdiOtXBcgYMi3p1ht?=
 =?us-ascii?Q?W8s7EpYvQpyNSw9EeZUV20MaVJQysrETuI2AY/OUzAfSMetye/z0N/RZFaB9?=
 =?us-ascii?Q?kIDizVmKSK4PAeT2R8GYTYevUegDEw0HFxHpI/Kh8U+Q5aYycLjhVzn4FqHH?=
 =?us-ascii?Q?Uo4hyT8PmqJyBWOoMh2OZR9Jt6abSwET5pVsbQIApfC2oTcD5weUR6UD0GnR?=
 =?us-ascii?Q?tE6sbPqvfS5ys+Qepc3Zusmewuq/hrfOc2t9IVd6OdLO15PSqRwDMLqI0tD5?=
 =?us-ascii?Q?e3BON7gtnRzNqzkrHt2GNZ7IYgAvi72F0dYUWqKDZ2ikf9G+LaOECnd5aqEH?=
 =?us-ascii?Q?v17SG+7rLryyEfIwCwLYfeEeH0tbSzLieix+hrkehgnaMXOJp8gANAgdmX8w?=
 =?us-ascii?Q?UxEp4CbdFbutjtcCNUk7UpIKoSy1trqxhnrEzKzVmQT5Pg+ywy+8DkD5Bxh/?=
 =?us-ascii?Q?WEUJP9Pc0gqt+wtEIH6vf+qIsAn5ct9mXp0Ml/vabZge35aJCg9ZNUToeDh0?=
 =?us-ascii?Q?zKNmOlRxnYUi/g/iXZtPeR4O/GTdENWaKk/TbKnVHji1Fbt11U9XedpIUiJ9?=
 =?us-ascii?Q?NRWll45AXN71AP6i9aZFB5lKzwNZc15/ZoOGjrU2JAGEEhfBPmKaQcmNO3Hf?=
 =?us-ascii?Q?kPkIT5j1N/f9D4eU+ohxaWC6XZm44nNpCg1DhOtbrOZ6TKVLUD8a9qQc8WVt?=
 =?us-ascii?Q?d26kNG/lbIwqCz8GobEzbjqKHku5opyklPmzHuPpRxfjVMY98IV1u8dXp5j0?=
 =?us-ascii?Q?0qPe9wrwGx7c7KcjitXc553kSzkLIptvoc+JI2IuExhw1N6NSSOYnU3AHmKV?=
 =?us-ascii?Q?oqN72x6Ezs7sUj2i2KIkKnKLuG9TrMAmXjqyi/6Dt96hvIiHLMke6rnSSI4D?=
 =?us-ascii?Q?JZzYYfYJF0TlRKZTl8tC5AtGezKN/n3jjgmmZtMuSwCDfztuYQx7kX8iYLex?=
 =?us-ascii?Q?p9iC4scCH/C54Uo/ozvKoRTX5ds3D3bc?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6f7789da-4023-4063-38e7-08decd789013
X-MS-Exchange-CrossTenant-AuthSource: GV1PR08MB8497.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jun 2026 20:31:23.3795
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
	TAGGED_FROM(0.00)[bounces-8676-lists,linux-leds=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,outlook.com:dkim,outlook.com:email,outlook.com:from_mime,GV1PR08MB8497.eurprd08.prod.outlook.com:mid,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A0FE96A28B9

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


