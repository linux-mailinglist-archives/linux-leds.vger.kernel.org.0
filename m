Return-Path: <linux-leds+bounces-1879-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 17B229048FE
	for <lists+linux-leds@lfdr.de>; Wed, 12 Jun 2024 04:27:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0943E1C22B60
	for <lists+linux-leds@lfdr.de>; Wed, 12 Jun 2024 02:27:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C1204A15;
	Wed, 12 Jun 2024 02:26:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=monolithicpower.com header.i=@monolithicpower.com header.b="s7vDt06d";
	dkim=pass (2048-bit key) header.d=monolithicpower.com header.i=@monolithicpower.com header.b="AzBQ5jLz"
X-Original-To: linux-leds@vger.kernel.org
Received: from mx0b-002bf204.pphosted.com (mx0b-002bf204.pphosted.com [205.220.172.86])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B32F58C1E;
	Wed, 12 Jun 2024 02:26:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.172.86
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718159217; cv=fail; b=mndwuQo/0upsXKd6ns6KBPjEIwIwKFAyCVOWVIP8wIBB0MbyCDOJ82KdP9RtqkbAeDZArIuVZ5+ke//VR2EIQgAEIsDKvWT7v4+4VfXTnLWOqM81lj3Rh0WWTcebvG0Sy4aq+/A7SbBtIz5aJiy4oAygPPvgsN1WCj3xsauxIWw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718159217; c=relaxed/simple;
	bh=nvf/nPxt/RanhyddVcHhTVRkjYxYPhwIzh7Xc+RB2p8=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=tpGorKVkWdHpIhQKZtE0pr1OF7HS/ko3IaV36J84YcTIJ8BMTNnyY8X3btD1sED8gjtVGaDTkHusg4KRyllWM7CCpu7bFxPiSk2VxLnCjTGOAWBnsipF+KP1kzUMs4a5BbLt5P0RlFn+3AAwN8VFpLYferqiBZKLqUhcMt4IIl0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=monolithicpower.com; spf=pass smtp.mailfrom=monolithicpower.com; dkim=pass (2048-bit key) header.d=monolithicpower.com header.i=@monolithicpower.com header.b=s7vDt06d; dkim=pass (2048-bit key) header.d=monolithicpower.com header.i=@monolithicpower.com header.b=AzBQ5jLz; arc=fail smtp.client-ip=205.220.172.86
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=monolithicpower.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=monolithicpower.com
Received: from pps.filterd (m0207525.ppops.net [127.0.0.1])
	by mx0a-002bf204.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45BIUqDu006483;
	Tue, 11 Jun 2024 19:26:49 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	monolithicpower.com; h=cc:content-transfer-encoding:content-type
	:date:from:in-reply-to:message-id:mime-version:references
	:subject:to; s=pps1; bh=nvf/nPxt/RanhyddVcHhTVRkjYxYPhwIzh7Xc+RB
	2p8=; b=s7vDt06dciepfwW71VdMFmJ6wXd88VSRMwN7x9iZpliWIuIPmmyO72oI
	8lXwsSCBWdMNpXMAZsQYC4A5aVMYcusVfXSVM745Uxqo+KE1zr9VosPSai2hPg8Q
	IOBD9EWnLRkfhm1yFA6uuKZ821hBP4ytQqV+flMtVjLKMuuBCF05LpIOtOwZkLm8
	hGntUHuipPUcsVb8f23QnEdJhAQbDsIg0xJ6B8CJkmazWHoyywFQ7fG4SnqA9wf1
	leSr2wKwIJMtSHuniWVTIbsPu4wwZjLnKpv8nKpWAq7/VaXpjGf9Odi4g/hHc2Zq
	4juPNsA5WQZSaMs5g/UkYO19tK5Z2Q==
