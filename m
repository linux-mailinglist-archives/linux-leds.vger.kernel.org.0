Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 630F95197EB
	for <lists+linux-leds@lfdr.de>; Wed,  4 May 2022 09:17:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345266AbiEDHVV (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 4 May 2022 03:21:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43334 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230240AbiEDHVU (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 4 May 2022 03:21:20 -0400
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (mail-eopbgr60125.outbound.protection.outlook.com [40.107.6.125])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5F9B62C4
        for <linux-leds@vger.kernel.org>; Wed,  4 May 2022 00:17:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VoCpvfG+YlDc1KfWrodO6raBux7CaOseY2Fw3eXbRqriwB8ZvBT9BFH+pGpn28wetsmEKiYmZX0FI3duaI3BAJ6BLq+d4s4UnRklMZP/qnFmwUdRRvMZYugxpxhijrI4LDAOo5IsCp02nOUEv1S6q+x0EBVcvmkp1CVXtAF4BPcvCuHYvEieORhs0JdhkCQ75uglHLEKWMNPXVx0l3Hr7Uk5NMgP5WSR7cYtM7XRMiXxkzzIeHslD8xcZkRdDEhmrEmM5/anFXX66A6pXvFJLXohikwTWHwIegk3Yl/XZWGkODLiYy8SIeRFI2EjI+IwgnpgwjC/wUKRwMHWnCWFEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6VEtVcJLuY0ZFujRxKyEKaaNY9UHncRefaO3i55xwD4=;
 b=UtiI0bgHwTO4U/xawak0tECUdPVsnQg6eKOrAH/4YVMKjNRSulQdHZWDm9dXtrSPVs8FK6htzpe1Z7YPXfnEw4I/ejTonYs2ymZwPIrPV8RGABP/nFsoUryNhf/EF+4IzVXaVEA0+ZVHS6UOk/vMtJpUxLA5XP4TPDhtsPIjRDFbN0coLk5cHcPozlKjVPRUO1XqUUVrk0lgEZTMfjNM6ET+tCLJ0y74/CXnV1tI7NgAB49eF5iSYtNWzvLsHHDPW7TxjbQ6nIQ5inXjSl6xnBv1HhCzdBIQYC9CxfZan9Pt5UYahXd6sGpk/8E0/S3QDYRayhCPORf0VWLI2FjTzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=schleissheimer.de; dmarc=pass action=none
 header.from=schleissheimer.de; dkim=pass header.d=schleissheimer.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=schleissheimer.onmicrosoft.com; s=selector1-schleissheimer-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6VEtVcJLuY0ZFujRxKyEKaaNY9UHncRefaO3i55xwD4=;
 b=W9h7rPXL0IFjYF2f9VemcSwiy6TJpRtKaPRFav2Z9eClS/o/v0aSdS12kyJI3MurJJNMv7tV6XkPwFQlI1c0fiYrK8DfGsrkGow6ANfkEZjSt5n+jmoIFng7qyr1N1F0S4g929t+kGXv0RsawtIsiWbPfPnsPJADIToS/FgOpFo=
Received: from GVXP190MB1917.EURP190.PROD.OUTLOOK.COM (2603:10a6:150:6c::18)
 by DB8P190MB0764.EURP190.PROD.OUTLOOK.COM (2603:10a6:10:127::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.24; Wed, 4 May
 2022 07:17:37 +0000
Received: from GVXP190MB1917.EURP190.PROD.OUTLOOK.COM
 ([fe80::d51:5e16:ae67:ccac]) by GVXP190MB1917.EURP190.PROD.OUTLOOK.COM
 ([fe80::d51:5e16:ae67:ccac%5]) with mapi id 15.20.5206.024; Wed, 4 May 2022
 07:17:36 +0000
From:   Sven Schuchmann <schuchmann@schleissheimer.de>
To:     Sven Schwermer <sven@svenschwermer.de>,
        "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>
CC:     Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        "pavel@ucw.cz" <pavel@ucw.cz>
Subject: AW: AW: [PATCH v2 1/2] dt-bindings: leds: Add multi-color
 default-intensities property
Thread-Topic: AW: [PATCH v2 1/2] dt-bindings: leds: Add multi-color
 default-intensities property
Thread-Index: AQHYXuDItnuRkj/QokSwpXQ9iOIt6K0NKZ3wgABYSYCAAMcX4A==
Date:   Wed, 4 May 2022 07:17:36 +0000
Message-ID: <GVXP190MB191792BF0B86407C86A43BB5D9C39@GVXP190MB1917.EURP190.PROD.OUTLOOK.COM>
References: <20220502204616.GA27288@ucw.cz>
 <364df52a196fa0ae5db07e599995fcf8dfafb43e.1651577132.git.sven.schwermer@disruptive-technologies.com>
 <GVXP190MB19174C638935B1C6717F8AEBD9C09@GVXP190MB1917.EURP190.PROD.OUTLOOK.COM>
 <499bce9d-81d1-8edb-3db5-187e86db71f4@svenschwermer.de>
In-Reply-To: <499bce9d-81d1-8edb-3db5-187e86db71f4@svenschwermer.de>
Accept-Language: de-DE, en-US
Content-Language: de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=schleissheimer.de;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 2cf41468-bd9a-470d-b029-08da2d9e2a2c
x-ms-traffictypediagnostic: DB8P190MB0764:EE_
x-microsoft-antispam-prvs: <DB8P190MB0764CB67017AB4998274EA28D9C39@DB8P190MB0764.EURP190.PROD.OUTLOOK.COM>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: dmPjvsHqvQRwu6+GH7mcaNstzaXShNYnQuqWlowyGHL7kpVqWqFXIUEgVsY6jfmKk7TldWHKLlGx1+b+0Kza6LP+0MgPT0VjBN6co1U8AuLEDP37lwLVXfiwOaGq2CCLgQR7w1rz0flrd8dqnzLJX/VvxhrJxTBfYDd5U/UUD2TS5HV73V2vimiQWBdmOSuC+p1C7OhXXC4cyI6kZ6fdbgkCgUm+0laG3ORrq9wpsNl9w7EugNr0lB4EOLMmoodGUwclCw2H6X8uru0KBX4xeWP19dOU22mIKLCT1suw5uD90+jrVjt07mw1aaPmE34spT7x1ALcogxqqvMskkWfTXv4ZSBVqQX2ifOFijLRIUPOQ3ADXAfZ5DjbM2DDEEJosocFw9U8qLcnhZKmiwX+gcAZmW5QbI6Wyw4tcUrc4RNpAgyPbqZkefgtsWpY5LXui0PdWb0MnuIDjTj6zi9M205sARWCeFZcWJE4QjLLUib4b3Wv8ifGv6qj3sD2/Qmbrmpz24d71H+UlBbs7giviK4XdVBRITr9otkydZYZEv+mhDAe/XVFLfEYI6I33zFpKSgtTfiViMTwv1autYq0PG3EuHE3csXbaPoYw6bNJitOy5KSd2aAA07JSuLJ590kc9cbEqGBxFeGE42ebhV6ZUushjidyaswwGmatqrE0dokGqFnas8lik20EgfLoUSLz7Njx1V1WIeRi4iC2yhr95tmHH6Z3qQBfabXPHvyxbxhdfJbSSvcnR/tN36GW/GNkXcQRl3/exIM4uJsqaAUMCLUqlIS2Q9rfgUss2jM/LA=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXP190MB1917.EURP190.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230001)(4636009)(396003)(39830400003)(346002)(366004)(136003)(376002)(76116006)(66946007)(9686003)(2906002)(66556008)(66446008)(66476007)(64756008)(33656002)(83380400001)(8676002)(4326008)(71200400001)(54906003)(38100700002)(38070700005)(55016003)(110136005)(186003)(26005)(53546011)(6506007)(966005)(8936002)(7696005)(5660300002)(122000001)(66574015)(52536014)(508600001)(316002)(86362001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ejdiWHBLZjVrWHhtM3o0aVZ3ZlFDQXAxKzBkZHN1NkhBeEtZZmVHY0ZtcDl0?=
 =?utf-8?B?ME5qVS9wYzVORWtINERlWHA1VTNhU0Z3Q0RyUURlZFYrM2hlL1FJUGNmbjAw?=
 =?utf-8?B?Q0NkSTZsTnZid3pSVnVBRDFCbjNIN1FFcDlteWN0QU1UMEwyVzhSazJzZGZD?=
 =?utf-8?B?dTltQzFBTUhpd1BQVGhHeGl6U0dralcvNlhwY3hpeVVjait5TEt0Q0VrbEtY?=
 =?utf-8?B?OWNPUGV1d0xNK1FhYitzWmV4ZjcvZG9yQ054T2tGM3NOS29tZU1yMjNoekY5?=
 =?utf-8?B?c2hIWitISmpsV05pZTNPdTByNEVuUi9Wb1VndXRrdFdZdkYwL2g0cmdhRzJ0?=
 =?utf-8?B?UjBLRGJvOTY1SS9mSzJGb2diWTFEVXAwNVpHR200RGdYSTduQUxuVHgvdjdO?=
 =?utf-8?B?NGF3aFFMaWowWUJHaHlTNGVsMEZHS1I0NlNveHozZHRMVVJpTkl5Z1RXUjlI?=
 =?utf-8?B?VS9sd2NJc0xBTks1VHI2aWlaWitFekliZTdneGVqR3E5TTgyUEIzTzVSaFIv?=
 =?utf-8?B?b0d0RktMSFJ2RTA2dEliVTNjWUNRQnJ0VEFoV1o5eGRRR3d0VVFQMUEzVjVl?=
 =?utf-8?B?TkxwQVNqRHhVSnRHU1Q1NEpJSXF2RENkSUZEK3I4cFgvUVVuTDJtVXZhdk81?=
 =?utf-8?B?ekgyOXdOVkduSUhkdDRuQzRpUzVCWForcEZiNVR3WDV3YTUxNXg4eURwMGZX?=
 =?utf-8?B?ekZ2aE9lUVVWVGM3bzNycStLTExRcW5qaS9tSWpyaE9FUmFuaTZYSE5LdGhE?=
 =?utf-8?B?R2VQaE92a2FyNEQ0ZHdyMXREYlR2dnlGQ2FsNlE3eVZEN3NXOWtXWkRYdnNv?=
 =?utf-8?B?Z2hJcVk3QUl5T2g2SXorSHMrUzZ6U0tMMmFxbzBCY3BEYS9XNGovU3p1WDVu?=
 =?utf-8?B?Nm5VUGU5bUJoL2tTTUJHS2hLMnp3OW9pWWo3cUxBQXpUMEhxVnk1dGFOV3Ix?=
 =?utf-8?B?TkdlSFd0Kzg2Qjh3SmQvRkxpT2lzMWJ4dmpvVW5ZamdjNG9sVHlZUXdja2NG?=
 =?utf-8?B?NlBNTThKM1Vjb3NLaFd4N0RzTTdvWG1PcE40emtaZVhMSlphRGY4MTRkamtN?=
 =?utf-8?B?N25FNmFLZGp5Q1Y0aVlvQk94eFF1eHc0WTRRVjBWbmc0NGh0R0tNZ1NFR0Ni?=
 =?utf-8?B?VmZrSUFQNitiSXpLTWhmdUNmSSs1QzIrUW1KZEQ0eVVzd1hxSURYUmZ1aDhK?=
 =?utf-8?B?UCtVY05hUHVCM0xsKzFKM003VytnRjZ1WjJWWEdqNnJCVktrUGd2dWY1WkxE?=
 =?utf-8?B?cHFYcld4VExTVWhkSlpod3plcy9UVWNkY0xYbVk1U3dxb3pLQ2JwdGJhOXlB?=
 =?utf-8?B?UjJzTVM1akNlQ1lDMUtkYzlCNDVlNlJoazQ2SWk5ZXNBYWs1ejROVG9adTFU?=
 =?utf-8?B?cjRXbHdqYlBUNFJCNjQzRWtWaGlWY25HeC84SW5ndW5OM1QyWlhkOE5WT0Qw?=
 =?utf-8?B?VHV6YTlPUXhPK1p0UkUvTUJ1NkZ0MjhKNWt2QWhYa2lVUTZOZlM2MjNsOXFY?=
 =?utf-8?B?cTZyaHh6TDZNeXpaZGdHWmtJSHE0RHZmR0ZRZjFLcjVucXhCaVhVOHhmSzYy?=
 =?utf-8?B?ODJyWE94dEtNSnM2dzVGb0d0UlhSMEhRRVh3aFlUL0tGM3JYZ3RJMFI3cTI0?=
 =?utf-8?B?T3dYVjdLa0xQbmhZalJoOUg1VS92MngzU1ZrK3l4NWI2bzFCY284VWJ2aUdW?=
 =?utf-8?B?RFJqNjI5ZC93aUZzeWhuTm9OZjlrcUgrN3NCZ0d5ZWtCMkpBMGhOUGJtZjV6?=
 =?utf-8?B?dGlPMUMzSEdvcjd0bXJWUkpOQ1h6RWhvcVJ0Ri9zYUh0c1ZLOUVuYnh2eEc4?=
 =?utf-8?B?UjZwS2NEYkRoWjRvM0JTMEUvVTlGT0xuOGxMU1FjS3JaZm0yTlhLQlZ1WVZI?=
 =?utf-8?B?YXVkdjRVMWg2d0dHRk9oR1NQSmMwbDVYRVdaTkttay9pK0NWTGVWYytmaXR5?=
 =?utf-8?B?WlQyZ3dRaEdLY2JDWWZDMGhFclRLRGl0ajBMOHBTdURMQ2FmeWNVV2h5MU1x?=
 =?utf-8?B?RDZpaG94VlVIS0w0UGc4bzRtSk9OcUY2MFlCeXBqRHJhQXo2L3VyOHdhZlhU?=
 =?utf-8?B?VXJFRGp5Q0FxVXc5aGUxQ2EyY2d1Y2YwNDB6bDhSeFZtOVNITHhsdDZQNjlE?=
 =?utf-8?B?VStMR1RqcGpHQmxrYTRnYkVJaVBVN2lVVnY4YzBWV0lTVisyMnV0VkduRmxJ?=
 =?utf-8?B?MXlwN0R3U1ZzOWxlbUNGSzNUREtDTFRsRks5NVVnQlR4NUp3Z2hWeFZRQ3pa?=
 =?utf-8?B?Ti8walM5SlpDRStHR1ZnMWhUTVFWWHRxNDllYWhFYlZYeW9ETjAySUI5b3Z2?=
 =?utf-8?B?Q1dTd0FVNk1wd2pMZDR0T1pyT3IrTEt2NXh0aXduYTVJcXNMa0FaOVdLLzJt?=
 =?utf-8?Q?hpzS4FaPHiBK8dUI=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: schleissheimer.de
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GVXP190MB1917.EURP190.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 2cf41468-bd9a-470d-b029-08da2d9e2a2c
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 May 2022 07:17:36.1532
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: ba05321a-a007-44df-8805-c7e62d5887b5
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: bfdpCjEk7GozIECp31B+kYvHu8qG2i8CwEwu3sRzfhb2uYVpNfE5d1peAtLQEUeurg5InH1/M2so6nLUP1WFec5m0P+w/J9E8HtnSrHE0bc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8P190MB0764
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

SGVsbG8gU3ZlbiwNCg0KDQo+IC0tLS0tVXJzcHLDvG5nbGljaGUgTmFjaHJpY2h0LS0tLS0NCj4g
Vm9uOiBTdmVuIFNjaHdlcm1lciA8c3ZlbkBzdmVuc2Nod2VybWVyLmRlPg0KPiBHZXNlbmRldDog
RGllbnN0YWcsIDMuIE1haSAyMDIyIDIwOjU5DQo+IEFuOiBTdmVuIFNjaHVjaG1hbm4gPHNjaHVj
aG1hbm5Ac2NobGVpc3NoZWltZXIuZGU+OyBsaW51eC1sZWRzQHZnZXIua2VybmVsLm9yZw0KPiBD
YzogSmFjZWsgQW5hc3pld3NraSA8amFjZWsuYW5hc3pld3NraUBnbWFpbC5jb20+OyBwYXZlbEB1
Y3cuY3oNCj4gQmV0cmVmZjogUmU6IEFXOiBbUEFUQ0ggdjIgMS8yXSBkdC1iaW5kaW5nczogbGVk
czogQWRkIG11bHRpLWNvbG9yIGRlZmF1bHQtaW50ZW5zaXRpZXMNCj4gcHJvcGVydHkNCj4gDQo+
IEhpIFN2ZW4sDQo+IA0KPiBUaGFua3MgZm9yIG1ha2luZyBtZSBhd2FyZSBvZiB5b3VyIHBhdGNo
IHNlcmllcy4gTXkgc2VyaWVzIHdvdWxkIHdvcmsNCj4gc2ltaWxhciB0byB5b3VycywgaS5lLiB0
aGUgZGVmYXVsdC1pbnRlbnNpdGllcyBwcm9wZXJ0eSB3b3VsZCBiZSBvbiB0aGUNCj4gc2FtZSBs
ZXZlbCBhcyBjb2xvciA9IDxMRURfQ09MT1JfSURfUkdCPi4NCj4gDQo+IEhvd2V2ZXIsIHRoZSBj
b25jZXJuIHZvaWNlZCBieSBKYWNlayBpcyByZWxldmFudCBmb3IgbXkgcGF0Y2ggYXMgd2VsbCwN
Cj4gc2VlDQo+IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2FsbC9kNTYzMWUzNS1jZDYyLTEwNmYt
MmVjNC1kZTMxNjMzNjdiYzBAZ21haWwuY29tLw0KPiBIb3dldmVyLCBJIGRvIG5vdCBrbm93IGhv
dyB0byByZXNvbHZlIHRoZSBpc3N1ZS4gUGVyaGFwcyBzb21lYm9keSBmcm9tDQo+IHRoZSBsaXN0
IGhhcyBpZGVhcz8NCg0KSSBhbHNvIGRvIG5vdCBoYXZlIGFuIGlkZWEuIEJ1dCBtYXliZSB3ZSBj
YW4gdGFsayBhYm91dCBob3cgdGhlIGRlZmluaXRpb24gDQpzaG91bGQgbG9vayBsaWtlIGluIERU
LiBBcyBmYXIgYXMgSSB1bmRlcnN0b29kIHdpdGggeW91ciBwYXRjaCBJIHdvdWxkIA0KaGF2ZSBk
ZWZpbmUgdGhlIExFRCBhcyBmb2xsb3dzOg0KDQptdWx0aS1sZWRAMCB7DQoJI2FkZHJlc3MtY2Vs
bHMgPSA8MT47DQoJI3NpemUtY2VsbHMgPSA8MD47DQoJcmVnID0gPDB4MD47DQoJY29sb3IgPSA8
TEVEX0NPTE9SX0lEX1JHQj47DQoJZGVmYXVsdC1pbnRlbnNpdGllcyA9IDwxMDAgMCAwPiAgPC0t
LS0NCglmdW5jdGlvbiA9ICJlZWUtbGVkLXN0YXR1cyI7DQoJbGVkLTAgew0KCQljb2xvciA9IDxM
RURfQ09MT1JfSURfUkVEPjsNCgl9Ow0KCWxlZC0xIHsNCgkJY29sb3IgPSA8TEVEX0NPTE9SX0lE
X0dSRUVOPjsNCgl9Ow0KCWxlZC0yIHsNCgkJY29sb3IgPSA8TEVEX0NPTE9SX0lEX0JMVUU+Ow0K
CX07DQp9Ow0KDQoNCk1heWJlIGl0IGlzIGJldHRlciB0byBkZWZpbmUgcGVyIENvbG9yIGxpa2Ug
dGhpczoNCg0KbXVsdGktbGVkQDAgew0KCSNhZGRyZXNzLWNlbGxzID0gPDE+Ow0KCSNzaXplLWNl
bGxzID0gPDA+Ow0KCXJlZyA9IDwweDA+Ow0KCWNvbG9yID0gPExFRF9DT0xPUl9JRF9SR0I+Ow0K
CWZ1bmN0aW9uID0gImVlZS1sZWQtc3RhdHVzIjsNCglsZWQtMCB7DQoJCWNvbG9yID0gPExFRF9D
T0xPUl9JRF9SRUQ+Ow0KCQlkZWZhdWx0LWludGVuc2l0eSA9IDEwMA0KCX07DQoJbGVkLTEgew0K
CQljb2xvciA9IDxMRURfQ09MT1JfSURfR1JFRU4+Ow0KCQlkZWZhdWx0LWludGVuc2l0eSA9IDAN
Cgl9Ow0KCWxlZC0yIHsNCgkJY29sb3IgPSA8TEVEX0NPTE9SX0lEX0JMVUU+Ow0KCQlkZWZhdWx0
LWludGVuc2l0eSA9IDANCgl9Ow0KfTsNCg0KDQpJIHRoaW5rIHRoaXMgY291bGQgdGhlbiBiZSBo
YW5kbGVkIGJ5IFJHQlcgTEVEcyBhbHNvLg0KDQpCZXN0IFJlZ2FyZHMsDQoNCiAgIFN2ZW4NCg0K
DQoNCj4gDQo+IEJlc3QgcmVnYXJkcywNCj4gU3Zlbg0KPiANCj4gT24gNS8zLzIyIDE1OjUwLCBT
dmVuIFNjaHVjaG1hbm4gd3JvdGU6DQo+ID4gSGVsbG8gU3ZlbiwNCj4gPg0KPiA+IHRyaWVkIHRo
aXMgc29tZSB0aW1lIGFnbyBmb3IgdGhlIExQNTBYWA0KPiA+IGh0dHBzOi8vbG9yZS5rZXJuZWwu
b3JnL2FsbC8yMDIxMDIwNDE0MzcyNi4yNzk3Ny0xLXNjaHVjaG1hbm5Ac2NobGVpc3NoZWltZXIu
ZGUvDQo+ID4NCj4gPiBZb3VyIHNvbHV0aW9uIGxvb2tzIG11Y2ggYmV0dGVyLg0KPiA+IENvdWxk
IHlvdSBnaXZlIGFuIGV4YW1wbGUgb2YgaG93IHRvIHVzZSBpdD8NCj4gPg0KPiA+IE15IENvbmZp
Z3VyYXRpb24gYXQgdGhpcyB0aW1lIGxvb2tzIGxpa2UgdGhpczoNCj4gPg0KPiA+IG11bHRpLWxl
ZEAwIHsNCj4gPiAJCSNhZGRyZXNzLWNlbGxzID0gPDE+Ow0KPiA+IAkJI3NpemUtY2VsbHMgPSA8
MD47DQo+ID4gCQlyZWcgPSA8MHgwPjsNCj4gPiAJCWNvbG9yID0gPExFRF9DT0xPUl9JRF9SR0I+
Ow0KPiA+IAkJZnVuY3Rpb24gPSAiZWVlLWxlZC1zdGF0dXMiOw0KPiA+DQo+ID4gCQlsZWQtMCB7
DQo+ID4gCQkJY29sb3IgPSA8TEVEX0NPTE9SX0lEX1JFRD47DQo+ID4gCQl9Ow0KPiA+DQo+ID4g
CQlsZWQtMSB7DQo+ID4gCQkJY29sb3IgPSA8TEVEX0NPTE9SX0lEX0dSRUVOPjsNCj4gPiAJCX07
DQo+ID4NCj4gPiAJCWxlZC0yIHsNCj4gPiAJCQljb2xvciA9IDxMRURfQ09MT1JfSURfQkxVRT47
DQo+ID4gCQl9Ow0KPiA+IAl9Ow0KPiA+DQo+ID4NCj4gPiBXaGVyZSBkbyBJIHB1dCB0aGUgImRl
ZmF1bHQtaW50ZW5zaXRpZXMiPw0KPiA+DQo+ID4gUmVnYXJkcywNCj4gPg0KPiA+ICAgICBTdmVu
DQo+ID4NCj4gPj4gLS0tLS1VcnNwcsO8bmdsaWNoZSBOYWNocmljaHQtLS0tLQ0KPiA+PiBWb246
IFN2ZW4gU2Nod2VybWVyIDxzdmVuQHN2ZW5zY2h3ZXJtZXIuZGU+DQo+ID4+IEdlc2VuZGV0OiBE
aWVuc3RhZywgMy4gTWFpIDIwMjIgMTM6MjcNCj4gPj4gQW46IGxpbnV4LWxlZHNAdmdlci5rZXJu
ZWwub3JnOyBsaW51eC1rZXJuZWxAdmdlci5rZXJuZWwub3JnOyBwYXZlbEB1Y3cuY3o7DQo+ID4+
IHJvYmgrZHRAa2VybmVsLm9yZzsga3J6eXN6dG9mLmtvemxvd3NraStkdEBsaW5hcm8ub3JnOyBk
bXVycGh5QHRpLmNvbTsNCj4gPj4gZGV2aWNldHJlZUB2Z2VyLmtlcm5lbC5vcmcNCj4gPj4gQ2M6
IFN2ZW4gU2Nod2VybWVyIDxzdmVuLnNjaHdlcm1lckBkaXNydXB0aXZlLXRlY2hub2xvZ2llcy5j
b20+DQo+ID4+IEJldHJlZmY6IFtQQVRDSCB2MiAxLzJdIGR0LWJpbmRpbmdzOiBsZWRzOiBBZGQg
bXVsdGktY29sb3IgZGVmYXVsdC1pbnRlbnNpdGllcyBwcm9wZXJ0eQ0KPiA+Pg0KPiA+PiBGcm9t
OiBTdmVuIFNjaHdlcm1lciA8c3Zlbi5zY2h3ZXJtZXJAZGlzcnVwdGl2ZS10ZWNobm9sb2dpZXMu
Y29tPg0KPiA+Pg0KPiA+PiBUaGlzIGFsbG93cyB0byBhc3NpZ24gaW50ZW5zaXR5IHZhbHVlcyB0
byB0aGUgaW5kaXZpc3VhbCBzdWIgTEVEcw0KPiA+PiAoY29sb3JzKSBhdCBkcml2ZXIgcHJvYmUg
dGltZSwgaS5lLiBtb3N0IGNvbW1vbmx5IGF0IGtlcm5lbCBib290IHRpbWUuDQo+ID4+IFRoaXMg
aXMgY3J1Y2lhbCBmb3Igc2V0dGluZyBhIHNwZWNpZmljIGNvbG9yIGVhcmx5IGluIHRoZSBib290
IHByb2Nlc3MuDQo+ID4+DQo+ID4+IFNpZ25lZC1vZmYtYnk6IFN2ZW4gU2Nod2VybWVyIDxzdmVu
LnNjaHdlcm1lckBkaXNydXB0aXZlLXRlY2hub2xvZ2llcy5jb20+DQo+ID4+IC0tLQ0KPiA+Pg0K
PiA+PiBOb3RlczoNCj4gPj4gICAgICBWMS0+VjI6IG5vIGNoYW5nZXMNCj4gPj4NCj4gPj4gICAu
Li4vZGV2aWNldHJlZS9iaW5kaW5ncy9sZWRzL2xlZHMtY2xhc3MtbXVsdGljb2xvci55YW1sICAg
IHwgNyArKysrKysrDQo+ID4+ICAgMSBmaWxlIGNoYW5nZWQsIDcgaW5zZXJ0aW9ucygrKQ0KPiA+
Pg0KPiA+PiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2xl
ZHMvbGVkcy1jbGFzcy1tdWx0aWNvbG9yLnlhbWwNCj4gPj4gYi9Eb2N1bWVudGF0aW9uL2Rldmlj
ZXRyZWUvYmluZGluZ3MvbGVkcy9sZWRzLWNsYXNzLW11bHRpY29sb3IueWFtbA0KPiA+PiBpbmRl
eCAzNzQ0NWM2OGNkZWYuLmM0ODM5NjdhODQ3YyAxMDA2NDQNCj4gPj4gLS0tIGEvRG9jdW1lbnRh
dGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2xlZHMvbGVkcy1jbGFzcy1tdWx0aWNvbG9yLnlhbWwN
Cj4gPj4gKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2xlZHMvbGVkcy1j
bGFzcy1tdWx0aWNvbG9yLnlhbWwNCj4gPj4gQEAgLTMxLDYgKzMxLDEzIEBAIHBhdHRlcm5Qcm9w
ZXJ0aWVzOg0KPiA+PiAgICAgICAgICAgICBpbmNsdWRlL2xpbnV4L2xlZHMvY29tbW9uLmguDQo+
ID4+ICAgICAgICAgICBlbnVtOiBbIDgsIDkgXQ0KPiA+Pg0KPiA+PiArICAgICAgZGVmYXVsdC1p
bnRlbnNpdGllczoNCj4gPj4gKyAgICAgICAgZGVzY3JpcHRpb246IHwNCj4gPj4gKyAgICAgICAg
ICBUaGlzIHBhcmFtZXRlciwgaWYgcHJlc2VudCwgc2V0cyB0aGUgaW5pdGlhbCBpbnRlbnNpdGll
cyBvZiB0aGUNCj4gPj4gKyAgICAgICAgICBpbmRpdmlkdWFsIGNvbG9ycy4gVGhpcyBhcnJheSBt
dXN0IGhhdmUgdGhlIHNhbWUgbGVuZ3RoIGFzIHRoZQ0KPiA+PiArICAgICAgICAgIG11bHRpLWNv
bG9yIExFRCBoYXMgc3ViIExFRHMgKGNvbG9ycykuDQo+ID4+ICsgICAgICAgICRyZWY6IC9zY2hl
bWFzL3R5cGVzLnlhbWwjL2RlZmluaXRpb25zL3VpbnQzMi1hcnJheQ0KPiA+PiArDQo+ID4+ICAg
ICAgICRyZWY6ICJjb21tb24ueWFtbCMiDQo+ID4+DQo+ID4+ICAgICAgIHJlcXVpcmVkOg0KPiA+
PiAtLQ0KPiA+PiAyLjM2LjANCj4gPg0K
