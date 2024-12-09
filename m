Return-Path: <linux-leds+bounces-3551-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id CB8719E9A71
	for <lists+linux-leds@lfdr.de>; Mon,  9 Dec 2024 16:25:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AF58A1886199
	for <lists+linux-leds@lfdr.de>; Mon,  9 Dec 2024 15:25:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 55DD31BEF83;
	Mon,  9 Dec 2024 15:25:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=siemens.com header.i=@siemens.com header.b="ze0Rotfq"
X-Original-To: linux-leds@vger.kernel.org
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2041.outbound.protection.outlook.com [40.107.22.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EB3F233132;
	Mon,  9 Dec 2024 15:25:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.22.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733757911; cv=fail; b=lit1aKU4gBW43KcSiFDUOd3DO3qQ4L4OxeAW6dsh2gIf0whYgrsILxv9pNUKa95NHj4GuGD3y9yqwioyVZFW3OYtxHs6ySzDFNBz0PhnVi4csP6Wrbdyx4X2cujUkNB1nyM0bAP4Ozs3C30TFK3JbZBXADWNnY9KPr3nSBnzTd0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733757911; c=relaxed/simple;
	bh=Ou6uAEemsNxF6GiSIAAkbbpzyVm39lcouyzWZcROMc8=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=p3NkoWOR4oAbyOZy1h7XH6wnbsL5U62+/gxaftgG++Ex0pG7eqzxhuDP/O90qKrQdepAGMzrukb1nhzcKXp0ZQcJt+olrqXZtIylOm/mwcyjpJMg2aJfmv9vWvcCGriC7QTelTGNFNWHrKwWwzMAM91MAboiDkX1sNt+1lpKsPY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=siemens.com; spf=pass smtp.mailfrom=siemens.com; dkim=pass (2048-bit key) header.d=siemens.com header.i=@siemens.com header.b=ze0Rotfq; arc=fail smtp.client-ip=40.107.22.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=siemens.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=siemens.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UAZuRQ6zidiSea2nrOgDcx4oKNN2XBnv+PuTPZhOVI4WqJNLUnTvhKzHjaqDOWs0sRPxL0eLebPby7GkbDjYWmgciNzNxPby6VhtEDdU3CmABElayNOKWIsQQYqwes6mdowp24LfKQgP1eiUzNrSzZbYVBAyr5ROEyve4wL3HDNm42uJQ0rFmtjKNFMbBCV5apg69Wp7EmnNGkH8REaEN9KB37jherd1Fwk/1XdV5Pl+tN98E3YLFuB3NFnXGx3q7UryY9Dv39KrRki7Nwo3cqisyDmpnvWDyGcYrp8Nb4cE3BBLUcO5WMkywjFLAofKpLhTccYmuvD4tqZAVYZjyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ou6uAEemsNxF6GiSIAAkbbpzyVm39lcouyzWZcROMc8=;
 b=Cvfw3910ArLOCWUaBvzwBc6EQGBh1KpV/RUPVS9GuZIU3Ak39oYUgJdQYVDpmlXjXPlPtAm/Qevxhz2y2G8eETFqEnikc3uyojNonjb6mb7LR1Wh+++IEA5zrAWz55RtaMO8X/CjYPhXB+43DLnLd9MQddMXRL6Jhu0Qn0eUcEgdEfJ9TAsyXD6eLUO9h2i8NrVrz6eJAXTNBDSSxjFvhxhs5LAQPKoVnWP0Hz0UGQk3i7xs8CawJfj9/ilyy4GbJVu/NICrDH5YsUoz61kk7g8J4lgskbTvWOIhwx+Aww7WPiJkz7uYLQerk9p9NZnZtb/T1gF8L8iHQwIXL4g3WQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ou6uAEemsNxF6GiSIAAkbbpzyVm39lcouyzWZcROMc8=;
 b=ze0Rotfq4A7bzRZVaq7HxVjMGoUI3eOfDnkuHl1WjgYSWtEOGYK//NoxJFKc275QG5Ji69yyVJGQWll6j+RhCyTZh5waqEQe6FBxHzD3crR6Aul91CB9/cl+M4cEQ65zW9eZYXrTx+n9B1Et0knDhwfypnv+d2lYPB1hRN832RhfjZZImXbP/NRudCUuOtBt1YNMJZe6dH0oyPBpvhldeELPv0WLUCLHjE5Swd3NnTAhXY3arIVNLK6yPpKl+5mqsNTqyQc+ke8fGU9TcR9IIVoWSg45gMGohQ9fbYliBvcOpIkVnt6XqrwD3s4XgBa1lo55Akd3Mgd0a4rIUDKT+g==
Received: from AS8PR10MB6867.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:5b6::22)
 by DB9PR10MB5401.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:336::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.12; Mon, 9 Dec
 2024 15:25:06 +0000
