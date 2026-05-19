Return-Path: <linux-leds+bounces-8210-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EBSOFkKxDGrdkwUAu9opvQ
	(envelope-from <linux-leds+bounces-8210-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Tue, 19 May 2026 20:51:46 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E7D4A583E2C
	for <lists+linux-leds@lfdr.de>; Tue, 19 May 2026 20:51:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 208CD304888B
	for <lists+linux-leds@lfdr.de>; Tue, 19 May 2026 18:51:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 96E7136C0DC;
	Tue, 19 May 2026 18:51:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="KDOpuBl+"
X-Original-To: linux-leds@vger.kernel.org
Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011038.outbound.protection.outlook.com [52.101.65.38])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46005358373;
	Tue, 19 May 2026 18:51:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.38
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779216702; cv=fail; b=CSoSfVWN9h25LGWB+ulvH/m5kIgees7yOteK8nwXxfN7KWv3MyJIqI+/cQcZoayZQWBzHChVZkjj1iuzbM+1M+0/RaNTEDvSCNwxGNGu+7xaCKIbYgYzNXmHMzUbyVBPcxVtAA9yQYB+jJqcJMabU7Sz24Q5w8C/Rz9yb5kX+vI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779216702; c=relaxed/simple;
	bh=jR0YQM91GNdndB/tNRwzAt0Vyg36HGsEc0gZ1/083aE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=l1QHLWqEdje0AhOtoufvx09fEIF1CEiWcZ1FIdC5Aswqwezzsz8OSFLDXoP1SHfRFA42qPiKSDqM+7mj9O1RaLbJlVjUxX2jSzkJeXUD58DT3+LJYXn3HLFMslsNV7rLMHQowJmTquA54761kM+Agyv1oUxuNJ2VD2Ty4iQKqqo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=KDOpuBl+; arc=fail smtp.client-ip=52.101.65.38
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=k6tVEKXWI+uPxh+k3R+2zEwMxTF9B9Xm5AF4UepUndeSUDyn+yScWE+r0HOwEfmqoeTp/yJCkwXG5oaiyeoAhCh/zyhn2335pkZkA2kI6etkLKmv7leoOzbtry3EycHD+2I7d+RyaBJ/mJtYGy5DwaGUGMBpradaBbRYW6xo5IAZo0UXDtkD+W4l5A0aCB4/tucjS2I5GTh7Frs/iS2EbRUCfnQVslZbZZQAquJVzRaZnV0ba0qka0pQX1zVqMB8iA4ttvGckQZy+AfdKfduHme4OZ4vOShMFl1Wo08K0uh6BIjOISck3HAIyqqSaMBT9mbgjbG3X7cRzCw/9GcNww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RG+w0Sh0jGSY0NwHVymM0myYS3jECGNtpBjp+YTpxio=;
 b=NoX4X3HdrtQAIKt6FBNKawjhCJPTen8dIp5UA6jSouj63Sf099F6XRUdWyr7O2v7U9IgImaNiqkd4KKDWegxWn3QJG5Q+amY/cKyuHsvw44G7qUX7CA+hF8X6tDLcY00m9hEZWC59pYwwmkrDJCeVTdFYBB9K9de+wyXJX8CYLqWvDw6ifym4RUHPElI8QK/KLYz7mnrhiBFJ1aDSC7ovkGsUNjepfxDea6ezGkMowJqIt0ovv7spCkUh82ivLcJgnqnBFdr+4RijSm2im07jFUNB8kG4+fkLdyWSuU4fOB0EtuTQS7FJedWkpNZRHbyltoVFxs336c/4PwyI+bizg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RG+w0Sh0jGSY0NwHVymM0myYS3jECGNtpBjp+YTpxio=;
 b=KDOpuBl+B1NI17KRx1sO8GLSryQR5v7dhMR2+JKSTViwrd9pdCu1sz5PJleOQtSQjXz8JBCwlNeYVpTAnTdGgaQuuAFPP58PS0FyiPHnpIV0zqjizI652yyJ/gUZe1L3vjDT1Mh+Bj+Xdf5OBwnm8vm/sr7sgkvH/sjRM1nyg4FcpHi8lcJ9uanSx/HC7swDZTeoJzPTluCmB7vi+5MKeG/tTcOgPxzVLIlIG2HKXTbdpsJihF8ZetAd/ecWaEuOoDQqz+NNgUOhtLk3pXIO/mdEzdLSd41mQTs7nW6L0UXQZZqPCF/sAgFthQpNj57PJ7te/EFaJB9NfeMzpBfi2Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by PA1PR04MB10227.eurprd04.prod.outlook.com (2603:10a6:102:456::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.25.24; Tue, 19 May
 2026 18:51:36 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%3]) with mapi id 15.21.0048.013; Tue, 19 May 2026
 18:51:36 +0000