Received: from nam02-dm3-obe.outbound.protection.outlook.com (mail-dm3nam02lp2041.outbound.protection.outlook.com [104.47.56.41])
	by mx0a-002bf204.pphosted.com (PPS) with ESMTPS id 3ymm00p9yt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 11 Jun 2024 19:26:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hQwoq7+0ZO9Bte1rZUKE0tI9U+7bexejTShkqD4J6SdCIxwwW3fz95WryDCwlGUdR1CDJ0zoxfXjVckya0WG1GktgUxhfRrTvZbTvjGPNhct3MMehYMZPJCNLyVItJD9KtR+TlmAkXl149yss8GGdkbcbeBgGuOWE/4B6hOTvo6KCyKgD7U3/IeVbY4XUXZvYLJMzvzbmwgxg9UfAv70clrqJMs4NKADKKsX59lgJksfu8pTKU2SLNEBK6TkyvO2mEaqNZpyR8w3I5GZI/j2QMqqG3YnHJxEAv8ZBZQkhVlJpOYzM0fUMkIGsY3ZlwG58hFLaB180NroGzJG1b6zDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nvf/nPxt/RanhyddVcHhTVRkjYxYPhwIzh7Xc+RB2p8=;
 b=Dm4ZIxO+wq5JWc6y/3xw5iOBSWl6SiCKwpGhDmSG4giiIqWHIqF42gvVBlbxAQZo7pQOsxCcQ7yZTU9Tr9JvgkhWVGBF8ncr3uYxp4EYrANj4DV2YTICbJpfdizjfq4UCLluJJv8+RMAqfoO5QEBThtaHuIMdPp7AjdicRFPz7mDLWraNPTfyRcJ0VHLXCezXoey8yTChfHCNUTtOHdLHVjR4RQWxms5P6YWNudzmplVSuxO2UIXmmDOfLJNhJx1JdIkmTlIRozB6uhqMUvKaTJzGbqnI0eLj04B7FEgPd3h2KpHcnbmgdiUnpD91t+ZCrBqGNGfFroaLkFtFgl9hw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=monolithicpower.com; dmarc=pass action=none
 header.from=monolithicpower.com; dkim=pass header.d=monolithicpower.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=monolithicpower.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nvf/nPxt/RanhyddVcHhTVRkjYxYPhwIzh7Xc+RB2p8=;
 b=AzBQ5jLz4wWsgpl4OJ6hpfmQYfIs+0ZOnW74TIP/Yx87UgWq6bkcAVeMELZ3uDOuqYTWtH5Q810mQpbB0u4aGmztkv4iCsSqKPpUXbQSCC/YuCogRnwVd6b5v5otGkFMCj3dlrA9Qz9qTZhF5mnyXP65IayZZM0HW7dhaBQbM+5G3BT8+A1VJBHw06Uekq7CxMLX7MO+/eQNzdgiXMCFJA2SzB/wDfX8N+TpMt+jTawmTkZXKa9vOMhwapPsLoTsM7XttM87mis53u35EXb9HLd41eNfxQvKgVfwwwIY4SSshArMBIm4JEjS9sEoTBwuFNVu+jIH3TIBMiirPg2bOw==