Received: from AS8PR10MB6867.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::baa6:3ada:fbe6:98f4]) by AS8PR10MB6867.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::baa6:3ada:fbe6:98f4%7]) with mapi id 15.20.8251.008; Mon, 9 Dec 2024
 15:25:06 +0000
From: "Sverdlin, Alexander" <alexander.sverdlin@siemens.com>
To: "conor+dt@kernel.org" <conor+dt@kernel.org>, "afd@ti.com" <afd@ti.com>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
CC: "robh@kernel.org" <robh@kernel.org>, "lee@kernel.org" <lee@kernel.org>,
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>, "linux-leds@vger.kernel.org"
	<linux-leds@vger.kernel.org>
Subject: Re: [PATCH] dt-bindings: leds: Convert LP8860 into YAML format
Thread-Topic: [PATCH] dt-bindings: leds: Convert LP8860 into YAML format
Thread-Index: AQHbSB350fispC8PgkisY35Mqsl9dLLd/SQAgAAB7QCAAAgkAIAABZkA
Date: Mon, 9 Dec 2024 15:25:06 +0000
Message-ID: <4fe345a1fffbd75aab8473ad0dcb1f0dfb952bb2.camel@siemens.com>
References: <20241206203103.1122459-1-alexander.sverdlin@siemens.com>
	 <de6039a6-b7e6-4960-afcc-5f0d29fb27a8@ti.com>
	 <8e1122977b316ca16e9eec0850ed470c31ae9f24.camel@siemens.com>
	 <d1122a33-5735-4000-98b3-ae9b1ed73008@ti.com>
