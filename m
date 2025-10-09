Return-Path: <linux-leds+bounces-5700-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id A4C1EBC9362
	for <lists+linux-leds@lfdr.de>; Thu, 09 Oct 2025 15:11:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id F17914E48C9
	for <lists+linux-leds@lfdr.de>; Thu,  9 Oct 2025 13:11:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 56E432E6CD9;
	Thu,  9 Oct 2025 13:11:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="L9m1mEuN"
X-Original-To: linux-leds@vger.kernel.org
Received: from BL2PR02CU003.outbound.protection.outlook.com (mail-eastusazon11011005.outbound.protection.outlook.com [52.101.52.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BA8F1E3775;
	Thu,  9 Oct 2025 13:11:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.52.5
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760015515; cv=fail; b=JzNaUWFcmpna795SafFaVoVMdioPM8DW/Nq9Ryemtk4WZ52+VTaUNuEg5kDkW768VHriYNX1o/uYMX3azCAi5X0ZsChSJx1xkwqj3d9pgCcN2s/jKvMI9LGTsO58344whRxjsyDwvgSZjHGFZGpxRsZDO3S8uBHGuql5P6fgmnY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760015515; c=relaxed/simple;
	bh=fZ7SqAMARx5Hi/++8jUGiswI15eBmZlMoC9yTKmK728=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=aw3HzlVhW+sojnxW8fQMBA7WMZST89y+tMypk1U5LgndtjIHa95oJazvdd6T9U5RLEq6ImuEymzKisna+nwOzgLZyl3E8cI8CbX1TDMcfpzd6JlM1OibGtwDWEdiX6KtlATSnidHPqiTAIYH+57MXXNqj3iz9qCj0Kfe5ufCTgo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=L9m1mEuN; arc=fail smtp.client-ip=52.101.52.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TEb2LVCHicj2PNXldkzI++M90G4sM3Ju33yGsI1KzY5pkmU6JZJgL/4ZKgTyjPmAPKN3OeurTEHXP14It9cHRhXf9wMamOeA2JZ/b5+scNKrUW2neTG68youoHXmOUNNgijiizbEARJyYVsRZ0eSieboZXuEZLYDGYdLCC0E9VW812V8wC/CAErZUFu9jF4tODOH4eAALFiFhgGpQrjWtdHxJGRTR7syyDD9CY5u9/RCaafgXdoGypnW/JNNoiBhAZHu4k+ihBVxEukPob9SUUXLAbTFzw0qdWBHl3xhWUZ0/iuydjy0hLuysL/mlxxMm4bBSDGaygZmStqVTy7hZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fZ7SqAMARx5Hi/++8jUGiswI15eBmZlMoC9yTKmK728=;
 b=RP0Yfi6ncmGtXjgYjrOSKwcTv+D2GfT0MMq5PDxWKoBuTUcH9KQcn9juEvHXgFsUSsmwq+UzRj7DSOvcJ+P8V0ldfaOl1fEfy6HniEEDavrO2zN/a9HhCpxEIB9mtl6NoOaAreyr4Cfc5V+w3To300Esoy67ajto6kME9bG4RS3o6KeQ0m7pORGCKYbGzNeBz/zilXUlsc66eJhElOVKitHox0RcJahnhlFokaLHpPxD/NMyM48VAEhi5WEsXxBaeve7pBWqCv//AM0ZsYWfplzIYBNxpYfrIqK2gpWztER1l8DWp9c9NRuP/4YarB7a6bAvVZW6YVGGmuq5siqMWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fZ7SqAMARx5Hi/++8jUGiswI15eBmZlMoC9yTKmK728=;
 b=L9m1mEuNdmbfiCSSWsq6WyzXuRmpvcGduzSoY2dQfLVfKBTUXBXJlo8LyLCAx+1wfRpG/eEUgNYXntfARAJ1F8d0p6b84NhhhxZlVGBygyzOEx5q6bzA+p3Ff9vGPYSwYzKYRS5yX/1Gb/3xhuEtXEC15c3IWhC+kdLygwDLjfZ2DO1Ctd+bLNOw+gTQRKCOKCBS2R0QnqRK//UiTYpjJjpVT1yQkNfzY8nnZB9ZWQ9HelgbDLg/CS1ZsV7llrGQm8McE90+E5/Hb1cHIL1U6T0PuKi79OvfA/YLAqtb/u8gciqeOBSDszy+GCcnBepr43PSyQWuM4CFoPlKRuVM/Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by SJ0PR12MB7475.namprd12.prod.outlook.com (2603:10b6:a03:48d::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.10; Thu, 9 Oct
 2025 13:11:49 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9203.009; Thu, 9 Oct 2025
 13:11:49 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 09 Oct 2025 22:11:45 +0900
Message-Id: <DDDTFDCO7V8R.342Y4MA6FQ4FL@nvidia.com>
Cc: "Lee Jones" <lee@kernel.org>, "Pavel Machek" <pavel@kernel.org>, "Miguel
 Ojeda" <ojeda@kernel.org>, "Alex Gaynor" <alex.gaynor@gmail.com>, "Igor
 Korotin" <igor.korotin.linux@gmail.com>, "Lorenzo Stoakes"
 <lorenzo.stoakes@oracle.com>, "Vlastimil Babka" <vbabka@suse.cz>, "Liam R.
 Howlett" <Liam.Howlett@oracle.com>, "Uladzislau Rezki" <urezki@gmail.com>,
 "Boqun Feng" <boqun.feng@gmail.com>, "Gary Guo" <gary@garyguo.net>,
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, "Daniel Almeida"
 <daniel.almeida@collabora.com>, <linux-leds@vger.kernel.org>,
 <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 4/4] leds: add driver for synology atmega1608 controlled
 LEDs
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Danilo Krummrich" <dakr@kernel.org>, "Markus Probst"
 <markus.probst@posteo.de>, "Alexandre Courbot" <acourbot@nvidia.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20251008181027.662616-1-markus.probst@posteo.de>
 <20251008181027.662616-2-markus.probst@posteo.de>
 <20251008181027.662616-3-markus.probst@posteo.de>
 <20251008181027.662616-4-markus.probst@posteo.de>
 <20251008181027.662616-5-markus.probst@posteo.de>
 <DDDSCBNFRLG9.26UA3ZEOA9LJH@kernel.org>
 <53fd34386cefd4a789c56a6e6d7c5618c06c531b.camel@posteo.de>
 <DDDSSGI3H08V.1L6YQN2Q5C8TE@kernel.org>
In-Reply-To: <DDDSSGI3H08V.1L6YQN2Q5C8TE@kernel.org>
X-ClientProxiedBy: TYWP286CA0001.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:178::12) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|SJ0PR12MB7475:EE_
X-MS-Office365-Filtering-Correlation-Id: 30ef16f1-9dfb-4fae-38f7-08de073567b7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|7416014|10070799003|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?N09qU3BZMG04aDFhWnNnYXEydE4yenM2K2NQeTJIR0xHVDNNQlIrcGVqblZS?=
 =?utf-8?B?WjdoTWVNdXRxWHRWdEw1TDExWXpiWlJPcVNlVTJDUlNNcDlwcnM2UzlFRGF6?=
 =?utf-8?B?aWd4Ym9lZ0NhV0YzNGh1cCt4ZmJ2OVBuYmdhcVM0ZWpSV2NCQVNtVVdaWm9T?=
 =?utf-8?B?ajNlY3ArUkM2RmhHOC82VEpLYUY0a1pvOUswM0p0aG1lWC9oLzZiR0Z0OW9k?=
 =?utf-8?B?Vy90UFNYVjRja3ptZjUrb0JYRmRwajVidXUxL0VoaXhjTFh1YVI1YzhxdzRB?=
 =?utf-8?B?TjJIQ0gvdkhjTjdhMmVReXJVT1hsd2dzQWNpOUFzRklEMU51aHVsek1seXov?=
 =?utf-8?B?bkhSK2NHNHhvckxlOG5YTDMwNTNrVXRlRGtMTWQrU2FQZ1ZqUXJqZkNpb1ZO?=
 =?utf-8?B?ZFFrUEFvVHJjMVBjVWt2VDhpZW13dFVPdDFZOFdoRUd1WUl2d0xQellxNkFP?=
 =?utf-8?B?QTdhWnd0VG8xOFlHRFcxODlZc1pZZStONDhwNEtELzdnZ1FNb3YzQ2tHVzhx?=
 =?utf-8?B?Tkt2RnhuWUxrNzJWTEE5NW4yNXF3N0hTYytGWWI3d2pvWWE3eWpONXJlV2hH?=
 =?utf-8?B?a3phN0lTTm8zS0J2VmJpNFVIZ1VwQS81NlBCRGhYclMwTGhKK3Fnc1ViWjVu?=
 =?utf-8?B?Y0pYbGg5cW9jRE1EVkpPVjdENHlkTVRGSlMzYTNlQTZzeG1Gbzc0aUxQbHBK?=
 =?utf-8?B?VEdWNGNKelBwdlBZQ2piRTRybDhPVlFPM0RSbndjYkxLa2wwMVRkSHVxbkVJ?=
 =?utf-8?B?bzY1MHhWcVozemZhcE1SN00zbmRiNXE0eFA2aXJ1eFgxenVtbVVLN1BMQjRy?=
 =?utf-8?B?SEI4U1kxbVU5VUdUdkNvY1A1NTdYYUxkSU4wVUFabXh2NGdKN1VMUGcvZXgz?=
 =?utf-8?B?OEd2eHMwVDduRTE3RW93bEg1NlpkSExodXFQYldTQzVTUHNoQmVJeU03MU5x?=
 =?utf-8?B?OEY3dU9nRkROQnk5NmdWa3VjSjVLYWYwRHVBamdVbnpJRTR4bHlObVNGa1Ba?=
 =?utf-8?B?enp5ODJqRDFOWHJ6VmJTeDlLR1l6M0FqWmNzRkpsV0ZYWmFYclVGbTlIMXRn?=
 =?utf-8?B?dTc5WldFYndWWktjcmRtSVhvb25BQVZwdzE2b2RvT0wzMkZjZlBTTXppcGpl?=
 =?utf-8?B?aDBOTjl3SkhFbjhGT3Z5aXROMzhBY0lvQ3dTS0NCcWcxZElERkN3SnBoMEtN?=
 =?utf-8?B?QnRNM1BYSzNGMHArRzZiL0pDNTdqY3oyUFk0OUdJclA5Tk5jK0RWbWU3enBL?=
 =?utf-8?B?VW0wMnB2NVZRbkkzRC9jdURML2Jnc2NoYW1uNnFwL2cxSmd5ODdoQmlPZktQ?=
 =?utf-8?B?a0VrU2pSZStSQVNsb0pBdmtSNXhsREt3WTMzSDRNMm42dm5KTS9ORTlsRlpZ?=
 =?utf-8?B?clgyczZVcjA1a2pSNWVYNXJFRGdNZ3cvRG4vQmZ5YTZkVW4rbDluajVrYlI5?=
 =?utf-8?B?NmlROVE5Q1V3b3hydENCTnQvT1hEczlOamxmRVk5NnlWSGRqMkJIV01BczJF?=
 =?utf-8?B?Wk9Oa1RobHVEYkZJVDVoTzZ1Y0gxajNNWGVJTTA5UDhROW0wVjQyTG1wNkhI?=
 =?utf-8?B?RmVjTU9MWjllN2JNNHpvcEdBaTBReGw2VWVzY251bWNEQmRFUnVlaGorZ1E3?=
 =?utf-8?B?dFBWWWM1OG8xMkRORFRNM2hiLzhiekpUWCtFMTBvRVIwK1lEOFZaWitBak9m?=
 =?utf-8?B?cm96UGROUnJtSWFFV29wbFYvMWZPQlA0UDNsdHN3N1UwRzVza2J1aGpPNFR0?=
 =?utf-8?B?MHRFSWEwQ2JoaVpjVEFOSW95VUJ6YkppOTFJK25NZDBUUks0Q2JKSVZxSmp5?=
 =?utf-8?B?Uk5PQ2x6ck1wcjkrcGdRY2duQU5CZDlDQm5XTEpqSTY4akFaVEIvQmFDNUVz?=
 =?utf-8?B?WWY1Y0l3YitibzFOd1BOczZKY2pYN0w2dTFnMGV4dFlJeVIvaTUwYVRzNnll?=
 =?utf-8?B?WHlJTFhZTkxUZG5GTE10SnZFaGdKRHFxZ28vRTQ5cGdTSVJYbW82WE9DRnJZ?=
 =?utf-8?B?MU5oOHZCdTF3PT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(10070799003)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WlVWbCt4N2ROTHp1bTJmTDZqdWZMSjAycXhyUzMwbWFjNC9nTzFXeGRVS1V5?=
 =?utf-8?B?ZXNOeHVSaitrNDV0Z0xhZWpGVW44ZTFHMmpLVXZKUzgycmMvekhnYTBPU3Y0?=
 =?utf-8?B?MFVYNG9JNnV2SUNUNk5nK0JaZkhrSWlsSzdCTTdnZnJpK0lVUmtURU1TaXBE?=
 =?utf-8?B?Snl2MHRiZ1lIekRLbWtiOGxpTFdrdHBqRjljT0lRRmJ3WWRaYmFHZWhQeGZj?=
 =?utf-8?B?eVE2aEthZHM0UEo3WFJoa1ZLM3pjREZsRDZ5ZTRUY2Z3dHdBUTN6UGw4dG4x?=
 =?utf-8?B?NXd3eVFnamk3MTRET25VOHcxbEpES1lVSUlsblRYWUMzaFVwY2QwYkxxRjQ5?=
 =?utf-8?B?NFVHM3ZPc2w5aytHUDNadE5ZTzZEZmREYjQzcTEyV3BTM0syMzBoV1NXaUtP?=
 =?utf-8?B?REw1cDAwWHNEVnBRbGgyWXNZVlhHYmptMVNxdExwY01mNCsrWmszTUJlS01u?=
 =?utf-8?B?SmR6L1FCazl4anAvdnZzME9aTlBqRTA3QzdGekJjcUxRTWRTeDhIMGo2MUpC?=
 =?utf-8?B?NThmRDdrZ1ZqMkE1N1dCdVJwS1huNTg5ek9DbEc4d09BMlBJdlRHU3JIbTd1?=
 =?utf-8?B?SXpBNVpjTXNMZEhhRlpaU002NDhaYjhaandSNW9FOGhEMzhoWkpWTFhtLzdv?=
 =?utf-8?B?RGtGYjVSWHpsTkpGOWVGUTBsT1dxRFBNdFN1M1A5UmQ5MG4vNy9XU05wMnB3?=
 =?utf-8?B?TXVPSzJZcXRpRlZ3QzJOWnMxZUZSUlBGZzZhSktBUStQMjBQR1JPc1F3MWxa?=
 =?utf-8?B?WGVTOXpYeUR2d3BOUUpmbE5sRFBKcGV0anhCdkZpWG5zeGdIcnFxYVg5RlZU?=
 =?utf-8?B?dVBhUm5RaXp5eUhnUUtJVm8zdUpkOGV2MHlhblJOS1FHWU4wTkdrVHJEY005?=
 =?utf-8?B?Tyt2Nk93WW0ySGtjbWdnaFFjNjBwdjZYV1BoZVFrRitTdjR2WjQ0QXNVSFZ2?=
 =?utf-8?B?d1NEczBnNlVLSis2aDN2ek14THNibnU3aXZmVXN2bjJmTFJWYUg0YlhZdHZM?=
 =?utf-8?B?TDluZ2srS3VRdTgyUE42MEdOMUlaMU5WV3BETmFienUyUGQ0ZXZpM1BJRXB2?=
 =?utf-8?B?UVhudkpsKzhIRkpDM3AyRFVjTUZBMU05ckRheTVscWFKdUxXNUd2bjk1Wk5l?=
 =?utf-8?B?ZTJWZTMyR0NydktXODdkYnpiTERJN2E0bWVncWJkemNZR2dJUlIyaS9OT1lJ?=
 =?utf-8?B?UXJTaXU2RVVER0ovRlhKTU1Hdk1CRXBCKy80UmtaY0hsT05jcnZOZ0ZvWGt6?=
 =?utf-8?B?eEFtdVg3Zm4rSkF3TDlHYVNTZWlRdVY5RXZqcCtBM0owcnpibTQzSFlHMVNn?=
 =?utf-8?B?RE0zTFp3SWFUUzZNTEJxYnZLRC9CdnI5S05GdmVDb1A3ZmxlS3JLcHY3UEN6?=
 =?utf-8?B?VHFFOFJjemRySkRERE8rRDM3UzRDQytMWWxabHA4eklrR045VTlFbThKd2tz?=
 =?utf-8?B?Vy9UVW5MUURpSEh2NHRFL1dldTlPbWMxdWhSTG5rd09xazlWaXlYVUtNTHdL?=
 =?utf-8?B?cklXMXYvd2IrNDBOS3dySzAySWZ1cXRHKzZLVmhxV2p4NFpXOTV1aGp4RWkr?=
 =?utf-8?B?T1Z2dXpxbWNzMWM3bjNmUVJTVjBzY1JBSXd0dUk1SW5nQ1VJYUdqOGNMQjVp?=
 =?utf-8?B?MzhvdVFHRElZUkk3R3FiMGJqOHU5MkRJL29RNlpnR1JDZGk1bE1LNTJqMnEy?=
 =?utf-8?B?K2hsT1R2cU5SeXA2WDEwSWJzbURKNW9BQWRrQ2NDRzhtQk8vSWdtMEFkRENq?=
 =?utf-8?B?akE5SFpnRDR6TkhiMUlyQTcyT2lOcHhoemFMVEkzTHhnemJpbjZWS25SYmFO?=
 =?utf-8?B?UUlRSFZvREJGcGVpWS9CUEpBN1NKWXNqdkh5T3JNZFZqOCtwaFZKVU5kQk9E?=
 =?utf-8?B?Qllhdjd5UDBldlhMd0N2TEQ2TzNnaDd3VTVLV2RzOGRrRzM3RnkrYWxGUktR?=
 =?utf-8?B?aU92M0g1aFZ6UHFnc3UxR3ViOEJ2Z0Q2ckg3dDAwaVdzeEVOSGJqZ0ZIY1Rr?=
 =?utf-8?B?K1FpMlM0NEpGRXdjZWcxcjhqbno2N3AvRDhoOFVmdUZuaHdReGRnWmxqSXhI?=
 =?utf-8?B?YlJDTXhNRHBicWtrL3pkaDRaMU9KYzlLS3VNbHBFb1FaZktXbmdnbmlaVTJS?=
 =?utf-8?B?VU16R1luc25CT2IwWkFPVXVudG1VS1ZQb01lL2NMWG1ORFdSQUgrRWQ5MWhz?=
 =?utf-8?Q?qGiKdb9WaWeypHoUnw4KUggP05PplG6Xnpw1WU0hCZqS?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 30ef16f1-9dfb-4fae-38f7-08de073567b7
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Oct 2025 13:11:48.9567
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4NQXLFVC8EMlaC3/poltjf0bzEecSwSFmL5QaiVfIU/kCIrfWopWSGKE883qLPiZ6MzGQ1Ut5Zka/hqsJDtVbg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB7475