Received: from SN4PR13MB5310.namprd13.prod.outlook.com (2603:10b6:806:209::17)
 by DM6PR13MB3884.namprd13.prod.outlook.com (2603:10b6:5:249::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.17; Wed, 12 Jun
 2024 02:26:47 +0000
Received: from SN4PR13MB5310.namprd13.prod.outlook.com
 ([fe80::a28a:ee37:b6aa:ff6b]) by SN4PR13MB5310.namprd13.prod.outlook.com
 ([fe80::a28a:ee37:b6aa:ff6b%5]) with mapi id 15.20.7656.019; Wed, 12 Jun 2024
 02:26:47 +0000
From: "Yuxi (Yuxi) Wang" <Yuxi.Wang@monolithicpower.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        "pavel@ucw.cz"
	<pavel@ucw.cz>, "lee@kernel.org" <lee@kernel.org>,
        "robh+dt@kernel.org"
	<robh+dt@kernel.org>,
        "krzysztof.kozlowski+dt@linaro.org"
	<krzysztof.kozlowski+dt@linaro.org>,
        "conor+dt@kernel.org"
	<conor+dt@kernel.org>,
        "wyx137120466@gmail.com" <wyx137120466@gmail.com>
CC: "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH V2 0/2] leds: Add a driver for MP3326
Thread-Topic: [PATCH V2 0/2] leds: Add a driver for MP3326
Thread-Index: AQHau9n7HzWAtHeT9U6L9OsGbh7qW7HCR8UAgAAAkUA=
Date: Wed, 12 Jun 2024 02:26:47 +0000
Message-ID: 
 <SN4PR13MB53105EE4DEB0E5EE42160627F6C02@SN4PR13MB5310.namprd13.prod.outlook.com>
References: <20240611083236.1609-1-Yuxi.Wang@monolithicpower.com>
 <170c14c9-e1c7-4252-a550-4f9a8cef3a27@linaro.org>
In-Reply-To: <170c14c9-e1c7-4252-a550-4f9a8cef3a27@linaro.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN4PR13MB5310:EE_|DM6PR13MB3884:EE_
x-ms-office365-filtering-correlation-id: 201a39b4-4706-4962-b3ee-08dc8a871c02
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230032|376006|7416006|366008|1800799016|38070700010;
x-microsoft-antispam-message-info: 
 =?utf-8?B?UnkxNjhRTk5BN1dWbllPanpKNUViUG16bTU1WFhzR3AvM2VZMllMbnVZWVFY?=
 =?utf-8?B?NkVlKy93UDV0WWkvY2RCWDZXS1BPNDJ1dnBQSHdUWGV5THllMFViWTYvVlZp?=
 =?utf-8?B?S0pycDBKRUNLRmxSWVRwcVlLaVJYSExDZVRRQVlXTy95aXdpN24xWk5OQ1M4?=
 =?utf-8?B?MlNqdXZqbzd1RnRNczBCTFptbGV3TjBpVE9wRVRYS2grektYdVJYNkZzUHFP?=
 =?utf-8?B?SXIvMzNJblVkb25nVTkrejlMT3UrMEpRR295N3B5VUplYjBFUEVIbXVzZlVx?=
 =?utf-8?B?Sy9KK2ZCeVoyMkFvQ3A4Q05Dejd3cmg0Vm9ZL3B0VVF3WHZzbkl2cStpQndN?=
 =?utf-8?B?MElRZ1VzSVNMdWYwTWN2czlvUmZ1eGoveGxUS3NFaTlKNHhCQkwydlloNlRq?=
 =?utf-8?B?cUtQOFZIRXVvZXkvQUxZV0tjY2svRXkvWkNYblNSbXhBWjUvak1DRzRDSEhL?=
 =?utf-8?B?Mi9udnUvanlna290Y1YxNzFzVXZxU1hVcTRnVkZnWXlYVzlGUzVoZDFzeDcw?=
 =?utf-8?B?bks1aGx4djBFTFNuUERpSzdFODNjeTJkU3E1blBHd2ttaUpjc2hGTEZlUDl3?=
 =?utf-8?B?SkhGUUdmcUFhNHVBd3YwUkhwTTlqRit4MFJqazVSK2NvV0tHR2xVUm42RnYw?=
 =?utf-8?B?QXB5RDE5cFp1UEJrd3dvUjRTU25IU1NWdDA4ckZtb3FkbUVQK3JrTkRNV2Mx?=
 =?utf-8?B?c2FkeC9EQisrTG5aOWkrRUdZTzNUb1kxZEZUL3RtN2pIZ3VEUGhkT3J4RmZi?=
 =?utf-8?B?d1J2QUVFTmcxRlB1UW4xRXJIU1k5UFVmUnN4dVlPejBPU1dURTR6bCtvSGg4?=
 =?utf-8?B?b2dGcHAydlRwVlJZdk8xVWdNUHBOakZiQzJEeGhHZHE4c2FNaStEOE5QNTFn?=
 =?utf-8?B?RlZwVGZNWldVd0h6MkZxV1NNM05UQ2VGZ1RVLzdqTU96Y3Z4MFV1V2h5RTJx?=
 =?utf-8?B?YW1pSEtsMVIzZ2EwU3JUTlh4Vk94cVlUSHVnTGlZYlRQWmc4cG5kaGQzQktR?=
 =?utf-8?B?eHdvTUsrRUluKysxVG96aWMvM3p1NVArZnprMkdTLzRpMUgyaDYyRlNoQlhr?=
 =?utf-8?B?SmIyWkphU0xQa0ZoSHl6RmZiTnJjU1FNSHZDcWNYaDBXMWswUVRsZ2VzQlhP?=
 =?utf-8?B?YW9KZHNOaU9Ud0tLNktDQU5GSVF3NlFpclp0VncvWjF5eHNzbStKY01MSVVZ?=
 =?utf-8?B?YVZEc3M1V2lCWkl1NnhyZFFIRS9WU1hJallpQnQrRnFBalNROTkxS2lxOVlp?=
 =?utf-8?B?NHNCU3c5UGN6YWlSd0VHNk5VT1VPc1hWYW50VGxlYzZqV05rQ0k3UHU4NW42?=
 =?utf-8?B?U1NFVTd0eXRTYWZzc01CYUp5ejJBaVZnTktmL1dmSzFlMVF0OVFpQzkyUXMy?=
 =?utf-8?B?K1dUQzlsMG91M1NQdUM3dnBwV3VsVXBSNFpQcThRaElGanVhS0ZMaEloYk56?=
 =?utf-8?B?Y3NseHZ4RERweVZjSUc5dER5dTBZcWhaeEtKZlo1MGdqYVlJNXpvaEo0b24z?=
 =?utf-8?B?SDJ0NXNUV2ZsS2RrOXAzWHZwZzBhTUVMdzFrRm5qcWFKTlAwM1R2dnQzcEVs?=
 =?utf-8?B?dTVJMDFFdE9Ca2hBZkZrejMyYWlPemN1THlWaFJQVlVwSXJoSHBDMVhWMkxw?=
 =?utf-8?B?bC9UeHdxUUJJK0V0Ynk0ckZXa2ZXY0p6TjJUTnBSZStvYkRTb3V6VXEvd3cy?=
 =?utf-8?B?VzZqZ3U4bFJ4NCtucGpaUm1PMUM2SVp4aVR3alNhS3l1Mjg5YUNyRW05cU8r?=
 =?utf-8?B?ejBFdkE2TFVrbWJhSzlTUUJsZ1FsZmxCVWZiU24wTnF0NGl0Q1hQcVN0WERH?=
 =?utf-8?Q?aTktROAq3A3X6J1xf/UvyNpALGTH/so/eWD6s=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN4PR13MB5310.namprd13.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230032)(376006)(7416006)(366008)(1800799016)(38070700010);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?YVQ4dkw2VExJYWlibW5oWkQzM3VTaHhpb21aOEpVODFYT09sdTlqcmR3eWo5?=
 =?utf-8?B?N3lnU2Y1VTI1U2hmQjgwZDUrUnJKRmtSTW5oT1FNWEo5SnFEMVQyWFZkWUdE?=
 =?utf-8?B?K1I3ak9TdklFSXRyeUg2L0UzOHQrWGlYUExqUEdlNnhOV2FCRzdHSlArYVJS?=
 =?utf-8?B?VTFrVVF2US80M05pbE4wK0pVaE9OT0h2Qno3WlNOWHlDWlBDZ0E1WFZqZkF3?=
 =?utf-8?B?QVp1VkRxLzFXaEZTaDB5Y2dLQzRTdTgxeWRuWExDZUx2ZHpvSEs4V0lhOFlz?=
 =?utf-8?B?a1R5NGtndHg5WU1qdmZJb3lUTUJuUUEzSjVyR25KV1U1OVB6TjcyZm4wdHJw?=
 =?utf-8?B?YWFYTktEcy9TODFUdGx1eC9PNkYzNWJKdHpsa1BEdWdlNGc0MDBZY3N6TXNU?=
 =?utf-8?B?am5wM085Vk5Ya2hCbWZIZlRaZXllTlhQNFZsbS9iaW9RQmNOM1c4S1pKY0Rl?=
 =?utf-8?B?OXlUUnFoR2R3M3R3bGVPUzlCM092d25PdlorVy9KY0VjNXhhRkxsaEtmUm9G?=
 =?utf-8?B?WUlCYThMYzgySFZYbTB5YXhEQXF6dTFxUzhTTCtnbXg0cm96QmpXbEs3TVFD?=
 =?utf-8?B?VE5SZExGcXlJRm1rWXVDUFo2MVhIVVcwcmlURFBxUm52UWc5dXlQM3hhcTRC?=
 =?utf-8?B?dTlETnRaRC9ON1crVnI3NDMzWEkxaFJlK2U5djVWKzhkQmpSWGsrNXVjTTBM?=
 =?utf-8?B?V3VYaTBvY0kvcDBZY0pFOVZsN1pyV3FnamtJaEw3OTVLUTlnQVFKVm1tbjk5?=
 =?utf-8?B?bC9DQzNEbCtwUno2RXFDMHFKR2gxZnhmUU45QU1taEV0NHM4RWI3ckdlVjVt?=
 =?utf-8?B?TXg0Y3ZodGE3cFd4YkRaSk5PNllUaEFwSC9IcUxtYk1GUHlQVVc3OU5JNTRN?=
 =?utf-8?B?djhNSDBPb2NZcVZTRm1RRHdGaThTUk1RTFBJM3hUQU5BalB6MG9ycDU5ZnFs?=
 =?utf-8?B?QTlXdmJDQXFTajc0ek1OMTh3a1ppUDhkSjIzTFZYZ01qUUs0Vzd1QmQ3cFVl?=
 =?utf-8?B?RGdFWlB6VlFMY3lEajh5MkdoL0Y3NmowSkJNRkIwc0U5aEpRUnpRYUx5U2Nq?=
 =?utf-8?B?bmVSejVCTW02NVprWVBDM0VWS0p1a2psMVM1K2tnZmhEV1YrY2lTSllBYmgw?=
 =?utf-8?B?Qk1PcHUxNklFamh4OGVzZXRmR1puMlNZRXVDbm84YkdwRjBjY0dYbnhZTGRY?=
 =?utf-8?B?TXdGekVYRk9GTzV4VmZJQzBwQ3NtM3V5ejdpSm9FNStxSGR1TUNVMzRUL09X?=
 =?utf-8?B?MXZyZWpLV2xzUjdvZ1Rvb0lwK2pid2lRYmo3MG1yUlc5cndhN1g1KzV3NEFF?=
 =?utf-8?B?dUlkZTFoYlhNR01iTVZWVklhVmhjbCtYYkVpeXpFTnFNYTkzL1dURjFRdEZC?=
 =?utf-8?B?ZjZIY25XY1ZaRW16UWpqaU1iRktIU0s0N1V5dE1xQWxnUnkwOWZiSndiOGRJ?=
 =?utf-8?B?OUdoU0JZSjA2S05BY1lMWG54MFg3eWFKeWxwbDJmaVQvOHdpenBDeGNkaWF5?=
 =?utf-8?B?VER0blBXRk1OenFiSVJjRUtIeGxGb2tGaW84N2cyczNqSmFFYmtPdkhkL1lG?=
 =?utf-8?B?Qy9XaEpNbEVGZjdRYzdlQXhVVHg4b3NzaitDSk82SXFmZkVYM05admtOelBh?=
 =?utf-8?B?YnVLQ1Q4ZXB6OGJ6bjZKblY1NlVpMjNHZTdsMEp1VEpQWXZPWWpXS001WjFP?=
 =?utf-8?B?YXlLK2t0d1hyTlpNVHdqamd1UDFmbmMzMkR0U0xObDBxc1hQU01FZWprZ3hx?=
 =?utf-8?B?ak1OSjlRb1RmQ1UwbnN0Q0I4bTV0M0RQUmtPT1hnNTJZUkZNNUMvUWxITXZo?=
 =?utf-8?B?OXhDZTdUUVJPY0pNVDJwNFMyM0U3MXFtSmtydHk5WURUblRZVlFRMTZOMUc0?=
 =?utf-8?B?M0pWQTkwZVRZSEllRUI3UG5sQWNZaWhkQXNnTGRVbWllcUxSeGEzaDJPRnhu?=
 =?utf-8?B?cHVpc0czSzZsZzFTOUVpMkJEQ3J3cUREbVhXWStlSSt1cEQ2b0FVTmxrWTY2?=
 =?utf-8?B?eFJhU3dKcGZFbWx0MVdqcjhsTmNiQkJXMEk2MjVrcllJQ1dDcUIzNEtaMUdQ?=
 =?utf-8?B?SnNFOEVEUzVDVWlCcFNGbHdyRHJTc0hSZnZsMjJjTDl3Zll5T1R3UHpVZVRq?=
 =?utf-8?B?UTMzaDdFRFd5eGN0T1FROUREM2tnZEVFRXZXUUV5bkN0YXFxNGZyaG5XQ0FZ?=
 =?utf-8?B?SVE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: monolithicpower.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN4PR13MB5310.namprd13.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 201a39b4-4706-4962-b3ee-08dc8a871c02
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Jun 2024 02:26:47.4562
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b862589a-7404-403d-98c7-6a3fede1a7b0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 23nKtPICQKIOYVZQuayGk9wIqHnFdTXHgYlSV6/jdWv+Ytv/tU4sq8BQCr/6xGVnH2+X0+/craxR5MHwrF7T58JSQ7gJExW1Y1Gx8dM0WNo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR13MB3884
X-Proofpoint-ORIG-GUID: Fwz0o3zQpVeKRUgCWgKjoPLfj4qi79ir
X-Proofpoint-GUID: Fwz0o3zQpVeKRUgCWgKjoPLfj4qi79ir
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-11_13,2024-06-11_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 clxscore=1015
 impostorscore=0 bulkscore=0 lowpriorityscore=0 spamscore=0 malwarescore=0
 priorityscore=1501 adultscore=0 phishscore=0 mlxlogscore=989
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2406120015

