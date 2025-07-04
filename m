Return-Path: <linux-leds+bounces-4994-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6082BAF8E3B
	for <lists+linux-leds@lfdr.de>; Fri,  4 Jul 2025 11:21:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 81557B44625
	for <lists+linux-leds@lfdr.de>; Fri,  4 Jul 2025 09:12:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B5DFC2EF651;
	Fri,  4 Jul 2025 09:08:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=leica-geosystems.com.cn header.i=@leica-geosystems.com.cn header.b="XXhkPzNO"
X-Original-To: linux-leds@vger.kernel.org
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011061.outbound.protection.outlook.com [52.101.70.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2942D28B419;
	Fri,  4 Jul 2025 09:08:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.61
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751620139; cv=fail; b=aZFs2hoTjGrpSeu1yI4uUzLsEeyLGTDUVY1bpmzd6/0Hr5dqK3h4HhCwTwYpreKzpo39yviqenX5+eLKaeL6HR8cYe/J2vzVMgEckT56Jqoskeyz7175/6xvNs7phG5e9b6H9wJEB65q0+O8mkhYraMoe8JBXlykiFHj0kO1ccE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751620139; c=relaxed/simple;
	bh=Y856osWTxHj3qCBayPr7eviuFGLmnzRvNr/0CLf7aNk=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=k/x6AsXVhKIj6Xd6IvKjn6HkcdmiNK+kEgmnZ25nWvTxBzaXcT1EX/QyiD4MDwFIdbdMOWYqjsPBai69HAxBqSgU/Hz5OVtAHccRpUURJ4+5lDd5Swat6FP4TfSEZBTqlwwDzwxs8s9tZpazAoQ/4Olf4yOpulCBbgXDMSw8QsM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=leica-geosystems.com.cn; spf=fail smtp.mailfrom=leica-geosystems.com.cn; dkim=pass (1024-bit key) header.d=leica-geosystems.com.cn header.i=@leica-geosystems.com.cn header.b=XXhkPzNO; arc=fail smtp.client-ip=52.101.70.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=leica-geosystems.com.cn
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=leica-geosystems.com.cn
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AJAPDixapnE5iPbtkPdoYBX7eqZXoIY6HysSlYDshVaSd7/RQrfw2eFJby3ume0oD0Dlv1jFR/nEGcBKlA02b0OZ3NWfGPNXrQ4CxRuuTpeyYDfyQGTUAq/sZ1dLW46a9Z2llj9bE2iZqSwcfRzDlPxYUqhm3u+qT4OLyu3hyr3Mds6Rza0CF4kKK7oedR+7p6D1vblGrHdP4xhrUnBA3iZdi8ULcWDcOAzOqL/kUHxEYHmiX2txbDbykVR51iwCQNKEOcpczgqid/2Y3FYrGHziHsaof3bvHEDYZlMe/vAebcFYmvlEirY5taHJtQlwsMTIYwV0HuW2yCPcLQSzhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y856osWTxHj3qCBayPr7eviuFGLmnzRvNr/0CLf7aNk=;
 b=ZN2J/IiBzRJkNM3yjoMUx0o5j/8NeP4xzVKjGhSRssddFyvthqs1Km89nA6RRef8rtxTgMBLqS9wSoXQ74Ka+GKBtmKw4f7q8cNYTZsxROSY7Vxm/esfAbJ0mLN9Eql6fSWAfonkS/9KEbXCjAQ28+APAEg/2h0fhbBJOS6cptSDFFxAjGs0Q4h8Vo75oCGhDz0j56hWi/Nld0Si8p1m56y2NfGl0F/Hqd1eRjwxkDMxA4nMqjxk0dK4IBHLch5kzYCCdQ1ptLTA5IzR1+61Atyf8jVyzGBwf2USDNQSFrkW657nw2ZINfBZ+QHLNe/cVgSjbpNj4jJmdwMw7weg3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=leica-geosystems.com.cn; dmarc=pass action=none
 header.from=leica-geosystems.com.cn; dkim=pass
 header.d=leica-geosystems.com.cn; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=leica-geosystems.com.cn; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y856osWTxHj3qCBayPr7eviuFGLmnzRvNr/0CLf7aNk=;
 b=XXhkPzNOrURLvJ/AQMiyA4VzgMMBgx1PKKpg9zFKVegS1gqG1WDAftIirfTMH+L46KDI16oSD8chqM+pdUtb82KSTTeFdCnOaMAfkLAlEKoeEY7o5upX4dIyVfV1MowjTjWmJInDYcj5kB2r1JcY+UAbn/VspD1yGf+CtNdeako=
Received: from AM9PR06MB7955.eurprd06.prod.outlook.com (2603:10a6:20b:3a6::16)
 by AM9PR06MB8195.eurprd06.prod.outlook.com (2603:10a6:20b:3a7::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.22; Fri, 4 Jul
 2025 09:08:53 +0000
Received: from AM9PR06MB7955.eurprd06.prod.outlook.com
 ([fe80::383f:82b9:8533:b78d]) by AM9PR06MB7955.eurprd06.prod.outlook.com
 ([fe80::383f:82b9:8533:b78d%5]) with mapi id 15.20.8901.021; Fri, 4 Jul 2025
 09:08:53 +0000
From: LI Qingwu <qing-wu.li@leica-geosystems.com.cn>
To: Krzysztof Kozlowski <krzk@kernel.org>
CC: "lee@kernel.org" <lee@kernel.org>, "pavel@kernel.org" <pavel@kernel.org>,
	"robh@kernel.org" <robh@kernel.org>, "krzk+dt@kernel.org"
	<krzk+dt@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
	"linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	GEO-CHHER-bsp-development <bsp-development.geo@leica-geosystems.com>
Subject: RE: [PATCH V4 1/2] dt-bindings: leds: pwm: add enable-gpios property
Thread-Topic: [PATCH V4 1/2] dt-bindings: leds: pwm: add enable-gpios property
Thread-Index:
 AQHb6/20KOVFnvUpm0699jNoWMGGK7QgKlYAgAAGb+CAAAkDgIAAB0rQgAFXpICAAAxRgIAAB61g
Date: Fri, 4 Jul 2025 09:08:53 +0000
Message-ID:
 <AM9PR06MB79559908932A0B175D812DF5D742A@AM9PR06MB7955.eurprd06.prod.outlook.com>
References: <20250703093430.229959-1-Qing-wu.Li@leica-geosystems.com.cn>
 <20250703093430.229959-2-Qing-wu.Li@leica-geosystems.com.cn>
 <85e411bf-58cf-46fe-9afa-7b76999f1a42@kernel.org>
 <AM9PR06MB795507373B99DFF6820D979ED743A@AM9PR06MB7955.eurprd06.prod.outlook.com>
 <1c95927e-a028-43fe-bdf5-449767b49ec1@kernel.org>
 <AM9PR06MB795513A172A70CB09462FCA8D743A@AM9PR06MB7955.eurprd06.prod.outlook.com>
 <20250704-devious-badger-of-contentment-e0a00a@krzk-bin>
 <AM9PR06MB795541A95E9A1089CA95AC1ED742A@AM9PR06MB7955.eurprd06.prod.outlook.com>
In-Reply-To:
 <AM9PR06MB795541A95E9A1089CA95AC1ED742A@AM9PR06MB7955.eurprd06.prod.outlook.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=leica-geosystems.com.cn;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM9PR06MB7955:EE_|AM9PR06MB8195:EE_
x-ms-office365-filtering-correlation-id: b7de7257-04e9-4818-e845-08ddbada65f1
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?aW9PRjZzNmhoaFN4WjJZYlBJT2VtaFVKNlFTVFU4aE1vMXFseWtGUDMyQ0RK?=
 =?utf-8?B?ZklMakdWZzJqci84RzAzb2hHVWp3a1czL01MTlJnKzJzR2JkVTQ0S2F5MENl?=
 =?utf-8?B?YnlGR2xNeEI1cHJ1T21IcjBWT0NQcTYwblFGaXRqd2dHbmRjR3hXVSttczBy?=
 =?utf-8?B?L3FWWDJIbmVKbU1NVks0bnJOMTN6VHlMT3lNZEVFaXlCa0ZMdUhQWm83Z0F6?=
 =?utf-8?B?N3U2cE42eFhrUGJnQjVURXdCS0J5ODlyV2N4ajdHT01qc05HNndDREZwUFdy?=
 =?utf-8?B?RU55QWlQTTlKLzVVVnZhK0pqajAzQkJSQ2FST1V4V3BnZDJRQ0VrSDlobysx?=
 =?utf-8?B?SXNheE5kbWVBdmNONEhnQWZpcU5hTXVibkk1ekJia2RVSXp6eEo1TFkxaHoz?=
 =?utf-8?B?d09IK2wxY1pmK0UwelRrSGVtb2cwOVFZWlFNUGtDSDZBSXVYMExEQnBPamls?=
 =?utf-8?B?a0JOd3Q4QXdBS1IyU3VkTUJJYXh4UFdldVZSODdHc3JHY3JyQStCdEc3OWQw?=
 =?utf-8?B?UDMrRVpaeTlOd29lQ3lVK1A3ZExmYjZqejJHSzNUVm5iQXB6ZW02OWVUdW1k?=
 =?utf-8?B?VzRvazVab0NyVHRleFFOcVVUQ25qQWF3SU1VN0U3cUVBNWxxOHZsVlpZTVBx?=
 =?utf-8?B?Z0hubGlmWkZDWlJJZnNRbjYrVG40eW5QVjAxWUI5cjNOOTRMcXBhc21wNXVS?=
 =?utf-8?B?Wi9Tb25hT1hwWHhPOXpyTG1CaGh5cEo4YVJobFpnd0c5ajRNMFBzQnE3dyt0?=
 =?utf-8?B?RzJ5S1dCNFREM0cyV3VMQXQzSEllUVo0V1hYelMrYjhFbmMyOUJEbVU4MXls?=
 =?utf-8?B?bTFHM29HUDNGOTVsUzBlTXI3aXJnd3Uycll6WHJrNE1QRVV5bGczVGdNVVoy?=
 =?utf-8?B?WjZXL21TSi9nbVNyQzhlQU95NW9ZOHBrT01INUc1bVBXN3VjelZvZ05aU1dz?=
 =?utf-8?B?STZORTRReHhrYXFkdkw2cFZPL3greVU3TjBDeDlBT0ZMcHFsRWU0OXQ4S1o1?=
 =?utf-8?B?Yml2QUJVT3VZWGQwQytuWDZwZ2lLdFAxYjhCZ3lnWmZzYW4wemtTN0VrREJ4?=
 =?utf-8?B?SDVYNUJ4ZTJLR2hJbE9SZ282ZDAxaEltYWk5SEFTeFVubk1TTXlpZTI5UDUz?=
 =?utf-8?B?RloxTnd4V0JMNnhTS0NaUC9mLzdqUnRxOTNUQWJTcGZUeXZhakRCZDA5bTBi?=
 =?utf-8?B?VTV6UUlXVjNGNEkvMnlyT2hvZE1PVFNhekJ6MkRGVUo0WnJ0aXZrK25Tc05t?=
 =?utf-8?B?NXpqSy9nYjExTzNnT1hFUDhTZjJuYkQzdmZqZE9vUDFUMWxLQ2JiTmZKSVJX?=
 =?utf-8?B?VE8yQUo0UGhISXdpeDF5TlQ5QVppVXFHVlNTMFRmZ1h5NEpkTStGRGFWUWcr?=
 =?utf-8?B?V05GdDBoR0ovRGp0akF5OEhoQ3dWbTZmMXl3bWgxR0NRVVRucWxOR2VDdFZL?=
 =?utf-8?B?SldjeXlvSkVZOTZ3TVk4ak5VRGp5K1B2c2dVYnRqSEVUeGRXUDQ1aFExRmVz?=
 =?utf-8?B?TVJXZlAycE5RdUVzTUYyblFvOXBuOHI4ZFE3Mk9RMmVuSU5yNUFYZmtOQzVm?=
 =?utf-8?B?UDVwNDlBQ05DaGhHcHcwUWJpbVphajI4SzlJK0ZDTVVGWEZTK3RKWUJiTkhQ?=
 =?utf-8?B?MUJ3SVBYZDEyTmYwR01pTXBVeGNHemNrTXhRRGFodWk0OVBUQ1Via3ZvdlhB?=
 =?utf-8?B?QUxhM2RrZHJyMFNSNkZhY1FaekMvVC9sWlZEZHVkeDRJeTk2TDBMWFNlOUp2?=
 =?utf-8?B?RzdHMDVOS3NHbHVBZEhWZ1V6YXE1cnpTWlFxY0ZZSXdESGxMaWlWK2FXVkdD?=
 =?utf-8?B?NS9ieHNNM1lRR1BMVk5ySERBM2VjUU9kSmUyTnRKZ3Jjd3RyY2JJMjBpZk1a?=
 =?utf-8?B?bDExQVdLY29JSFVUbGU5QTdXSjBJZGc5OXBtamdOclJLRnVybEhOdzNhTGhD?=
 =?utf-8?B?SkhVNXNWaFFHQkdkWXZYWHVXeXorTmFGdXNsZWUyaFNRVzloS0hTeTZhWHN2?=
 =?utf-8?Q?Arg2iviq0s78/zgc7ffpxSV9iVbELo=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:zh-cn;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR06MB7955.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?NElFcHFrNDhLL1V4SWlPUGFQUWVLT2xqNCtBT2R0cFB0eW1HQnJWa2w0WUJx?=
 =?utf-8?B?NEZaVi9pc0szdzZRQWtGYmhTcTdZREVRYlVTVWFHcElvclZUcnB0cnNCK1pW?=
 =?utf-8?B?SS9mSzdBbnhPNEZ4bkdxem5sSkhSLy9hNmRqcFVuTytUd2o2amZEQm5URkgw?=
 =?utf-8?B?S2pCanQrM3ZkZm9zWGdSTWg2S1N5M0VkbWhLLzkxcWUzMi95U2MvKzJjZDBW?=
 =?utf-8?B?dkM2TGpCbEJheDRBRDFPUE1GUWdYK3BlNHdpdTM4SkJzY2h1a1ViNXFSOGQx?=
 =?utf-8?B?L20zWkZuZUpVN0Uza3J4YW93N3ZJT0lGeTg0VkhpeVY0TGNEcjdlSkJkdk9R?=
 =?utf-8?B?alFtc2RROG9pZmt1dGdUb3ltYkFTY2NrdUd3ZDRFQ3RnaGRmY1hFakp6OHVt?=
 =?utf-8?B?M3FDV0tHU2JzOEpmUWFDeDFvYXhBMkszN2dQNUE5dHVsQk0zSW5RY252R1Bn?=
 =?utf-8?B?em5pbjdIdDV3M0N6T0wzTmt6Ny9SWFE5VEx1dXhjM0ZMTlZSdW9zb0c4QjVy?=
 =?utf-8?B?NmNuM0JOdURCbWgzU1YvKzJUU25UQ1c2b1Z5VnJ1UTY5OFRpNUZnZS8xdUJs?=
 =?utf-8?B?VVV6Y1diNmt1ZUk5Q0VsVEhXOTdFRllxK0RURFM5MmJ0OHVhbDBJcStFa3Vu?=
 =?utf-8?B?eUhUVmZhUlMzREZMK2NKaE1NK1VZNTBBUmNyb1ZFb2JscVBTOWFCWTdqYmNn?=
 =?utf-8?B?S2JVSXRNYUxOR00rWUFUb1d6OHFVS3FFR2drWDd0WTlZb3JUaUQxa242MWJC?=
 =?utf-8?B?bVZMVnBNRkZtTHA3dnl6MlM5amxrRkNxNzJRWXNlL08yS05DUTViTGYzN0d0?=
 =?utf-8?B?eFpYaUUxejhiZmM1RHpzMHAxSE1kaXUzRnN6Ym11blU5S1dzZTk0aEkxaHVH?=
 =?utf-8?B?WWxnNVZDZjhrRDlFdlpaWWhtaEVkSVluUXdDWkNxblUyN21Sdmdsdkhac1E5?=
 =?utf-8?B?alY0YmYvdmdsRmlFSUIrTHkySHcvR0NURm5maUZMYy9aZlVBQWRtbmFUVFE1?=
 =?utf-8?B?YWpSK3JPOHJreERVRnovRy8wUG5QYk9IRVFPcUJCR1UzY0FnVllGcGppcUhT?=
 =?utf-8?B?ZWxxaklPQWNrSllCYy9RMnFPMWdpWnZ5cHVFYWNaZkQ1MDc4d2NwdXJjQ2Na?=
 =?utf-8?B?bUJmaEJSbE9wUEVhUlpGMldlSnd1Ykc5WitpY0VrQkRPTlVpVWJuYm5kcFpr?=
 =?utf-8?B?a2xiTnRHRUtwZHpoZDZFRHlXdldqR2pJTWd4amlCQURKbDFHZ2IvVkZBYVRt?=
 =?utf-8?B?eXg5WFgrV1NjT1FEUGNvVXVjeDVzVkoybHNyUzIySDZxRnZxaUlHdWpJYzlL?=
 =?utf-8?B?TnBwRXl0WjE5S3BlWXRadVZxbzE3WUJPWUUrUko3dFVOT0Q5a1pqaGVEcUY2?=
 =?utf-8?B?OUczb2FuR0tpREwzTmdIcG0vcjFyZFI1MkhjbDB0bTVGTjNDMWZnRk4zdlFq?=
 =?utf-8?B?cUswZVhoUGI4VkhUMi8rSXFxQXBOMkQ4aHA5TENXckNSNEIyZFBnYmwyQ01q?=
 =?utf-8?B?RFBKTVJ6VHkyWUtHMzMzQyswTTlnejE1c2Y5QUhZQS9VUTVrWDdDcWNXbFdC?=
 =?utf-8?B?S1crMXJualhtVk5SM0ZIKytzYUR0MHkyU3d1SFMzaFJsaThRa1RXVm1FR3dY?=
 =?utf-8?B?aG0rQWpVemxyVUhNNTlCeUhXaHAzQVF1NEZTM1BaSkgzaUNhc3M1RmtvYW1z?=
 =?utf-8?B?UlFLc1VSdTBreThnbVdtZGgyUkhIRFlzTU9YY1BGcXlpQzZCSVZlQW1paUZj?=
 =?utf-8?B?WnEzaENQRVBkUldPZ2V3T0ZNT1ZHK0NBZW5FcVdtWnQyaGI2bXlSR21pdW9S?=
 =?utf-8?B?R1RyRzF0dVRDVkRpcGdCdUFnaithd3RaOEVnMTJrWk9CaEN5Q1NTMkk3Sk1m?=
 =?utf-8?B?cExNYVZKblZVQ3A5SytBSGNHNzZVaVZNL0lLNTY4bGtMNW1aUnhYM0Ztakxy?=
 =?utf-8?B?dWxQQm1wN0o5SW94M3QwTXk5L2RuV0VqQzhCeUh0VGR4NUFsVE1XM3JDUmpv?=
 =?utf-8?B?MFplb1hUM3dZVGFxTFRGNmlpVmFQZ0xHQnBjSGdaU0JoN3JSWmxSZGJoYkZY?=
 =?utf-8?B?SWhzOE5EQ0cwa1JNY3dDUEVuOTkyaW5lRng4cm9DSEVCc2lDdXVJWmpSeHVB?=
 =?utf-8?B?SjhZeGNUY2dNR2RrUDI0TS9TNmx6VFdjUko5ajl5aDNrdDJNUnl0UmhSRWt6?=
 =?utf-8?Q?YYYmDVAYMN6P0Jd4K8gIpvc=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: leica-geosystems.com.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM9PR06MB7955.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b7de7257-04e9-4818-e845-08ddbada65f1
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Jul 2025 09:08:53.2178
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: RZxLhz877kY8vBZ34PIdh+mwybjGz8bsA823nh6qt5SaeADJcu8986FbfVLP/ZzrluHQgVmy09XujPsMPLWOtshLRgbu1j+nn0GZid0uMX9nOSVwHEyvdQ1IA55RCh/u
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR06MB8195

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogTEkgUWluZ3d1IDxRaW5n
LXd1LkxpQGxlaWNhLWdlb3N5c3RlbXMuY29tLmNuPg0KPiBTZW50OiBGcmlkYXksIEp1bHkgNCwg
MjAyNSA0OjM2IFBNDQo+IFRvOiBLcnp5c3p0b2YgS296bG93c2tpIDxrcnprQGtlcm5lbC5vcmc+
DQo+IENjOiBsZWVAa2VybmVsLm9yZzsgcGF2ZWxAa2VybmVsLm9yZzsgcm9iaEBrZXJuZWwub3Jn
OyBrcnprK2R0QGtlcm5lbC5vcmc7DQo+IGNvbm9yK2R0QGtlcm5lbC5vcmc7IGxpbnV4LWxlZHNA
dmdlci5rZXJuZWwub3JnOyBkZXZpY2V0cmVlQHZnZXIua2VybmVsLm9yZzsNCj4gbGludXgta2Vy
bmVsQHZnZXIua2VybmVsLm9yZzsgR0VPLUNISEVSLWJzcC1kZXZlbG9wbWVudA0KPiA8YnNwLWRl
dmVsb3BtZW50Lmdlb0BsZWljYS1nZW9zeXN0ZW1zLmNvbT4NCj4gU3ViamVjdDogUkU6IFtQQVRD
SCBWNCAxLzJdIGR0LWJpbmRpbmdzOiBsZWRzOiBwd206IGFkZCBlbmFibGUtZ3Bpb3MgcHJvcGVy
dHkNCj4gDQo+IA0KPiANCj4gPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiA+IEZyb206
IEtyenlzenRvZiBLb3psb3dza2kgPGtyemtAa2VybmVsLm9yZz4NCj4gPiBTZW50OiBGcmlkYXks
IEp1bHkgNCwgMjAyNSAzOjUxIFBNDQo+ID4gVG86IExJIFFpbmd3dSA8UWluZy13dS5MaUBsZWlj
YS1nZW9zeXN0ZW1zLmNvbS5jbj4NCj4gPiBDYzogbGVlQGtlcm5lbC5vcmc7IHBhdmVsQGtlcm5l
bC5vcmc7IHJvYmhAa2VybmVsLm9yZzsNCj4gPiBrcnprK2R0QGtlcm5lbC5vcmc7DQo+ID4gY29u
b3IrZHRAa2VybmVsLm9yZzsgbGludXgtbGVkc0B2Z2VyLmtlcm5lbC5vcmc7DQo+ID4gY29ub3Ir
ZGV2aWNldHJlZUB2Z2VyLmtlcm5lbC5vcmc7DQo+ID4gbGludXgta2VybmVsQHZnZXIua2VybmVs
Lm9yZzsgR0VPLUNISEVSLWJzcC1kZXZlbG9wbWVudA0KPiA+IDxic3AtZGV2ZWxvcG1lbnQuZ2Vv
QGxlaWNhLWdlb3N5c3RlbXMuY29tPg0KPiA+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggVjQgMS8yXSBk
dC1iaW5kaW5nczogbGVkczogcHdtOiBhZGQgZW5hYmxlLWdwaW9zDQo+ID4gcHJvcGVydHkNCj4g
PiBPbiBUaHUsIEp1bCAwMywgMjAyNSBhdCAxMTozNjoxMEFNICswMDAwLCBMSSBRaW5nd3Ugd3Jv
dGU6DQo+ID4gPg0KPiA+ID4NCj4gPiA+ID4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4g
PiA+ID4gRnJvbTogS3J6eXN6dG9mIEtvemxvd3NraSA8a3J6a0BrZXJuZWwub3JnPg0KPiA+ID4g
PiBTZW50OiBUaHVyc2RheSwgSnVseSAzLCAyMDI1IDY6NTUgUE0NCj4gPiA+ID4gVG86IExJIFFp
bmd3dSA8UWluZy13dS5MaUBsZWljYS1nZW9zeXN0ZW1zLmNvbS5jbj47DQo+ID4gPiA+IGxlZUBr
ZXJuZWwub3JnOyBwYXZlbEBrZXJuZWwub3JnOyByb2JoQGtlcm5lbC5vcmc7DQo+ID4gPiA+IGty
emsrZHRAa2VybmVsLm9yZzsNCj4gPiA+ID4gY29ub3IrZHRAa2VybmVsLm9yZzsgbGludXgtbGVk
c0B2Z2VyLmtlcm5lbC5vcmc7DQo+ID4gPiA+IGNvbm9yK2RldmljZXRyZWVAdmdlci5rZXJuZWwu
b3JnOw0KPiA+ID4gPiBsaW51eC1rZXJuZWxAdmdlci5rZXJuZWwub3JnDQo+ID4gPiA+IENjOiBH
RU8tQ0hIRVItYnNwLWRldmVsb3BtZW50DQo+ID4gPiA+IDxic3AtZGV2ZWxvcG1lbnQuZ2VvQGxl
aWNhLWdlb3N5c3RlbXMuY29tPg0KPiA+ID4gPiBTdWJqZWN0OiBSZTogW1BBVENIIFY0IDEvMl0g
ZHQtYmluZGluZ3M6IGxlZHM6IHB3bTogYWRkDQo+ID4gPiA+IGVuYWJsZS1ncGlvcyBwcm9wZXJ0
eQ0KPiA+ID4gPg0KPiA+ID4gPg0KPiA+ID4gPg0KPiA+ID4gPiBPbiAwMy8wNy8yMDI1IDEyOjI3
LCBMSSBRaW5nd3Ugd3JvdGU6DQo+ID4gPiA+ID4NCj4gPiA+ID4gPg0KPiA+ID4gPiA+PiAtLS0t
LU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiA+ID4gPiA+PiBGcm9tOiBLcnp5c3p0b2YgS296bG93
c2tpIDxrcnprQGtlcm5lbC5vcmc+DQo+ID4gPiA+ID4+IFNlbnQ6IFRodXJzZGF5LCBKdWx5IDMs
IDIwMjUgNTo1OSBQTQ0KPiA+ID4gPiA+PiBUbzogTEkgUWluZ3d1IDxRaW5nLXd1LkxpQGxlaWNh
LWdlb3N5c3RlbXMuY29tLmNuPjsNCj4gPiA+ID4gPj4gbGVlQGtlcm5lbC5vcmc7IHBhdmVsQGtl
cm5lbC5vcmc7IHJvYmhAa2VybmVsLm9yZzsNCj4gPiA+ID4gPj4ga3J6aytkdEBrZXJuZWwub3Jn
Ow0KPiA+ID4gPiA+PiBjb25vcitkdEBrZXJuZWwub3JnOyBsaW51eC1sZWRzQHZnZXIua2VybmVs
Lm9yZzsNCj4gPiA+ID4gPj4gY29ub3IrZGV2aWNldHJlZUB2Z2VyLmtlcm5lbC5vcmc7DQo+ID4g
PiA+ID4+IGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmcNCj4gPiA+ID4gPj4gQ2M6IEdFTy1D
SEhFUi1ic3AtZGV2ZWxvcG1lbnQNCj4gPiA+ID4gPj4gPGJzcC1kZXZlbG9wbWVudC5nZW9AbGVp
Y2EtZ2Vvc3lzdGVtcy5jb20+DQo+ID4gPiA+ID4+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggVjQgMS8y
XSBkdC1iaW5kaW5nczogbGVkczogcHdtOiBhZGQNCj4gPiA+ID4gPj4gZW5hYmxlLWdwaW9zIHBy
b3BlcnR5DQo+ID4gPiA+ID4+DQo+ID4gPiA+DQo+ID4gPiA+DQo+ID4gPiA+ID4+DQo+ID4gPiA+
ID4+DQo+ID4gPiA+ID4+IE9uIDAzLzA3LzIwMjUgMTE6MzQsIExJIFFpbmd3dSB3cm90ZToNCj4g
PiA+ID4gPj4+IHNvbWUgcHdtIGxlZCBkcml2ZXIgY2hpcHMgbGlrZSB0cHM5MjM4MCByZXF1aXJl
IGEgc2VwYXJhdGUNCj4gPiA+ID4gPj4+IGVuYWJsZSBzaWduYWwNCj4gPiA+ID4gPj4NCj4gPiA+
ID4gPj4gU2VudGVuY2Ugc3RhcnRzIHdpdGggY2FwaXRhbCBsZXR0ZXIuDQo+ID4gPiA+ID4+DQo+
ID4gPiA+ID4+IHRwczkyMzgwIGRvZXMgbm90IGhhdmUgZGVkaWNhdGVkIGVuYWJsZSBwaW4uIEl0
IGhhcyBWRERJTywNCj4gPiA+ID4gPj4gd2hpY2ggc2VydmVzIGFsc28gZW5hYmxlIHB1cnBvc2Us
IGJ1dCBpdCBpcyBhIHN1cHBseS4NCj4gPiA+ID4gPg0KPiA+ID4gPiA+IFNvIHRoaXMgcGF0Y2gg
aXMgdW5hY2NlcHRhYmxlIGFueXdheT8NCj4gPiA+ID4NCj4gPiA+ID4gSWYgeW91IG1ha2UgdGhp
cyBwYXRjaCBmb3IgdHBzOTIzODAsIEkgdGhpbmsgaXQgaXMgbm90IGNvcnJlY3QuDQo+ID4gPiA+
IFlvdSBoYXZlIGVudGlyZSBjb21taXQgbXNnIHRvIGV4cGxhaW4gdGhlIGhhcmR3YXJlIGFuZCBh
bGwgdW51c3VhbA0KPiA+ID4gPiB0aGluZ3MuIEhhdmluZyBWRERJTyBhbmQgRU4gcGluIGlzIHVu
dXN1YWwsIGJlY2F1c2UgeW91IGRvIG5vdA0KPiA+ID4gPiBzdXBwbHkNCj4gPiBwb3dlciBkaXJl
Y3RseSBmcm9tIEdQSU9zIG9mIGEgU29DLg0KPiA+ID4gPiBBbGwgdGhpcyBzaG91bGQgYmUgZXhw
bGFpbmVkLg0KPiA+ID4NCj4gPiA+IFRoYW5rIHlvdSBmb3IgdGhlIGZlZWRiYWNrLCB3aGF0IGFi
b3V0IHJlbmFtZSB0byBwb3dlci1zdXBwbHkgd2l0aA0KPiA+IHJlZ3VsYXRvciBzdXBwb3J0ID8N
Cj4gPiA+IENvbnZlcnQgdGhpcyBwYXRjaCB0byBhZGQgcmVndWxhdG9yIHN1cHBvcnQgaW5zdGVh
ZCBvZiBHUElPLCB1c2luZw0KPiA+ID4gInBvd2VyLXN1cHBseSIgcHJvcGVydHkgdG8gY29udHJv
bCBMRUQgcG93ZXIsIG9yIGRyb3AgdGhpcyBwYXRjaCBhbmQNCj4gPiA+IGdpdmUgdXANCj4gPiB1
cHN0cmVhbSwgb3Igd2hhdCdzIHRoZSBiZXR0ZXIgZnJvbSB5b3VyIHBvaW50IG9mIHZpZXc/DQo+
ID4gPiBhcHByZWNpYXRlIHlvdXIgZ3VpZGFuY2UhDQo+ID4NCj4gPiBEb2VzIGl0IHNvbHZlIHlv
dXIgcHJvYmxlbT8gSXQgaXMgc3VycHJpc2luZyB0aGF0IG9uY2UgeW91IHNheSBpdCBpcw0KPiA+
IEdQSU8gYW5kIG9uY2UgYXMgcmVndWxhdG9yLiBIb3cgaXMgaXQgaW4geW91ciBib2FyZD8NCj4g
Pg0KPiA+IFJlZ3VsYXRvciBpcyBsb29raW5nIGFzIGNvcnJlY3QgaGFyZHdhcmUgZGVzY3JpcHRp
b24sIHNvIHRoYXQgcGF0Y2gNCj4gPiB3b3VsZCBiZSBmaW5lLg0KPiANCj4gDQo+IFRoYW5rIHlv
dSBmb3IgeW91ciBmZWVkYmFjayBhbmQgY2xhcmlmaWNhdGlvbi4NCj4gT24gb3VyIGhhcmR3YXJl
LCB0aGUgVFBTOTIzODAncyBWRERJTy9FTiBwaW4gaXMgY29ubmVjdGVkIHRvIGEgR1BJTywgd2hp
Y2gNCj4gaXMgdXNlZCB0byBlbmFibGUgb3IgZGlzYWJsZSB0aGUgZGV2aWNlLg0KPiBBY2NvcmRp
bmcgdG8gdGhlIGRhdGFzaGVldCwgdGhpcyBwaW4gaXMgZGVzY3JpYmVkIGFzICJlbmFibGUgaW5w
dXQgZm9yIHRoZSBkZXZpY2UNCj4gYXMgd2VsbCBhcyBzdXBwbHkgaW5wdXQgKFZERElPKSBmb3Ig
ZGlnaXRhbCBwaW5zIi4gSWYgZGVzY3JpYmluZyB0aGlzIGFzIGEgc3VwcGx5IGlzDQo+IHRoZSBw
cmVmZXJyZWQgYW5kIGNvcnJlY3Qgd2F5IGZvciB1cHN0cmVhbSwgSSBjYW4gaW1wbGVtZW50IGFz
IHN1cHBseQ0KPiByZWd1bGF0b3IgY29udHJvbGxlZCBieSBHUElPLCBhbmQgdG8gbW9kZWwgdGhp
cyBiZWhhdmlvciBpbiBkZXZpY2UgdHJlZS4NCj4gDQo+IG9yIGlmIHlvdSBoYXZlIGEgYmV0dGVy
IHN1Z2dlc3Rpb24gZm9yIHN1Y2ggY2FzZXMuDQpMVDM3NDMgYWxzbyBoYXMgYWxzbyBzdWNoIEVO
L1VWTE8gcGluIGFuZCBpdCBoYXMgc2VydmFsIG1pY3JvYW1wZXJlIGN1cnJlbnQNCmh0dHBzOi8v
d3d3LmFuYWxvZy5jb20vZW4vcHJvZHVjdHMvbHQzNzQzLmh0bWwjZG9jdW1lbnRhdGlvbg0KDQo+
ID4NCj4gPiBCZXN0IHJlZ2FyZHMsDQo+ID4gS3J6eXN6dG9mDQoNCg==

