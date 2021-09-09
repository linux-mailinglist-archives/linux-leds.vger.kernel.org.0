Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F1BC040600A
	for <lists+linux-leds@lfdr.de>; Fri, 10 Sep 2021 01:27:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235071AbhIIX2O (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 9 Sep 2021 19:28:14 -0400
Received: from mail-dm6nam10on2074.outbound.protection.outlook.com ([40.107.93.74]:14340
        "EHLO NAM10-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S230367AbhIIX2O (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Thu, 9 Sep 2021 19:28:14 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MoElh9hkAOc3Dl8U/xKUZe3Q4CAig9RrYgAO+xchE6SCkewLKqeli/+OkaQ+RnH7LisxaNgZbVWEhTGO5qWgfHNNGjAau0cOhcnyHnhQFhyTdv1emnZAxo/Nld7ko6IVbzSH2Jlu7iY4d5z4asjNAp3OfveK59IE/yYHGivkSNDHSK0khmoacjEGVvBhQldSNFXghtSNUZQr1nGeD3XJzHK4iD9QKIMqwLaLt+e/c7KRYNR/ivsR/BeptgUyeweTRpg3LhtrNir0Ol1UYBKu9+s7edA0ZlChClwsGhwQz+XcJfukU0ozUQ5cQP3JENltEXf0IpXfcgEjtobZkx9sfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=UfOPaE8usFH0wzOj35eUdvG5C9R5m1warMBI4Ke0PgA=;
 b=MDJU1xglj3Xq1fmPkcH9mzHbmDa4maO39xbkp0YW++Ddlv5L9fPQJ+gm2GnnlB7sbd/4vpWrhTr+gincZ11AvL1R3uTFQ6PUT6YPyu+PmofBYeM9E15AlZQBs99Zj6m7fyEOKdEciRR1seLh9DgZjhdbXxr02jFkrFMwHN8jeZAuNoXfkzx5uUcDCKq7OnQAkmnGNiysqg/m0bVOUzeaYHyk11inVTPbG3LQxzLr94SzfMAZD7xrQ7iplrualIWaCBB9x4ZciAGCfZmLKfvVBR5jWZtoXXQznGJiac8tZy/UPuTn8nScY1TKxQtsEgMJ4Bttv56TIPvGgEcUzv4baw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UfOPaE8usFH0wzOj35eUdvG5C9R5m1warMBI4Ke0PgA=;
 b=KltzLWy1qN98MWyRqLoeKp66K8T3njR7o20v6mSf74HKwkeuVuWL+noi411WWsfQhoNQz3o86lmxoNtLp/qbKv1u8fu8kKYeqkuXaB4i9/hQB3oShtaXjElKAxBFqe5LybNTuXvhVPjqNq3tlTPSnHeMt8BaBPoq/cfDxGLBvUXxme0r7Cp3KLOP/2OhNrLXcUh8xsaV+65IEb/l3Om2jFFzarQkvJ4qaN1mJZz4IuxxoJwP1FFgGSbcEO4OAVtd15OHUx1U+96fp9XRMpCV5Xj3JsSo5GowqqtAgxNikHZBhPROMBPezGgySc6bCW3CgwVG+fTgXidfXrO7ewil1w==
Received: from MW2PR12MB4667.namprd12.prod.outlook.com (2603:10b6:302:12::28)
 by MWHPR1201MB0272.namprd12.prod.outlook.com (2603:10b6:301:52::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.21; Thu, 9 Sep
 2021 23:27:02 +0000
Received: from MW2PR12MB4667.namprd12.prod.outlook.com
 ([fe80::498a:4620:df52:2e9f]) by MW2PR12MB4667.namprd12.prod.outlook.com
 ([fe80::498a:4620:df52:2e9f%5]) with mapi id 15.20.4500.017; Thu, 9 Sep 2021
 23:27:02 +0000
From:   Chaitanya Kulkarni <chaitanyak@nvidia.com>
To:     Ian Pilcher <arequipeno@gmail.com>,
        "axboe@kernel.dk" <axboe@kernel.dk>, "pavel@ucw.cz" <pavel@ucw.cz>
CC:     "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>,
        "linux-block@vger.kernel.org" <linux-block@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "kabel@kernel.org" <kabel@kernel.org>
Subject: Re: [PATCH v2 04/15] block: Add block device LED trigger integrations
Thread-Topic: [PATCH v2 04/15] block: Add block device LED trigger
 integrations
Thread-Index: AQHXpcmdRWmEn10dDEyHAKSv79Y3yaucWM6A
Date:   Thu, 9 Sep 2021 23:27:02 +0000
Message-ID: <a176ecec-2f94-1a93-f29d-5b0e70466c34@nvidia.com>
References: <20210909222513.2184795-1-arequipeno@gmail.com>
 <20210909222513.2184795-5-arequipeno@gmail.com>
In-Reply-To: <20210909222513.2184795-5-arequipeno@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
authentication-results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 881b7faf-adf0-41c0-90fd-08d973e95431
x-ms-traffictypediagnostic: MWHPR1201MB0272:
x-microsoft-antispam-prvs: <MWHPR1201MB027207550417628CCFA7B6A5A3D59@MWHPR1201MB0272.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:381;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: rzPqf/jmEx8cgkZH5HfhHw2Ecu9ktIjJfOvCgfQ0m4Hg3/Qq54ItMS1RtWrROG7gCNRPuPkvce5J7/+OR6EbeypG2r8sFcWKVWiwAnDqfZ7s8Qt5CtD1u7G3qZ4BoJpat9baZP/n9xK9YUeuDOuW4wOAG/EO4tXpr3ppU6oDe4i+yJOYym38TiDFmmCB7Rf+LKoTOmBOA740O0dvgQ90MgyEsf3vjiKnpFrGJBTwEsWR6EEvmIuVwwwpY7xHVoICn+kzZ4K9mSLqRtjZ8jPMFAok3OUqSVBMUZRP3qHhmSPkG4jqc4pH40tVkXRxYaKfCpUw7mw2jr2LDqAJZXwG3UPxeTMMbZjvLoJ1nWrdpl7PrMMiIiMVZJo6BoQ+TpKqJbaxlAgKpx7pYVt7X+GBNoXdDkspwUwr11DFeDcBuSoiVM2ArIaxSzvYpBiiMc8Z2A6JYNtASKcb+la5mPgmnqSmh+uGR3etONUGaqbYHNJXEothsCqLH3XO1C0cNioq1kxaJQ54tprZJ0etC2eDZm0zNpuRvTA2qatm3P8xx+v+DDgK53WCG+DRNrVupZyh4orGWDQwH6lnuJ/TlbJ0UJ01ktIjPswxGZ+6VZJPCAXHYMHW3Oqlgex1D87VRQiQ7mEbumLytclySp9V8bDwbnk3ylpjnYOE7bVa21F8e7EPXYMmDJFLUsnS1k5BWH5OL+hWQGDWq+TwrICrXW2cxwG+CsxXzBLhmAJfc9+oglkgJOuv66Yxn/t/vsZvKjI/aeePNBBZB6J7Okat8QWhEA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW2PR12MB4667.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(346002)(376002)(39860400002)(136003)(366004)(38100700002)(6486002)(4326008)(66556008)(8936002)(91956017)(122000001)(64756008)(76116006)(186003)(31686004)(66946007)(36756003)(5660300002)(66446008)(110136005)(316002)(83380400001)(6506007)(478600001)(53546011)(2906002)(31696002)(54906003)(4744005)(71200400001)(6512007)(86362001)(8676002)(38070700005)(66476007)(2616005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?alVaYnBrNFJxZVJSbTR0bFVTdjdUZ2tySmozWGl2elEwZTNoeS9DVk1mSUcx?=
 =?utf-8?B?eTM0eTAwNndKQ1NoWkNzaUhzTVFja1d2UjVmUlVGSVZLMHlnZnZBenF2Z0ZC?=
 =?utf-8?B?aXN2TDBhT2FVVGx3VmlRL1NEVVJlbmthS0lNWFFkMnF1U1ZiWlNmSGtlM25J?=
 =?utf-8?B?RjZQaHVTMGlNM0FnbzE1b0pmemprSHVUM0FNbUVSM3VRV1M0cXRzTnBnOUtN?=
 =?utf-8?B?OHltZVBTajdGaEt1bSswU2pkbEN0c1RMNExSeDNxVG5zdGNMWVRiUnY1ZXh2?=
 =?utf-8?B?cWVNcm5DOGh1aVBJN0d4YTRkMmc5M2IrdDN6MUF1Ym1zMUpHMmQzZXN0Zm1o?=
 =?utf-8?B?aEIzdEViK1VWWDBjN3VRRzFieGl2VmJHWnNLWHNIUytmV2VaS0RpbFR3MGVl?=
 =?utf-8?B?YmhhKzAwTXBLRnRLN0hmcHBNTE5qNTB3WlJNWHF4amRObGFXQWxOZ3VkNXBR?=
 =?utf-8?B?TzdSbEIyeU1Nb0Z6WjFqcFM0WjA5ZHpWL0VZOFNXT0xNNnluZ2FuV1JCOEcz?=
 =?utf-8?B?ODUwRys4ZzJnRlNpZ1ZQT1BKN1VXalFnQ3dtSitXVTczRno1MEJYcmtHWGFv?=
 =?utf-8?B?dzd5QUlEWFNOMGJvdlNid1B4c3BmbnNhemVSMFBjMUlVbjVYSW1pTmJmT2F6?=
 =?utf-8?B?eEU0U2V4Yy92SGlTY2R0UU40anNsSmJjWFBBTDUzQUVSbmJhNW1oSEdyUnh6?=
 =?utf-8?B?OHp3UXk1S2xTTWxVQWZzYW9HK1hNUXlIWGdqSjFwNWx4eDUxamMxVFAxOXZ1?=
 =?utf-8?B?aHpBRzMrWDVjS3FjVnFhaTUxSGV6ODNCNHk2cUV1ZS95UXlNVlAxYm56S2ZE?=
 =?utf-8?B?Y2pHb0oyZlc3djUvbkF3dEJzS1hTV2hoUGdHcUtNcDVCa1VhelNYMHY1aFps?=
 =?utf-8?B?M0lhWkNmSVNnck9XZ3hDRVB4eFlpaVE4VFEyR1ZPYmg0dVpyLzkwM0F0K2pE?=
 =?utf-8?B?ME83YWRQRVV6c0pkUDlOS01RVjQvbkE2MTB6T1Z5LytEemFiWWtxYlBoRE9W?=
 =?utf-8?B?b0N2VW81OXh2NWsydXhhUFFMdzJUNEozVUU1cHNwZHNkN2ZXZmtkQWcxd3J6?=
 =?utf-8?B?MVFOM21YeFd5bXZRMWdlY2E1RCtoNklibzgwOW54UzFVdGplcDAxUytscHhV?=
 =?utf-8?B?Y0l5b2RQWDFoRjRuUkJibnBTcVozalZJOFNPSzZIS1U0VUdHZWkrR3ZXNlBa?=
 =?utf-8?B?MHVQNmgzek5PUG1uRzAzV3BEcGZHN2xWN2ZMb1RQdFVmcFVIdjNzMUdrajE4?=
 =?utf-8?B?Z1lxRUZLNEdpRnM0S1dveUdmRzVuSmpTc3F2UlI0T0ZKK3ZwcWc1Sm9mZjU3?=
 =?utf-8?B?ZVVmcjBKOTNlNG5mMjM0czFKT0xsbmVYaC92NmNDMCtCL1lxK1hacjZGNzd1?=
 =?utf-8?B?Nks4aXpTNkpOa3E0NTVvMXl3aWo2eXRKZmN4ZFVSTU51UWVxMUFaRGIxd1lH?=
 =?utf-8?B?b0krRGd4bmM3M2V3ai84eUllOENoRjFBOUd2NTRJYktUZjgvR1dXNnJ3SGhG?=
 =?utf-8?B?a3JLUGs4WTExbi81c2pYSDBTb3NoZGs2T2w2L1NWYmtKTDhsSGlJZEcyVjdo?=
 =?utf-8?B?QUg0cWZjMXBydEwxMlJTbVFaM3V6T1UrTDFyR1JhU3hDeVlvRndXNHV0REpU?=
 =?utf-8?B?bk9oNlZaWCtmYlFkL250bGNTbGtqcjh5Y01ISE43QU1TY1JRY01raXNUQlNP?=
 =?utf-8?B?cWVmdHZHVHRyM3ZDaDNIZWFiRU41ckhiTU84WmwyVjErM2tzZHRlUEh6RFFQ?=
 =?utf-8?B?aHVMLzJBNEZLYTh0UHIxWnd2Tk1raEJydklGQUpSOWUzM3lOVE13aG1PNlJa?=
 =?utf-8?Q?2PuwIVyirF1PqZLK1lrk6PvV+FdaTUDHWvFaU=3D?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <7132D0F972B97C478104CF5FC80DBCAD@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW2PR12MB4667.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 881b7faf-adf0-41c0-90fd-08d973e95431
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Sep 2021 23:27:02.4136
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tItSiK5eN77DWFwMXshSJ+k7jpRjXDrzWlNxB5L0t9u70p4QwknW3F8Dr7LELJsKP6iHFYEOiXz8pfoe3SpmdQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR1201MB0272
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

T24gOS85LzIxIDM6MjUgUE0sIElhbiBQaWxjaGVyIHdyb3RlOg0KPiBFeHRlcm5hbCBlbWFpbDog
VXNlIGNhdXRpb24gb3BlbmluZyBsaW5rcyBvciBhdHRhY2htZW50cw0KPiANCj4gDQo+IEFkZCBM
RUQgdHJpZ2dlciBkaXNrIGluZm8gcG9pbnRlciB0byBnZW5kaXNrIHN0cnVjdHVyZQ0KPiANCj4g
Q2FsbCBsZWR0cmlnX2Jsa2Rldl9kaXNrX2luaXQoKSBmcm9tIGRldmljZV9hZGRfZGlzaygpIHRv
IGVuc3VyZSB0aGF0DQo+IGxlZHRyaWcgaXMgaW5pdGlhbGl6ZWQgdG8gTlVMTCwgaW4gY2FzZSBh
IGRyaXZlciBhbGxvY2F0ZXMgdGhlIHN0cnVjdHVyZQ0KPiBpdHNlbGYgYW5kIGRvZXNuJ3QgdXNl
IGt6YWxsb2MoKQ0KPiANCj4gQ2FsbCBsZWR0cmlnX2Jsa2Rldl9kaXNrX2NsZWFudXAoKSBmcm9t
IGRlbF9nZW5kaXNrKCkgdG8gZW5zdXJlIHRoYXQgdGhlDQo+IExFRCB0cmlnZ2VyIHN0b3BzIHRy
eWluZyB0byBjaGVjayB0aGUgZGlzayBmb3IgYWN0aXZpdHkNCj4gDQo+IFNpZ25lZC1vZmYtYnk6
IElhbiBQaWxjaGVyIDxhcmVxdWlwZW5vQGdtYWlsLmNvbT4NCg0KVGhlIGNvbW1pdCBsb2cgZG9l
c24ndCBleHBsYWluIHRoYXQgd2h5IHlvdSBuZWVkIG1vZGlmeSB0aGUgY29yZSBibG9jaw0KbGF5
ZXIgQVBJIHdoaWNoIGlzIGhpZ2hseSBkaXNjb3VyYWdlZC4NCg0KV2h5IGNhbid0IGxlZHRyaWdf
YmxrZGV2X2Rpc2tfaW5pdCgpIGJlIGNhbGxlZCBiZWZvcmUgeW91DQpjYWxsIGFkZF9kaXNrKCkg
aW4geW91ciBkcml2ZXI/IHNhbWUgZ29lcyBmb3IgdGhlIA0KbGVkdHJpZ19ibGtkZXZfZGlza19j
bGVhbnVwKCkuIElmIHRoZXJlIGlzIGxlZ2l0IHJlYXNvbiB5b3UgbmVlZCB0bw0KZG9jdW1lbnQg
dGhhdC4NCg0KDQoNCg0K