In-Reply-To: <d1122a33-5735-4000-98b3-ae9b1ed73008@ti.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS8PR10MB6867:EE_|DB9PR10MB5401:EE_
x-ms-office365-filtering-correlation-id: 008d748d-9473-47c6-10da-08dd1865a8e6
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?elQ4ZjU5bkNza2hCTUJNb09MT3pRbmZXeUtCM0xXSjA4dEpjbVRtUEhUTCs5?=
 =?utf-8?B?bzZKT1ZWbDUzQTNsWEVKeEVqUERZMTRJTWNKb1Y3MDdnTGJwb1hDOUZ0VVpK?=
 =?utf-8?B?RUk2TkV4dVhXeDRlUEl2Rnc1MzZ1RU9SRkRqNndCc2RYK2lRd0hoMXdWNUpn?=
 =?utf-8?B?N0I2bHNWZjRRbXJzelFIcnRZK25EVG41TFl4TXpsVnVROFhERTJZSDhhSk9t?=
 =?utf-8?B?NU83V2JXc2RjaWZHek9XVGI5QytRRmJsRFMvamd4bUx2a2xwY3lBNU1aVVFR?=
 =?utf-8?B?S3BDWE9MYXVUYi8rd3ArRkNVZWl3bTRwMlcxYTF0TXNpbG5DSVd1MTV6RXVw?=
 =?utf-8?B?MkFJSmpGazFvZU83dnFyeFBHTkEyNXRNY2ZJN2kvM1c0V2FJdm42bUtQSzE2?=
 =?utf-8?B?TDg5R1Exa1p0dWYwV0plOWkzanJVcTNGb1F3L0gxb3YxdHpTMUQ3MmkxcmZI?=
 =?utf-8?B?NDVyNm9qZVFxd1Jrcldndll0NkN4RFhsLzZkb3c3Rm1KZEpaY0UzS1pLVTMy?=
 =?utf-8?B?TW0wdFhhTWpQc294d0JMalpldUNBTjlxbEFoMmRRMEdKT1RITGM3RGNuTTFQ?=
 =?utf-8?B?V2Y3UjZKQzBTaUdlN24xSzJXY0lOWnFxNGxxRjdSUXFLaldvTHQ2WEJKNFlY?=
 =?utf-8?B?TkVPMUdXUStjbVR2RGtNd2doOTRLMXVGS0JYWFhRR1I1YmlENEZtNUlmcHpZ?=
 =?utf-8?B?eGo4MEI2UVRBVVNvbDF4d1pHTVJLbVl6ZG1pTldjNlZLTUxXeHJUMGlJWWhD?=
 =?utf-8?B?cHRaZHFhTzJyOUJTU1JnLzFVMUVzSUpJSWhodE12UkEwM2JrZmZPL0Jna3N4?=
 =?utf-8?B?Q0JKNVd3SDIwbDZvQXFwK1k3alRDTVM3Y0srZUh5c0FuR2RPYlFEUm0yTDJD?=
 =?utf-8?B?ODJuWWtnUWNzMWtPOVhEVldjanlNaDFJRDFaTWxMWGtMMnBsOXpmekdoNkJw?=
 =?utf-8?B?N2lTdzVteTFjLzhjZit1MEorNkJEcldXYm43a1VGS2hVSHZZWXlGaTRYdHRO?=
 =?utf-8?B?N3RjWmNvQ3VrTnlTeTZmN3Nka1c2TTBGdEV1ZWxGZ2EweE5taWZPMFV3ODFH?=
 =?utf-8?B?b0RIMmQvMEh3L0tuZjJBMUM2L21KeHBTVmNYeXJEdWJIeWwxdUlBbmJLZE5i?=
 =?utf-8?B?T2d2cmlBM0I0NGVKVUFhVGhZbUkvTGhhZVpFTHdsR1FYMkEraGNkbmxCVkVF?=
 =?utf-8?B?VGpDam5ycTJ1d1Q2eFBoSnNabVFYcEUvditwQzdyZ0ppdUJZd1J4a3dsdnkw?=
 =?utf-8?B?QW9KSVdpS3B2UVVjYjdnNHArdHpieWZvSVNzeER5OXV4ZGpKVUZyL3RnaEtU?=
 =?utf-8?B?em8wVmpVK0ZmUEJYQ1RaZVhUQVh6Sjl3eE5XcDV4SkVJbkRaU09sNWZEcVlH?=
 =?utf-8?B?ZG5MTERCOVRkbFZBS2hXRndJRXorQzhQOTZBVVBLOHVWUFlYdU15clluVDZu?=
 =?utf-8?B?Y25oQ01rRGJ4SnVlUVFHSjFhWW1vUzFNTUYzTkNXS1RCaDBTMkt6TVg3dGZz?=
 =?utf-8?B?OVd6VGx3VVdhUlhueWgyNk45OS9MUlBodUsyZDMzSkd6K2FPVGhpaVV5Nnh0?=
 =?utf-8?B?RDlGaW1wakowNS9ZQUhreTNBdlZJNUdPMTB1eVpDUEtMMWJMWTFpbTh0YkN0?=
 =?utf-8?B?Z2htcy9ha3ZkTVFDc0NEU1B2K0RaWUNQUWJyTkMzNXVUKzh6Y0hsVHZMZHpl?=
 =?utf-8?B?bXJ5cXdtNWh6Y04yZzgxeEVFUWRNOUhYdG41UlcxQVlacXdiZlRraFhGOVUx?=
 =?utf-8?B?L2UvdGprNkNscGpwRWprblJLMDJhU3VzR2NMUFRGajRxSWtUN2tZZDJ5VFZp?=
 =?utf-8?Q?iQamEAn642E8eBr5wjF0D6dBKS4IysYonZA7o=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR10MB6867.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?c1lWN0RtTXowZEE0T1IxaGk4bkcrM3JEOVh1ZmpMZUNQcGlUMnZadldZWWpk?=
 =?utf-8?B?UkdMV1VOVHdiY3QxQVYyRlE0NGp5b25RNjdOUnlLWk9sVFk5TSt3T0k1alRJ?=
 =?utf-8?B?eStsejcxZ3pzdGFYMkVOamFhS29DUDQxWHREWjY0RHp5Qk5aQ2p4UkxXQUhZ?=
 =?utf-8?B?WVBLWUtEMTBrU3ZtN2xhUFcrM0VIL0hyOGdpQ1dKOGJtM2IrSGlQL3F1VXFX?=
 =?utf-8?B?QVVXTnRVU3pqQWp3cGF3cU9saDU4d285aUlUUEdjK3l2dTZGWnkrVHZaSnQw?=
 =?utf-8?B?TEY5MnpZQ3RwWG8vSDFhZm9lbWVCRnorZmRVeXF6UmxmU0VRclhlMGsvRVU4?=
 =?utf-8?B?dStCRUs1ZTN4bWlZWWc0TmJSZ29CUjR1eG5nN290RWxYeTJoUER3NmtqMGdq?=
 =?utf-8?B?RnF0aUtYZjl0QlcxTzNQMzlvZjcrWWx3S1dFMDZ6SFVYNlNoRWZ4ZXdqRi82?=
 =?utf-8?B?bzFnMGN2dVpNcU1NK0xmMFp1L0R0RW56c0RSTEdrOXRyZWE3dG9TbEZUM2Vq?=
 =?utf-8?B?eHJ2eVM4ZUVaOWFnUTRyeXZVcnE3MkZHVUZ4U0FhMmgzT3I2eHF6STZWbE1r?=
 =?utf-8?B?a1BiUWpDRnd5WktaNEkvOVdZSDBxV2hNVFI4S2w4WFNZK1dmUTM0RG9tamla?=
 =?utf-8?B?UURtVjlhVGhFd0VYTnVuVDZTc0ZnQWZtbmt1ckJMb2ZiM25hbGtkRURsdEdy?=
 =?utf-8?B?K0l1REJqZXdKMWRWMzN3Qy94UE1XTWpLMklLLzBRT0VlRFRtQVFZdExrK1Mv?=
 =?utf-8?B?UUQ3WkF3RmtBZ041elB0RHBYOFo4ZTVZL2psMDlYdFhpakxpOXROUnEwKzR6?=
 =?utf-8?B?ejJ3SjJ5aVdxeExFeWYzb2V4eUhJOW1taUtmVFJJa0Q4d3hmMFJjdmlleURx?=
 =?utf-8?B?dzRWSFpRQ0xvdjZTWmluYzJXdlFmYUZGRWFrVnljWWdGK0xSODRoalJhS1I3?=
 =?utf-8?B?QzdvYXBXZ1pHRzFmcnBoNHgyK2tzbWpmcmNaaUtjR2Fxdzd0a2FZM2ljTXZG?=
 =?utf-8?B?Njk5YWNXRml3R1JpMlZvNUEyNHAxMm8vRy9XTjZKUTZpMVdpanpDODJ6TTFj?=
 =?utf-8?B?VTdhN3RSR21LeGlWVzdWRzBCeGhLbytpMlV4Y2I2cVJKMGpVOHNIdzZQeXd5?=
 =?utf-8?B?YTBHU1BtN2I3andseVd1N1E1Wm1GQVo3eGZ4ekJ4TktZMEJqOXpNZGRMcitV?=
 =?utf-8?B?ZXNpQ2k4RHdMOXY0Vm9jOFgxeCs5QW5OTGI1SFZ6TmlxR2RyTk01Ri9QcDMw?=
 =?utf-8?B?ZXQyZzd6MmJCVERjZHlQY1N6RmlTaG82NDYrSWltWVZXYWp4NllFUWxNcWN3?=
 =?utf-8?B?SSt2SHR6QmFCdkFoejJHc0R3Uk0zUkJPOXZsckRVV3dBeVcrQUZ5V090VnpD?=
 =?utf-8?B?RkJ4VzhMenZUTXZRVk1CaGZVeTFhd2k1a3k0SUcxcHRuR2VnQjhWd3VNSENY?=
 =?utf-8?B?L0JzZXlIY1dHQUdQZDM4Qm85T1V6MmMyY2NpZk5YVzkrMGQwYWdDQUg5NXc4?=
 =?utf-8?B?eDV3Q3duZ1JQQi9Pa3BPY1J5NUEybHZxM0thRTNUemEyVXpGOUZaRGMwckFa?=
 =?utf-8?B?WFZjR3QxeXBsMXRueGNaMG1TYklmSlBCc0k4Q0JLaXpKbVl3MzFwbTVqVDBR?=
 =?utf-8?B?UnVJUGNVb2RFeUxkNGxxalNaaGp6OEhYRVlHaEFrVFlEOGhUMnN0QjloUkE0?=
 =?utf-8?B?YnlnV0Z0TWt3Z1VCUXRGUTBTd24vaFF1RkV1RVRJNGlYTFJnR3JOQXhXUGVl?=
 =?utf-8?B?UmgzTFBuOFVOOThKTVB3UWo4UEdDZldzMncxaDB0WVNHMmMwM0FWa2EyY2NC?=
 =?utf-8?B?N2J2M2FsRFkvdWZUbXFkUkN2SkswNkhmQzFUVEFyN0RreDFIWVBrU0ViSndD?=
 =?utf-8?B?RGlPY25rdHFoVDZNM3U4eTFtaXR4d0d4Uk80ZVpRL1Qvekh1UTA2S1B4Nys1?=
 =?utf-8?B?cmloOW54bUcrMThzend3VTlYTFlwR0RiT2lHSUNuYjdVS3ppSkJpWmluc3Bs?=
 =?utf-8?B?ZGsxR242YWF5YUFoR2tsTEhBcEo1bU5jWDRuMmtLdGE1ZEd4SS9JQVVFOFFW?=
 =?utf-8?B?cDkxcWFRUzdHa3R1NjR0UlI3b2p3UHR1djVRdzk2QWY1dzBxSG9ZMm42VG16?=
 =?utf-8?B?Y2NnQ1N3V2tKZHFFKzgvZFIvRVYrTjIvNVlwU1NQRVFIVHBrTjAyS2s1Z2VD?=
 =?utf-8?Q?4zx5/pewbLlwdvf5Ox7MYb4=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <47FD029BF4C35C4F938A65EBD02CF63E@EURPRD10.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS8PR10MB6867.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 008d748d-9473-47c6-10da-08dd1865a8e6
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Dec 2024 15:25:06.0841
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: meB7IVYMB5kVi4zf5i4Lha7rhuDcxfDJZjqje2V2K7xIgKWgAkwcmoEBl54cFrmWKeL7U0twAWYA7yld01skQwHl3h9lCy8BBHJUZTKySzM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR10MB5401

