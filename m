Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 11041293AEB
	for <lists+linux-leds@lfdr.de>; Tue, 20 Oct 2020 14:04:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2394246AbgJTMEm (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 20 Oct 2020 08:04:42 -0400
Received: from outbound-ip24a.ess.barracuda.com ([209.222.82.206]:51296 "EHLO
        outbound-ip24a.ess.barracuda.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2394238AbgJTMEm (ORCPT
        <rfc822;linux-leds@vger.kernel.org>);
        Tue, 20 Oct 2020 08:04:42 -0400
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2169.outbound.protection.outlook.com [104.47.55.169]) by mx4.us-east-2a.ess.aws.cudaops.com (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO); Tue, 20 Oct 2020 12:04:35 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QbWmXz5ebIl5N2ckZy+2JEW1h4/SC9ZZwrciJLFe9R5inmslxWbcqMXHckCcOecEjr8MgB3VbvFfEVe/SVl5Kwm+BLNxpBbkbY1ps4n+h1zfxZKoUHw9CP00pKwXC9JBdQ7S1KWaWySeM1a7L+eRNa26n66Hes1MFee3j4/NQctjd9CfEssW1ejr140IkCLZ+5JvexC9m9380bkAb/7plNoQgAEx5w9gyt8yjmogYPaYgRjta0+wv2TNKZ+Prjh2d26PeNjF1NDtDC5nTp7W4lFwSNJRXMVvzxiOBJ31pK/hDHwyfjNBewLdoxgnfVZs8CwqXcsS5nHw5ieG+YnIig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Peg0RP2LvFHhrZZbYw3aZ5M47hEaLNUBAIgLFLUscKc=;
 b=E2Iy4RmC/c+1oYiEuNAiGWTRE4Dco0+t74rb+LKb5R23aKEYJFE+N7X0Xtw+EG8dRTM4b7B2kN54C4u2Xni2LFXuY0kESf/xdtj9OoTOeTwLYOIao50SsZ+VQwV8JoN5XeuDOAmeEVc45kJAS9dKhjJ8HpbrxUYNfXo3HrcX2+BGgpU7gu9N0f3Eucw36RzrQumk4ghDuqQP33j59Ws5FvmtVRNRp791cX2J1GRu8NCUFpDm3zAPE5gGNXTqKBZCAPORjqFyoEnY4XMGHguTlDsxMK/i9Q62ugBEVtkQibkJ0urV5v3OcVk/8+cWeDuLtYQ/mCYTPxTFsW6jFYMrGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 198.51.192.230) smtp.rcpttodomain=ucw.cz smtp.mailfrom=digi.com;
 dmarc=fail (p=reject sp=reject pct=100) action=oreject header.from=digi.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=digi.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Peg0RP2LvFHhrZZbYw3aZ5M47hEaLNUBAIgLFLUscKc=;
 b=XLhRqvpEmJkgY3w6F9cnzMyEvzk9TArvKwFgxMOIFM5AXGjWNtBxHuPk3DlVWxEcmDUb+wHNmsRRk/HEdpve1nzBI+5sksw8TFHAAn0tiYTVoZQROiU2noG8WcqTnROFldS/mzTmBkv9KOYhBeIZR7/x3KIOEMU6H95PZDfCX8k=
Received: from CO2PR05CA0054.namprd05.prod.outlook.com (2603:10b6:102:2::22)
 by DM5PR10MB1531.namprd10.prod.outlook.com (2603:10b6:3:d::17) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3499.18; Tue, 20 Oct 2020 12:04:33 +0000
Received: from MW2NAM10FT021.eop-nam10.prod.protection.outlook.com
 (2603:10b6:102:2:cafe::f3) by CO2PR05CA0054.outlook.office365.com
 (2603:10b6:102:2::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.13 via Frontend
 Transport; Tue, 20 Oct 2020 12:04:33 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is
 198.51.192.230) smtp.mailfrom=digi.com; ucw.cz; dkim=none (message not
 signed) header.d=none;ucw.cz; dmarc=fail action=oreject header.from=digi.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 digi.com discourages use of 198.51.192.230 as permitted sender)
Received: from MTK-SMS-XCH05.digi.com (198.51.192.230) by
 MW2NAM10FT021.mail.protection.outlook.com (10.13.155.189) with Microsoft SMTP
 Server (version=TLS1_0, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA) id
 15.20.3477.21 via Frontend Transport; Tue, 20 Oct 2020 12:04:31 +0000
Received: from MTK-SMS-XCH01.digi.com ([fe80::cca7:5299:c88e:1c40]) by
 MTK-SMS-XCH05.digi.com ([fe80::a576:56af:8463:b976%15]) with mapi id
 14.03.0468.000; Tue, 20 Oct 2020 07:04:30 -0500