Date: Tue, 19 May 2026 14:51:26 -0400
From: Frank Li <Frank.li@nxp.com>
To: Lee Jones <lee@kernel.org>
Cc: Daniel Thompson <danielt@kernel.org>, Jingoo Han <jingoohan1@gmail.com>,
	Pavel Machek <pavel@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Helge Deller <deller@gmx.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Maud Spierings <maudspierings@gocontroll.com>,
	dri-devel@lists.freedesktop.org, linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-fbdev@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: Re: (subset) [PATCH v8 1/4] dt-bindings: backlight: Add max25014
 support
Message-ID: <agyxLnTYstqRwGva@lizhi-Precision-Tower-5810>
References: <20260407-max25014-v8-1-14eac7ed673a@gocontroll.com>
 <177755722019.2606736.10749503716773482329.b4-ty@b4>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <177755722019.2606736.10749503716773482329.b4-ty@b4>
X-ClientProxiedBy: PH1PEPF00013300.namprd07.prod.outlook.com
 (2603:10b6:518:1::e) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|PA1PR04MB10227:EE_
X-MS-Office365-Filtering-Correlation-Id: c65f4ea5-7fbb-4f5d-25d0-08deb5d7a75b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|52116014|366016|19092799006|1800799024|11063799006|4143699003|18002099003|22082099003|56012099003|38350700014;
X-Microsoft-Antispam-Message-Info:
	txdydq61eEsV5hk5ibCe4j+t0HRs7Ld6exxIw0WP4R3A0J8i0lVvpWwmdl3o02eNJB0J/0v1MMt8Jl2kbeL6it3E8wQIzHE4EGicC3VFu0hgmh54WW+pU67PfwaYW6T3lbIfBwSnTjnhfgj83NQQErv4h/ug/+ifJ1dwH1N5s9zk5uc/RFayFmsJ/9t6SjZs6vyjwGOFuTaOJ5EXPIl2JfSkTdpnPdwqfLu0CBGUIQ+vvzs/RBe8Pswesoq5j764JjlOOOZ42/23NKM7YQyHHmdPbXfLKUxSaRElSXgD6jMan7k0pK+EjpEvYLHgpVLkiG7YRjgxJ9nLatx4r8FdW+azkSzhbb0W3LCSDbmrUIAcSETsd7OfjI4gqfYt8jW064d6gU3iWiY6PS+epvLftUByY/iTeZfURv6UCsrXqnGywvCD8tJPlE1gudGvg1fsS4x8sJLSNkbE/neZGWLz/P9Am/O+LHd3YdDh35MhP6ALqPQEUnR1Mi4W2VNPsrIgTOmOuMP1VYAMvCwi/Jyn+p/OyYkm9tn1WiE0HKB8xXbvjY3+pa/Ncxhc2xhndX9caKW7c5adx5TOIA575EqXqWVD99GY8Dm2H8Y6WIuIK28bpg19kNCYNWWmoqvKwq9QYzF+BdZc+qixb9AJ9FuxvJL8/ogJX0U3IhJYtS6QcGeDATG8oSHLrQ1lbq5BPVyR+ZXFRG+HKfeKeOlH5EixB6XwJn2iGVk7LgTBPQQEudf8Fz4m8qDAacLJpJ9u1Jhg
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(52116014)(366016)(19092799006)(1800799024)(11063799006)(4143699003)(18002099003)(22082099003)(56012099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Vk53WHcrNlFXNHd3ekcrMHozems4emNEKzY2QjdweEx2OG9XcWdhUUZHTktz?=
 =?utf-8?B?Q29aU3pYU3FzK1dHWm4wa2grRkJVQ2NLRWRsTXZBT0pJV2pNSm05aG1md1JI?=
 =?utf-8?B?L2tYTDhRTXJVc0RUZldVZDNVbHJxSndyS3I5SVdDVTNabzZvVzFtUUZjZ0c3?=
 =?utf-8?B?ZnJPbXp6cFBaWDJoT2FUcCtrKzZ5S0FhQ0ZLQkwvK0tUak1GQ0RpQ3kyeFdm?=
 =?utf-8?B?bkM1S2EvUWhiNTZnUnRJUnhQSVNZdjhPN083K0E2aktBYmFkbjY5N3RMd0w4?=
 =?utf-8?B?Q0UzKzdYWXdPMEgxakdUSjcydHA1bVpZcFhCVmkzRWVpUTZJT2pObGwrWkNp?=
 =?utf-8?B?ZjdlT0czd2FYL1NPUTY2MVY0cS93alFqSXRsbXIvTFVFLzRnaW9SditWNEhX?=
 =?utf-8?B?cmdHaTRiZ1dIdFBVRXR4a04zR3JEeFVmRlJ1MHM1S3JQSUZBYWl1M21tQnky?=
 =?utf-8?B?RE12dlpFQktUVy9iV3p0bWpranp6bkZNYWFKczNKTkQ3aVgrNXZlZHR5blN4?=
 =?utf-8?B?SGNJUCszaU1mb0ZKNW8wKzZnT3p2Vmc1MDIzaW55RGVteXJDZXlrRUVGZG15?=
 =?utf-8?B?d0pWemNxQWFYVXNWbDVIY1pLTFVDM292RFFMdzViR2JVRDBGU1pxMlFiTEVT?=
 =?utf-8?B?Y2g4Q2Z0eGROWjZwR0dYMEN4OVBoR0RwL01ESHNBV1JYRTI3SlR4ZDEyaFdX?=
 =?utf-8?B?MXUzU3Q1RGVTMHhNZ3RxOEp6eTFJa0pQV3hla0ViVTNPeW1oVFlqeVk5V1V1?=
 =?utf-8?B?TnlpT0Z2UENYZ1BZZjVHYVpKVUZHUkVqSUJRdEphZ1c1UUxmQjgxL1dia2xN?=
 =?utf-8?B?Wis5czhuTVBmQmtQTjlxVXdHTjludHcveEMyZkdveVVJbSsyNFZOUzJPVGhx?=
 =?utf-8?B?QWt5MEZCTnVWNnhLK2xObFIrbkdLbk8xUHQ4TnZoL29xSDYxdFp1alpTOVRI?=
 =?utf-8?B?a0czUU5XR3IyaDhQNTFReUNkdzZOdFh5ZG5BZ1RuenN0dXB0eGQzanZZVENv?=
 =?utf-8?B?VEdNMjdjVWd6OEl4ZzZLYm00VURHR1dlOXZod2dLUmxkYkhycXVDQnJoLzJj?=
 =?utf-8?B?blR1eDV6VHlKTUtNOEhVUkhLYkI5QjFMQ3VQajB1M0xrN1ViQnBPcWtWZjRX?=
 =?utf-8?B?Q29wRFc0bkN2QTlINFpSZUg2VTNVeVV4U1kzMURYQ3VCYWNvYlUxOFFacXBL?=
 =?utf-8?B?UWZWZlRKaDFManVlZjMwWjRXTmZGTmhia1hiWmJzSnBHdUZTR2xYbXZ5USsw?=
 =?utf-8?B?cUp1ZktvVXY2MlcwQ05OdVRKcHBFN0krN3pLUlVGaEtBNDFhT1Q3N3Y0aVBp?=
 =?utf-8?B?ZWl4QVhwcmNlWXVLK2E2T0ZEaTAzUnUwbGxwdTdYa05tWWhFZTZjamJEL2Q3?=
 =?utf-8?B?VnVqcExpM2dDd3d5REc2SHNwWmlodXQzcFNSK0h5TnNrTVd2eGYydWFpTzFY?=
 =?utf-8?B?OFlDdnZuMXE3L3NwTXpPMGowejNWT2dpTWNXUnVyYStIbnBuMitoOHVlNk1w?=
 =?utf-8?B?anA3R3BZZTNiS0ZYWU9UVjFrdjYxY29MeHIyVUdZVyt5UHk4eTdMVEVDVHJ1?=
 =?utf-8?B?dm04aTVVTGUxL1lwT3NXcVNqbitLVEdSUDRJd1FaRjVIMldGVGl5NE9WQnN5?=
 =?utf-8?B?bGhvZFBoR1lOdVFsbWxnbXpTajA0Rm5BeVZORmcvWmtrTUxSZUZ1dDZXdHRT?=
 =?utf-8?B?a1J4OWN2MUNOeE1uNFFWalNPOG93VkZZeTdyTjZSaEF6UU9maVRqMVBXTFB6?=
 =?utf-8?B?bWVESTFRbzk0RG10V0NNSlMwVG5BSGRYb1hNbS9sOUxNZHV2amtod3NMYTJ1?=
 =?utf-8?B?Z2FjVisxNTFWQVFoNXRSbzh1NXBtRjBpR3Q3K1FrR0Zobys3ZlgzUG92VU5u?=
 =?utf-8?B?WWZ1alVQbHRBaXJGbWo1MHpQV0ZlbEl1NlZ6WVpxSFliZ1hBd2IxaDF6SHRX?=
 =?utf-8?B?amoxaUY0TDh1cWVpVEhQMkhoWU12WDVHK2hHWmhFL1FuSkxlWmZnM2Z2eU1B?=
 =?utf-8?B?d2dZM2ZWSlNoZ2pWaHAyLzR1N2p1U0NUbGQrS3JIc2I0RytsMXhSOHBvZjFJ?=
 =?utf-8?B?amFSUmFZUWZHVTF4SjUvUndzaU1YYVJtSENhUmo0VjRyb3ZwaWFvNzBUSkJ5?=
 =?utf-8?B?YStEc1Rvd2xadFVyRUNoWkRoN3k3YkNqcXFaSTlWd2FwRnQwUlY5U3J5cUxR?=
 =?utf-8?B?RGRGMnhIaTc0R01RdVR5U3RObHQxNWJ5c0E3Q0JNUUZVL1BPSWZYQmpwUTBK?=
 =?utf-8?B?U3ZQLzF4S21DUmFvdWU2anZPQWRhUmZtSjVxREhVbExOTWtraHJmWUJMcFV3?=
 =?utf-8?Q?ea8M4jfWBrrNVK4XQy?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c65f4ea5-7fbb-4f5d-25d0-08deb5d7a75b
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2026 18:51:36.5393
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xYTg0m7T95SJBtPSYq4D6dN/sQdawbvCcd/kUs5vbNLnQAgeHoa4lcgY/tJIay5y2THonXi0WW5PzDO7AJHidw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB10227
X-Spamd-Result: default: False [1.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-8210-lists,linux-leds=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[22];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,gmx.de,pengutronix.de,gocontroll.com,lists.freedesktop.org,vger.kernel.org,lists.linux.dev,lists.infradead.org];
	DKIM_TRACE(0.00)[nxp.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Frank.li@nxp.com,linux-leds@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nxp.com:dkim,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo]
X-Rspamd-Queue-Id: E7D4A583E2C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, Apr 30, 2026 at 02:53:40PM +0100, Lee Jones wrote:
> On Tue, 07 Apr 2026 16:41:42 +0200, Maud Spierings wrote:
> > The Maxim MAX25014 is a 4-channel automotive grade backlight driver IC
> > with integrated boost controller.
>
> Applied, thanks!
>
> [1/4] dt-bindings: backlight: Add max25014 support
>       commit: 5fcbbedec9dfce78044eee922bf2030e1bd03faa

Lee Jones:

	I have not seen it in linux-next. Anything wrong?

Frank

>
> --
> Lee Jones [李琼斯]
>

