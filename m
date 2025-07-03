Return-Path: <linux-leds+bounces-4984-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 77FB6AF7058
	for <lists+linux-leds@lfdr.de>; Thu,  3 Jul 2025 12:33:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C4AB31BC2689
	for <lists+linux-leds@lfdr.de>; Thu,  3 Jul 2025 10:32:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B85DF2EBBB3;
	Thu,  3 Jul 2025 10:27:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=leica-geosystems.com.cn header.i=@leica-geosystems.com.cn header.b="lINWA/Md"
X-Original-To: linux-leds@vger.kernel.org
Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011063.outbound.protection.outlook.com [40.107.130.63])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 843262EBBA9;
	Thu,  3 Jul 2025 10:27:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.63
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751538468; cv=fail; b=UtjU+WjUUYqgQpFZVdAW0riieN+UvtZ4cm4QIcCOf1kjB/ePyjxXQMPHn+mJNtKPKWG1hxDPugiNczKGlJ2gLffs3nAM9KNJvM4KAuxImFqejxoKH4hKBbGsihJGz+hRXJY1a9tSFalAIjyFtFUqfO5MplN/rQgrJJHCe5s20/I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751538468; c=relaxed/simple;
	bh=TOOaGYKzvNL2B0z0k2no3AlNGti7/25rKQi3+ZrVur4=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=mpPvHI11rpz8tOPc+S3/xhAIm/w7tzv6m69zn+chKg3h5zoGt4vVA7jMh+Igb1Mh5zvKSPANnL28N9T0ugPxripI/qCucQMdO98ZsG8M4x25z0ge272Exsn7eQhQ3SyRjf4SQDfAO6Q5RThKns+GMJ/7zNgbH3vqGRyst4D9iNg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=leica-geosystems.com.cn; spf=fail smtp.mailfrom=leica-geosystems.com.cn; dkim=pass (1024-bit key) header.d=leica-geosystems.com.cn header.i=@leica-geosystems.com.cn header.b=lINWA/Md; arc=fail smtp.client-ip=40.107.130.63
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=leica-geosystems.com.cn
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=leica-geosystems.com.cn
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=I78kEEM2GEicxNx8SlA/c42PJ9zb2rMiERx0s/nAaUkr38aiJW0FiyyM7yzCRRm5WYeC3rerIKPBVXliLcf0IM3g9vxpUFslCuh0sZ88HCJ6TekbWVw+MREKqx6EEx/nIzXrjwgxvXylKB6fyKhR6eQmTduUrtUinbJwJx4yFVq0oralHkh8aAmM3R41Z441iPvTfzibVA0TLPh84ePgKypisx6eElxIz3uUWmffO6Eyx05DikfNPPHQH8BnrhtWIILpB1QXmJgunmDCQ+mTGiP3KbwiJiBhcQvx778CaeRc22LMhHBuWedtKwG1r1+29iM4mxxmAsfFmPsiFPazTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TOOaGYKzvNL2B0z0k2no3AlNGti7/25rKQi3+ZrVur4=;
 b=oP2ytQ2Z5Pzoo5u3lAUgKSb9tEfLHrbfj9nF/ymWsy107wK4FMgyzup4/tQWPWu62vtCyblciGEFjVyPEvaq0w6osVrZO43rfANcpMnOKNpNSMmb9b4KCVMQzaROEpuYZNF/GCwCa+hY/wK2gsIZsGcZdusbf2pNvo8WXuFBnohbTDijguwza2woxx3If1zVqWhudyTc85El/1f2fuyEIEleSMANWC+kRI1sGUqrIXpixSTJ/hxZ6bgSe9eGGAA9VbZYdAzMkWXnkoR5KFzxBznu9VDVjnjxFogZe2Ecv90/hmRnwYDCjNzf43PmyS6+mMfkHQgt3Ub5TRl6WOpQRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=leica-geosystems.com.cn; dmarc=pass action=none
 header.from=leica-geosystems.com.cn; dkim=pass
 header.d=leica-geosystems.com.cn; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=leica-geosystems.com.cn; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TOOaGYKzvNL2B0z0k2no3AlNGti7/25rKQi3+ZrVur4=;
 b=lINWA/MdVbPI8JSSU01OLH9MbOWi0EiT23apVCiZfWvIgtGny3RxfgSxWJyOX4d9gRlQjEg19xJyaqcRU65eqp0WFPvqf01nsz9EMKsspSR9qTVIQbzd7Mq2NaTKjjZEUixIuwhT3c/fLMSXXo8Jq1MgQRF0VQ/LV7cNLHwozfs=