DQo+IE9uIDExLzA2LzIwMjQgMTA6MzIsIFl1eGkgV2FuZyB3cm90ZToNCj4gPiBBZGQgdGhlIGJp
bmRpbmcgZGVzY3JpcHRpb24gYW5kIHRoZSBjb3JyZXNwb25kaW5nIGRyaXZlciBmb3INCj4gPiB0
aGUgTVBTIE1QMzMyNi4NCj4gPg0KPiA+IFNpZ25lZC1vZmYtYnk6IFl1eGkgV2FuZyA8WXV4aS5X
YW5nQG1vbm9saXRoaWNwb3dlci5jb20+DQo+ID4NCj4gPiBDaGFuZ2VzIGluIFYyOg0KPiA+ICAg
LSBGaXggcGF0Y2ggZm9ybWF0IGVycm9yDQo+IA0KPiBPbmx5IHRoaXM/IFNvIGFsbCBvdGhlciBm
ZWVkYmFjayAtIGxpa2UgMTAgY29tbWVudHMgLSB3ZXJlIGlnbm9yZWQ/DQo+IA0KPiBTb3JyeSwg
cGxlYXNlIGdvIHRvIHByZXZpb3VzIGRpc2N1c3Npb24gYW5kIGltcGxlbWVudCBlbnRpcmUgZmVl
ZGJhY2suDQo+IFRoZW4gZG9jdW1lbnQgaW4gY2hhbmdlbG9nIHdoYXQgZGlkIHlvdSBkby4NCj4g
DQo+IEJlc3QgcmVnYXJkcywNCj4gS3J6eXN6dG9mDQpIaSBrcnp5c3p0b2YsDQoNCkkgdGhpbmsg
cHJldmlvdXMgZGlzY3Vzc2lvbnMgY2FuIGJlIHN1bW1hcml6ZWQgYnkgdGhpcyBsb2cuDQoNCk9r
LCAgSSB3aWxsIHdyaXRlIGFsbCBteSBjaGFuZ2VzIGluIHRoZSBuZXh0IHZlcnNpb24uDQoNCkJl
c3QgUmVnYXJkcw0KDQoNCg0KDQoNCg0KDQo=