On Thu Oct 9, 2025 at 9:41 PM JST, Danilo Krummrich wrote:
> (Cc: Alex)
>
> On Thu Oct 9, 2025 at 2:30 PM CEST, Markus Probst wrote:
>> On Thu, 2025-10-09 at 14:20 +0200, Danilo Krummrich wrote:
>>> (Not a full review (let's work out the dependencies first), but
>>> there's one
>>> thing that stood out to me.)
>>>=20
>>> On Wed Oct 8, 2025 at 8:10 PM CEST, Markus Probst wrote:
>>> > +struct Atmega1608Led {
>>> > +=C2=A0=C2=A0=C2=A0 addr: Atmega1608LedAddress,
>>> > +=C2=A0=C2=A0=C2=A0 id: Atmega1608LedId,
>>> > +
>>> > +=C2=A0=C2=A0=C2=A0 client: ARef<I2cClient>,
>>> > +
>>> > +=C2=A0=C2=A0=C2=A0 mode_lock: Arc<Mutex<()>>,
>>>=20
>>> Mutex<()> raises an eyebrow, since a mutex that doesn't protect
>>> anything is
>>> pointless. So, I assume it is protecting some data, but in an unsound
>>> way.
>>>=20
>>> > +impl Atmega1608Led {
>>> > +=C2=A0=C2=A0=C2=A0 fn update_mode(&self, mode: Atmega1608LedMode) ->
>>> > Result<Atmega1608LedMode> {
>>> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 let _guard =3D self.mode_=
lock.lock();
>>>=20
>>> What exactly does the mutex protect in the code below?
>> Otherwise there would be a race condition. Each register has 8 bits,
>> each led has 2 bits. If the led mode is updated at the same time with
>> another one in the same register, it could lead to the first action
>> being overwritten by the second.
>> Meaning if two actions run at the same time:
>> - led0 reads from the register
>> - led1 reads from the register
>> - led0 writes to the register
>> - led1 writes to the register (the changes for led0 have been
>> overwritten here, as it did read the register before led0 has written
>> to it)
>
> Ok, so you need exclusive access to a register. I think this is something=
 the
> register abstraction I also mentioned in [1] could support.
>
> @Alex: Have you thought about this already?
>
> [1] https://lore.kernel.org/rust-for-linux/DDDS2V0V2NVJ.16ZKXCKUA1HUV@ker=
nel.org/

I haven't at all. :) And indeed intuitively I couldn't say what would be
the right level to provide such concurrent access protection. When
someone reads from a register, there is no guarantee that they did so
with the intent of writing an updated value back to it, so I don't think we=
 can e.g. hold a
guard for as long as the read value exists.

Even the `alter` accessor does not take any lock for the duration of its
closure, so I don't think it protects us. OTOH, `led0` would hold the IO
resource for as long as `alter` runs, which should prevent `led1` from
accessing it? If so, I'd say that's the correct way of handling such
cases.

(drive-by comment: I will probably rename `alter` into `update` to match
the regmap API once the dust settles with all the code moves related to
register!())

