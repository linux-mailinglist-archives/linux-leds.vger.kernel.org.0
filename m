Return-Path: <linux-leds+bounces-8864-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id EiBcE82tRmrgbQsAu9opvQ
	(envelope-from <linux-leds+bounces-8864-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Thu, 02 Jul 2026 20:28:29 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C48F6FC08E
	for <lists+linux-leds@lfdr.de>; Thu, 02 Jul 2026 20:28:28 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=outlook.com header.s=selector1 header.b=KEJDePfs;
	spf=pass (mail.lfdr.de: domain of "linux-leds+bounces-8864-lists+linux-leds=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-leds+bounces-8864-lists+linux-leds=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=outlook.com;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 73B563143670
	for <lists+linux-leds@lfdr.de>; Thu,  2 Jul 2026 17:42:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DDBBB34107D;
	Thu,  2 Jul 2026 17:42:40 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazolkn19012009.outbound.protection.outlook.com [52.103.32.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C7ED30C172;
	Thu,  2 Jul 2026 17:42:39 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783014160; cv=fail; b=qrYLi5HJeYW8tZGskB9QysEtiZWnBBn1OnN0mAe3vrX783YjsQGTmOTBelcDYzclexVR3aBGVeJq4P6CcjPEnv1PIoAt05cF0ek7bwKYAKrgKca0WKc163ynkLsv4ELMrk5F2PqmQvR5OjODg3RlaQJt+yX4DM2eylizJ8EwzGM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783014160; c=relaxed/simple;
	bh=u9jBK+2dcKy/dAxVLQPi+IarBcSNBBzpAvGCArnmWJc=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=QA1c0+7ScknnIpmvfSHyfjrWuajb6OSo9hwGeGCuelL/fWMq3kARK7ObuwhiD32i5XjQ07hH1mM2+EKknNuMXDYVVvLafcvPKMc4BEBA2r08nBmISTP8hqvvg/dwZnu22yePIzWtO0z+r+8uoQhxkmEoC3cVR5YeG2taYiM5CAk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=KEJDePfs; arc=fail smtp.client-ip=52.103.32.9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=seVPevcwEI/o3la+PNHg5Mj34A/bGcbgIoF1qbC8TuBL/vYpMViHxBT59Gp6ZFt8PwLeSg3oA9yDu/37N2+apJ3ohj0etegIpLZ/DmyEHomqt1fTX6JKWYVBnCdFDMlypd7CXwH9eDJ5Z959d292CklVNGlEfUSE3ntqNru9MlByPGG6xev5vHULNTYsQ3FTpA21AiykjPWlIDw1vjw9dP/fpkh7ECoct/syvV4zqs7XDLIdxWEYEnkzw1gM4RpKsfvpLlLAhoZt5xgKmEBTzWgA6IvmHBZ76vTagy5pQZi4YXQ7hZv5Xv0waS4+7t3Tv+VbiGPQB7J5Dy8V/Ul9ew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=n7eiSwYr6TBJNIePMLzCCKcoc1ARTrol4g5RyxFz04g=;
 b=tclOR99WfaIP4jlLwyQcteniljNviJtuCRumJe4VS2vvlTK/hC6Ds6IO2FIG3x6MN2eDJdHwoXZkTE8krg9TxAPnT2eqyftbE8gPqxDuApdXBRHMAcRhTB88FUEvyfzV4z4MuNmKR+AzM6PCsQDzKeoPAYVb1cSYp+dbbsstHWBrsFyGDdWp5yDx8Zr7oEhCfTB84xcks6vNo7QZHOiQYhc1jLVT+b6Xi3cI+gcuQJmcAZkZ55q4WmlOHaGEwfdQGIB84CgL6f/QbP0r6H8CKW2QykP3V/EpwiBw+KS6NAJGp4WTckowsZEPinvD0Gl0yfFOmPAjFD4jT9mMKMFNCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n7eiSwYr6TBJNIePMLzCCKcoc1ARTrol4g5RyxFz04g=;
 b=KEJDePfs1z9fjqPSQ3nHVuJi+ifHDp5GDUCuJ0xmBlDullBMj2vSph5d6avWNwaqdtMOGRhyWztYxUpviesa0K5VEEehGaneEgxPqnBd55XSEYc6f9ujys9U76/YrFat4T7nvWfjDGGGzplBeinC/fzNP8/0PirVlpVBSTx0M09wbJhurfoiS7xnP9Kr29IT38N8pdRbrFteiNHWWzqSu+rtO5BAzyhnyVf/rsiMAI8uzavD/hi0W5xd8S21BLERigsZXlCWM55ensPY5jZYTYVzwMXSCUxbnfFtD4qd04rhaECJWGHR8ck2S1pBW8flYR2B5+m+Dyduae+ObUlHRg==
Received: from GV1PR08MB8497.eurprd08.prod.outlook.com (2603:10a6:150:81::22)
 by GV1PR08MB7313.eurprd08.prod.outlook.com (2603:10a6:150:1c::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.9; Thu, 2 Jul 2026
 17:42:36 +0000
Received: from GV1PR08MB8497.eurprd08.prod.outlook.com
 ([fe80::705b:d4a3:1c1f:b9a2]) by GV1PR08MB8497.eurprd08.prod.outlook.com
 ([fe80::705b:d4a3:1c1f:b9a2%5]) with mapi id 15.21.0181.009; Thu, 2 Jul 2026
 17:42:36 +0000
From: Manuel Fombuena <fombuena@outlook.com>
To: lee@kernel.org,
	pavel@kernel.org,
	vicentiu.galanopulo@remote-tech.co.uk,
	linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v6 7/9] leds: st1202: disable channel when brightness is set to zero
Date: Thu,  2 Jul 2026 18:42:23 +0100
Message-ID:
 <GV1PR08MB84973C517D12B589ECA77649C5F52@GV1PR08MB8497.eurprd08.prod.outlook.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <GV1PR08MB84972A16ED557BFB96D63F57C5F52@GV1PR08MB8497.eurprd08.prod.outlook.com>
References: <GV1PR08MB84972A16ED557BFB96D63F57C5F52@GV1PR08MB8497.eurprd08.prod.outlook.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO2P265CA0503.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:13b::10) To GV1PR08MB8497.eurprd08.prod.outlook.com
 (2603:10a6:150:81::22)
X-Microsoft-Original-Message-ID:
 <20260702174223.2648135-1-fombuena@outlook.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV1PR08MB8497:EE_|GV1PR08MB7313:EE_
X-MS-Office365-Filtering-Correlation-Id: 0135c5ba-bf89-4682-d8ee-08ded8614da1
X-MS-Exchange-SLBlob-MailProps:
	WaIXnCbdHrO+2YmbT5jW+WUSUt4IT5vR1sEDWlVmUlC0b1QyYfSuYd9kc0vdgDucSPb8MEB5TBuxc8G/v4c3uLbVj03hhmWjiFHS/VTX57pXJbbcq7IgqB2UBH2FlmJCeAau9+Z3WsqlhTzINqO7s/xyHnje+x4K3TndgoLXfCXgag5HgTnIaP8q4xFN5ldh1eP8YVpyWZYDp5zbam+eJJ4N192NJavqzZFWwFLoL9b1MLg6UyP/pUrFxCG2jkmlWcGYB73iBKaziDd4duuTowfgXFi/PI2uO+uecjIaFMTrblz1Ynfwkeh/j7O65TxHg5VhGgTtp2ltUbn+DP11eXNdgs9fUhWu9MNxnAQz8bktGeXMnvGxcGgAiJ49HRNF815fJRIhonSv+Q0cOK0BV8leZfY3EvRlmnMXhf9E+dYAGUIRvM8eAKMmxCbfvGqXOk5ckoB5IYRdiZcMDI63nZM+kQHDdSUa+gqb2DcH6hmuhWtUcNyxhaRlFa2A6Sj6SNIGWTj+QB/Vw3AtWVgOb6f6y/ijqOAWkXwMuMkeyxpcUSadLRuG5UZMHWo74hzkxW5ZOkCfHYblfFT0MbcvK/MrhGHFrZwUnVkdi6KgN5VbtntXnNGOtJSca1Bfqbu0QcQmT6jJYJsJCJE17Ab19yhuQqzammsRTCHJqbvXRTgVlXuuV+/zdRgEVSymqPlyiuLp6dbzr/gQuokL3BBVz9L9HaP+68oW8Lyg9rUjseM4X14azVWe/IMCLBuDqp3IhlHAQMzrUv0=
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|15080799012|24021099003|25010399006|41001999006|23021999003|37011999003|5072599009|51005399006|8060799015|19110799012|3412199025|440099028|40105399003;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?MWDtS/j7mwPHyRql3gvnM+kjLwhNl7MPssp/Y+Jg6sHUZjt2jfvM5RUCuhn5?=
 =?us-ascii?Q?1J54p2//NMmjjV8bN3okC89CtfNFdJL9L46q6vJbtLoSiuh8M/x9arOCgLFT?=
 =?us-ascii?Q?mbkSy97WISMCfbh0qvs8sTFEOl5JugY/IUg8mYknjLy9Ae6J/sNYe23/8GMf?=
 =?us-ascii?Q?z9lSR7abPoksBQeDsZOfL2NC9cmP0lVTpD1qDY51UViTM7NplnXIWwHqEfwi?=
 =?us-ascii?Q?1l3abSvyEaPNtHe+XkFNXsuU1oPOr5CuetYPLLzJaNZ963pmtYEb+8z3OtpJ?=
 =?us-ascii?Q?hN097Vk2siqDlTYSTmSwP1aIHPr4x44binrfhDL5WyCUogKCxrbv8SegQMkh?=
 =?us-ascii?Q?emIxZj9f1lrTCTRnShRosHxRJ/hW15DNxRFmMVwIzO5UMhSjWvxgc1qdMzba?=
 =?us-ascii?Q?ondHfU7ft3G0BwqapwkEtYm09XzKIYzwtiAqLAcnA/BC6W8Lhq3kQ03elm0b?=
 =?us-ascii?Q?+qTkudFGMA5PpDuLyYwW/OxQDqsFxzSEh/XdCxmAPFs1omzVu9YP4285ELnT?=
 =?us-ascii?Q?40L4M+zrA+fjwKwfP/45e6v1cr/HL75l0ttvPBylhIq7gh4dA0J4NkB4Gerv?=
 =?us-ascii?Q?R8ZI6/iDISSBf3dlnRuk7MvE7w0NW0ZcuGZPqQJiNhUapqKSupXx55Uyubij?=
 =?us-ascii?Q?pudDAzTN4YlWR2XbI2uGyBpsvku1SYBS9G3o9tppJpXgTtUDM4lH0yuyCnOI?=
 =?us-ascii?Q?D11VE2hw7P90pOuZc9+hNZDT9/M2Mxwg8h167qsQa1K6rVNXAjjlPIkZC419?=
 =?us-ascii?Q?2FX6a805dQ9NJQSMprLCCk9Dt1nPdYmXf+iofiNLkhYwYxzWNF2jru1yTex1?=
 =?us-ascii?Q?quKlhwQIg/uEuhA8nRSeNPzYx2qgMLNJoZ4F4B82qurl1+WCof5Jjbt+KRHj?=
 =?us-ascii?Q?RJIaCdt8uSwdoePZ/Vdbn6zI8NAhqLYVYlBtS3mFgHgku1Ft246SXBgKu9x6?=
 =?us-ascii?Q?RP5vqhxZwFEwxYI4NTJmeOOULgbravg6u5UthZzfzGpnEFgLAMmZ0PQRLVit?=
 =?us-ascii?Q?C5sW?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ES32HY9Sabf9tEbHCC/YgnI7iksHCc524oJHkRUhKXymnOv8gQlXW6LSMXmE?=
 =?us-ascii?Q?5g8cOtPo4ATzQNC2MYAaNXgu2KhkovONecZZmhbOv7CDJoSM86aFamHvn8Vn?=
 =?us-ascii?Q?KcSnrKm8VlsClyKaDB4+1pi6OFkmm4tYEUqXatqtHjsNXJ2UVRroMd6o7B08?=
 =?us-ascii?Q?u3PP/uUQsqirmqoD6golkFZGl1a41iENVduRFsNKleGvn02vDk/sbDBCqtoH?=
 =?us-ascii?Q?RZqBNdC//qS7IOObJ3YgoVNcT7Y/pPHC3FcbWf86KC7UZAcr+AKIkdgXyNPR?=
 =?us-ascii?Q?ULylhuPmjzGlnxex6e2LTEfDJ+4ahdVadtSITbYeS7RU7dwJGI5pnOvYsQBV?=
 =?us-ascii?Q?2zlaE6psnr/UpFxu3PF417KSaGgIwy4w2J6GrIiUUqH3bqn0O5HIVO85r4oG?=
 =?us-ascii?Q?zOBKHVlxfr9g67PVljDxRTWWMgNfp42JvXWfK2JuttE08+Vh8UIC7d/JqPW+?=
 =?us-ascii?Q?FynUZ2t6okXpP1wLiOr9XPAnBvuiD5Q5Ip8xxiBhVs3EMBn7ulnllVAgmbOe?=
 =?us-ascii?Q?0CA3+BiYJUWfZFRuXpTRwhk8O1Ba9MceCMbVkQ8MKwOsOw8SfLzgpVqf4PQk?=
 =?us-ascii?Q?D2+nmkw3dT+kJ42k5CSziUQfK5mhT3Y7Twlg7LRp91bEZYEP5abwhhWhpsd4?=
 =?us-ascii?Q?RBbGYI5jvH9M9RsKo3iDeko4G0rz5H+GrZsw4NqDj9Ym/GBbY7tetnKhsOWl?=
 =?us-ascii?Q?iyMZrAtYEnH12C+UdxHgX5FimdXDXC+QKbMN70TnqdCTwg8FFj+0DD/gt+dr?=
 =?us-ascii?Q?hUMxxschxJVoc3yFcxH0a7YClwlT7JbHFY6j8V/P9dzsOTr08edsHazxXuxA?=
 =?us-ascii?Q?xa/Xopnzpb2q1O6OOjF0wD1Gh5Q37VuqZAHB9HQ1/EYifNp7+0tfaZ1oBtUs?=
 =?us-ascii?Q?xC7Qcv2MT+ZOpl5x3ACCdebykwaZaRgHdBf3L0RNNKCcxLDhZzjf1rUFLUwS?=
 =?us-ascii?Q?q6DJtguq/YVHkVbjdhvPqRtDXf+jCOXh1XKtihR4D/AYKdtUKjLwYbzOSkkw?=
 =?us-ascii?Q?kYlMr2xqq58h7Myt/sQ9rhsnBah4/XIAN47TwFVBHUyDNFe45OnDew9XqDMM?=
 =?us-ascii?Q?SHJktPgM5IgNk6PdDL08FvQybEPfx4dgvm8LSpUtTdpUoqz64gkuD/sfop0z?=
 =?us-ascii?Q?duk+b3fDLL4KhHYUqZ8ddU2WDsEoKOvGZ1IHZoHiPIgs/CIkpq8gJL9xbySM?=
 =?us-ascii?Q?fpmmHsyIBRzkjhy2/7jAr5Bl8W5Pz/QFBUunUBhGJ5ozhS79mzaNcMVy8+ei?=
 =?us-ascii?Q?lvfzC3//W6O6mfcOysmiyp7dDushuCooBygIVSYB2xrZvY9EXpWeCk5lsZG2?=
 =?us-ascii?Q?bLU3AsWgq4ZOZiuzy0itp74MXrBlHtUGN3PuEIiE7URmqbBDDIydO3kLWTvO?=
 =?us-ascii?Q?3LQQNbobmfaa6oVm16FCacMXi5WI+I6oDVJnzgqKI6QsFEA1KMLDjrCEyHOK?=
 =?us-ascii?Q?yx91tsEm+bJdaXr4AAR5PP57XqX+PV32?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0135c5ba-bf89-4682-d8ee-08ded8614da1
X-MS-Exchange-CrossTenant-AuthSource: GV1PR08MB8497.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jul 2026 17:42:36.2630
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB7313
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.34 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[outlook.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[outlook.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-8864-lists,linux-leds=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_NONE(0.00)[];
	TAGGED_RCPT(0.00)[linux-leds];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,GV1PR08MB8497.eurprd08.prod.outlook.com:mid,outlook.com:dkim,outlook.com:email,outlook.com:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 9C48F6FC08E

When brightness_set() is called with LED_OFF, only the ILED register is
zeroed; the channel enable bit is left set from probe time. A hardware
channel enabled with ILED=0 still draws a small residual current, causing
a dim glow even when the LED is supposed to be off.

Fix this by splitting st1202_channel_set() into a lockless inner function
__st1202_channel_set() and a locking wrapper, then calling the inner
function from brightness_set() while it already holds the mutex. The
channel is now disabled when value is zero and re-enabled when non-zero,
in the same lock region as the ILED write.

Fixes: 259230378c65 ("leds: Add LED1202 I2C driver")
Signed-off-by: Manuel Fombuena <fombuena@outlook.com>
Assisted-by: Claude:claude-sonnet-4-6
---
 drivers/leds/leds-st1202.c | 68 ++++++++++++++++++++++----------------
 1 file changed, 39 insertions(+), 29 deletions(-)

diff --git a/drivers/leds/leds-st1202.c b/drivers/leds/leds-st1202.c
index 4909985ade04..2ecd36aae336 100644
--- a/drivers/leds/leds-st1202.c
+++ b/drivers/leds/leds-st1202.c
@@ -128,39 +128,11 @@ static int st1202_duration_pattern_write(struct st1202_chip *chip, int pattern,
 				st1202_prescalar_to_miliseconds(value));
 }
 
-static void st1202_brightness_set(struct led_classdev *led_cdev,
-				enum led_brightness value)
-{
-	struct st1202_led *led = cdev_to_st1202_led(led_cdev);
-	struct st1202_chip *chip = led->chip;
-
-	guard(mutex)(&chip->lock);
-
-	for (int patt = 0; patt < ST1202_MAX_PATTERNS; patt++)
-		st1202_pwm_pattern_write(chip, led->led_num, patt, ST1202_PATTERN_PWM_FULL);
-	st1202_write_reg(chip, ST1202_ILED_REG0 + led->led_num, value);
-}
-
-static enum led_brightness st1202_brightness_get(struct led_classdev *led_cdev)
-{
-	struct st1202_led *led = cdev_to_st1202_led(led_cdev);
-	struct st1202_chip *chip = led->chip;
-	u8 value = 0;
-
-	guard(mutex)(&chip->lock);
-
-	st1202_read_reg(chip, ST1202_ILED_REG0 + led->led_num, &value);
-
-	return value;
-}
-
-static int st1202_channel_set(struct st1202_chip *chip, int led_num, bool active)
+static int __st1202_channel_set(struct st1202_chip *chip, int led_num, bool active)
 {
 	u8 chan_low, chan_high;
 	int ret;
 
-	guard(mutex)(&chip->lock);
-
 	if (led_num <= 7) {
 		ret = st1202_read_reg(chip, ST1202_CHAN_ENABLE_LOW, &chan_low);
 		if (ret < 0)
@@ -188,6 +160,40 @@ static int st1202_channel_set(struct st1202_chip *chip, int led_num, bool active
 	return 0;
 }
 
+static int st1202_channel_set(struct st1202_chip *chip, int led_num, bool active)
+{
+	guard(mutex)(&chip->lock);
+
+	return __st1202_channel_set(chip, led_num, active);
+}
+
+static void st1202_brightness_set(struct led_classdev *led_cdev,
+				enum led_brightness value)
+{
+	struct st1202_led *led = cdev_to_st1202_led(led_cdev);
+	struct st1202_chip *chip = led->chip;
+
+	guard(mutex)(&chip->lock);
+
+	for (int patt = 0; patt < ST1202_MAX_PATTERNS; patt++)
+		st1202_pwm_pattern_write(chip, led->led_num, patt, ST1202_PATTERN_PWM_FULL);
+	st1202_write_reg(chip, ST1202_ILED_REG0 + led->led_num, value);
+	__st1202_channel_set(chip, led->led_num, !!value);
+}
+
+static enum led_brightness st1202_brightness_get(struct led_classdev *led_cdev)
+{
+	struct st1202_led *led = cdev_to_st1202_led(led_cdev);
+	struct st1202_chip *chip = led->chip;
+	u8 value = 0;
+
+	guard(mutex)(&chip->lock);
+
+	st1202_read_reg(chip, ST1202_ILED_REG0 + led->led_num, &value);
+
+	return value;
+}
+
 static int st1202_led_set(struct led_classdev *ldev, enum led_brightness value)
 {
 	struct st1202_led *led = cdev_to_st1202_led(ldev);
@@ -257,6 +263,10 @@ static int st1202_led_pattern_set(struct led_classdev *ldev,
 	if (ret != 0)
 		return ret;
 
+	ret = __st1202_channel_set(chip, led->led_num, true);
+	if (ret != 0)
+		return ret;
+
 	ret = st1202_write_reg(chip, ST1202_CONFIG_REG, (ST1202_CONFIG_REG_PATSR |
 							ST1202_CONFIG_REG_PATS | ST1202_CONFIG_REG_SHFT));
 	if (ret != 0)
-- 
2.55.0