From:   "Bollinger, Seth" <Seth.Bollinger@digi.com>
To:     "Bollinger, Seth" <Seth.Bollinger@digi.com>
CC:     Pavel Machek <pavel@ucw.cz>,
        "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>,
        Dan Murphy <dmurphy@ti.com>,
        Seth Bollinger <seth.boll@gmail.com>
Subject: Re: Strange timer LED behavior
Thread-Topic: Strange timer LED behavior
Thread-Index: AQHWpiEO4JOa0xb3bESM7pkNxmLF0qmfTGOAgAFtfgA=
Date:   Tue, 20 Oct 2020 12:04:29 +0000
Message-ID: <2A80CF0E-1022-4673-86E8-12BF0696708E@digi.com>
References: <A2C38AF0-0CE8-4312-8329-54B7E9653223@digi.com>
 <20201019140617.GA25480@duo.ucw.cz>
 <3D108EE8-F4B6-490B-9B97-59B8E008F63B@digi.com>
In-Reply-To: <3D108EE8-F4B6-490B-9B97-59B8E008F63B@digi.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.27.1.17]
Content-Type: text/plain; charset="utf-8"
Content-ID: <DAD4E1A79141D845A490896C77ABC00E@digi.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 173e3e61-5f33-4ef4-efe6-08d874f04d92
X-MS-TrafficTypeDiagnostic: DM5PR10MB1531:
X-Microsoft-Antispam-PRVS: <DM5PR10MB1531AD68797ECB5F30741D65E81F0@DM5PR10MB1531.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: YGgCen3dpDrrLV/wYpc1Hubav4zVcQvg4zZBoPYGbOlxM3mYX/5jVj06le+x4dEV3DPjDZGnYI2fW5NQ+e1bEys1vwKPSbbp7ymZAKP2RqPL2voI2PlDgwom1jV7wm8BgXmOSPPlJYei1uad3z+XcitO6CQlKK6V1QL9JDgpwUKS2dqXeqa4DWZbPMlgsjYyxsmDDsOOciwKtjRAxS7/jvt2Wkjjl6s6hoakmBpxuEJes3CDmfcLsvUG32l4QHbAWlIMbWXJTZhAmy70lSoy7I21D50UzCuTfRHBOQvtVOo6kFMtFk2Lme1nOfjb8sR8FbxJjvOr5jPR3QF3qRBmOtsco+FalpwB1r1q6ewI8xI3s1d1tXSwuVmnFffmpRpr7uy0cKvzYT/6A5HOz87EyX25lWAuuYtj6Jxh/KpzUc9iQxeSNiospBPCXN/Ycb1t
X-Forefront-Antispam-Report: CIP:198.51.192.230;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:MTK-SMS-XCH05.digi.com;PTR:ErrorRetry;CAT:NONE;SFS:(4636009)(376002)(136003)(396003)(346002)(39850400004)(46966005)(70586007)(83380400001)(356005)(5660300002)(36906005)(2906002)(70206006)(81166007)(82310400003)(53546011)(26005)(33310700002)(2616005)(36756003)(6200100001)(54906003)(82740400003)(47076004)(86362001)(7696005)(3480700007)(186003)(6862004)(33656002)(426003)(316002)(4326008)(8936002)(478600001)(336012)(8676002)(37006003);DIR:OUT;SFP:1102;
X-OriginatorOrg: digi.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2020 12:04:31.2305
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 173e3e61-5f33-4ef4-efe6-08d874f04d92
X-MS-Exchange-CrossTenant-Id: abb4cdb7-1b7e-483e-a143-7ebfd1184b9e
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=abb4cdb7-1b7e-483e-a143-7ebfd1184b9e;Ip=[198.51.192.230];Helo=[MTK-SMS-XCH05.digi.com]
X-MS-Exchange-CrossTenant-AuthSource: MW2NAM10FT021.eop-nam10.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR10MB1531
X-BESS-ID: 1603195475-893006-13524-177319-1
X-BESS-VER: 2019.1_20201016.1851
X-BESS-Apparent-Source-IP: 104.47.55.169
X-BESS-Outbound-Spam-Score: 0.50
X-BESS-Outbound-Spam-Report: Code version 3.2, rules version 3.2.2.227668 [from 
        cloudscan8-150.us-east-2a.ess.aws.cudaops.com]
        Rule breakdown below
         pts rule name              description
        ---- ---------------------- --------------------------------
        0.50 BSF_SC0_SA_TO_FROM_ADDR_MATCH META: Sender Address Matches Recipient Address  
        0.00 BSF_BESS_OUTBOUND      META: BESS Outbound 
X-BESS-Outbound-Spam-Status: SCORE=0.50 using account:ESS112744 scores of KILL_LEVEL=7.0 tests=BSF_SC0_SA_TO_FROM_ADDR_MATCH, BSF_BESS_OUTBOUND
X-BESS-BRTS-Status: 1
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

