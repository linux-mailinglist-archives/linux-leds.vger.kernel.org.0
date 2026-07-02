Return-Path: <linux-leds+bounces-8832-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 8npcNZdPRmoLQgsAu9opvQ
	(envelope-from <linux-leds+bounces-8832-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Thu, 02 Jul 2026 13:46:31 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id BC5AD6F6F66
	for <lists+linux-leds@lfdr.de>; Thu, 02 Jul 2026 13:46:30 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=garyguo.net header.s=selector1 header.b=wtrwSExf;
	spf=pass (mail.lfdr.de: domain of "linux-leds+bounces-8832-lists+linux-leds=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-leds+bounces-8832-lists+linux-leds=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=garyguo.net;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 056DD311B130
	for <lists+linux-leds@lfdr.de>; Thu,  2 Jul 2026 11:09:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD8FD3A5E90;
	Thu,  2 Jul 2026 11:09:36 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from LO3P265CU004.outbound.protection.outlook.com (mail-uksouthazon11020106.outbound.protection.outlook.com [52.101.196.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6CA53CB2EF;
	Thu,  2 Jul 2026 11:09:34 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782990576; cv=fail; b=E1ZK+wiFyIy4NjrHK7ixdbhexKTnKMutHlYtZ0MFqBSmiAhD37aWZsnBLd4B+3+fATrVDbMiNtRbCW7v4adF55tHE9xwj1C6pE9HBGn6dOiEk4Csf7+B/vMkYb5w7ZQBLVlu9P5qHVUxc1YyNcF4jyobw6yeIQYmUp4t3f/vPrM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782990576; c=relaxed/simple;
	bh=yhsZ9TXqEndVg+TbLFHOc0JR5r+aYTFsVgSO1eWuxJI=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=Fj8DOSjGSusoabl9TbdvT28SGZOIaPlbTrlqUC4AJB4AfLTr8XksgX6JW2T0rJ2ZrTPM0x2Or+PB0tDTrp/0XkNPYGT6V328KXsFc/ZKZaPQ81+yk0gmeB8x1LjY9v6ROVs7ZYgiOhRiVEn3B4ZW6onaj9GoIGNesBMgUPci0mM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=wtrwSExf; arc=fail smtp.client-ip=52.101.196.106
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZHfoC1VcRdiLWDiIonId+XcMB2QOdhRcrsRx0Re1FTKQk+FnVGgYbkrSo6IPUBgS9tOghA/I8HymYc4l+SuV9vJgauH+PVcB6XUDe8Qyf4P8sQeZ6gBUsdxbQ/nL7J1JBI6+7ARcPYERq7nAFFiJUJNFjDnnMgaOJE6Ro/gVPt3HXnUzu0zNQ33opJvMHORT9KdV4MSgh/7VqCSd31fYOHs2pAB6Ogj0lGs/StoWZ/lypdX1Ecq6dFQOVdjRLh8+3cCKMbaWxtMV/NJbgkNu6GyHd/8CM/gQqkNwv6SGpbQwZnAeAojallkAUxqFCZCv3mPL6BzB7Tq5K6AQ4rRzVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KSv0W54xSV2+H70TQ+bTr+mWN/lSi0T6F+IucvvdZQg=;
 b=YuCzvG1t8cO9xiM4J+X9BKBSdxokZ6OyrnySAwM0VO9qgeT/DSYsUd3Vw0DNJbebc+NljIQDEsrvzm1WAw+EcNcfyNJ/Guenyo2lUdx1TTjoEc/SxeotDkKPE1JVQ/TwPSZxUBEymEywnm72faxrUg2ro8hPvH5iihoVMlZ0NbnmcPbCwbX9uiCl1d8NqUiYQGKBgVFY5IlpHb7dZOW/yKCWUx8DLKii0LxP8BTNBZXUtaSy9ftebRB5TsUcIKol+uWAkufiP5l2bJHdNhZ2raEvsxXlbOXC1busPRBbD1D9Bz0W+49jRot0Uig9I5uSDbRJ6+BUgybzce7DT1kYbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KSv0W54xSV2+H70TQ+bTr+mWN/lSi0T6F+IucvvdZQg=;
 b=wtrwSExfF5rruQMDxlxa6u2PYMxt4awHE1+WX5GL9//bsWprRfyqIHWygj6ocG5RBJqTo4UVqQuXQu/0hgbAGboXRA3ElUjAczHLOTkADI72YrzEp5XVuUdw/W3Du+L+DPP6BzBQ6UWIPYHnlwaSbowHyz1w5bK0ZqfwPRzO1gk=
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by CWLP265MB6288.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:186::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.10; Thu, 2 Jul
 2026 11:09:30 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%4]) with mapi id 15.21.0159.018; Thu, 2 Jul 2026
 11:09:29 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 02 Jul 2026 12:09:28 +0100
Message-Id: <DJO1ENLRMXTG.20I6Q1L8QQ45G@garyguo.net>
Cc: "Lee Jones" <lee@kernel.org>, "Pavel Machek" <pavel@kernel.org>, "Greg
 Kroah-Hartman" <gregkh@linuxfoundation.org>, "Dave Ertman"
 <david.m.ertman@intel.com>, "Leon Romanovsky" <leon@kernel.org>, "Miguel
 Ojeda" <ojeda@kernel.org>, "Alex Gaynor" <alex.gaynor@gmail.com>, "Gary
 Guo" <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Trevor Gross" <tmgross@umich.edu>,
 "Danilo Krummrich" <dakr@kernel.org>, "Rafael J. Wysocki"
 <rafael@kernel.org>, "Bjorn Helgaas" <bhelgaas@google.com>,
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, "Boqun
 Feng" <boqun@kernel.org>, "Daniel Almeida" <daniel.almeida@collabora.com>,
 "Tamir Duberstein" <tamird@kernel.org>, "Alexandre Courbot"
 <acourbot@nvidia.com>, =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>,
 "Ira Weiny" <iweiny@kernel.org>, <rust-for-linux@vger.kernel.org>,
 <linux-leds@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-pci@vger.kernel.org>
Subject: Re: [PATCH v21 1/3] rust: leds: add basic led classdev abstractions
From: "Gary Guo" <gary@garyguo.net>
To: "Alice Ryhl" <aliceryhl@google.com>, "Markus Probst"
 <markus.probst@posteo.de>
X-Mailer: aerc 0.21.0
References: <20260629-rust_leds-v21-0-4f0f19579db5@posteo.de>
 <20260629-rust_leds-v21-1-4f0f19579db5@posteo.de>
 <akZBsBrMlxd4qbBl@google.com>
In-Reply-To: <akZBsBrMlxd4qbBl@google.com>
X-ClientProxiedBy: LO4P265CA0182.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:311::12) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|CWLP265MB6288:EE_
X-MS-Office365-Filtering-Correlation-Id: d82c6102-8b1a-458d-73e9-08ded82a630d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|7416014|1800799024|23010399003|10070799003|376014|22082099003|18002099003|4143699003|56012099006|6133799003|3023799007;
X-Microsoft-Antispam-Message-Info:
	bw3suqGTcV3XSv0++1iIwGNS8CvgLYpTEKzxfqkzMxhTWHkdxbZGfCAPOqQPgmCMYv6YsNXimH7yMVeVvF7kQ/HhUmj3XCVqvBHC8EKvKGcB5RvgtB075KiAAA+mNMWukkqON3j59DNbl/RtjAJPni+fWB5Ox4wdLe/Pzm7A/ImFbVTU0m7pANu+R0ROUC5DOkMgOy1Mbgy/7vrdPYAQxE7XJXMn7DDZcNnu0n7nkpphfgbbh4e6txd0339lT5cWbQpgFcrmJsQ7SuNkEIZWm2hx1tMraY1jxlzKEBqaPXLbg0y8NHZ5RQPCJH1Hl6Eok05tz5USRQSfmf+HFcW/IgyiCq4nyAgnrkLss9GsIZ+45SkcXMwajXK157cqb61PClj4ebB/1tAb7j669yoUVN4Xp6ltVHWy/pUjnfDBFWjtWxiT+BGVpXpk1KjT7Sj3KeiyH6qZN2uOncf+ZM+6ZylKS+e0RpyjZIpNgj3vQSBolmb3TMTgkmStqxVy9Sx+jsRxZMXzFZyJ+XNmZkvpxodUc0cWE/tpsp/BRpcZYdl3jnzl3rwWPUzWqQye21iaGc4SILTxc34OyIrUMeboFTkQDAFMVi36P7FhvgRbP5Ls5A+8Dt36jKI1HBEA3P5XThSk6RFksqKKB3Z+GgplYpmz2cmA7AugNtgi4yQC7hQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(1800799024)(23010399003)(10070799003)(376014)(22082099003)(18002099003)(4143699003)(56012099006)(6133799003)(3023799007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?d3cyZUlGZFJ0TzhzdzRSTjJBRWVwOEZtRlJDUWg1ODhleVBqOENqNUIwUmlW?=
 =?utf-8?B?cHRjQUpHZ2owSnExTy9Gd2xlNWNTZmdZMUhuUmZ1YTdndk1SNGJOaDl0cnVR?=
 =?utf-8?B?SjdYVG9Id1JmUE9teVZ3ZFpVbkk2a0JWRmUvZU03YjB0V3JVdVE2Nm9MRVZt?=
 =?utf-8?B?dmttKzZTZ3g3dlRXeXdYMlpxUU85RVJQWVlneVlBb1R0OHVoQ01XR0p2Vks0?=
 =?utf-8?B?eXFFNG1qSjhVc0VrK0w5UG5hQ1ZST1VSQ0ZIL2ovVkFmT1VZVkxzQlR2ZVVp?=
 =?utf-8?B?MU5VenFkVjI1cVI5ejNKN1hrOHhBR1VVMXg4eW5ISmxiNGZNMWh3YzZaQmlN?=
 =?utf-8?B?dURnMFZSck1KTEdRQkFEYm1tcE5QVkdVWlBObHl6eTJXQnY3VzhPNUxCVVhx?=
 =?utf-8?B?dE5PV255emZHOTZKVExTSERGTkt2U2d5OFFCbXZnaEQrVURMZnB4V1QwMmpl?=
 =?utf-8?B?eWhacGNuZ040clNpM2FnOEdJaGtRT3hnSU9CMXFRbnhMeTkvMmlLRkJWL0Nv?=
 =?utf-8?B?dXYwd3czNW55YTNVSkVrbE1YUDVwa0JwUVdEZU9tZkZJWHdqdWltSVR0aFc0?=
 =?utf-8?B?ajB4WG5Nb25HeUZlakpIRDJ2cDlSUEdJMERhbnZCdkN5bkdjQ1dZdGUwbGxC?=
 =?utf-8?B?NzNBNlhhcitRWm9jb1BmdFYrT216QXF0MnJHQTl3V3FjWjU3ZElFOHV5bmRl?=
 =?utf-8?B?ak1UYUNsQlFEY0JlZ2RGMTY5Tzc0UW1xWEZDMmxHRks0aStuRHpqNitES1d2?=
 =?utf-8?B?b0ZMdnl0RDk3Qk9JRmNmQWZ2RXVnOWRwQjBDOTFtelFSWnBJM0RUc2FhbWt3?=
 =?utf-8?B?V01xNlBqK2dLbk1XcWxNQUF0TTZJUVlWWkVMTU1OVTFyQXg1bzJsQmRPZG5i?=
 =?utf-8?B?bTI0czZOek5zOW80THc4Qjd6UElpeC9ZaTliTnA3bUZoTjUwUUdtZUFRNElC?=
 =?utf-8?B?dS85aVROU0NNRHFteFdENHROUCtDUlJaNGIyRW1MTDM0bS9qdXl6UThDNjNl?=
 =?utf-8?B?SUdhRG5FbDJNcDZuYjNHbFVJdVhCRWFhYXl4ckFZYWRwaFRuM0RzNWw2K0Q4?=
 =?utf-8?B?Tzk3Qks3TnFTTzJBWG1qMzBUSCtCZEtNMEo1ZWV0bVlCalpBTHRSZjEwaVZy?=
 =?utf-8?B?ZDY5MzRxK3U5NnpmRWcrYm1iZURSdGx5ZkcrREYzU0tTYzc5T29ualIxRGJK?=
 =?utf-8?B?djhUeEt0UGcrLzNuaHVsc1ZPRU1vdWRQckd3VXc4eXJnbzVSdlZCbDJKd21C?=
 =?utf-8?B?R09Jd0JoNHllRWx0WHBuYkovNW1hVXNsdllxVHpMcjIvdmpSS252eU1UdWFS?=
 =?utf-8?B?RXVhUGZSMHNRTnlEZmkxOGdjWklRMzdaMmVnQk90OGplb3hnZmtvSVJHQVd4?=
 =?utf-8?B?U25lSnFzeGZvNjR0dC91VDdjdlpIMDdLOEJzeG1xTURzOEkxZG9NVDlFOWNq?=
 =?utf-8?B?OU54VmtLRTlSbDN1SUJxZmtoaFRmM2VOT2JlcFpwYjdTVHRJdXhWN2VFcXYx?=
 =?utf-8?B?SjRURFlEU1B3WTIwOEdLTnQ3TkF5Ky9xSHpvSk9BaytOWWdYUjFJeW5XZEFY?=
 =?utf-8?B?MnY3K0h1aWYwTDNIc0RMMjlSaTRTcVROZWRyVGNOQjBpYXV1UjF1aUdZd1hz?=
 =?utf-8?B?ZXlmZ2liMVVFTjN1VmpDVkg2OWcxSXNEdUdGcGcyQkVXRTJrWDI3SjlHUW1q?=
 =?utf-8?B?ZkNQUS9hbTUxL2FZcU5YSGpOM0V3T0Vocm9CUFBvSTFMV2MzYVl6eW0xcVZK?=
 =?utf-8?B?bENTczdlZit1T3NxRHZpMFZxRHc1RVRaRSs2SHlQZURmM2tIZ3liWWhxUXZO?=
 =?utf-8?B?SHA4RHdybUJuUWFkT1krVkZIQ2N4UmthZzVsalJPYTBrd3lLaXhFZUJRYlVB?=
 =?utf-8?B?dXUzK0svdzJtSDJvZ3Q4NENCWFJibXNjeWRiL0RITitKd1hlT3ptVjUzKzRa?=
 =?utf-8?B?OFFzSHhKZXJTK3dkQ0VCa1pYYllMVWtUUXE3RUtncHhjcDVtYmUxTFZzemgx?=
 =?utf-8?B?cmY1VThUcVZZTVluUzlWd3FncU1Ja0JGTUxteE4zRERwdUlqWEozN3ZRZEN5?=
 =?utf-8?B?bXRmbmp5dWFDVmdKKzBTcDYzSTEwT0hucnZpVHI2NUYzTURPUnNKL2VUUVVL?=
 =?utf-8?B?MkczTkJhSFFLWUI2VWx0MUg0VFFTMGQ5VUFlNnJYY29JbkVpeEZrVkhGRTNH?=
 =?utf-8?B?QkhTTDcrUWtwRzBDejlqM1NHT0theWJTeDdNelB6SWdzbkY4UTVWMENxeTNZ?=
 =?utf-8?B?WGplSi82NUhvcFVHUC9UbnRPcHNTMURwdmh3dmJUR3hHdHByblB4bnFCU1dq?=
 =?utf-8?B?TE9FeUZhM05jZzJ0L0RCOGg5ZlhrWTRYU2ZoMm1OUDVTeW1aWnNMUT09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: d82c6102-8b1a-458d-73e9-08ded82a630d
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jul 2026 11:09:29.6084
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KL2AukT6JbGHDmv149VIrpc/cHct0DrD41A4rBx7mI+VCmI0vzQzgtXPqivsz5ScpTge88RJyCp4qjhEHyiVuQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CWLP265MB6288
X-Rspamd-Action: no action
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[garyguo.net,none];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[garyguo.net:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-8832-lists,linux-leds=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[28];
	FORWARDED(0.00)[lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:lee@kernel.org,m:pavel@kernel.org,m:gregkh@linuxfoundation.org,m:david.m.ertman@intel.com,m:leon@kernel.org,m:ojeda@kernel.org,m:alex.gaynor@gmail.com,m:gary@garyguo.net,m:bjorn3_gh@protonmail.com,m:lossin@kernel.org,m:a.hindborg@kernel.org,m:tmgross@umich.edu,m:dakr@kernel.org,m:rafael@kernel.org,m:bhelgaas@google.com,m:kwilczynski@kernel.org,m:boqun@kernel.org,m:daniel.almeida@collabora.com,m:tamird@kernel.org,m:acourbot@nvidia.com,m:work@onurozkan.dev,m:iweiny@kernel.org,m:rust-for-linux@vger.kernel.org,m:linux-leds@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-pci@vger.kernel.org,m:aliceryhl@google.com,m:markus.probst@posteo.de,m:alexgaynor@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[gary@garyguo.net,linux-leds@vger.kernel.org];
	FREEMAIL_CC(0.00)[kernel.org,linuxfoundation.org,intel.com,gmail.com,garyguo.net,protonmail.com,umich.edu,google.com,collabora.com,nvidia.com,onurozkan.dev,vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gary@garyguo.net,linux-leds@vger.kernel.org];
	DKIM_TRACE(0.00)[garyguo.net:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	RWL_MAILSPIKE_POSSIBLE(0.00)[104.64.211.4:from];
	TAGGED_RCPT(0.00)[linux-leds];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,vger.kernel.org:from_smtp,garyguo.net:dkim,garyguo.net:mid,garyguo.net:from_mime,lechnology.com:email,posteo.de:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: BC5AD6F6F66

On Thu Jul 2, 2026 at 11:47 AM BST, Alice Ryhl wrote:
> On Mon, Jun 29, 2026 at 01:10:28PM +0000, Markus Probst wrote:
>> Implement the core abstractions needed for led class devices, including:
>>=20
>> * `led::LedOps` - the trait for handling leds, including
>>   `brightness_set`, `brightness_get` and `blink_set`
>>=20
>> * `led::DeviceBuilder` - the builder for the led class device
>>=20
>> * `led::Device` - a safe wrapper around `led_classdev`
>>=20
>> Signed-off-by: Markus Probst <markus.probst@posteo.de>
>> ---
>>  MAINTAINERS               |   8 ++
>>  rust/kernel/led.rs        | 288 +++++++++++++++++++++++++++++++++++++++=
+++++++
>>  rust/kernel/led/normal.rs | 230 ++++++++++++++++++++++++++++++++++++
>>  rust/kernel/lib.rs        |   1 +
>>  4 files changed, 527 insertions(+)
>>=20
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index 15011f5752a9..ceb2285366ff 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -14662,6 +14662,14 @@ F:	drivers/leds/
>>  F:	include/dt-bindings/leds/
>>  F:	include/linux/leds.h
>> =20
>> +LED SUBSYSTEM [RUST]
>> +M:	Markus Probst <markus.probst@posteo.de>
>> +L:	linux-leds@vger.kernel.org
>> +L:	rust-for-linux@vger.kernel.org
>> +S:	Maintained
>> +F:	rust/kernel/led.rs
>> +F:	rust/kernel/led/
>> +
>>  LEGO MINDSTORMS EV3
>>  R:	David Lechner <david@lechnology.com>
>>  S:	Maintained
>> diff --git a/rust/kernel/led.rs b/rust/kernel/led.rs
>> new file mode 100644
>> index 000000000000..c92d99d68497
>> --- /dev/null
>> +++ b/rust/kernel/led.rs
>> @@ -0,0 +1,288 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +
>> +//! Abstractions for the leds driver model.
>> +//!
>> +//! C header: [`include/linux/leds.h`](srctree/include/linux/leds.h)
>> +
>> +use core::{
>> +    marker::PhantomData,
>> +    mem::transmute,
>> +    ptr::NonNull, //
>> +};
>> +
>> +use crate::{
>> +    container_of,
>> +    device::{
>> +        self,
>> +        property::FwNode,
>> +        AsBusDevice,
>> +        Bound, //
>> +    },
>> +    error::{
>> +        from_result,
>> +        to_result,
>> +        VTABLE_DEFAULT_ERROR, //
>> +    },
>> +    macros::vtable,
>> +    prelude::*,
>> +    str::CStrExt,
>
> CStrExt is in the prelude. Please check for unnecessary imports.
>
>> diff --git a/rust/kernel/led/normal.rs b/rust/kernel/led/normal.rs
>> new file mode 100644
>> index 000000000000..2769f690bb24
>> --- /dev/null
>> +++ b/rust/kernel/led/normal.rs
>> @@ -0,0 +1,230 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +
>> +//! Led mode for the `struct led_classdev`.
>> +//!
>> +//! C header: [`include/linux/leds.h`](srctree/include/linux/leds.h)
>> +
>> +use super::*;
>> +
>> +/// The led class device representation.
>> +///
>> +/// This structure represents the Rust abstraction for a led class devi=
ce.
>> +#[pin_data(PinnedDrop)]
>> +pub struct Device<'bound, T: LedOps + 'bound> {
>> +    #[pin]
>> +    ops: T,
>> +    #[pin]
>> +    classdev: Opaque<bindings::led_classdev>,
>> +    _p: PhantomData<&'bound ()>,
>> +}
>> +
>> +impl<'a, S: DeviceBuilderState> DeviceBuilder<'a, S> {
>> +    /// Registers a new [`Device`].
>> +    pub fn build<'bound: 'a, T: LedOps + 'bound>(
>> +        self,
>> +        parent: &'bound T::Bus,
>> +        ops: impl PinInit<T, Error> + 'a,
>> +    ) -> impl PinInit<Device<'bound, T>, Error> + 'a {
>
> I think it would be useful to separate out the two lifetimes more
> clearly. You have two sets of lifetimes:
>
> * 'bound which is the duration in which the bus device is bound.
> * 'a which is the duration in which the `name`/`devicename` fields are
>   valid.
>
> And these have different constraints because 'bound is much larger than
> 'a. The 'bound lifetime is longer than the entire Device struct, but the
> 'a lifetime only needs to last for the duration of the initialization
> because (I assume) the strings are copied by `led_classdev_register_ext`
>
> So under that logic, I would rename 'a to 'name or something like that
> to indicate what it's the lifetime of.
>
> Note that if I'm wrong about the lifetime of the name strings, then this
> code should be changed accordingly. It looks like you're actually
> stashing the pointers in the led_classdev, and if that outlives this
> initializer, then the current lifetimes are wrong, and Device must also
> be annotated with 'name to indicate this additional lifetime.

The lifetime here would probably be better named 'init.

It's the same case for async desugaring, where the lifetime is to capture
everything used in the initializer.

Best,
Gary