Received: from AM9PR06MB7955.eurprd06.prod.outlook.com (2603:10a6:20b:3a6::16)
 by VI0PR06MB9391.eurprd06.prod.outlook.com (2603:10a6:800:23c::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.20; Thu, 3 Jul
 2025 10:27:40 +0000
Received: from AM9PR06MB7955.eurprd06.prod.outlook.com
 ([fe80::383f:82b9:8533:b78d]) by AM9PR06MB7955.eurprd06.prod.outlook.com
 ([fe80::383f:82b9:8533:b78d%5]) with mapi id 15.20.8880.024; Thu, 3 Jul 2025
 10:27:40 +0000
From: LI Qingwu <Qing-wu.Li@leica-geosystems.com.cn>
To: Krzysztof Kozlowski <krzk@kernel.org>, "lee@kernel.org" <lee@kernel.org>,
	"pavel@kernel.org" <pavel@kernel.org>, "robh@kernel.org" <robh@kernel.org>,
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>, "conor+dt@kernel.org"
	<conor+dt@kernel.org>, "linux-leds@vger.kernel.org"
	<linux-leds@vger.kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
CC: GEO-CHHER-bsp-development <bsp-development.geo@leica-geosystems.com>
Subject: RE: [PATCH V4 1/2] dt-bindings: leds: pwm: add enable-gpios property
Thread-Topic: [PATCH V4 1/2] dt-bindings: leds: pwm: add enable-gpios property
Thread-Index: AQHb6/20KOVFnvUpm0699jNoWMGGK7QgKlYAgAAGb+A=
Date: Thu, 3 Jul 2025 10:27:39 +0000
Message-ID:
 <AM9PR06MB795507373B99DFF6820D979ED743A@AM9PR06MB7955.eurprd06.prod.outlook.com>
References: <20250703093430.229959-1-Qing-wu.Li@leica-geosystems.com.cn>
 <20250703093430.229959-2-Qing-wu.Li@leica-geosystems.com.cn>
 <85e411bf-58cf-46fe-9afa-7b76999f1a42@kernel.org>
In-Reply-To: <85e411bf-58cf-46fe-9afa-7b76999f1a42@kernel.org>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=leica-geosystems.com.cn;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM9PR06MB7955:EE_|VI0PR06MB9391:EE_
x-ms-office365-filtering-correlation-id: 10f013b6-e6eb-4201-05b1-08ddba1c3ceb
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?RTk4MmpKdEVyQnBOTDIydVJoOW5Mc2d2Z3VIMy9OUFJHTjBoNTR0NUt1d1A1?=
 =?utf-8?B?N2pMTGVsRlMycCs5cHN6dHpQb1JwN0dQRDNJSWVxa05PSnlRU3JwOWlMUmxS?=
 =?utf-8?B?U0Y0NHNibFp4VG15MG5YSE1aZnNVbUsxc1dwbWNNZlBkeVRTMVR6YnB6b1V2?=
 =?utf-8?B?OWdsVk1wQnZWNWRodEN2NTJHMEJUOVZJU1pxSjJrcEx0NFRscUY2cEhGVGFO?=
 =?utf-8?B?amEzK2FWR1JVU3E0UFdZbHNkNnpVdTA0UmpHUEhnNE11emE2N05yaW00Z1Vm?=
 =?utf-8?B?VEt6NlFSMkgwaElyYTlzUXhXS1Niam5oQ2xwTDNwVTBpVjV5VGhtci9TRGNM?=
 =?utf-8?B?K0pDdnpzNmNpd25QS3pDQzQwZEtuQkhSNnlFSitSem90RWJZQWNrQlNZV3Mv?=
 =?utf-8?B?dC8vRU5KaVVoWWtnYnhpQkhXdTZheDNRQkFCaVlmb3M2ZXI2U1IzTGo4MzJl?=
 =?utf-8?B?MDEzSy9IWXMvVjdpTVpIdDlSU3pETW9OdWJrY3NZTThITSt6SU1lRkMrOXRQ?=
 =?utf-8?B?WXdqeW1rZGpOYnJyV2I5SWwzYVA4dlIyUHNLaStrbFdseWJqR2J6b0s1UzFw?=
 =?utf-8?B?OXZvNkJMSzVBc2cxRXI3QmZDdHR4TWhid1ZFdzh0ZWpRakpWenoycStzNHRr?=
 =?utf-8?B?eWVjSjk3UHdEWnNzVlY5M0tmb1pDMDBUWVdheGNURnl0Z0FYamhVVWQ1V0dG?=
 =?utf-8?B?V3hDMS9TVnVNVUxqUTNtRTlDaHJmM0hFdTMxMWF6WDRVK0loemhSUEtaeFRW?=
 =?utf-8?B?UDBpZldkMW43Vno5eXF6QTBYQktWOHJDaEpBMGg3Szl2UnNKamNZbzVtdEdB?=
 =?utf-8?B?Nm1CYk1xWTRaOGdKWEJNd1lVeHUydFNDS00rZmJTbHNuR1JITDNOdVBobnAv?=
 =?utf-8?B?VmowS0dwMVE0L1gwMUhGOWR3R0NSYnZjVC9qeExGZCtxczM4ZzNhSUFXWWFB?=
 =?utf-8?B?Qm8wUmlXenNWK1Z1MXdPWm5DeFVtWStPNXl5V2wzbzRMM3I1YTZuWlJpc084?=
 =?utf-8?B?V0szZGM0c2hwRFVLSUkvNnc3TDVMeUw5My92MWNNaUoxMUdTUlNQYmxzRkNa?=
 =?utf-8?B?dk9uSXRjTTlZMzZpS3BrWVhGZ0s4YWwwQTd5N0FudGZCWEtPWWpScGxKWWN3?=
 =?utf-8?B?dnZKZzY3d1Rrd2p4NUpQQUhNWkdFVDZYc1REQ2p5dWZPbmZteXprTWFNZU9o?=
 =?utf-8?B?aWZwcCtCMjFFYU1sV3EwdXRoZmpvcFV4cjhpL3ArZHg4dml4TG4yaXhuUGxo?=
 =?utf-8?B?RUhtcFJMR21ZRTRJV2IyS3l1MzZXK2ZGYjArdjB1NDI5WUlpUWttVzhsczdu?=
 =?utf-8?B?SVZsR1VvTzBtK1cwU2ZjUFFjbm9DaUFLY2M3ZVhCYisyemxUVXpUZThXYWth?=
 =?utf-8?B?TEkrNVpNaVNNR3lsL2JvOHdSVDM5VmxRYkxnM3JacmdTaXZJNk9uSWtvTWNJ?=
 =?utf-8?B?WktWVkxzWGhtdXVVcjdFTXpnZ3BIdW9qZ01aWHgrRHpVQ0xjQ1U4bWU5TElW?=
 =?utf-8?B?NU1IcnBkZ1ZBZnhvLzZJTndhbWNkVjNtUmlhanl5S2hXdHEzTElCVC9KRmZK?=
 =?utf-8?B?S1BVZ2Q4THRXQ1NTSzdhMlRnYjJ0cklUUHhrWEIwczlJYWNqRFlaaFBCZW5O?=
 =?utf-8?B?eUtMTUNlcDhISXN0bUt6Um40OHRFbCs4V3NZTkZQVEFhaGZIakRlTHZaYUgz?=
 =?utf-8?B?UnIxMUxkWEdGZ0I5aVNEZ2lneXQ1Rks0V3BkTVZzOUZkVEdNRTMzaEhpbC9j?=
 =?utf-8?B?YWllMko2U3I0aXBoN3VoN3lJelFUSERoVk9HdVMySmV4VzBQU0lHcHQrZDZ0?=
 =?utf-8?B?RzNwbkdZM1Fqa0dkRVlqRDFjQkNwNFJMeEZCQXozS3ZCTDQ5c21GdGpBK0xG?=
 =?utf-8?B?YUxTb2xhVEhMbGhBVDFlWUJZblMrK0x4VkhubzNsVUZ5UHc5TlFVMnpMMWZP?=
 =?utf-8?B?L1IvVUJueEVNa1MvU1VZTVFUTzRJa1BqTnQzQXByRXZtbTZQa1VDTElvSGEw?=
 =?utf-8?Q?+s8uzpyQ5RbADRASHYZoPYBctU6Ve4=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:zh-cn;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR06MB7955.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?SXo2dmc0YThQOTYzOWM2UmJsVWswNXkrYVZ3L0xrblJjSFpoY0NsbDNSUk9z?=
 =?utf-8?B?STZCbnBpS04zb0Y3QmdPUVcvdTZ0dDdaVGs1MytxOTV2VTZIMVJlUlI4c3lq?=
 =?utf-8?B?TTRBa2dkQUhWQVUyQXQrekZwTHZhRkRlZjk2cDBEM21nUEZrLzJnZExmTWVE?=
 =?utf-8?B?MFNQYlo5Rld2V095WHNIQjh6Rk11Q0FtMk5nWXBYOU83YlhUMkhNZU1mNmpE?=
 =?utf-8?B?ekowWXY5ZzNCTDE4Q1phTldwa2lzNUFTVWpmdnczNWUxeWJvT3RmaFhQTVY5?=
 =?utf-8?B?Ty8zTG40WXN6eGplcE84QlVSbE5rbzIrWjJSejkzWlVXN0pRcU9xcmR0enZY?=
 =?utf-8?B?d1MzZmFBT1Z6Zy9kZllrdWh6S2Q4c3l6MVVZeFdBc3V1TmpldERNZHdZSG1j?=
 =?utf-8?B?SHFISVZ5ZHYycFFnenhrK2FVSk1rNmN2aWdBeFY1anlzV1V5WitlQWJHcjFp?=
 =?utf-8?B?cFg0NDBOZjBrcWE1MDJmN25YLzFGR0xXYjlHZlJRV2hpNFVGaC9vcTZWOU9O?=
 =?utf-8?B?aUk4TFFaeGx2RUtYYit2MFlQcFZ5MmY2Vng3NXVna0NPZkw0cFFFZngvWm0r?=
 =?utf-8?B?MWdQeTFUT3I1aWJJVmlWT3c1MHdmN05vZ2RMQU9Wc0k2SVphUjV1ZmNmRDhY?=
 =?utf-8?B?U0FQem1XTGpzMCtoNXc4aVVIWjBDeEVRQ0ZIOHY4N2hvWnRNU1o1UkV2L0ZM?=
 =?utf-8?B?SWorWEdnNXRLTjZTeHhxWnM3S0ZOUFJDci9LOXU3c3lEQWMySFdqMkhhVzZ5?=
 =?utf-8?B?Qk85V0M4VVdMb1Y4YWY0UFhsODJhem8vL3FZQllCdGl1d2N1YUlDWDRoMWdm?=
 =?utf-8?B?VnRHWjVWRnZubXAvczdnc1UySTVoVWVCMm4zN3ZxUWJZWXhOQzgrbVdQWkNP?=
 =?utf-8?B?d0xTQnhVWXd0cW5GRWZab1NHcFVLQU9qYmN4R0h0Z0kvK3lodGNmVjZIcTF2?=
 =?utf-8?B?MW5vSXArckhad3ZzY251cUdZeGFvTENBRXd5L3NMMmJkcVR5VnF5bGwvRytG?=
 =?utf-8?B?N0ZsWERnRzZlRFc1RnN4VUY5WXhTRUg1Sk04KzZrQk5kOEpuNnh5MjdqT1Nk?=
 =?utf-8?B?MHgyR2UwcFNCT1R3Z2pNYXpVQkRGQlBzcWxtT0lOQXpiRDVsclVZcU5tVWJ1?=
 =?utf-8?B?dGlXOGJYdTJDeWNIRHNxbHBNcy9LZU95NjFDRzNWQ3JocXRucVZjTUNyZjU3?=
 =?utf-8?B?eXkzeWdScm9ldG95T2FMQmpmeWZDRUNzalVLZTRPNzJZVFU0ckRIemN6U2Qy?=
 =?utf-8?B?WURhZFlYakNUZWZRbGxZQUtXaEVlMUtzS0I2K1oyUlV5U0hyUjQrV0wwOWF0?=
 =?utf-8?B?MFpzeENxVlluV1RveWdlc2ppcEliZUZ6YlJhazUva3dnbVgya1YzU1hVd3FI?=
 =?utf-8?B?Z2FKZndJRER5SzhUNW0rcUcrSlM3VXRuYWgrdWF4R2Fuci9qQStaU3dOd2Ur?=
 =?utf-8?B?dDEyVjB5cXd1clJCbEFhMTFURXZMQmVzR1Zic2QyOUIwa2FjQTBCN0NsQjFJ?=
 =?utf-8?B?dVAzNjJTQnVoUE1icFpZQWF5UlpLTldkbENHQ2VKV1NNU1FLYndtUzlteTFu?=
 =?utf-8?B?OFp1SWFnUGNxYkhhVVdVamk3TnZPRGNHMlI3M1FqdDNhZEFoQnMxN2Z6c0ow?=
 =?utf-8?B?QlNsdTduVUNpMExvSGd2bVV1Tm1ValF4THA2RXBaZE1mUTh2REJnam1FNnVP?=
 =?utf-8?B?SEJoU3cxbFNIUi9CQTVDcEhFa3ZmKzZmMnk0Vnd5TDVqSFYvcmQva1VjUUpi?=
 =?utf-8?B?ZHJNNlFBWllSelZoRHVJSk9zV1hQeG5lN0RNWW0xa0JBd3ozNVQ4SktGUVhi?=
 =?utf-8?B?ZmoxOExPZHExbXEraGJ5RUZRS2hESWgwazNTcTI2ZlY4TjZKYnQxcitxZFhD?=
 =?utf-8?B?dmV4Qmw0Uzc1QlRJQ2UrMExuME5QUVBWQ3k5RnU4UmRhcklMRmtDbXNrdzAx?=
 =?utf-8?B?Y2ZWOURVa2xUQlkrMTZCcjdFRWhIR2FOS2xGR0E4WDJlV2c1NktaNy90TlRm?=
 =?utf-8?B?WEN5M1FHK2o2VFdpOUhoVDlqQ1psSlhocTV1YlZ2R2hCVDJ0TXUwS29UWFk5?=
 =?utf-8?B?V29TRHNUZGtLUnV1VXd3WlUxbnA1eVlFcVlDVXZjMmJMeHBpOGl5NjFEN3JQ?=
 =?utf-8?B?ZnB4NW81VkZwaE8wVGM4cGZTWnc1aG1UWEIrRXNrMkNIVTQ0T0R2WHJmbXJ2?=
 =?utf-8?Q?iH1mMywzmTzQ/J1Vj0NFKXU=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 10f013b6-e6eb-4201-05b1-08ddba1c3ceb
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Jul 2025 10:27:40.0118
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jTEoFl7fZzsv3eG6bykJlTlTRn3UD1xenyb1GwQrQlq/FBRgyjhaPmI7c2clZrTn00EpJ+OjnkyiVTwaVowd7qVsrQlae0FEvz4wHYutbJMaaj1mYTutQUAhTaxsHbDv
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR06MB9391

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogS3J6eXN6dG9mIEtvemxv
d3NraSA8a3J6a0BrZXJuZWwub3JnPg0KPiBTZW50OiBUaHVyc2RheSwgSnVseSAzLCAyMDI1IDU6
NTkgUE0NCj4gVG86IExJIFFpbmd3dSA8UWluZy13dS5MaUBsZWljYS1nZW9zeXN0ZW1zLmNvbS5j
bj47IGxlZUBrZXJuZWwub3JnOw0KPiBwYXZlbEBrZXJuZWwub3JnOyByb2JoQGtlcm5lbC5vcmc7
IGtyemsrZHRAa2VybmVsLm9yZzsNCj4gY29ub3IrZHRAa2VybmVsLm9yZzsgbGludXgtbGVkc0B2
Z2VyLmtlcm5lbC5vcmc7IGRldmljZXRyZWVAdmdlci5rZXJuZWwub3JnOw0KPiBsaW51eC1rZXJu
ZWxAdmdlci5rZXJuZWwub3JnDQo+IENjOiBHRU8tQ0hIRVItYnNwLWRldmVsb3BtZW50DQo+IDxi
c3AtZGV2ZWxvcG1lbnQuZ2VvQGxlaWNhLWdlb3N5c3RlbXMuY29tPg0KPiBTdWJqZWN0OiBSZTog
W1BBVENIIFY0IDEvMl0gZHQtYmluZGluZ3M6IGxlZHM6IHB3bTogYWRkIGVuYWJsZS1ncGlvcyBw
cm9wZXJ0eQ0KPiANCj4gVGhpcyBlbWFpbCBpcyBub3QgZnJvbSBIZXhhZ29u4oCZcyBPZmZpY2Ug
MzY1IGluc3RhbmNlLiBQbGVhc2UgYmUgY2FyZWZ1bCB3aGlsZQ0KPiBjbGlja2luZyBsaW5rcywg
b3BlbmluZyBhdHRhY2htZW50cywgb3IgcmVwbHlpbmcgdG8gdGhpcyBlbWFpbC4NCj4gDQo+IA0K
PiBPbiAwMy8wNy8yMDI1IDExOjM0LCBMSSBRaW5nd3Ugd3JvdGU6DQo+ID4gc29tZSBwd20gbGVk
IGRyaXZlciBjaGlwcyBsaWtlIHRwczkyMzgwIHJlcXVpcmUgYSBzZXBhcmF0ZSBlbmFibGUNCj4g
PiBzaWduYWwNCj4gDQo+IFNlbnRlbmNlIHN0YXJ0cyB3aXRoIGNhcGl0YWwgbGV0dGVyLg0KPiAN
Cj4gdHBzOTIzODAgZG9lcyBub3QgaGF2ZSBkZWRpY2F0ZWQgZW5hYmxlIHBpbi4gSXQgaGFzIFZE
RElPLCB3aGljaCBzZXJ2ZXMgYWxzbw0KPiBlbmFibGUgcHVycG9zZSwgYnV0IGl0IGlzIGEgc3Vw
cGx5Lg0KDQpTbyB0aGlzIHBhdGNoIGlzIHVuYWNjZXB0YWJsZSBhbnl3YXk/DQogDQo+IEJlc3Qg
cmVnYXJkcywNCj4gS3J6eXN6dG9mDQo=

