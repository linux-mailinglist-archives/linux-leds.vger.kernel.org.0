Return-Path: <linux-leds+bounces-6821-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aDdKL2HIgGl3AgMAu9opvQ
	(envelope-from <linux-leds+bounces-6821-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Mon, 02 Feb 2026 16:53:05 +0100
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E258CE73B
	for <lists+linux-leds@lfdr.de>; Mon, 02 Feb 2026 16:53:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 82E3D3076EC5
	for <lists+linux-leds@lfdr.de>; Mon,  2 Feb 2026 15:43:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C81A537AA93;
	Mon,  2 Feb 2026 15:43:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="Gy0j2mGn"
X-Original-To: linux-leds@vger.kernel.org
Received: from LO3P265CU004.outbound.protection.outlook.com (mail-uksouthazon11020143.outbound.protection.outlook.com [52.101.196.143])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53C5B3793CF;
	Mon,  2 Feb 2026 15:43:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.196.143
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770047022; cv=fail; b=X0Ur54rSsZBI3RAZvw/v0tTYUpdvoTmPCucQimsW+QEH765si++isIySizrfT4Bd8oGKvTtQzbI8YWAfPYAHzcdwJ7uzHo+HkV7UIse2oBTjGuj/rNLtiOD0AdUKhj0II2GMf41SQmg/qIprjGboT/I5C1j2o4ZoedRYd0wrh6Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770047022; c=relaxed/simple;
	bh=TTYMspu038DF8VgZFx1Qn14oJC1J13VfsE04inR9AmA=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=IRtjFQrmf32WX55zeg4lPYgTloHxOH10Tlv1nC/ibb6oMYFeo7j4f/3yDdbluXV6QT+LodoJvouzI8Gqigimy3hXaoDT9hMMDsIh3t6wcXJTGbpLvU9094X3FWFttK6VNXs2hmFS1xlLKGy42KL6kBuu3NzmVpvb0Ps1hk3TaLA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=Gy0j2mGn; arc=fail smtp.client-ip=52.101.196.143
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vMuXeP9CruXOo5oG8zHXLQq+3Yo14kIRdvDTKSLWy5CgN8EEGcTgFR7nP7lxK5txdw9I0tJZ8QL08uQolKlLnaYhc9mbYVg1m5IQMGWyZ66Isz/FRPNH+lPOuJOIP/6iPThJqwbxy0oYIjZ2cj5e85x0KMwopJoguHVX1fSUGLo0uw1QD/RUovHhGO0A/E4ofcqj15pEFai5jKOu+houRP1cnHOhluMAO4PI49FiOCuHsynmHkxeV/74lHqetCxDD9mGMcqS0HgIUXFkhlD0Xw9GlAsHFuXDY2E87xaodsGL/HiLIemflo69LGNdVIen9iFaaO3Uj8tqk+DzmsDSZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=shm7po4HDIWM4vECpKd7EnCjm1r8qGEOQYDl9eXWcpc=;
 b=GwYNcTwldjZBFD3vIlKUMbdQXdhwFdEE+7OEefDgYXXkTLffwzCO23gxvVdgkvZXPAjy8M4BJUBtSXo3CmpCjBPoUhguRVSHv0QY058vmbBVcXJhKIty1fCNeB7z9OZccbEij+2bQrYxx/KzcsD8F3zc0vws/QLqGVf4qrmOXgwRgFUFFirVQBA1vpfbqyci9Y+DsZoX1bX55lELeNbV69Oj1bLbNsvgZLhveLoI7810B/JCarFYaWYgsed6Lv+3G6jXIfQL8gSqzHNore/kUm6/GYnGmOdAfWYXU5GxYcKk2YsWkyVtFBa7uQOmA/+Cy3hNnVvIPJqoDPrAq+4KRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=shm7po4HDIWM4vECpKd7EnCjm1r8qGEOQYDl9eXWcpc=;
 b=Gy0j2mGnPhPmywfVNZ0nhiCd5ZdOPrIaXH+gAj+Jni7xyUdgnpPm6+C7PEhAvx2/gq6n2TH+FCF6qk34yEg0/NK6qbawMG4OBAHhc6VnupXKkzW/VxhboQhgaDFFL+PjfEL61bccWhWGAyES6mwpix/E+IbWRfm/IDsUiPoqM08=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by LO2P265MB5696.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:26a::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.16; Mon, 2 Feb
 2026 15:43:38 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%5]) with mapi id 15.20.9564.016; Mon, 2 Feb 2026
 15:43:38 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 02 Feb 2026 15:43:37 +0000