SGkgQW5kcmV3IQ0KDQpPbiBNb24sIDIwMjQtMTItMDkgYXQgMDk6MDUgLTA2MDAsIEFuZHJldyBE
YXZpcyB3cm90ZToNCj4gPiB0aGVuIHNvbWUgbWFwcGluZyBiZXR3ZWVuIHN1Ym5vZGUgYW5kIEhX
IGNoYW5uZWwgd291bGQgYmUgcmVxdWlyZWQuDQo+ID4gV2UgcHJvYmFibHkgZG9uJ3Qgd2FudCB0
byBwYXJzZSBhIG5vZGUgbmFtZSBpbiB0aGlzIGNhc2UgYW5kIGNhcnZlIG91dCAiLTAiDQo+ID4g
cGFydCBvZiBpdCwgaW4gc3VjaCBjYXNlIGEgd2VsbC1kZWZpbmVkIHByb3BlcnR5LCBzdWNoIGFz
ICJyZWciIHdvdWxkIGJlDQo+ID4gcmVxdWlyZWQuDQo+ID4gDQo+IA0KPiBXZSBhcmUgbm90IHRo
ZSBvbmx5IGRyaXZlciB0byBkbyB0aGUgIi0jIiBtZXRob2QuIEFsdGhvdWdoIHllcyBqdXN0DQo+
IHVzaW5nIHJlZyBpcyBlYXNpZXIgZm9yIHRoZSBMaW51eCBkcml2ZXIuDQoNCkFmdGVyIGEgcXVp
Y2sgZ3JlcCBvdmVyIHRoZSBiaW5kaW5ncyBJJ2Qgc2F5IHRob3NlIGxlZC1YIGFyZSB1c2luZw0K
ImdwaW9zIiBvciAicHdtcyIgcHJvcGVydHkgdG8gYXNzb2NpYXRlIHRoZW0gd2l0aCByZWFsIEhX
IGFuZCBzZWVtcyB0aGF0DQp0aGVyZSBpcyBleGFjdGx5IG9uZSBleGFtcGxlIG9mIGRvaW5nIHNv
bWUgaW1wbGljaXQgbWFwcGluZzogbnhwLHBjYTk1M3gueWFtbA0KDQpJdCBzZWVtcyB0byBtZSB0
aGF0IHVzaW5nICJyZWciIGlzIG11Y2ggbW9yZSB3aWRlc3ByZWFkIChpZiBpdCdzIG5laXRoZXIg
ImdwaW9zIg0Kbm9yICJwd21zIikuIA0KDQotLSANCkFsZXhhbmRlciBTdmVyZGxpbg0KU2llbWVu
cyBBRw0Kd3d3LnNpZW1lbnMuY29tDQo=

