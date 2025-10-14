Return-Path: <linux-leds+bounces-5774-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id A9FAABD7240
	for <lists+linux-leds@lfdr.de>; Tue, 14 Oct 2025 05:08:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 91A004E2215
	for <lists+linux-leds@lfdr.de>; Tue, 14 Oct 2025 03:08:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7DF4F3074BE;
	Tue, 14 Oct 2025 03:08:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=hotmail.com header.i=@hotmail.com header.b="u9KktX85"
X-Original-To: linux-leds@vger.kernel.org
Received: from BL0PR03CU003.outbound.protection.outlook.com (mail-eastusazolkn19012022.outbound.protection.outlook.com [52.103.11.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FC073074AA;
	Tue, 14 Oct 2025 03:08:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.11.22
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760411312; cv=fail; b=QunetR7FeFNBncmaFDkzVPbVXArlJMB/PGhurY8Ltk951EoB1ABEtZZbCzeJSivJcDuB6zaeZ7kfSjrT6au/HouYITqiGQQReaCZAtyvsjT6YXXK9btM4i/w4s8KYc+9kXOc7PuCqf5DsNeS8NkmrTgOTSkIRwfRF1LmcLGlaG8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760411312; c=relaxed/simple;
	bh=n7TQBKTgKRYqiM8Xv0IcZM1K5f8GxIC0PMnHBXTr3/Q=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=C2i4EKAqER3w08r/D8OpUI0m7Jgm5dCDVWqw1vT+aV+Xj8aAL0HPs7cAXhUbh9r3XffqoBGWv1mEHKB8YYjwoMCQIjWsHV6ZnrlRiJYFn+LCFG1VYznyQOxX4fF34aTfx+HaQpbLul3nT1AO+Ks0liCie7Acoul61YtiJeYdw9o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=hotmail.com; spf=pass smtp.mailfrom=hotmail.com; dkim=pass (2048-bit key) header.d=hotmail.com header.i=@hotmail.com header.b=u9KktX85; arc=fail smtp.client-ip=52.103.11.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=hotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hotmail.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=E40Stk42wqsGHabWsxF1sSexPdzkSKAmIkqNs7RJAQiGAQNMM34k9s2Sd9mQW+TxvBWH9WoN7m3r9DfgljcfD5YT3ZpCSUMfpSs1QAoL8mphTwlAbvr7uScVm3P/md+FNY6xOpJJX4rB2hzUXY3+6Fk0y3bF1CwY5y08tWNLwh0b+HfZb3vL9KC9mdxpcPJAGmnnj3gLSsSZNqfeUGx5JDeHkOapefJhgbWSZy8/JSS7DXLat98E8vt+NGK/xazt+0586hPlPwZL4F0LhHFYEdxUfycMmppEDx1SkOhcB2GtjrrOej2haNwPnLgjkD5Q+A+ilEzG49+AaZRHAHQqKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=n7TQBKTgKRYqiM8Xv0IcZM1K5f8GxIC0PMnHBXTr3/Q=;
 b=m2dCGZnNiH0m0mK6QhKho0WSO0hDjOa9XldF8D3JgbZKdbgmkHtdQxuZeV3EjfE8ngcElGx/18KWVGb71/UNWbvQTWdz9uFQKamOEnjSwAhKUCZfhxz2l0dVTTj7gtHicq0IsoR+4Pg86yEEotKH1FDq+IfJCSXKzO5A4GgU+gczZcNm86eiBD6l263ZsvNb7DqKlp0R0Rw/WVxs6/F5IXQBCthTdsCBeNziWf8dskLDQYUbmc1oghY5nsxqD0uHGLH8qxHeNHTvqSoxy2X4PXXiHAV7AqTywq+AGhEncQGAdGhTnjBMzDpcCssiCdeSsv3kJu3bz9SoLKEUFVnTyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n7TQBKTgKRYqiM8Xv0IcZM1K5f8GxIC0PMnHBXTr3/Q=;
 b=u9KktX85LX8aFexJv1mWKWdfQCRSCBNt+1EdjjIwVDL94vsCPBnc7Fjtoc9jF7KguQAqs+VQucMa+r4XREO66kDWJFW0ACKrb8XrinYcOmzEJBcsywf6rdkLj8aMG8Wt9jiL4gjNIs4mVBSDGdPI3V7skRTV/+L69Lm09CkXv9luu8kf5TzSxdpnuBxsCubMyz3rXOcyvkxQk60pFEAAXAMGI7ulhaKsljYP8knOPyKUSuQSScuaV3kS2pUJvAgS/cyfnNBrl+ghTfWov3rZzZ59N88bYPl06wBXe/eVIFARYkyMG2KRaNYRF0v6yM5dgdCW1f5N7MdXnyMCySIiyQ==
Received: from DS0PR84MB3746.NAMPRD84.PROD.OUTLOOK.COM (2603:10b6:8:1aa::21)
 by CH3PR84MB3594.NAMPRD84.PROD.OUTLOOK.COM (2603:10b6:610:1be::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.13; Tue, 14 Oct
 2025 03:08:24 +0000
Received: from DS0PR84MB3746.NAMPRD84.PROD.OUTLOOK.COM
 ([fe80::478a:57e4:fdbe:4a6c]) by DS0PR84MB3746.NAMPRD84.PROD.OUTLOOK.COM
 ([fe80::478a:57e4:fdbe:4a6c%7]) with mapi id 15.20.9203.009; Tue, 14 Oct 2025
 03:08:24 +0000
From: Jonathan Brophy <professor_jonny@hotmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, Jonathan Brophy
	<professorjonny98@gmail.com>, lee Jones <lee@kernel.org>, Pavel Machek
	<pavel@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Radoslav Tsvetkov
	<rtsvetkov@gradotech.eu>
CC: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>
Subject: RE: [PATCH v2 1/4] dt-bindings: leds: Add YAML bindings for Virtual
 Color LED Group driver
Thread-Topic: [PATCH v2 1/4] dt-bindings: leds: Add YAML bindings for Virtual
 Color LED Group driver
Thread-Index: AQHcPDpePUkxoQbHUU+bPIfSeqL1DrTAvWyAgAARi4A=
Date: Tue, 14 Oct 2025 03:08:23 +0000
Message-ID:
 <DS0PR84MB374636FF53989F5D94D821D49FEBA@DS0PR84MB3746.NAMPRD84.PROD.OUTLOOK.COM>
References: <20251013120955.227572-1-professorjonny98@gmail.com>
 <20251013120955.227572-2-professorjonny98@gmail.com>
 <8c3796eb-63d0-4650-b296-60894461a806@kernel.org>
In-Reply-To: <8c3796eb-63d0-4650-b296-60894461a806@kernel.org>
Accept-Language: en-NZ, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS0PR84MB3746:EE_|CH3PR84MB3594:EE_
x-ms-office365-filtering-correlation-id: 36de4378-9bb7-41fe-4581-08de0acef00b
x-microsoft-antispam:
 BCL:0;ARA:14566002|31061999003|461199028|8062599012|8060799015|19110799012|12121999013|13091999003|15080799012|3412199025|440099028|4302099013|40105399003|10035399007|102099032|1602099012;
x-microsoft-antispam-message-info:
 =?utf-8?B?ZjBmaURJNzA0Q1JSUkJ1cUgyanJRZkl3OVNnK2pBalV2d3RaYlgzYW5UOWlQ?=
 =?utf-8?B?QkFZYW1zS05oemRGTURuOEZ1NitlN2pYSndKeTVpOFlFUFJkWlRtWERHYlVk?=
 =?utf-8?B?UXN6Q1BKeDFtUlJ6OGdHTmtKVWxkSE55N3g5Wlpzcmc1bVEvaUgwbEZ0N1pv?=
 =?utf-8?B?bDZ4cXNVUHc1ZU9GYzZoWEMrS3NucTVsbXkxMDk2YnlLc1hnU2RwdXkyZGZF?=
 =?utf-8?B?Qi9ORFFmNk1SUUVGVEx2aXBGVFBMUnJ4bHV5SWdlQmc4cVd3VmFzS1N3WVls?=
 =?utf-8?B?Y0tHZHJHR0VzL1kvVEJySlNvcENXQWs5TWMxSHVxaFRRMTlJVENmcSszMEVD?=
 =?utf-8?B?L012RGlzYytMNEZNWW5VWG02QkF0QnJiZ3lxb2ZQUU5zS00zM2krSlFNNktU?=
 =?utf-8?B?T29uTGdNTUJJdGtOWXJ6TXdKdWJHRHZaNE01VDZCK1RPUFpnenRUamlGUEhP?=
 =?utf-8?B?aGJCa005Nno5eXkydWxKNllJRDNxQkw4UDNEZXBpR1BQUExFbUpvaS9xQ0cw?=
 =?utf-8?B?MWRYTXM4aXh3MnE2bnVadTViRUpHbHM2WE1wM0t3TW5XMkIweS9NTFd6N1pL?=
 =?utf-8?B?bnVGazZieFdzc3RwNmlCZGkyWGQzWUtQc1ViU2lwTWpzMWttYi9ncjNidCtK?=
 =?utf-8?B?QlR2VXpXblNEL0FPQTdCTk1VeUtIaFVwaTJ2UzZ3bllBR0lEOU84UXFyV1NS?=
 =?utf-8?B?S1k4YTJPRnJqZ3owaGMyamJGL2RHRFJSak5SWGQ2VWVHeHIzZ2JHK3Jld0NM?=
 =?utf-8?B?c0N6YVNwby9GUUNzeW9FdFhVdkMvSXIzdFdUK05vK2ZjZk5iMlo3V0JEcUVV?=
 =?utf-8?B?OTZIdk5ZdVVLbGxPZnEzbUFkMVd1RW9QaHd5NDY5R0JHZU5QTzhJcHBTdkNN?=
 =?utf-8?B?TTl2bGIwcCtmeWFJZVNyS1dFT2Q3UEtnNmR1My94MVJpdGJzVXFwSTlWMHEw?=
 =?utf-8?B?SUJqL05vUWZ6N3cvVk9ON0ZxY1Y3WXNGY2VKWllRRVRjRkppVGJzZnM3QkND?=
 =?utf-8?B?a01JTHBkZ3Y2S1Flditvb0N6M0pCdGpRL3dMdXdPazZHUEpEa2VXQmlhQjdq?=
 =?utf-8?B?ejNIN2licDRiYmNvZmNBR0xSZ1FZdUwya3ROdW5ZTGhqTldaMVN5ZHB1TXRy?=
 =?utf-8?B?dTEyZTBJTzFlQXdDd3oyenNOUVZ5cEx5djlXVk5mdjhJWkx6YXNJQkRNYTI4?=
 =?utf-8?B?WCtuZmN3WW5wc3RxUGNkTDE2VXVQV3VlaFVDMnIwTndLSGVoVHF0RVNHR3Ax?=
 =?utf-8?B?ejU2NE1UbktlWDRyRThKZG9xZkJjOTFKdTdISnltczY1WlREUmx3WEhCVmth?=
 =?utf-8?B?ZG5zb1RoVE83UnhVQzl2Z3RWM3c5UGZxT1AvdS81VUs5Zy90OWRrc1c4MEln?=
 =?utf-8?B?YjVIY1FsT0VweGJCZTdHVHd6ZktQcVZTdkhtMU01UXRmclJYU2NmQzFYYzEz?=
 =?utf-8?B?NWhjcVd2bVJ3SzUrWWs1aHUydDBlanZtNDdGWDU5ak9waU51UER6S0d1RjVr?=
 =?utf-8?B?YUd6K0Z4M0lWTllJTDNoZHBuYTdsU0dKZWh5bWFqQTl5cm16MmRFcGl4em01?=
 =?utf-8?B?RE5KbCs4SVM5U0k3NFZNN0J4bmVUWVRHTFdpaCtCVEZDUXN2enRGaWl2WnZz?=
 =?utf-8?B?TWJwSjJXUW5kVGZ6eWNWZ3RCSzB1dDJMbHdqdzZKUXJuQ3VMY2VEenZPWHNs?=
 =?utf-8?B?V0htbzllNUdWc2svUFE0M3ZhZ3FCZXdNWFY2Qm1KbE1FbU9oZ29ONi9iUHFa?=
 =?utf-8?Q?kpjAiCJK1dRvZAIIf0=3D?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?MC9XRnVsbzV2dG92QUs3RTNkWVBLaTJZYzFZUUxQdWFIMEM4Ky9EOWRlellv?=
 =?utf-8?B?R095dzZsajhSZzVxUmNiTW15Q1UrcWh4anJxbUZXWVV1Nk80MXNFbTlDVnNS?=
 =?utf-8?B?WG9vdHdBa09tNWtBOWlkMlk2K3Q3VFRnNW1iYlNQTDNsem1VdHNFSCtWRXhC?=
 =?utf-8?B?emVDSXBTTDNscmtqYWJQbCt0bnJLVmxIRGVJM2twVm5xaGFBZWtEdlYyU1du?=
 =?utf-8?B?V2w5UldMaVUzbUZNbkRJUHJidEcvVTdwak1ybzFncUNubXpFR002T1ErbWJn?=
 =?utf-8?B?WjE4OG1QK2p2SmxMTURQRlMxNXJUOEFwcU1zTWFLZHZiZm5TZHBHYlRVclVk?=
 =?utf-8?B?UWxMNk43MlBFOEZncXBYVWFoak5obUVZNForSXBWTUJjRzM2YTluUXgwYWZV?=
 =?utf-8?B?MTlpem1JalQ4eEtJQnlHOXRROHNPY2huK0I0N0Y1WVFld0dGL01McHRLWDBF?=
 =?utf-8?B?M0s5NDdQaFp4T044UkMzdE5TcUhyNGJrNTJNZXVXSnh1ek1UN1p6Q0kzNUNZ?=
 =?utf-8?B?NzExZXdJc1pIZy9mRlZhS1B2Vm81Q2wyYkJuUVJhUEtxQ0xpM1dENWhUaTRG?=
 =?utf-8?B?b1FPcEdhVWtqUUNaTC9LM3RJT2xETy9tcGhtM1VKRXJrdmd0YUxDenphUDda?=
 =?utf-8?B?NitrY3NtdDdrSW9ZcnBTNGk2R3IwSHRvaGlNV1dLQWkzSGQ0QTVUMUc0S3dx?=
 =?utf-8?B?QytRakJpU0hESVBZdVo3bzNkNFUrT21xQlZBVUlyM1Q5SDUrRVVqaDdWYXdz?=
 =?utf-8?B?SCtnME9ZYUt1RWVpUC9GY3NVR1hpdkQyTVIzMjdLNC9CNE94S1h6aHNRYW52?=
 =?utf-8?B?ZVV1U0NicTFFUk5kUnkvWko3T3RHLzlrYzhrVzN3N3ExR1V4UDREeDM4ZCtx?=
 =?utf-8?B?bXZGbURqRGpUdmlWV2k5RC8xNVhvMTM4dkExc1ZGQ1ZsTVBRMlM3cXh1SG5R?=
 =?utf-8?B?VVptMHVCeVJzNVVFcWxZUWtXc1d3L0JGZ2o1NDN0MTR6bTZHWkxJL3BGOHJC?=
 =?utf-8?B?MkJFOG9hQ0hVT3hoY1hxTkRKNS9qempVUUdick5MYkE3VHB2V3paYkgwRHFp?=
 =?utf-8?B?YjdMWldob3BWTGczWlhBa0ZNelNpZTFPZVpZaWd6bW0xMUlZMEVTcUhwMmlU?=
 =?utf-8?B?RzVnUXM4SlpjUko3cU1jMEFvdWtJc1pUMkhtc2ZFclFBRVRoTHZrbFllMi9P?=
 =?utf-8?B?ekx0dEZaNjNTc0ZaOFFyUWdaU05nd0J1ZEUyVFZBQXAzVXFVeWx4RXVpNlRu?=
 =?utf-8?B?cTVlWEtTZStGV1h6ZFJyZkZuOFQ2K09admYwR1QwZlJicFpYeHRmbnVoU0tr?=
 =?utf-8?B?M3BzcGFZTU5zS0ZFdUFmMEMrTjRvaDVHc254UktQQWtBZ256KzJxY1FnenBP?=
 =?utf-8?B?UmE5TGw3dW1EWWhpVXdpQ2xXZ2RDVHBLY2h5dEpLUUpQMUIvWTliVmszVzF5?=
 =?utf-8?B?b21NOTBkWUMrK2R2YnRkSWJxY09QRWxBbzRNbkNFSXFOeHlNaXNuYU55M3Js?=
 =?utf-8?B?NGU1MHI3N0wzaHc5c1NrV1VZekRSb0tVNlNBNm5TZG1PaHpLeWpHRk90TDlr?=
 =?utf-8?B?bFI2MWxlcDFpenRxZ2tCaFh3ZE1LSkMrYkpOVDNMaUo1Z3VGMDNPajVvbFc5?=
 =?utf-8?Q?Oek7oCbLtv5BPe1o5OulDfjjp13GX8Yi/Hlrz+JhBlD0=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: sct-15-20-8534-20-msonline-outlook-774d9.templateTenant
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS0PR84MB3746.NAMPRD84.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 36de4378-9bb7-41fe-4581-08de0acef00b
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Oct 2025 03:08:23.9812
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR84MB3594

b24gIDE0LzEwLyAxMjo0MiwgS3J6eXN6dG9mIEtvemxvd3NraSB3cm90ZToNCg0KPj4gRnJvbTog
Sm9uYXRoYW4gQnJvcGh5IDxwcm9mZXNzb3Jfam9ubnlAaG90bWFpbC5jb20+DQo+PiANCj4+IERv
Y3VtZW50IFZpcnR1YWwgQ29sb3IgZGV2aWNlIHRyZWUgYmluZGluZ3MuDQo+DQo+SSBkb24ndCBz
ZWUgaG93IHlvdSBhbnN3ZXJlZCBteSBjb21tZW50IGFib3V0IG1pc3NpbmcganVzdGlmaWNhdGlv
bi4NCj4NCj5Sb2IncyBxdWVzdGlvbnMgYWxzbyB3ZXJlIG5vdCBhbnN3ZXJlZC4NCg0KT2sgSSBr
aW5kIG9mIGp1c3RpZmllZCB0aGUgaW5jbHVzaW9uIG9mIHRoZSBkcml2ZXIgaW4gdGhlIGNvdmVy
IGxldHRlciBjb21taXQgbWVzc2FnZSwgYXMgZm9yIHRoZSBtdWx0aS1sZWQgYmluZGluZyBJIGhh
dmUgZG9uZQ0KdGhlIHNhbWUgdGhpbmcgSSB3aWxsIG1ha2UgY2hhbmdlcy4NCg0KU29ycnkgSXTi
gJlzIGEgYmlnIGxlYXJuaW5nIGN1cnZlIGZvciBtZSBhbmQgSSBtYXkgaGF2ZSBwdXQgbXkganVz
dGlmaWNhdGlvbiBpbiB0aGUgd3JvbmcgcGxhY2UuDQoNCg0KPkZldyBtaW5vciB0aGluZ3MgZm9s
bG93IHVwLCBidXQgY29uc2lkZXJpbmcgbWlzc2luZyByZWFzb25pbmcgSSBkaWQgbm90IHBlcmZv
cm0gZnVsbCByZXZpZXcuDQo+DQo+QSBuaXQsIHN1YmplY3Q6IGRyb3Agc2Vjb25kL2xhc3QsIHJl
ZHVuZGFudCAiWUFNTCBiaW5kaW5ncyBmb3IiLiBUaGUgImR0LWJpbmRpbmdzIiBwcmVmaXggaXMg
YWxyZWFkeSBzdGF0aW5nIHRoYXQgdGhlc2UgYXJlIGJpbmRpbmdzLg0KPlNlZSBhbHNvOg0KPmh0
dHBzOi8vZWxpeGlyLmJvb3RsaW4uY29tL2xpbnV4L3Y2LjE3LXJjMy9zb3VyY2UvRG9jdW1lbnRh
dGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3N1Ym1pdHRpbmctcGF0Y2hlcy5yc3QjTDE4DQo+DQo+
Li4uIGFuZCBkcml2ZXIuIEFnYWluIC0gZXhwbGFpbiB0aGUgaGFyZHdhcmUuIEJpbmRpbmdzIGFy
ZSBub3QgZm9yIGRyaXZlci4NCg0KSSdtIGtpbmQgYSBsaXR0bGUgYml0IGNvbmZ1c2VkIHdoYXQg
eW91IG1lYW4gYnkgdGhpcyBzdGF0ZW1lbnQuDQoNCkknbSBndWVzc2luZyBJIHNob3VsZCBvbWl0
IGhhcmR3YXJlIGluZm8gaW4gdGhlIGNsYXNzIHlhbWwgYW5kIG1vdmUgaXQgdG8gYSBncm91cCB5
YW1sIGxpa2UgdGhlIG11bHRpY29sb3Igb25lcyBhcyBiZWxvdz8NCklmIHNvIHRoYXQgaXMganVz
dCBhIG1pc3Rha2Ugb24gbXkgcGFydCBub3Qga25vd2luZyB0aGUgZmlsZSBzdHJ1Y3R1cmUgd2Vs
bC4NCg0KaHR0cHM6Ly93d3cua2VybmVsLm9yZy9kb2MvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVl
L2JpbmRpbmdzL2xlZHMvbGVkcy1jbGFzcy1tdWx0aWNvbG9yLnlhbWwNCmh0dHBzOi8vZWxpeGly
LmJvb3RsaW4uY29tL2xpbnV4L3Y2LjE3LjEvc291cmNlL0RvY3VtZW50YXRpb24vZGV2aWNldHJl
ZS9iaW5kaW5ncy9sZWRzL2xlZHMtZ3JvdXAtbXVsdGljb2xvci55YW1sDQoNCj4+IA0KPj4gK2Rl
c2NyaXB0aW9uOiB8DQo+PiArICBCaW5kaW5ncyB0byBzaG93IGhvdyB0byBhY2hpZXZlIGxvZ2lj
YWxseSBncm91cGVkIHZpcnR1YWwgTEVEcy4NCj4+ICsgIFRoZSBub2RlcyBhbmQgcHJvcGVydGll
cyBkZWZpbmVkIGluIHRoaXMgZG9jdW1lbnQgYXJlIHVuaXF1ZSB0byB0aGUNCj4+ICsgIHZpcnR1
YWxjb2xvciBMRUQgY2xhc3MuDQo+DQo+VGhhdCdzIGNvbXBsZXRlbHkgcmVkdW5kYW50IHN0YXRl
bWVudC4NCg0KT2sgZmFpciBlbm91Z2gsIGJ1dCBJIGJhc2ljYWxseSBjbG9uZWQgdGhpcyBjb21t
ZW50IGZyb20gdGhlIGxlZHMtZ3JvdXAtbXVsdGljb2xvciBhcyB0aGV5IGhhdmUgc29tZXRoaW5n
IHNpbXVsYXIuDQoNCj4+ICsgIENvbW1vbiBMRUQgbm9kZXMgYW5kIHByb3BlcnRpZXMgYXJlIGlu
aGVyaXRlZCBmcm9tIHRoZSBjb21tb24ueWFtbCAgDQo+PiArIHdpdGhpbiB0aGlzIGRvY3VtZW50
YXRpb24gZGlyZWN0b3J5DQo+DQo+QXMgd2VsbCBkcm9wLiBZb3VyIGRlc2NyaXB0aW9uIGlzIHBy
ZXR0eSBvYnZpb3VzIGFuZCBkb2VzIG5vdCBoZWxwIGF0IGFsbC4NCg0KT2sgdGhhbmtzDQoNCj4+
ICsgICAgcHJvcGVydGllczoNCj4+ICsgICAgICByZWc6DQo+PiArICAgICAgICBtYXhJdGVtczog
MQ0KPj4gKyAgICAgICAgZGVzY3JpcHRpb246IFZpcnR1YWwgTEVEIG51bWJlcg0KPj4gKw0KPj4g
KyAgICAgIGxlZHM6DQo+PiArICAgICAgICAkcmVmOiAvc2NoZW1hcy90eXBlcy55YW1sIy9kZWZp
bml0aW9ucy9waGFuZGxlLWFycmF5DQo+PiArICAgICAgICBkZXNjcmlwdGlvbjogTGlzdCBvZiBw
aGFuZGxlcyB0byB0aGUgbW9ub2Nocm9tYXRpYyBMRURzIHRvIA0KPj4gKyBncm91cA0KPj4gKw0K
Pj4gKyAgICAgIGZ1bmN0aW9uOg0KPj4gKyAgICAgICAgZGVzY3JpcHRpb246IHwNCj4+ICsgICAg
ICAgICAgRm9yIHZpcnR1YWxjb2xvciBMRURzIHRoaXMgcHJvcGVydHkgc2hvdWxkIGJlIGRlZmlu
ZWQgYXMNCj4+ICsgICAgICAgICAgTEVEX0ZVTkNUSU9OX1ZJUlRVQUxfU1RBVFVTIGFzIG91dGxp
bmVkIGluOg0KPj4gKyAgICAgICAgICBpbmNsdWRlL2R0LWJpbmRpbmdzL2xlZHMvY29tbW9uLmgu
DQo+PiArDQo+PiArICAgICAgcHJpb3JpdHk6DQo+PiArICAgICAgICAkcmVmOiAvc2NoZW1hcy90
eXBlcy55YW1sIy9kZWZpbml0aW9ucy91aW50MzINCj4+ICsgICAgICAgIGRlc2NyaXB0aW9uOiBQ
cmlvcml0eSBsZXZlbCBmb3IgTEVEIGFjdGl2YXRpb24NCj4+ICsgICAgICAgICAgKGhpZ2hlciB2
YWx1ZSBtZWFucyBoaWdoZXIgcHJpb3JpdHkpDQo+PiArDQo+PiArICAgICAgYmxpbmstZGVsYXkt
b246DQo+PiArICAgICAgICAkcmVmOiAvc2NoZW1hcy90eXBlcy55YW1sIy9kZWZpbml0aW9ucy91
aW50MzINCj4+ICsgICAgICAgIGRlc2NyaXB0aW9uOiBUaW1lIGluIG1pbGxpc2Vjb25kcyB0aGUg
TEVEIGlzIG9uIGR1cmluZyBibGluaw0KPj4gKw0KPj4gKyAgICAgIGJsaW5rLWRlbGF5LW9mZjoN
Cj4+ICsgICAgICAgICRyZWY6IC9zY2hlbWFzL3R5cGVzLnlhbWwjL2RlZmluaXRpb25zL3VpbnQz
Mg0KPj4gKyAgICAgICAgZGVzY3JpcHRpb246IFRpbWUgaW4gbWlsbGlzZWNvbmRzIHRoZSBMRUQg
aXMgb2ZmIGR1cmluZyBibGluaw0KPj4gKyAgICAgICAgbm90ZTogU2V0dGluZyBqdXN0IG9uZSBv
ZiB0aGUgYmxpbmsgZGVsYXlzIHRvIGEgdmFsaWQgdmFsdWUgd2hpbGUNCj4+ICsgICAgICAgICAg
c2V0dGluZyB0aGUgb3RoZXIgdG8gbnVsbCB3aWxsIGNhdXNlIHRoZSBMRUQgdG8gb3BlcmF0ZSB3
aXRoIGEgb25lLXNob3QNCj4+ICsgICAgICAgICAgb24gb3Igb2ZmIGRlbGF5IGluc3RlYWQgb2Yg
YSByZXBlYXQgY3ljbGUuDQo+DQo+DQo+QW5kIGRyb3AgYWxsIGFib3ZlLCBleGNlcHQgcmVnIGFu
ZCBsZWRzLiBJZiB0aGVzZSBhcmUgbmV3IHByb3BlcnRpZXMsIHRoZW4geW91IG5lZWQgdG8gdXNl
IHByb3BlciB1bml0IHN1ZmZpeGVzLg0KPg0KPmh0dHBzOi8vZ2l0aHViLmNvbS9kZXZpY2V0cmVl
LW9yZy9kdC1zY2hlbWEvYmxvYi9tYWluL2R0c2NoZW1hL3NjaGVtYXMvcHJvcGVydHktdW5pdHMu
eWFtbA0KDQpUaGFua3MgZm9yIHBvaW50aW5nIHRoaXMgb3V0IEkgZ3Vlc3NlZCB0aGVyZSB3YXMg
YSBkZWZpbml0aW9uJ3Mgc29tZXdoZXJlLA0KQXQgdGhlIG1vbWVudCB0aGUgYmxpbmsgc2V0dGlu
Z3MgYXJlIHVuaXF1ZSB0byB0aGlzIGRyaXZlciBJIHdlbnQgdGhpcyB3YXkgYXMgd2Ugd2VyZSB0
cnlpbmcgdG8gZ2V0IHNwZWNpZmljIGJlaGF2aW91ciBhcyB0aGUNCm5hdGl2ZSB0aW1pbmcgZnVu
Y3Rpb25zIGRpZCBub3Qgd29yayBhcyBpbnRlbmRlZCwgYnV0IEknbSBsb29raW5nIGF0IHJlcGxh
Y2luZyBpdCB3aXRoIHN0YW5kYXJkIGZ1bmN0aW9ucyBpZiBJIGNhbiBnZXQgaXQgdG8NCndvcmsu
DQoNCg0KQmVzdCByZWdhcmRzLA0KSm9uYXRoYW4NCg==