Message-Id: <DG4LAU6LYW4Q.3P6D805EE751B@garyguo.net>
Cc: <rust-for-linux@vger.kernel.org>, <linux-leds@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-pci@vger.kernel.org>
Subject: Re: [PATCH v11 2/3] rust: leds: split generic and normal led
 classdev abstractions up
From: "Gary Guo" <gary@garyguo.net>
To: "Markus Probst" <markus.probst@posteo.de>, "Lee Jones" <lee@kernel.org>,
 "Pavel Machek" <pavel@kernel.org>, "Greg Kroah-Hartman"
 <gregkh@linuxfoundation.org>, "Dave Ertman" <david.m.ertman@intel.com>,
 "Ira Weiny" <ira.weiny@intel.com>, "Leon Romanovsky" <leon@kernel.org>,
 "Miguel Ojeda" <ojeda@kernel.org>, "Alex Gaynor" <alex.gaynor@gmail.com>,
 "Boqun Feng" <boqun.feng@gmail.com>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Alice
 Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>, "Danilo
 Krummrich" <dakr@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>,
 "Bjorn Helgaas" <bhelgaas@google.com>,
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>
X-Mailer: aerc 0.21.0
References: <20260202-rust_leds-v11-0-585d1c8be20c@posteo.de>
 <20260202-rust_leds-v11-2-585d1c8be20c@posteo.de>
