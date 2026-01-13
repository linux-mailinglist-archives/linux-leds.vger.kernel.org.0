Return-Path: <linux-leds+bounces-6630-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 09C75D1739A
	for <lists+linux-leds@lfdr.de>; Tue, 13 Jan 2026 09:14:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 49C6B3065233
	for <lists+linux-leds@lfdr.de>; Tue, 13 Jan 2026 08:12:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A2B2A3793B1;
	Tue, 13 Jan 2026 08:12:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b="LLu544xn"
X-Original-To: linux-leds@vger.kernel.org
Received: from mx0b-00128a01.pphosted.com (mx0b-00128a01.pphosted.com [148.163.139.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E01711BC08F;
	Tue, 13 Jan 2026 08:12:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.139.77
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768291946; cv=fail; b=L+7O4zSjIPKA3IJ1rO0em+snWGej7t50akOYWx+uGePRqGpZCoS6/ZuABBsK14qQe16avPrcU5q7iYqDFlRSspU5Vk99G55NEXxk2MUuMPoWUHRKfZpQTYWl/M211EvFFZ85fh+R1qNyB2swH5/AEwsXeULsE7ua/aAwLpsX7UE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768291946; c=relaxed/simple;
	bh=8dOx7GFe2JOC+JdDQi1FShgYx4msGJ7Au7kj5sA1zHQ=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Gt12HWZNlNCX4uHSvmMpMZs/uhhc382vP8+kY20vvUuTs2DlW+DHpJLNg5lEnbe+j0QJQotYEdriqXX2YbF4yoU37wrE65kPt6u2GeYM7FCMyzhNShdB3ewyOM7x1LKiyeiLY3Fpbd4HZAd4UveYt+HLi+5t6HJIoP+t6JmmlL0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com; spf=pass smtp.mailfrom=analog.com; dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b=LLu544xn; arc=fail smtp.client-ip=148.163.139.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Received: from pps.filterd (m0167090.ppops.net [127.0.0.1])
	by mx0b-00128a01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60D5Zv822979067;
	Tue, 13 Jan 2026 03:12:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=DKIM; bh=8dOx7
	GFe2JOC+JdDQi1FShgYx4msGJ7Au7kj5sA1zHQ=; b=LLu544xn48oVKbiadPaw2
	J0l5Wcz/k01hA30AP9hSLJq+JZdfa/U27ppO8xLJ5qlsG+RMhcEiFSTxpQdJBwfe
	Mc++eUokx10Op4qu8QU0A5RBiEUwdzZiN3/d4PnE6rksI+aV7oRcdf3wod9w169W
	RdDPOeFxhg/SiaoBl9vMBNyD+4V6NhVOmrm4URDLpc94nBmuaWro8F45oSprr0Cc
	OzbHXyhGpiFFg/X9hRCMrMiGIbUwIFlDR9Ck8vZHvJThEiw3ZPY7w65WSaeeyhzC
	16x7MR53wxXh8YwHS/6epgEqsjAZjoi3QyMf6CCMoVdkDP80BRG0+reiyf4Q9YaS
	w==
Received: from sj2pr03cu001.outbound.protection.outlook.com (mail-westusazon11012001.outbound.protection.outlook.com [52.101.43.1])
	by mx0b-00128a01.pphosted.com (PPS) with ESMTPS id 4bn8w0ayav-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 13 Jan 2026 03:12:20 -0500 (EST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MNCgC2kkt7G487HaE5SOtmpgJPd0eblR2xmA4FxvPWKFCpdDMZvZR8FZ5HZ4p+lZ8EY9y8aVdGl+uEAdx5QpPdM2z9QVtfkp/PgjoapFVnCDNUOrbDAiNEMmLJtzi1EXOpmrx0yAkxt9HAL1UOpZId5i6jM5M8yGTN+YCOY+N+HwUIF878IBXfIhZzcyj7Qnge8ZoITpWZ9J4jf+LLjG2R+rG1mV7H7JQQKm0jKP4ilIIbXd68R4lRQ1hMzQHcjNjI934EagiMnjSDLFKhecGsZBjOdH4RKmQw5lBUFJfNc+amqnOtlFBPhVfgdsU1Tch9vTwaEb65z2nmHTuB4HUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8dOx7GFe2JOC+JdDQi1FShgYx4msGJ7Au7kj5sA1zHQ=;
 b=Dz92ax9o5Vklg970lOfoFqZklsvSGk7S2liNrPlvhVmjvRHCw3+wsybXG26FhbAwp+UMngWxAHsADT7VOBfbyQ6Xm3o3+i4BUgSR/qO0IKqYf6Fb0HdoxgLxIoWhEj149OyaNDTHXzA/mjgQcqfPK+uxLdOdsZP3rqBs7I+BZ8C0R14UYbTS3nA2dXibZ2l4QfeE1ifHkNEahnAgrH/4DW1QABkd3vwme7YzMLRROHmkqj2drEjudTDB7EPX9T8gToD9sS0WgbsPy19dajJK7kXfcxOMvEZ0P/cmCWXqLuEaRPkS4vdVTDknXxopsDf5j1J3KGDFUwoPjZ1UIuc3Gw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analog.com; dmarc=pass action=none header.from=analog.com;
 dkim=pass header.d=analog.com; arc=none
Received: from PH0PR03MB6525.namprd03.prod.outlook.com (2603:10b6:510:b5::5)
 by CO1PR03MB7963.namprd03.prod.outlook.com (2603:10b6:303:270::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.7; Tue, 13 Jan
 2026 08:12:17 +0000
Received: from PH0PR03MB6525.namprd03.prod.outlook.com
 ([fe80::fd3e:ce9e:8dd2:c5fe]) by PH0PR03MB6525.namprd03.prod.outlook.com
 ([fe80::fd3e:ce9e:8dd2:c5fe%6]) with mapi id 15.20.9499.005; Tue, 13 Jan 2026
 08:12:16 +0000
From: "Escala, Edelweise" <Edelweise.Escala@analog.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
CC: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>,
        Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        "linux-leds@vger.kernel.org"
	<linux-leds@vger.kernel.org>,
        "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v2 0/2] Add Support for LTC3220 18 Channel LED Driver V2
Thread-Topic: [PATCH v2 0/2] Add Support for LTC3220 18 Channel LED Driver V2
Thread-Index: AQHcg6He7BpTIK1W20uZTwopDz+rprVPvqSAgAACMMA=
Date: Tue, 13 Jan 2026 08:12:16 +0000
Message-ID:
 <PH0PR03MB652508CC0CB53611A72A8119ED8EA@PH0PR03MB6525.namprd03.prod.outlook.com>
References: <20260112-ltc3220-driver-v2-0-d043058fc4df@analog.com>
 <20260113-remarkable-determined-pogona-bfb2ab@quoll>
In-Reply-To: <20260113-remarkable-determined-pogona-bfb2ab@quoll>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR03MB6525:EE_|CO1PR03MB7963:EE_
x-ms-office365-filtering-correlation-id: 9594132c-19e8-4583-4318-08de527b7746
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700021;
x-microsoft-antispam-message-info:
 =?utf-8?B?RlZHNFl1NTZENHF3WTZOT2xCNFRnYnNpNlBpT1FQSFU3dlRORXBCOWdhMkY0?=
 =?utf-8?B?NzdpVXJ0V3J1RzlpM0hPZ0Y3TWFFK0xzb3RMYlNCbmpXQm10ZU00WmV6Q2NP?=
 =?utf-8?B?OHZiWEF5WFZtaGo2YWM4bVhWaDBKdjVqcG5HbUJjbmw0eDJmeTNDaG85VUgz?=
 =?utf-8?B?WmhwVkw4NmtLOURqbGkrSHpNVmdoaWVucEtuTlh1OE04blZESml0TmNQTTU2?=
 =?utf-8?B?YXJ2N3dnem9UdFhSQWZ6ZFdtQnJVajlRYW9xLytWTWtSdldvL0E4MUhVSXdi?=
 =?utf-8?B?Nm80N0tRN3JWbW9PYlorcTZTSW1RajhXRE5lTzU1bzMzWHNlS2ZnK2M0U0tp?=
 =?utf-8?B?Q2tFbGN6ZWF5K2d3enJKdmdlcXFlSHVOUE5OVVkxbW9ZN2lkNTI1dUxRemty?=
 =?utf-8?B?UXMzbUFBY3dQTXYrOXBIaElDL2ZNS3RsLzVMUmVTUTduODlaSWsxU2U3WE1G?=
 =?utf-8?B?QitHQisxbnZ0L3kvVU01U1pDanRXelFzWHdnL2RNQzNoV0FON1RYTGVSdlJJ?=
 =?utf-8?B?cVBwZ1d1M0t4VmF1MHhIdlpJaGJVMGZpT1lpb0xiMC9SVmdSaFpsRWU1eWww?=
 =?utf-8?B?S3dGUmpDL01LTXZXVWZsOXlnVTE1Q1ExY1YySk9nUHhDV3Z1a0JWNFRHT2lh?=
 =?utf-8?B?TmhGTW9sdGViYTJ2U01zL05scUMwUGpFQ2gvanFjL2NMN0c4UEo2RE93MkRr?=
 =?utf-8?B?SDQyY0RLaGNvZndFd2hwVWc1THJjZ3g1SUwyVk1JY0hrRk83U0sxT2c5SGli?=
 =?utf-8?B?TmhVUk5hMSsvOTZGTk4zS1NYMG9JcGVnV1hXSlQ2eHowL0xwTnJTTHFxMkY3?=
 =?utf-8?B?UjJuMmNTc01PZHhSMDk4Y1ZZcStHTmRXWEhXaUNXYk9CVW9EcVBxY1drcDIr?=
 =?utf-8?B?UXZwbmJvUmdiUXdoZ0NjUzNVclZOcjRtK3dKUU42RkpPUEZQbVY1bXU4R3Vi?=
 =?utf-8?B?NlZYejZNS2x4ZzBJVzNkMjhVdzFzU1hzUW9ueWRjSWdCY2RwUnhxNEE0b25Z?=
 =?utf-8?B?VGZtVCtsdVBhYisrN0cxZVVrTk51SHhaeGYzWFl1YmxNK0ZNQXBpNlcvODdI?=
 =?utf-8?B?ZjRwdGN1cU56djRwVWV0d2w1U3VzTXFaK3lneHN6SVFKQnV6Y1V6cDRGZkZN?=
 =?utf-8?B?T3hzc1hLbjV1N2J4VjF0bHo2ZllwNkN1b1MxcnBnVzRQLzh5SmtwZGQ5bGh5?=
 =?utf-8?B?eFlLMHNGQnBNUVV5MStmZWdqUnhXV1hNVGFTTE56b0NBaGpjeWtRdEdwaFlX?=
 =?utf-8?B?RVAyYmwwV1VHdXNIL25COEZCaG9KcTkyQjRnWUhObG0rYWMrUUowVVB0dnVX?=
 =?utf-8?B?djV6SUt3c0RpYUVOZUxyU2o2SmFaRUZHcDRNZ2NONkRzeTRyRVQ0SklFeWNQ?=
 =?utf-8?B?b2hrRm0xL0lyL3JPWDJWSkZqcnI3OUwxRnQzckRCNzJkb3l5OWpRdG1GL0Z1?=
 =?utf-8?B?Mk96L2Z4RVFLZ2lIT0lOVU1SRzdrK0c5NXVWK09rL2tucSszQy9jU3lienoz?=
 =?utf-8?B?eGlZTWQyaVk5QXB4SjhwcUN0RHVCVVRJVXYrNVg1Ym5LT0c3WGMvZmxZam5l?=
 =?utf-8?B?d2IrWXRXcDJDNkQvYjBlOUJ4R3RJRnZDZDJ1Qk1laExlMENEVVhuWUE2SzdQ?=
 =?utf-8?B?Q2dwL3VyT1A1OUlySjdhNVFlREg1UVFhTEJnRll1NGw0MjdDQTZudTJHNTlp?=
 =?utf-8?B?aWVVV3dQY1hDK29HWklnQUQ2Nmw5QlowcC9JUGJvdnlxRmVWMkl1VGNxYjNm?=
 =?utf-8?B?dlZTYUhDOUh2b0YrUm9idmd3djNwT1BkT3dZdnZ2a0ViekgwY1oyM2ZWdUtG?=
 =?utf-8?B?eFYzek84VlQ2YnUwNDV2NGdMVVFsNW1DTzEyc0NUMjUvbDNqdng2R3ZXS3lW?=
 =?utf-8?B?VkFodEdVVEZMTmFIYzNQRENxNGFWNEZFTktKVUJQREhwZFhmTHhBdnAvMHov?=
 =?utf-8?B?bjAzQW1GZkNKRHEwTGVlTEp1b3JRY1dRMXd3OW1ueFV3bURjKzBwVklLb09p?=
 =?utf-8?B?OEFtcHJaQ2I3YXNKd0F3T3NLeVIrR3R1L3d0cE5BZURld2NmbVp1RmorYXE1?=
 =?utf-8?Q?cqEuDD?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR03MB6525.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?VGljcTJlMTF4Rml2Y09zT3hhYzJyZ3prSFBZcWcxWUtlTTRjSTMzemZvR0JM?=
 =?utf-8?B?V0NhTGl0cGpCcnFkSk50dnBYdjh3MExFeUMyUFExd1MrbUV4ZXpnN2ljOXFr?=
 =?utf-8?B?bkVmRFBvbEovKzE4ZmNlUVFWNlRES0l4NlRWTmoxNUZEL2QwaktiQmxvY3Iy?=
 =?utf-8?B?eFVXWk9lM2VwT2RhZzA0OEl6K1p3cHN3bExUMHJnbk1lRHFBcTdSdmFHck9q?=
 =?utf-8?B?UzlLeTJQYzlVbHExNHBvR1J1QTAwQjZRYnQ0YzBSeW1SZUladTUzQ1FmNjN4?=
 =?utf-8?B?QmJ0eGE0YWtCa3JNNEtxNjhFeGVDMHdDM295eWMrNE4xbFZWTWZFbnJUbHRJ?=
 =?utf-8?B?TE53dEJPUWFsVVk0YVJQWHBpcUpXL0o1SUpxc3JpNk55U0YwbkloMW1hMFFL?=
 =?utf-8?B?S0hvQVIvdC9ORFNTM0ZXL3NtVVRFdXlvZytxZXhNcHNmSVZNdUlJdUoxcERG?=
 =?utf-8?B?RGdPZWgzdFcvQmt4MEJFYlRralFLNXZ6Nlh4Z2tISGtCOHB3RkdvRWloWTVL?=
 =?utf-8?B?NEhiNE1UV3VFNGZmSDBkTkFVT0QxaTdyeGhnamZlbkp5UHVhMlZTMkliQVp2?=
 =?utf-8?B?dkZoY0RoeUJFTk4xOEFMQU5na1FSWStuditmSnFDbWdOTytYbXpJSzh5TUFT?=
 =?utf-8?B?VVhOcUN2dEF2V0R3Uy9sbk5neFprTGJiWmppd212MjNVWlh2eFk5eVJYRXhj?=
 =?utf-8?B?V2RKZEs2ZkVPdW4vMk1pd1RCME85ekw5TUY1d0FqaGFkY1dsOC9GWUQ3V0tD?=
 =?utf-8?B?R3R6cWJ5b3VwT3FTN3A3N3lvYVZrNFhJNk00SlhjR1k3MDkveWVVQkR3QUdw?=
 =?utf-8?B?VmlENlBacHUxYVVqRkNOQlBiVWY0cGUvY1B0Q2R3NEFNblNHSFZVaElSdWVT?=
 =?utf-8?B?TnErR24vZEx4MGdLcStpaHlla1lYOUNCUFprVHBCQTRjWVd6REMxK1VQTzQ2?=
 =?utf-8?B?NG5saE5Cd0szb05aWjBDb0NEQUlyL2Jla2FpcS9UM0dGcmV2a1hiN2NMOWI2?=
 =?utf-8?B?UDFHLzBBcXA2WVlSUFM3am4yZTEzZzZjRTd1dGJlbmVEZkFsTEw3V2Fzbnhs?=
 =?utf-8?B?L3JMQTh1NnVWRktiNXVIZXlTbTdpa25vM0hOc2pWWDJlUjZFL1kwNEZrMGsr?=
 =?utf-8?B?a2lFRGpkck1kV3FFRVFUWWlzcW84OGovcEJrb2J1ai8wZGZUQ2s2N0p6dUtD?=
 =?utf-8?B?bVMxd3hQRVVEaGVHa3VRcUFlRi9BelUyRnZWT1ZKaHZObFRLeGRHMHFaZ2Nq?=
 =?utf-8?B?Si90ajQzU1dxSDBrcFN1WTBHZU52UFQwMEdnN3BXZmFpZklaZXEwQmZsa04z?=
 =?utf-8?B?b3c1SVh4cUhweitGdVd6bDh4YkxhSnJMUy90SjlLTlIyTHNpREtCbGc0VUJs?=
 =?utf-8?B?eU50WWkzcVVQaXU0SnZoc05RTmpaUDFCd3hwYUhQWUJyMlJ4aWdUVG9MeGhv?=
 =?utf-8?B?VkhrSkZrV3M5NlJOeEsyd3pkVHNyVC9PK3VhRjFaZkJ2S2wrRnZSUGh0UUdh?=
 =?utf-8?B?bDFweC8wOHhWWnBOenpIU3RiTE5OS0lSN2U1VjVLOU5zc1VuMHVOMndLai9m?=
 =?utf-8?B?U1lhZzNMV2FmWkhRbko1TndGR0Jnd29zUFFML0JLRUlRWEVKWENDQVgvZlRt?=
 =?utf-8?B?YWx2YlhhSGgrU2FzbHBqNXQvWnBqUGRqdFdtbDRXZzNVSys2OUxsT1ZqVkNQ?=
 =?utf-8?B?UjFzUFlDTm94VEFVdUZ5YmFycXFSeTdvUmRYN0l6NU5Zc25iVTBFdnJJbEtz?=
 =?utf-8?B?VmVuRjNiL0dpMGtvTnVGeisvZUJKL01ZTUVLK1RCQXp4djBmWVRoVWkzeENE?=
 =?utf-8?B?bndMbE1PZFMwMnlOV3kzd1hKVTlpS29yenBiK1BtNEZHY2hGRjJpQ3FycnV5?=
 =?utf-8?B?MDdFUEV0UFg1TXU2dTRDNlI5bUVxcmVFNmN2d3hULzQwME00NmRqeFdwWTg5?=
 =?utf-8?B?cGo5cWtlTlJldHE3bzd0bW82K2NHRGtkaDd1eFhqT21yZk1POERFSkFldktC?=
 =?utf-8?B?bDRXaEgxUDlEcUNLb21xNlNkdUtrMHJyOFJuUEovVUdlSUZiSGczRk5HWSs4?=
 =?utf-8?B?MThwQUZTblR6OUZMa25aYXdaTmk3UHZiQnVLV2Vha25ONHRzSjFnc29aSEFN?=
 =?utf-8?B?K3VXTW5kcVVFaWU0SFhmbXR0T2k3NzIvank4WlNBTWVjaFU0aUNhVlM5b090?=
 =?utf-8?B?T1F1Zm9VRE8yT3h5SEdlV1Rqb3ovMkprOTBBSHU1aXpRU0haVFg0SlBXb05u?=
 =?utf-8?B?bnRQWmZsamFtMEc0NmxNRGY5Nzh2YTlmNCtmcnR0dWlaNXNjWWdOc29GZ1JI?=
 =?utf-8?B?bUtvSUFiOHRWT29wWVo5UEpnd1lVenV3d0twcGx6dzBIUXYwbThJUT09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: analog.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR03MB6525.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9594132c-19e8-4583-4318-08de527b7746
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Jan 2026 08:12:16.8242
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: eaa689b4-8f87-40e0-9c6f-7228de4d754a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: s1XVxvLQMPibU+lOeShrCeXE9K+JEkf9WQJ7LdsW0mtPfHJ8/f5U48L/2GfORW4SvH4dg8ZcnBNZUZI5Qjw6SqzNcaVaxqIr0/5CUa5V/gc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR03MB7963
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEzMDA2NyBTYWx0ZWRfX8IIYaMC40d2C
 KK1scMjVXk/Rcmiw627LslilOUpfBZiF5X0rsHLwhTo5Xhp77iY5niidQMrFhwwiXaFujvMKNQQ
 OTEvYvpsY+d8KUy6LjGZDCMui+KaVcwXbK88vd8XfNu9B9Zf9TzW+jWRGm3wyWkt2bYl2J11RdE
 AN3l90tcYMI24soO8PeQKMkZulRZA8mdeVoIDhJiWAlwU6M3OnAdlqb1QVQBBLYVWbx6z/wHgAV
 3vbQw/Y/Ea/rauV5ePyKoi4P+4zTE8oDEumCawHpG/FPGcguRspqkhvoWpozjfEzib8IZKnKX+X
 2hQKmkBaIvCU0ZVv6bi/4tYtB7m9VYCJUNTsiwqSJmgdjgOedoIHHM6076fs6Qjj0c9TQ96pn3Z
 ItqY5uYcJbxzII9xNKOgyUqd3h8hzLd2fbu5T4G1cksrv1MovBD6hzqyhdAYT1yhf7OU2u8HCMh
 lo92jSO6xNnneRhYEug==
X-Proofpoint-GUID: f8SGv8TVVKvkgP62qT5yxe1Fz7rvLGWh
X-Authority-Analysis: v=2.4 cv=MaFhep/f c=1 sm=1 tr=0 ts=6965fe64 cx=c_pps
 a=JgVaYur/QNM9XUS2zzqRTA==:117 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=VkNPw1HP01LnGYTKEx00:22 a=gAnH3GRIAAAA:8
 a=YDjGm4a3r6l4fmoAM_MA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: f8SGv8TVVKvkgP62qT5yxe1Fz7rvLGWh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-13_01,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 priorityscore=1501 impostorscore=0 bulkscore=0
 lowpriorityscore=0 suspectscore=0 adultscore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601130067

DQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggdjIgMC8yXSBBZGQgU3VwcG9ydCBmb3IgTFRDMzIyMCAx
OCBDaGFubmVsIExFRCBEcml2ZXINCj4gVjINCj4gDQo+IFtFeHRlcm5hbF0NCj4gDQo+IE9uIE1v
biwgSmFuIDEyLCAyMDI2IGF0IDA0OjU1OjUzUE0gKzA4MDAsIEVkZWx3ZWlzZSBFc2NhbGEgd3Jv
dGU6DQo+ID4gVGhlIExUQzMyMjAvTFRDMzIyMC0xIGlzIGEgbXVsdGktZGlzcGxheSBMRUQgZHJp
dmVyLCB3aGljaCBjb250YWlucyBhDQo+ID4gaGlnaC1lZmZpY2llbmN5LCBsb3ctbm9pc2UgY2hh
cmdlIHB1bXAgdG8gcHJvdmlkZSBwb3dlciB0byB1cCB0bw0KPiA+IDE4IExFRCBjdXJyZW50IHNv
dXJjZXMuIFRoZSBMRURzIGFyZSBpbmRpdmlkdWFsbHkgY29uZmlndXJhYmxlIHRvDQo+ID4gNjQt
c3RlcCBsaW5lYXIgYnJpZ2h0bmVzcyBjb250cm9sLCBibGlua2luZyBhbmQgZ3JhZGF0aW9uIGNv
bnRyb2wgdmlhDQo+ID4gMi13aXJlIEkyQyBpbnRlcmZhY2UuIFRoZSBibGlua2luZyBhbmQgZ3Jh
ZGF0aW9uIGNvbmZpZ3VyYXRpb24gaXMNCj4gPiBzaGFyZWQgYWNyb3NzIGFsbCBMRUQuDQo+ID4N
Cj4gPiBMVEMzMjIwIGhhcyBhIHF1aWNrIHdyaXRlIGZ1bmN0aW9uIHdoaWNoIGFsbG93cyBjaGFu
Z2luZyB0aGUNCj4gPiBicmlnaHRuZXNzIG9uIGFsbCBMRURTIHNpbXVsdGFuZW91c2x5IHdoZW4g
dGhlIGJyaWdodG5lc3MgaXMgY2hhbmdlZCBvbg0KPiBsZWQgMS4NCj4gPiBGb3IgdGhpcyB3ZSBt
YWRlIHF1aWNrIHdyaXRlIGEgZGV2aWNlIHByb3BlcnR5IHdoaWNoIHVzZXIgY2FuIHNldCBvbg0K
PiA+IHRoZSBkZXZpY2UgdHJlZS4gV2Ugd291bGQgbGlrZSB0byBrbm93IGlmIHRoaXMgYXBwcm9h
Y2ggaXMgYWxyaWdodD8NCj4gPiBBbm90aGVyIHdheSB3ZSBtaWdodCB3YW50IHRvIGtub3cgaXMs
IGlzIGl0IGFscmlnaHQgdG8ganVzdCBtYWtlIGENCj4gPiB2aXJ0dWFsIGxlZCBmb3IgdGhlIHF1
aWNrIHdyaXRlIGZ1bmN0aW9uLiBDaGFuZ2luZyBicmlnaHRuZXNzIG9uIHRoZQ0KPiA+IHZpcnR1
YWwgbGVkIHdpbGwgY2hhbmdlIHRoZSBicmlnaHRuZXNzIGZvciBhbGwuDQo+ID4NCj4gPiBWMiBD
aGFuZ2Vsb2c6DQo+ID4gbGVkcy1sdGMzMjIwLnlhbWwgY2hhbmdlcw0KPiA+IC1GaXggd3JhcHBp
bmcgb24gZGVzY3JpcHRpb24NCj4gPiAtSW1wcm92ZSBkZXNjcmlwdGlvbiBhbmQgY29tbWl0IG1l
c3NnZSB0byBkZXNjcmliZSBoYXJkd2FyZSAtRHJvcA0KPiA+IGx0YzMyMjAtMSAtRHJvcCBjaGFy
Z2UgcHVtcCBsdGMzMjIwLmMgY2hhbmdlcyAtRml4IHdyYXBwaW5nIC1Ecm9wDQo+ID4gbHRjMzIy
MC0xIC1Ecm9wIGRldm5hbWVfbWFuZGF0b3J5DQoNCg0KQXBvbG9naWVzIG15IGVkaXQgb24gdGhl
IGNvdmVyIGxldHRlciBpcyB3cm9uZyBJIHdyb3RlIHRoZSBjaGFuZ2Vsb2cgYWJvdmUuIEJ1dCB0
aGlzIHNob3VsZCBiZSB0aGUgY2hhbmdlbG9nDQoNCj4gPiBTaWduZWQtb2ZmLWJ5OiBFZGVsd2Vp
c2UgRXNjYWxhIDxlZGVsd2Vpc2UuZXNjYWxhQGFuYWxvZy5jb20+DQo+ID4gLS0tDQo+ID4gQ2hh
bmdlcyBpbiB2MjoNCj4gPiAtIEVESVRNRTogZGVzY3JpYmUgd2hhdCBpcyBuZXcgaW4gdGhpcyBz
ZXJpZXMgcmV2aXNpb24uDQo+ID4gLSBFRElUTUU6IHVzZSBidWxsZXRwb2ludHMgYW5kIHRlcnNl
IGRlc2NyaXB0aW9ucy4NCj4gDQo+IEh1aD8NCg0KQmVzdCBSZWdhcmRzLA0KRWRlbHdlaXNlIEVz
Y2FsYQ0KDQo=