DQoNCj4gT24gT2N0IDE5LCAyMDIwLCBhdCA5OjE2IEFNLCBCb2xsaW5nZXIsIFNldGggPFNldGgu
Qm9sbGluZ2VyQGRpZ2kuY29tPiB3cm90ZToNCj4gDQo+PiANCj4+IEhpIQ0KPj4gDQo+Pj4gV2Ug
dXNlIHRoZSBzeXNmcyB0aW1lciB0cmlnZ2VyIG9mIHRoZSBsZWQgc3Vic3lzdGVtIHRvIGNvbnRy
b2wgb3VyIGxlZHMgKHR1cm4gb24sIHR1cm4gb2ZmLCBhbmQgYmxpbmspLiAgV2hpbGUgZG9pbmcg
dGhpcyB3ZSBmb3VuZCBhIHN0cmFuZ2UgYmVoYXZpb3IuICBJZiB0aGUgdmFsdWVzIG9mIGRlbGF5
X29uIGFuZCBkZWxheV9vZmYgYXJlIGV2ZXIgYm90aCB6ZXJvLCB0aGUgbGVkIHN1YnN5c3RlbSB3
aWxsIG1ha2UgdGhlIGRlY2lzaW9uIHRvIGJsaW5rIGF0IGEgNTAwbXMgb24gYW5kIDUwMG1zIG9m
ZiByYXRlLg0KPj4+IA0KPj4+ICMgY2QgL3N5cy9jbGFzcy9sZWRzL2cwMQ0KPj4+ICMgY2F0IGRl
bGF5X29uDQo+Pj4gMA0KPj4+ICMgY2F0IGRlbGF5X29mZg0KPj4+IDg2NDAwDQo+Pj4gIyBlY2hv
IDAgPiBkZWxheV9vZmYNCj4+PiAjIGNhdCBkZWxheV9vbg0KPj4+IDUwMA0KPj4+ICMgY2F0IGRl
bGF5X29mZg0KPj4+IDUwMA0KPj4+IA0KPj4+IGRyaXZlcnMvbGVkL2xlZC1jb3JlLmM6MTg0DQo+
Pj4gICAvKiBibGluayB3aXRoIDEgSHogYXMgZGVmYXVsdCBpZiBub3RoaW5nIHNwZWNpZmllZCAq
Lw0KPj4+ICAgaWYgKCEqZGVsYXlfb24gJiYgISpkZWxheV9vZmYpDQo+Pj4gICAgICAgKmRlbGF5
X29uID0gKmRlbGF5X29mZiA9IDUwMDsNCj4+PiANCj4+PiBJcyB0aGVyZSBhIHJlYXNvbiB0aGF0
IHRoZSBrZXJuZWwgd291bGQgZGVjaWRlIHRvIGJsaW5rIGF0IHRoaXMgZGVmYXVsdCByYXRlIGlu
c3RlYWQgb2YgbGVhdmluZyB0aGUgdGltZXIgZGlzYWJsZWQ/DQo+Pj4gDQo+PiANCj4+IFllcC4g
SXQgYWxsb3dzIGhhcmR3YXJlIHRvIHByb3ZpZGUgZGlmZmVyZW50IHZhbHVlcyBpZiBpdCBjYW4g
b25seQ0KPj4gYmxpbmsgYXQgZml4ZWQgcmF0ZS4NCj4gDQo+IE9rLCBJIHVuZGVyc3RhbmQgaG93
IGhhcmR3YXJlIG1pZ2h0IG1ha2UgYSBkaWZmZXJlbnQgY2hvaWNlLCBidXQgaW4gdGhpcyBzY2Vu
YXJpbyB3ZeKAmXJlIHVzaW5nIHNvZnR3YXJlIHRvIGJsaW5rLCBzbyBldmVyeXRoaW5nIGlzIGhh
bmRsZWQgYnkgdGhlIGtlcm5lbC4gIEFsc28sIGlmIHRoZSBpbnRlcmZhY2UgaXMgaGFyZHdhcmUg
ZW5hYmxlZCwgaXNu4oCZdCB0aGUgcGF0aCBhdCBsaW5lIDE3NyB1c2VkICh3aGljaCByZXR1cm5z
IGJlZm9yZSB0aGUgZGVmYXVsdCBpcyBzZXQpPw0KDQpXaHkgc2hvdWxkIHNvZnR3YXJlIGJsaW5r
IG5lZWQgdG8gc2VsZWN0IGEgZGVmYXVsdCByYXRlIHNpbmNlIGl0IHNob3VsZCBiZSBhYmxlIHRv
IGhhbmRsZSBhbGwgcmVxdWVzdHMgKGV2ZW4gMCwgMCk/DQoNCj4gU2V0aA0KPiANCj4gDQoNCg==
