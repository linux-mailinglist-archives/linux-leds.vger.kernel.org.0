Return-Path: <linux-leds+bounces-5220-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DFFCB22618
	for <lists+linux-leds@lfdr.de>; Tue, 12 Aug 2025 13:45:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 30B3F3BE01B
	for <lists+linux-leds@lfdr.de>; Tue, 12 Aug 2025 11:44:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA9FB2ED876;
	Tue, 12 Aug 2025 11:44:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=leica-geosystems.com.cn header.i=@leica-geosystems.com.cn header.b="WHuLrfYH"
X-Original-To: linux-leds@vger.kernel.org
Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013012.outbound.protection.outlook.com [40.107.162.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F2F22E9722;
	Tue, 12 Aug 2025 11:44:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754999095; cv=fail; b=odBvxXSoVfc3uPb7rYLJxhvmPUNf5TcxnENOULtOSqF0HJDomwV1iNRWXkwetVAdfZv+ibLpdUEFWkGVcHWFeFan82iaNlliM/K81Hdk4Xx3M8ZyzefFK+TMn0N7Remk3z0eFDfQmgDhCLyG1dLuDGTpdEHtV3IJv/kEb78LXXM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754999095; c=relaxed/simple;
	bh=D88leWmxY9PlkFbP4W8A7WLUbZvIVtNIR2OO9EihC5s=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=N/JjKaI5JHvehWo98MJe2neT2hZAJ5JwW8/9jeHvcXB+Xty65aLS81FBh/4z+R7CGsD1MRxZ0smmf8gr1BHtGSZkE3FiA3R7fDmQLqu0QOk2EvW540XDiYaWpf0jvSYT06n9YryCrgOCx0L9t5Gc3UEEtZ75ZrCF1mG/a1G6Pgg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=leica-geosystems.com.cn; spf=fail smtp.mailfrom=leica-geosystems.com.cn; dkim=pass (1024-bit key) header.d=leica-geosystems.com.cn header.i=@leica-geosystems.com.cn header.b=WHuLrfYH; arc=fail smtp.client-ip=40.107.162.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=leica-geosystems.com.cn
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=leica-geosystems.com.cn
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=q6Zki4CdyfTYhJFLjp4j6NEbmwfgka0LARyTIZ6W8FjyHt8giADaw13TCYd3rU9aQrwShXPTfGCgy0rAiJGN1a1KicaG32AOGmSbDjuhPuAE6OjXkxZGGf+LRl5m94Gu0FpY7yzGp1lKMao4DY2fJOjybOYK7ItHI6jgzpPODF1a8+7KmnKn1nTcr8EoU8qr09Tj7bSTU0Cu1JqT/HzFlG63eBPGx1iW0gK73K4MmaPRFJN23luSjvWqc4s1Pw7aE+u05F0I27TZfPkIN228E2k09lTC3buQsuWbUyOn6M1eAQP40VaPNUFl+jOt20AVh2P5zNVYO+j9KxQfRxEk5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D88leWmxY9PlkFbP4W8A7WLUbZvIVtNIR2OO9EihC5s=;
 b=HZCQjoCHisLsCzMx41EDOLtpAObS8FMQZzf8v5UtA0wO5rMPbYOovvjKzAvFnq6wtqaIfmY0U0i2SAEiORCYUZQNDLyleSHu5LpOzUqOqGHpj9HK4RAoQDUUv/i0Twdq7qkb7srqJ4QMcDTtkMJb7kypj7kcYNZWOFnveL7vtA8TKfoqB5B+l0twF3Dwxq08yJxYJU0ZO39gBl0Gs6/09xpWeBbvBOb8X/JM4SjuE0XA8t4txyajtXtxiG/XIb3mjDUPFxBJwz0/ufrG5nF1lg5qBYGWSvk/3HEeO2XLMMau/9QcroJ2GHtwrR4p6UPQjh9zati7eVfB2uTp7bp/zQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=leica-geosystems.com.cn; dmarc=pass action=none
 header.from=leica-geosystems.com.cn; dkim=pass
 header.d=leica-geosystems.com.cn; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=leica-geosystems.com.cn; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D88leWmxY9PlkFbP4W8A7WLUbZvIVtNIR2OO9EihC5s=;
 b=WHuLrfYHQ44qc7jBfCgGqHqOeidCk01DOrFmzokf2js9akOCTi0I0Rb1pzwY+iEpnJ45Wty/UuyoWzl7QyfkZSXCEUJS/Ld0fiv5OJCPiW//W5MqurW001fBxG6kYck8UFTk6Cp8IsAtM9cAI76MqRrHB6N8Sxgxglo5NSzsCUo=
Received: from PAXPR06MB7966.eurprd06.prod.outlook.com (2603:10a6:102:1a5::19)
 by DB8PR06MB6474.eurprd06.prod.outlook.com (2603:10a6:10:126::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.21; Tue, 12 Aug
 2025 11:44:49 +0000
Received: from PAXPR06MB7966.eurprd06.prod.outlook.com
 ([fe80::7024:6061:c75c:760e]) by PAXPR06MB7966.eurprd06.prod.outlook.com
 ([fe80::7024:6061:c75c:760e%4]) with mapi id 15.20.9009.017; Tue, 12 Aug 2025
 11:44:49 +0000
From: LI Qingwu <Qing-wu.Li@leica-geosystems.com.cn>
To: Lee Jones <lee@kernel.org>
CC: "pavel@kernel.org" <pavel@kernel.org>, "robh@kernel.org"
	<robh@kernel.org>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>, "linux-leds@vger.kernel.org"
	<linux-leds@vger.kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: RE: [PATCH V8 2/2] leds: pwm: Add optional GPIO enable pin support
Thread-Topic: [PATCH V8 2/2] leds: pwm: Add optional GPIO enable pin support
Thread-Index: AQHb/HFP1RYejI5jWkaTvESOZN77PrRMF9SAgBLrV0A=
Date: Tue, 12 Aug 2025 11:44:48 +0000
Message-ID:
 <PAXPR06MB7966CCA6E36625F3F807DA2BD72BA@PAXPR06MB7966.eurprd06.prod.outlook.com>
References: <20250724080221.7562-1-Qing-wu.Li@leica-geosystems.com.cn>
 <20250724080221.7562-3-Qing-wu.Li@leica-geosystems.com.cn>
 <20250731104623.GD1049189@google.com>
In-Reply-To: <20250731104623.GD1049189@google.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=leica-geosystems.com.cn;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAXPR06MB7966:EE_|DB8PR06MB6474:EE_
x-ms-office365-filtering-correlation-id: 906cdd0a-1d83-41ca-8994-08ddd995a490
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?QWd2N2plY2hnRUtGaU50WFR1YWVZMU9vdU9QZnVBUkZIZ2ZZbEptNFJVZFBt?=
 =?utf-8?B?MjUzOGtMWHd1V0ZiZXFUR2lXSEU2aW1sd2kxRyt1UVVGMGRqbmxzdllUUVlI?=
 =?utf-8?B?bGZCNGtpY0Q2VmtaL2MzWTdadzZaVnN6a2p5TytHeklUMUJLTElUS1ozN0JH?=
 =?utf-8?B?ak9GWnBhaCtaNkdiVnlIeWNsM0twVFN2ZzMyak1wdzd1aElaN1VCTEpLNkpZ?=
 =?utf-8?B?RXJoV2ZrTmVOemNaNE4yaTlFS0xETDM0dnlqQXB6SmFkUHFRUjk0LyswZlFD?=
 =?utf-8?B?aUJIdkhMTEp6aGZuTTI2cFk2cXp1VGlqNENYZDQwdkt2aW16RVVxRWl5amRE?=
 =?utf-8?B?c3B0dHFLZVdwakR2NU01RlRPTUFMc2dXVlMwMVd2T1RXcC9qOWs5STcrbTVk?=
 =?utf-8?B?K1ZHcVBnc29JVmk1SW1wY2pUKzhjeTVudGpvbmE4THdvTE5xbnVMN0pqZXg1?=
 =?utf-8?B?SFF2aHg1S1pkbHlZSXRMRFJDbjZnZ2haSUZ6TFp4T0R5MTdSNkg0aWxHT3FM?=
 =?utf-8?B?Yi9mTTlubGtIZE13UXc0VHpWcUlWWExTQXVqamNaNDlEcTdORG9VS3hCb2t4?=
 =?utf-8?B?d0VKNm0zU3FTeTQ5YWdlSEl6aWprTnZwY1ZYZC9iZ0RYaFFhRTB2c0l2Mmcy?=
 =?utf-8?B?UUxDMTQyWHhtRngzcFdkZndlSFUvdjhLZG9JbEI5VE9GSFJOTi9OMnNuT2J5?=
 =?utf-8?B?RE4rZU82N3JCYjNmSXNYeWs2Y1hXTTgxbWhUNktOOTkvVVJmVWhhdVk5Q1pp?=
 =?utf-8?B?Y3BsU284aHZkWmNtQzdyTlRlUVFvNUk1OGNlUERrbDJiRnY4SERSMmM3bkZw?=
 =?utf-8?B?S3BPb25QK05HT1dQeGhWdDhpQ0VNd01ocG9oS1l4SWduT1lTV2JSRkQ3TVpU?=
 =?utf-8?B?MC9wRUNzTHhzYmF1OGN3VjNtRGdna201Y1RnbWs3UDVjcHdaZ2ViV21IRnZv?=
 =?utf-8?B?QTd6YkI1V1VHYnlKRVlPVld4elpSYW5YR0xtOVd3dHNGM1A3b25wYmZNbzg2?=
 =?utf-8?B?Y0NiYnNXbnNFYTVpbHNvZjRZY3RpLytiaVBaUEY2Y3ZrQlNkS0dJdzBnNzY1?=
 =?utf-8?B?dXJEeTFJd3hyUURoQTlIeVZmTVh5N05hcDhIakpDb2U4RDJoVjBDWVdNaFln?=
 =?utf-8?B?ZnN6bS82S09wK0RZUFN1SGxwdzBhQStHckQvS3FRK2FoRzlubnlnZTV2YjF4?=
 =?utf-8?B?U25JMjFqQy90V2lVYjVsY2xyYk9JUU9rbnNxZytIakhTWk1jQzZZUU5pUHlu?=
 =?utf-8?B?Y1F1dzBzNDR1YnlqOHIvNjhLU2JKZGdHWlJ5emVacHpzTDE0VjNjUHgyR0Q2?=
 =?utf-8?B?dHh0eG5QQjZ0Z2hJc2h4dEJUenR3enAzZlA2aGxNeVo2OXFhc2F4VXBpUzI4?=
 =?utf-8?B?NzB4MkVqcVpWNVdUSzJkOU1NcVJCeWNiWEdEUCtpME1tMllQNk0ycWpqZ0JL?=
 =?utf-8?B?cVVuYTd6MkNlOXJFK2VEVzJ1cnZpeDM3MU9JY3dxNjVNMkJsOWFUWEZ5Rkgy?=
 =?utf-8?B?V0FlUVhQVERQUzhhTkdSMGVKenEyMDhpdDd0WEFQNy9uUzFocnZ6cE5JT21V?=
 =?utf-8?B?eFpvTjh1dlR5SmMrd2hoRkJEbFlOVmdBdll4Qys1amdmOTdkSlRLbm9SSnNG?=
 =?utf-8?B?cnBNRWVrcUxINUhCcjhHU1pMcTRQZzJpZUdmRS9oMlY4Ym43aWV2SGdHSk1M?=
 =?utf-8?B?eGo5Nm1KOHhVV2hpQ0JFTlJpWXJlSG1BbThUZFF6bzhsb0tBemFxNWIyZ3lI?=
 =?utf-8?B?blBza1M4YlIrRG5aSFFWUnZHZDd2Ymt4S3ZYcnR1REROQ0szUFVmeXhrd0do?=
 =?utf-8?B?NDI2ZEsvbm4xa3ViRi84cm5GSmdncHVXUUNmRGovTGQ4WVZqRFovYmF6aU1a?=
 =?utf-8?B?VjRBcW4wbGlzTXJXVjN5elV5NC9VVzFBMHJUVmtjZnhqRFh2WUlSQTVxeGd6?=
 =?utf-8?B?MjZseVo1YXJlc2lSRU9jVGlFcTEvcTV0ajZzQTBaMUJNL3hTRzNURHlqYmJ3?=
 =?utf-8?Q?oWFrDwoDTNbiCp4F93uLX4IvBIZU+U=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:zh-cn;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR06MB7966.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?dlBTTFJ2R1A5aUJvS09ocm9RVStWUDBMUjRra0ZOYjB4Smw4anNWTTZJNDg0?=
 =?utf-8?B?dkZQUVNwaXl4cFRDSmFjZFZKcklTRU5lL29KeTE4eWVhOWc1bXRKMU1acHMw?=
 =?utf-8?B?U0JDUktSaHBLRm8ydWJhYklxWkwvdy9pZHRJSmVPcDJROWpQdnBEaFAvR0ZL?=
 =?utf-8?B?eSs5UG8xZUhJY1IvVkJwNml5VGw3ckNQVkFZZnM5Si9nS2FtYXJnVWRsTUxL?=
 =?utf-8?B?WEowRFdrMituS3Uwa1FsNmp6K3paMDZjdnV6OGVpSi9WVnhLNFFYUGdZOU9Z?=
 =?utf-8?B?RUF5a0JCSW9NUUx0NDdCdHprWmdMcVd5NmF1bWF2SjBZU1pzd3YxcjVtY28r?=
 =?utf-8?B?aGFhUTVWNXQ5RW1PNDFnTmVWSy9MWTZoR0o1OGtqR2N1SlFzYmlXZDdQUDFZ?=
 =?utf-8?B?SGNGNkRrMVdoR0J3UnlFUlExUFMvbEFLL1cyUXhkakIwZ2FQTVcwN083RnVp?=
 =?utf-8?B?YWQvYUg2bVJQKzVUeXJNb0MvZWViWWZIT3dCOUNLZTBuK1EvRnduWTRYR2Z6?=
 =?utf-8?B?bk8rL0NudDQ4YW53UkZYaW5pckh2OGZRTVYvZ1JNR3paaVNWTVpkR1g5dlVq?=
 =?utf-8?B?MFNYRWI0L0ZLSFhWak9tcjc1MXNRMFN0Q0l3OWJCL1VzeUVIQkxqSm90OXFB?=
 =?utf-8?B?YzRnaCsvd01ZMUg3eXBMUTkwYTBSZlhYR1JVYk9JcGgxbm5kb0dNWW4vZ2Fx?=
 =?utf-8?B?MlVFbWt3WjBtOTBWVlhVeHF3a3lmSlExZEZ5aXVwWGREK28wRFNOcXFvV2Zm?=
 =?utf-8?B?Q3kxckdaRVVWVEdjM04xSzhWRmdxMkxxUGJRRTV1c0RhM2JLQWpmY1JQbGZy?=
 =?utf-8?B?R0orSkFua294Y1h6bHVydm5nTUpxMmpNMUdQWjZKN0pucDl2Z1hZWVE2bytP?=
 =?utf-8?B?NEVYSWcwbU4yd0phQTc5cTFJbEZoL1FmemhCbVkxUEhld1VGWDFSM05oU1BR?=
 =?utf-8?B?WmJBVkV5UkFYejQrOE1vT29QelFHZWh3eldGTXZnRGQyVVFMOTVKQ1pPc3Fn?=
 =?utf-8?B?UzVHQkpMRG81UEJmKzExejBQVEN6NFJKWHlDVXBKbnErNlE0ZFRWcVhxRVY2?=
 =?utf-8?B?blVUL1loZEwvRGljMFgzVEN6Ty9SYldtMThOc1BpMm9LOGtxVWo4K1N1SW9O?=
 =?utf-8?B?Tm1wRFJOVGR1YXB5WkF5Z3NsWU9BN2RwcGhXbUVmWXNTcFo1VTFrQ2dlR29x?=
 =?utf-8?B?azYvbGt4Vk5HRGUrU3RBa3RrQWlGcWM4SXNMUEJYendhT1NkTWRyaU9sSUVQ?=
 =?utf-8?B?cnhMbkNZbTVDUytJSlJROURqTHVQc1FFc3ZOSXIreDlNengrbnRGd0dSeVgy?=
 =?utf-8?B?bVM3eWhiSGxsUE9Rai9OcWhPN3VVQW5lTExlVDlOTDRhb2VwR3hrLzFzL1pR?=
 =?utf-8?B?S1hQY0o2N1VZRzB2Uk9XK2x1K21JWUs3cXMxZ0xlTmxwRXBRZ2VBb1ZJZjIv?=
 =?utf-8?B?TlY0TzRJSnBlTXYwTC8vbHRGYnlEL3kvVWtwdmRVSVJYTG8vVXo4b0oxOUpx?=
 =?utf-8?B?OG51TUl6L3h0SUdIeXlyTHhHNlRqbkJoRlY1R2dMUnF6Yzc2UjZ4OVlFYmNs?=
 =?utf-8?B?ZkRBazgwNVJZT01lL3pJNEF6d0RiL2NoazJVMS9xdXp6NG5nVnpIWDhGTHNx?=
 =?utf-8?B?dCtjZ0pERkVxV1lEbmhYcmVycGY4V01nM2RkUDJaQmdIekpRbVoxczJlTmhS?=
 =?utf-8?B?a0tIVE5jSlVUN3h2YzdCb25zZmtvTG5ZdXZNd2h6a2lFYVM2cjJVYU16NTF0?=
 =?utf-8?B?Qm5WclBpNkZQdWtyT1dFL24xd0VRNVphZEtLc3VsQTUwK3dwaCtNSmdmNWZ3?=
 =?utf-8?B?QnlwSjUzYVE4K0ZwenE5S0pUd3NFS0FpcFlFcWtndlBad2FFdVR2SFFDcG5q?=
 =?utf-8?B?K0tnbXI0NWppU2szQWxGUDhUV1NsYTI1dFlYY2xzTmd3THVScmVxZXZLSW5a?=
 =?utf-8?B?TEVaeXdwcXI5SGxiMG5MbU1mQnJyeUs1Z2tQMVYrbVB6a1FIYVMxRmxWckE2?=
 =?utf-8?B?aFNESGtBaEVHSUpWUW5WVHFqMlZoTVMySmxBdW50SXJLTFJFVFRlRnNxeGhl?=
 =?utf-8?B?TGdDRlQxK21TdzlONXV6a21LTjRZN0R4SENxNkJVQ1B2OHNrOUhZdW9UNHNp?=
 =?utf-8?B?VFRGNGFkeDZkNXZwT1NmVmZkSC9lNzNkd0gwVTl5Q2Z2M0l0cmNLWGdxQTVL?=
 =?utf-8?Q?xGJeXJXdkmcSwLozG/++gZs=3D?=
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
X-MS-Exchange-CrossTenant-AuthSource: PAXPR06MB7966.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 906cdd0a-1d83-41ca-8994-08ddd995a490
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Aug 2025 11:44:49.0599
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: t1misdpU4K8pronkb/O2/UPpmtjmkyLvHxg+rpW2hTghJlUckfk94qnN76gAZLkK6TgaN8dEuZcVOjlChxXdYOlairXetQF2Oh+TsozcYu/ttPkeZes549JELB6wHZPO
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR06MB6474

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogTGVlIEpvbmVzIDxsZWVA
a2VybmVsLm9yZz4NCj4gU2VudDogVGh1cnNkYXksIEp1bHkgMzEsIDIwMjUgNjo0NiBQTQ0KPiBU
bzogTEkgUWluZ3d1IDxRaW5nLXd1LkxpQGxlaWNhLWdlb3N5c3RlbXMuY29tLmNuPg0KPiBDYzog
cGF2ZWxAa2VybmVsLm9yZzsgcm9iaEBrZXJuZWwub3JnOyBrcnprK2R0QGtlcm5lbC5vcmc7DQo+
IGNvbm9yK2R0QGtlcm5lbC5vcmc7IGxpbnV4LWxlZHNAdmdlci5rZXJuZWwub3JnOyBkZXZpY2V0
cmVlQHZnZXIua2VybmVsLm9yZzsNCj4gbGludXgta2VybmVsQHZnZXIua2VybmVsLm9yZw0KPiBT
dWJqZWN0OiBSZTogW1BBVENIIFY4IDIvMl0gbGVkczogcHdtOiBBZGQgb3B0aW9uYWwgR1BJTyBl
bmFibGUgcGluIHN1cHBvcnQNCj4gDQo+IA0KPiBPbiBUaHUsIDI0IEp1bCAyMDI1LCBMSSBRaW5n
d3Ugd3JvdGU6DQo+IA0KPiA+IEFkZCBzdXBwb3J0IGZvciBvcHRpb25hbCBHUElPLWJhc2VkIGVu
YWJsZSBwaW4gY29udHJvbCB0byBQV00gTEVEIGRyaXZlci4NCj4gPiBTb21lIFBXTSBMRUQgZHJp
dmVyIGNoaXBzIGxpa2UgVFBTOTIzODAgYW5kIExUMzc0MyByZXF1aXJlIGEgc2VwYXJhdGUNCj4g
PiBlbmFibGUgc2lnbmFsIGluIGFkZGl0aW9uIHRvIFBXTSBjb250cm9sLiBJbXBsZW1lbnQgc3Vw
cG9ydCBmb3Igc3VjaA0KPiA+IEdQSU8gY29udHJvbCB0aHJvdWdoIHRoZSAiZW5hYmxlLWdwaW9z
IiBkZXZpY2UgdHJlZSBwcm9wZXJ0eSwNCj4gPiBhY3RpdmF0aW5nIHRoZSBwaW4gd2hlbiBMRUQg
YnJpZ2h0bmVzcyBpcyBub24temVybyBhbmQgZGVhY3RpdmF0aW5nIGl0IHdoZW4NCj4gb2ZmLg0K
PiA+DQo+ID4gVGVzdGVkIG9uIGkuTVg4TVAgRVZLIHdpdGggVFBTOTIzODAgTEVEIGRyaXZlciBj
aGlwDQo+ID4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBMSSBRaW5nd3UgPFFpbmctd3UuTGlAbGVpY2Et
Z2Vvc3lzdGVtcy5jb20uY24+DQo+ID4gLS0tDQo+ID4gIGRyaXZlcnMvbGVkcy9sZWRzLXB3bS5j
IHwgMjAgKysrKysrKysrKysrKysrKysrKysNCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDIwIGluc2Vy
dGlvbnMoKykNCj4gPg0KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2xlZHMvbGVkcy1wd20uYyBi
L2RyaXZlcnMvbGVkcy9sZWRzLXB3bS5jIGluZGV4DQo+ID4gYzczMTM0ZTdiOTUxNC4uMDhhMWY3
MzUxNjZhZCAxMDA2NDQNCj4gPiAtLS0gYS9kcml2ZXJzL2xlZHMvbGVkcy1wd20uYw0KPiA+ICsr
KyBiL2RyaXZlcnMvbGVkcy9sZWRzLXB3bS5jDQo+ID4gQEAgLTE3LDYgKzE3LDcgQEANCj4gPiAg
I2luY2x1ZGUgPGxpbnV4L2Vyci5oPg0KPiA+ICAjaW5jbHVkZSA8bGludXgvcHdtLmg+DQo+ID4g
ICNpbmNsdWRlIDxsaW51eC9zbGFiLmg+DQo+ID4gKyNpbmNsdWRlIDxsaW51eC9ncGlvL2NvbnN1
bWVyLmg+DQo+IA0KPiBUaGlzIGxpc3QgaXMgYWxwaGFiZXRpY2FsLg0KPiANClRoZSBvcmlnaW5h
bCBjb2RlJ3MgaW5jbHVkZSBvcmRlciBpcyBub3QgYWxwaGFiZXRpY2FsLA0KSWYgeW91IHByZWZl
ciwgSSBjYW4gcmVvcmRlciBhbGwgb3IganVzdCBwdXQgIiNpbmNsdWRlIDxsaW51eC9ncGlvL2Nv
bnN1bWVyLmg+IiB0byBmaXJzdCBsaW5lLA0KUGxlYXNlIGxldCBtZSBrbm93IHlvdXIgcHJlZmVy
ZW5jZS4NCg0KTGkgUWluZ3d1DQoNCj4gPiAgc3RydWN0IGxlZF9wd20gew0KPiA+ICAgICAgIGNv
bnN0IGNoYXIgICAgICAqbmFtZTsNCj4gPiBAQCAtMjksNiArMzAsNyBAQCBzdHJ1Y3QgbGVkX3B3
bV9kYXRhIHsNCj4gPiAgICAgICBzdHJ1Y3QgbGVkX2NsYXNzZGV2ICAgICBjZGV2Ow0KPiA+ICAg
ICAgIHN0cnVjdCBwd21fZGV2aWNlICAgICAgICpwd207DQo+ID4gICAgICAgc3RydWN0IHB3bV9z
dGF0ZSAgICAgICAgcHdtc3RhdGU7DQo+ID4gKyAgICAgc3RydWN0IGdwaW9fZGVzYyAgICAgICAg
KmVuYWJsZV9ncGlvOw0KPiA+ICAgICAgIHVuc2lnbmVkIGludCAgICAgICAgICAgIGFjdGl2ZV9s
b3c7DQo+ID4gIH07DQo+ID4NCj4gPiBAQCAtNTEsNiArNTMsOCBAQCBzdGF0aWMgaW50IGxlZF9w
d21fc2V0KHN0cnVjdCBsZWRfY2xhc3NkZXYgKmxlZF9jZGV2LA0KPiA+ICAgICAgIGlmIChsZWRf
ZGF0LT5hY3RpdmVfbG93KQ0KPiA+ICAgICAgICAgICAgICAgZHV0eSA9IGxlZF9kYXQtPnB3bXN0
YXRlLnBlcmlvZCAtIGR1dHk7DQo+ID4NCj4gPiArICAgICBncGlvZF9zZXRfdmFsdWVfY2Fuc2xl
ZXAobGVkX2RhdC0+ZW5hYmxlX2dwaW8sIGJyaWdodG5lc3MgPT0NCj4gPiArIExFRF9PRkYgPyAw
IDogMSk7DQo+IA0KPiBIb3cgYWJvdXQgdGhlIG1vcmUgc3VjY2luY3Q6DQo+IA0KPiAgIGJyaWdo
dG5lc3MgPyAxIDogMA0KPiANCj4gT3I6DQo+IA0KPiAgICEhYnJpZ2h0bmVzcw0KPiANCj4gPiAr
DQo+ID4gICAgICAgbGVkX2RhdC0+cHdtc3RhdGUuZHV0eV9jeWNsZSA9IGR1dHk7DQo+ID4gICAg
ICAgLyoNCj4gPiAgICAgICAgKiBEaXNhYmxpbmcgYSBQV00gZG9lc24ndCBndWFyYW50ZWUgdGhh
dCBpdCBlbWl0cyB0aGUgaW5hY3RpdmUgbGV2ZWwuDQo+ID4gQEAgLTEzMiw2ICsxMzYsMjIgQEAg
c3RhdGljIGludCBsZWRfcHdtX2FkZChzdHJ1Y3QgZGV2aWNlICpkZXYsIHN0cnVjdA0KPiBsZWRf
cHdtX3ByaXYgKnByaXYsDQo+ID4gICAgICAgICAgICAgICBicmVhazsNCj4gPiAgICAgICB9DQo+
ID4NCj4gPiArICAgICAvKg0KPiA+ICsgICAgICAqIENsYWltIHRoZSBHUElPIGFzIEdQSU9EX0FT
SVMgYW5kIHNldCB0aGUgdmFsdWUNCj4gPiArICAgICAgKiBsYXRlciBvbiB0byBob25vciB0aGUg
ZGlmZmVyZW50IGRlZmF1bHQgc3RhdGVzDQo+ID4gKyAgICAgICovDQo+ID4gKyAgICAgbGVkX2Rh
dGEtPmVuYWJsZV9ncGlvID0gZGV2bV9md25vZGVfZ3Bpb2RfZ2V0KGRldiwgZndub2RlLA0KPiA+
ICsgImVuYWJsZSIsIEdQSU9EX0FTSVMsIE5VTEwpOw0KPiA+ICsNCj4gDQo+IFJlbW92ZSB0aGlz
IGxpbmUuDQo+IA0KPiA+ICsgICAgIGlmIChJU19FUlIobGVkX2RhdGEtPmVuYWJsZV9ncGlvKSkg
ew0KPiA+ICsgICAgICAgICAgICAgaWYgKFBUUl9FUlIobGVkX2RhdGEtPmVuYWJsZV9ncGlvKSA9
PSAtRU5PRU5UKQ0KPiA+ICsgICAgICAgICAgICAgICAgICAgICAvKiBFbmFibGUgR1BJTyBpcyBv
cHRpb25hbCAqLw0KPiA+ICsgICAgICAgICAgICAgICAgICAgICBsZWRfZGF0YS0+ZW5hYmxlX2dw
aW8gPSBOVUxMOw0KPiA+ICsgICAgICAgICAgICAgZWxzZQ0KPiA+ICsgICAgICAgICAgICAgICAg
ICAgICByZXR1cm4gUFRSX0VSUihsZWRfZGF0YS0+ZW5hYmxlX2dwaW8pOw0KPiA+ICsgICAgIH0N
Cj4gPiArDQo+ID4gKyAgICAgZ3Bpb2RfZGlyZWN0aW9uX291dHB1dChsZWRfZGF0YS0+ZW5hYmxl
X2dwaW8sDQo+ID4gKyAhIWxlZF9kYXRhLT5jZGV2LmJyaWdodG5lc3MpOw0KPiA+ICsNCj4gPiAg
ICAgICByZXQgPSBkZXZtX2xlZF9jbGFzc2Rldl9yZWdpc3Rlcl9leHQoZGV2LCAmbGVkX2RhdGEt
PmNkZXYsDQo+ICZpbml0X2RhdGEpOw0KPiA+ICAgICAgIGlmIChyZXQpIHsNCj4gPiAgICAgICAg
ICAgICAgIGRldl9lcnIoZGV2LCAiZmFpbGVkIHRvIHJlZ2lzdGVyIFBXTSBsZWQgZm9yICVzOiAl
ZFxuIiwNCj4gPiAtLQ0KPiA+IDIuNDMuMA0KPiA+DQo+IA0KPiAtLQ0KPiBMZWUgSm9uZXMgW+ad
jueQvOaWr10NCg0KDQo=