In-Reply-To: <20260202-rust_leds-v11-2-585d1c8be20c@posteo.de>
X-ClientProxiedBy: LO4P123CA0015.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:150::20) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|LO2P265MB5696:EE_
X-MS-Office365-Filtering-Correlation-Id: 87c94178-2b8a-4f71-8bae-08de6271d534
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|1800799024|7416014|376014|366016|7053199007|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?NzE0V0NaM2tUTDZJY3VtWlloTHZqendpbGZ1MU9EWDQ4bVZXRndoK3p0Zis2?=
 =?utf-8?B?N0lCbVVLV1o4VkI2ZFBOZFNjeU1hUERkMkc5Q3hHVmY0azVBbk1TV1F0dUkz?=
 =?utf-8?B?VDFDbnFVbmtCYnR1Rk5iN2lzTVJjMkZMbnd3V3ZiYkc5Z3VrR3N3TzlpM1Zt?=
 =?utf-8?B?VXcweTZtUWhxaXJZa09vSjNTeENSRnB4WkozQkVoYTFyV2J0aG9PRjdSOHN0?=
 =?utf-8?B?UU83cnVMTEk1TWN0MitFNFp3MXV6VzczMVRVYXRBQ3lvRVViVlAwNExSVFhN?=
 =?utf-8?B?K1paY0Y3SWFTMFk0WTNtRTZCZmZhT25hK1hhTU4vRzh1WHFTVkJ3NnFoNGln?=
 =?utf-8?B?NndHaWJBL2FZNlNvWHJPSUxUMkRkRXRjVHNWSWxFOXdrVjZiTVIxZzRLNmJT?=
 =?utf-8?B?NWorVDdpb29pamlPVGhjbllNWXY4M3FmLzROWjlQWmlUclRCZE5Wc1hUbmQ3?=
 =?utf-8?B?NHBhby9iTlNlYzVFQThxdFlVYVgvdXNnWnltYndQTHVYZVJmWEkyL012a2hp?=
 =?utf-8?B?Qk1WWUZIQUk2VStDYkM0aEFYNHM0ZFRTaUpWbjZEUzZTaFIyaTVseGtkaUt0?=
 =?utf-8?B?bFd6M004aU5zNkNQSmN3dGpFR0RHZVZBQk9yc09MV3l2Y3RrWTN1Q0lpU1lC?=
 =?utf-8?B?eW5sVnFWdVhHcUF5UTNCWnZnQVNFbWMyanFyQWcwVDE0VzNlSjZIbTkzbXFm?=
 =?utf-8?B?a1RaeTR6cXZnUXZuV1Zad09sQm1qZ2daQ0xRTkV3VVRLWHZPWGlmT2QwUlZZ?=
 =?utf-8?B?THJlYWthanVBcm13R09ITHNrUkpsWW5HOVREOW5IczlUWlBHeUorWWdDdzZn?=
 =?utf-8?B?S0UvUllGU3NvK3krUWowbm9SbTJrZkZ1dTZseWVGS1hZbldackN5ZVkvZzZS?=
 =?utf-8?B?MEFsc0ZkNW4wVUhaNjZxQ1dIQ3dCekVURExEOEpBTUVudUdzdGkyd29DL2Zq?=
 =?utf-8?B?MENpOUU5ZmJIbTJiYlJwWW1EQnVTL2ZCNmJaWStieFRyeXRrTHJMODdhVk9w?=
 =?utf-8?B?ZFFMWTlQWEFTUUcxbVJpd1UvYkF5d3FJWGdMbWhTbFU3M2tPZVIvTWI0SUJF?=
 =?utf-8?B?ZXVMTmZ1WkJpMWd5bXlzY0IwQWczbmhxcTJjQnZKTktNblB2RXBOY1RGSkJJ?=
 =?utf-8?B?UVlyRytrNWdSbHN3ZG9lUjV2TWpVVUJMblRuQXorNjg5L1VBYkZTd2VYZ0RP?=
 =?utf-8?B?azhqYXVDMmpVL2hITlNXWWd5MTJMMG1JWFFKczkvWHN2VlBhMC9FU0EzcHJx?=
 =?utf-8?B?T1dNQUFNbWxtcUNtYW44Rk1BUGtrNFdvVG41WDNNckRoK2l0TWEvc1lFQ1B5?=
 =?utf-8?B?QkJRMGRpNkJBT2xDSGdZSkhva1FvY2Z3OWhhWWtLY09XVE90NWlBMzZhL1Uz?=
 =?utf-8?B?cTN3bU1qQ1Vmc2t1M25jZFdGWXFoWE4zYmkzVG92eloyOVVjcFJYZ2dzYktx?=
 =?utf-8?B?d2lZKzRHOHVyZzc5RUduTkhZR3BZUW9kM2FPaWRBVGQ4ZjRXMmhyaE53Qk9a?=
 =?utf-8?B?aGFGdnNUYUt6UWhvZGhxU2l3YWlLbmhudjdsZU1sWWtYYlQ2dGxKSTNLTk1q?=
 =?utf-8?B?aHhyQ2hxTmxjZGFSWWVQd3dPb1F6Sm9WSUlTVjdJZVhDSk5Ua1RWeis1c2pl?=
 =?utf-8?B?REh5SkJ5UXNURHF4U3VCck9iWFd2TnNrWk1vZ1VlanZPZFluSVY0c2VCOVpt?=
 =?utf-8?B?UHlDb0tDR0V6YTlIazdLYktGRTRLQUhlSmNSUjVUcnJvMDlaODZuVWJyNWpo?=
 =?utf-8?B?b2w1VnU5S1hWME11N2I4bmlRdHV5KytZb1U5dlhZZDlTb2NNQmtpR2RaSVNE?=
 =?utf-8?B?TGIrOFMwNHFCMnNmWGF3U2pRN2Fweng3M2gxYk1yQ0duSnV5cUdpYUt3bkRP?=
 =?utf-8?B?cFVQS2wxWHlXNWhzSnlyckxMTktuYlkvcklMVUpLNS9xTU1pT2d4Q3lndWR1?=
 =?utf-8?B?eXJNVFR3a2prek5MT2k3WmpMdkF0NWpWeDFzMERtUWxjRy9VQ3QzQ0o5S2lB?=
 =?utf-8?B?U0hqOGZMT2JXMVhxL1F5ZVpBVU1zSmZJbmJVTy9od0JkdGg4d2orMmZNTVIv?=
 =?utf-8?B?S2RwR0hIK0JvUGVQU0E1YzJwSHFubGpHMVAzYWJkdkZiRTFKUzNVeVJrNldY?=
 =?utf-8?B?UWRPOWViZ3YyczQ0YSt2MWJ0ZnJwaTQ1N3B2cHdybVNSaDJHL1YrSjYzQ3hG?=
 =?utf-8?B?cUE9PQ==?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(1800799024)(7416014)(376014)(366016)(7053199007)(921020);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UzJ0bzZnZWdwckVlalhWZ3dUOUhaM2xlU2d4L3M1R3Z6dUFIY2pPOVNWalM2?=
 =?utf-8?B?Q0pkSytTalVra2F3eWpwc1JvelZVYkhjYitVMHlzUlo4aXdmUE9BQk8wWC9D?=
 =?utf-8?B?MFI3OTlVNTBIcVd1Z1Q0MGNSREtCS2UzU0VuOFAzSkpHeWZqbkZGSW1jVHJV?=
 =?utf-8?B?WXgycnZJU1E0WDZKQTRGek1PNExhcU12WXhad1VnOUVMR0xzOTZiMWZZTU4x?=
 =?utf-8?B?VG1FUE5pRnl6SFNKdVZuaGJLR1Z6S054Rk9zY2FLcDZHaDhxWHpBTU5GV2Zo?=
 =?utf-8?B?WjNoc3BDRld3NXBERlk0VEg0V1F1c1lSUS9XWTNOQ2o5TVZVS24zZWpZdVJ3?=
 =?utf-8?B?czBwMTdwNmI2UERTN1YzMGlSSXgrTkg5VGhnZi8zekUzeDVXYXRJTHFGUU9k?=
 =?utf-8?B?RHZTZlVLSzdDTllwMnlEeXBmdUZKa0plbURSSWxRRERrMU45Qy9UalN1clhJ?=
 =?utf-8?B?MkpUZFUrcHZlb2V6dkl6TzlsVTJQeVhvbTRCMkZuZW5ERTc0cFRDbzQ1YkZk?=
 =?utf-8?B?cW1CRWZ2M09LTG9ocm5FREdCRnM5ZTBqdUFEeDZqRS9oWnhOaGRKZ2lwdmxu?=
 =?utf-8?B?Y0U0Zmx1SFFwakdEeHBuSHdYdHhGVnpOWm9xOHpCTDB6NHRJclY1dzRGd01x?=
 =?utf-8?B?QTkzYVdlWTAzR25aRjhiODJpTUZqOTJUQkZZNmNUMmJZUk02TlJxZy81Z0tJ?=
 =?utf-8?B?Z0Y4aW9yQjVzZWdQOUgyV1VyMWNCeDVBKzlvQzRmNTRCUlh2TngwdHRnVzd3?=
 =?utf-8?B?ZXNWNEtndURBQktUWUM1bjhvMnpQODgxNmZBOE8wMGxjSDJCeE1hbHg2TUM2?=
 =?utf-8?B?YWVBS0UzVWlZQzQ2TWkrMytUTGZ4ZGdYaS9yN0xKU0RWbkdVYkdlZ1pab216?=
 =?utf-8?B?Y1FodEN1MTk1N2s0YTJKNWZTcmNNNktnL3J3b1VHaDFGS1doN0JTUE1mOUFR?=
 =?utf-8?B?Y3RVd28wQnIvY3FNQ0lRZXN1YzNkUFhJam9iR2lIbE55ZnZhYnlzT3NwY2xR?=
 =?utf-8?B?eDgyd21Qc3lxRDl0aWN0SWJ4bitUUkNLdGJwVDNLN1hzbFMxNWQzV3l0WTZ3?=
 =?utf-8?B?cWFsVENXRFE3UVFFQlhEZjYvUUkzZm5RdVU1SXB4emRhbDJUZVRSeDFkb1FU?=
 =?utf-8?B?OE43MnZwcWtiNnVrVGt3MVh0WHRmVGRYT1ZrQnZ5NVc3VXREYkNWVHRjVTFO?=
 =?utf-8?B?RWFBVkRVa2UwZlZqR2dJdjZDNkVoOHJEYkZlN1FmNGlVOU9sT053c3dxNEtL?=
 =?utf-8?B?REh3U0lMKzFNVjRXc2FyZGczcTZweUlaT0Vtc3JVb09HWEo1NktwSnh6L1ZU?=
 =?utf-8?B?NGt1RE1vQXNEQW4ySkNtM00rald4LzB1NVlYZHZXcnZ1MElJRURlMmRZMFVs?=
 =?utf-8?B?eURacFdxNkR6VzZCKzh4Rm5ObE9mZjVHRXJ5aW83ai9QZDNZZm8zcFdRb0ZT?=
 =?utf-8?B?OUxSdGxGU281SmZTbWliWGp1RWVOR2tjbEVFaXVmMWxRcHAyanl3d2s3Rkc3?=
 =?utf-8?B?eEtGWE5FcE5MU1NnTmdQdDlocHRRd25ZSER5TTVLdlNmWHdjOW1JK1lrZ0Zq?=
 =?utf-8?B?S0ZHdUpyd3Jsd1lZdzJsUTQxQVV0U2dHU0dmZGFHK3gzc0VNMWZjdjJHOXF6?=
 =?utf-8?B?YWlVQ0NsQTNHcmNvbjB2aFlHR05HUWVBejJYcW5kOGRmVCs4TmtsWkhjWHZX?=
 =?utf-8?B?SEhYdFcxTkhjTS9DQW5weVg5TlR2ZzY3clBySi94dHRHQVRuWGtJemc0TVFT?=
 =?utf-8?B?MStzSHRQS29lTXZuU0c3NmFRMTlaQ1drYll5Q0VsV1R5NHFoY2pWd2VpOHFL?=
 =?utf-8?B?ckxrcWJIV0NZUW9SaUNYQkNiT2pLc3ZjSGRtSk5kWjlzMUJ4bWpiVFJRSWFr?=
 =?utf-8?B?TndRL2Q1K0cwMGVrRXAyU0I2V1hXMEN4cG5jb05GSmV5Y2RzNVkwN1Nuc2Fr?=
 =?utf-8?B?REVodzg1bGhkdkRnVWdUaUVOdzIrejBTMjBGWlJzVDhYVThsYXRGV2RNV2or?=
 =?utf-8?B?SEhEdUhLdEhJZWIvQmpzN2xNRnZRUjFtYWxiS2VocGZwTkdZWjMwWEh6MHIy?=
 =?utf-8?B?Slg0SXlWaWFjcHA4b09qWnlHS1UyaDJEYXV1TC81SkdNMEJ4a1hHRzR4Ujcz?=
 =?utf-8?B?YnZWaWNJazcrRklOMXc4Z3grSGQ3K3RQbnl2V3JHNGNUdWdETFN0WTIvMVhC?=
 =?utf-8?B?Y1JCVlRmVStOamZJUGxwa3oyc0k1RUhOTUhPTUlZWWxpaDRxQ2xNTDVrZkN3?=
 =?utf-8?B?OUlrRUFzNHkvMGtPU3NpWnQxbDVYME01T1NtUDBrNEg2TGo0bnBRK0k5R01p?=
 =?utf-8?B?b3MwZ3lIeTRacmZaai9XVWJ4eUF2OThqU1hrNVBWQjRta2thZWFhdz09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 87c94178-2b8a-4f71-8bae-08de6271d534
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Feb 2026 15:43:38.1835
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /ltjZegZ+FWXNGbodwj/LZXGwjgurNiLP0/aQZrUoeFCuVG02bSJpiCVKGuBpPXsFBSuxJNy/90wkVpDMu01qQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO2P265MB5696
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[garyguo.net,none];
	R_DKIM_ALLOW(-0.20)[garyguo.net:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-6821-lists,linux-leds=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[posteo.de,kernel.org,linuxfoundation.org,intel.com,gmail.com,garyguo.net,protonmail.com,google.com,umich.edu];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[24];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gary@garyguo.net,linux-leds@vger.kernel.org];
	DKIM_TRACE(0.00)[garyguo.net:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-leds];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[posteo.de:email,garyguo.net:mid,garyguo.net:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 1E258CE73B
X-Rspamd-Action: no action

On Mon Feb 2, 2026 at 1:52 PM GMT, Markus Probst wrote:
> Move code specific to normal led class devices into a separate file and
> introduce the `led::Mode` trait to allow for other types of led class
> devices in `led::LedOps`.
>
> Signed-off-by: Markus Probst <markus.probst@posteo.de>

This patch deleted a lot of code that's added in the previous one.

Could you structure it in a way without doing this?

Best,
Gary

> ---
>  MAINTAINERS               |   1 +
>  rust/kernel/led.rs        | 245 ++++++----------------------------------=
------
>  rust/kernel/led/normal.rs | 226 ++++++++++++++++++++++++++++++++++++++++=
++
>  3 files changed, 259 insertions(+), 213 deletions(-)

