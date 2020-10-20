Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CD6D2293B9F
	for <lists+linux-leds@lfdr.de>; Tue, 20 Oct 2020 14:31:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2405424AbgJTMb2 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 20 Oct 2020 08:31:28 -0400
Received: from outbound-ip24b.ess.barracuda.com ([209.222.82.221]:51400 "EHLO
        outbound-ip24b.ess.barracuda.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2394355AbgJTMb2 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>);
        Tue, 20 Oct 2020 08:31:28 -0400
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11lp2175.outbound.protection.outlook.com [104.47.56.175]) by mx1.us-east-2b.ess.aws.cudaops.com (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO); Tue, 20 Oct 2020 12:31:19 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=C4M+j8/aNPu2snp+eTCrlF+XnW30ZR98K0XX2ahzgFstqvFZ1Ze62fXSTNYHS4Vjvlq7Yw800ZETSiXm6tdlX15k5RwsjLQc3eEbwEZx2RlDOtEzNdvLO+PvDd+Nn7co3giaV+G/5WfSzam3X1mZAsGu1Gkoq7ZeAi2iNU3CqvNc6OPL8Pz7L7gEzbh1p4p1V/G8aPW74Ic7NlmszLy0eY7zku2/XefzTCeu2OBcVy344LHR01UDHIMlqOrZQ1MPtmoL4lyPyHYLaObY1S2Um2MhiqnHEH2TILKC2xagPxURjgqVJ3TviUttiZHVMzL4Oe6Q1IbuMZ+wkqJEItJ2ZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TeMAVn7AaTbMa30EWwEpJZU21yP0QyPDgAOrSs2u64M=;
 b=m0xvCeNvD3Jp9O8WFWi1eY/rr9hMUwJoX4GxbW1amZ6Mexmnnl/3km44+Y9GXGsKQy8XdQa8cR6dQUyTQTENzkgOww2urvUal1b51QVt69S4jIoE2ZaG/cazEpV5XHGCH6hnsu6T9IP0yGh9d7GubMJfJ8jzXWnFsYt4wt7HWz+fCNG63sFqcKbqKN3TnMomncYg24A/JzyDODT+nFqWqcRNTHDqcMGgHM96HGTm9xHCIv/wi2d6sX6WDl/Cd+eEiRN93CqfgDSUxqeB/uzm/nTy1EKhVNcoosMY3Aqb9hFbLE5pLXzW8lNw4SQvinR6gQ9kplNvpDmrjkJ4OgJV5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 198.51.192.230) smtp.rcpttodomain=ucw.cz smtp.mailfrom=digi.com;
 dmarc=fail (p=reject sp=reject pct=100) action=oreject header.from=digi.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=digi.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TeMAVn7AaTbMa30EWwEpJZU21yP0QyPDgAOrSs2u64M=;
 b=lfDY1KvxosS1hM3jkVNmtKRi9lxskEKFz/76nYWbPZ5p0KTsN9tfrZi9X5rqXqDA1tc8EQQX82pyaGQxq70fxRuz7GTFcKLPwvMrSbsJqKA2ocEeYg7B8+noV9kz46GJW5TgZ3G3BUOIa0PDbbXkB3DdPpkknn7w2KHbJ/0DMMg=
Received: from CO2PR04CA0168.namprd04.prod.outlook.com (2603:10b6:104:4::22)
 by DM6PR10MB4044.namprd10.prod.outlook.com (2603:10b6:5:1d0::28) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.20; Tue, 20 Oct
 2020 12:31:17 +0000
Received: from MW2NAM10FT050.eop-nam10.prod.protection.outlook.com
 (2603:10b6:104:4:cafe::f0) by CO2PR04CA0168.outlook.office365.com
 (2603:10b6:104:4::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.21 via Frontend
 Transport; Tue, 20 Oct 2020 12:31:17 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is
 198.51.192.230) smtp.mailfrom=digi.com; ucw.cz; dkim=none (message not
 signed) header.d=none;ucw.cz; dmarc=fail action=oreject header.from=digi.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 digi.com discourages use of 198.51.192.230 as permitted sender)
Received: from MTK-SMS-XCH02.digi.com (198.51.192.230) by
 MW2NAM10FT050.mail.protection.outlook.com (10.13.155.13) with Microsoft SMTP
 Server (version=TLS1_0, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA) id
 15.20.3477.21 via Frontend Transport; Tue, 20 Oct 2020 12:31:15 +0000
Received: from MTK-SMS-XCH01.digi.com ([fe80::cca7:5299:c88e:1c40]) by
 MTK-SMS-XCH02.digi.com ([fe80::4960:cfbf:ad5e:3cdb%20]) with mapi id
 14.03.0487.000; Tue, 20 Oct 2020 07:31:14 -0500
From:   "Bollinger, Seth" <Seth.Bollinger@digi.com>
To:     Pavel Machek <pavel@ucw.cz>
CC:     "Bollinger, Seth" <Seth.Bollinger@digi.com>,
        "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>,
        Dan Murphy <dmurphy@ti.com>,
        Seth Bollinger <seth.boll@gmail.com>
Subject: Re: Strange timer LED behavior
Thread-Topic: Strange timer LED behavior
Thread-Index: AQHWpiEO4JOa0xb3bESM7pkNxmLF0qmfTGOAgAFtfgCAAATZgIAAAp0A
Date:   Tue, 20 Oct 2020 12:31:14 +0000
Message-ID: <DF67F732-7B99-4C32-A7E9-4595E2B1E82A@digi.com>
References: <A2C38AF0-0CE8-4312-8329-54B7E9653223@digi.com>
 <20201019140617.GA25480@duo.ucw.cz>
 <3D108EE8-F4B6-490B-9B97-59B8E008F63B@digi.com>
 <2A80CF0E-1022-4673-86E8-12BF0696708E@digi.com>
 <20201020122149.GA19856@duo.ucw.cz>
In-Reply-To: <20201020122149.GA19856@duo.ucw.cz>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.27.1.17]
Content-Type: text/plain; charset="utf-8"
Content-ID: <7FFFCF107991BC4C853C6F1ED16040C8@digi.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 84b9599b-a181-4506-83dc-08d874f409ae
X-MS-TrafficTypeDiagnostic: DM6PR10MB4044:
X-Microsoft-Antispam-PRVS: <DM6PR10MB4044E77CB3DCDD6491675029E81F0@DM6PR10MB4044.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 830LEc7kihIdSIqSArCic8/r+j3Xu3uh578ChHHI3QrrcZPYnVqF8We5HhnAdkkR8nCMzgDKW/6a9ocwajh3qq7+UUqsBdT6uRPnA64+lRIEjOf+DDnOJYVXH9oUNGoS6Mntuq4ji9u/UZoTHRsnHJJtLb2abI5pdIW0HOx719EDZvIpkXzCXIQgLABe1IzywkvTzTq+C3SX9vgPfxs3pi5qn7qlUjnDJaMT5LjoNfZMh0c7rFcIc0wb9qEwk7/atrRwQAurAOPpPBQZb6mfHlYEPgdvdogHm7T0K6bft21Hm5ZEJVAhVF4s/l1rikobxchbS35VNpcMeR7HGU/iySRVSxFs+zkDkCHuFosNI7SM5+b4KSi1Ud2tBl6lNSduj2WP2uysdlWWgdvxIJum9Y8iN50Ln4JJHH95OhsASmjWJjmdsblsnHg76v0StQUmPRV0Z9eKpwqruvEQ6j2VKiII0+Bodl5rreV6edASTap7yJ6ICAc84nxK3pVqcoUY
X-Forefront-Antispam-Report: CIP:198.51.192.230;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:MTK-SMS-XCH02.digi.com;PTR:ErrorRetry;CAT:NONE;SFS:(4636009)(396003)(136003)(346002)(39850400004)(376002)(46966005)(36756003)(47076004)(3480700007)(54906003)(26005)(336012)(356005)(83380400001)(33310700002)(186003)(426003)(8936002)(82310400003)(86362001)(478600001)(82740400003)(8676002)(81166007)(33656002)(36906005)(7696005)(966005)(70206006)(316002)(70586007)(6916009)(4326008)(5660300002)(2616005)(2906002);DIR:OUT;SFP:1102;
X-OriginatorOrg: digi.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2020 12:31:15.3151
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 84b9599b-a181-4506-83dc-08d874f409ae
X-MS-Exchange-CrossTenant-Id: abb4cdb7-1b7e-483e-a143-7ebfd1184b9e
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=abb4cdb7-1b7e-483e-a143-7ebfd1184b9e;Ip=[198.51.192.230];Helo=[MTK-SMS-XCH02.digi.com]
X-MS-Exchange-CrossTenant-AuthSource: MW2NAM10FT050.eop-nam10.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR10MB4044
X-BESS-ID: 1603197078-893001-9247-69447-1
X-BESS-VER: 2019.3_20201019.1728
X-BESS-Apparent-Source-IP: 104.47.56.175
X-BESS-Outbound-Spam-Score: 0.00
X-BESS-Outbound-Spam-Report: Code version 3.2, rules version 3.2.2.227668 [from 
        cloudscan17-254.us-east-2b.ess.aws.cudaops.com]
        Rule breakdown below
         pts rule name              description
        ---- ---------------------- --------------------------------
        0.00 BSF_BESS_OUTBOUND      META: BESS Outbound 
X-BESS-Outbound-Spam-Status: SCORE=0.00 using account:ESS112744 scores of KILL_LEVEL=7.0 tests=BSF_BESS_OUTBOUND
X-BESS-BRTS-Status: 1
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

DQo+Pj4+IFllcC4gSXQgYWxsb3dzIGhhcmR3YXJlIHRvIHByb3ZpZGUgZGlmZmVyZW50IHZhbHVl
cyBpZiBpdCBjYW4gb25seQ0KPj4+PiBibGluayBhdCBmaXhlZCByYXRlLg0KPj4+IA0KPj4+IE9r
LCBJIHVuZGVyc3RhbmQgaG93IGhhcmR3YXJlIG1pZ2h0IG1ha2UgYSBkaWZmZXJlbnQgY2hvaWNl
LCBidXQgaW4gdGhpcyBzY2VuYXJpbyB3ZeKAmXJlIHVzaW5nIHNvZnR3YXJlIHRvIGJsaW5rLCBz
byBldmVyeXRoaW5nIGlzIGhhbmRsZWQgYnkgdGhlIGtlcm5lbC4gIEFsc28sIGlmIHRoZSBpbnRl
cmZhY2UgaXMgaGFyZHdhcmUgZW5hYmxlZCwgaXNu4oCZdCB0aGUgcGF0aCBhdCBsaW5lIDE3NyB1
c2VkICh3aGljaCByZXR1cm5zIGJlZm9yZSB0aGUgZGVmYXVsdCBpcyBzZXQpPw0KPj4gDQo+PiBX
aHkgc2hvdWxkIHNvZnR3YXJlIGJsaW5rIG5lZWQgdG8gc2VsZWN0IGEgZGVmYXVsdCByYXRlIHNp
bmNlIGl0IHNob3VsZCBiZSBhYmxlIHRvIGhhbmRsZSBhbGwgcmVxdWVzdHMgKGV2ZW4gMCwgMCk/
DQo+PiANCj4gDQo+IEhvdyBjYW4gc29mdHdhcmUgYmxpbmsgYXQgIjAsIDAiPw0KDQpUaGlzIHdv
dWxkIG1lYW4sIGRvbuKAmXQgYmxpbmsuICA6KS4NCg0KU2luY2Ugd2XigJlyZSB1c2luZyBzeXNm
cywgd2UgbmVlZCB0byB1cGRhdGUgdGhvc2UgdmFsdWVzIGluIDIgRlMgd3JpdGVzLiAgSXQgYXBw
ZWFycyB0aGF0IHRoZSBzeXNmcyBpcyByZW9yZGVyaW5nIHRoZSB3cml0ZXMsIHNvIHdlIGNhbuKA
mXQgY29udHJvbCB3aGF0IHZhbHVlIGlzIHdyaXR0ZW4gd2hlbiwgc28gaXQgZ2xpdGNoZXMgZm9y
IHVzLiAgV2UgY2hhbmdlIG9mZiBmaXJzdCwgdGhlbiBvbiwgYnV0IHRoZSBvcmRlciBvZiB0aGUg
Y2FsbHMgaW4gdGhlIGtlcm5lbCBpcyBvbiBmaXJzdCAod2l0aCBvZmYgYWxyZWFkeSAwKSwgdGhl
IGtlcm5lbCBjaGFuZ2VzIHZhbHVlcyB0byBkZWZhdWx0LCB0aGVuIHRoZSBvZmYgaXMgd3JpdHRl
biwgbGVhdmluZyBvbiB3aXRoIGEgdmFsdWUgb2YgNTAwICh3ZSBzZXQgaXQgdG8gMCkgYW5kIG9m
ZiB3aXRoIHRoZSB2YWx1ZSB3ZSB3YW50ZWQuDQoNCklzIHRoZXJlIGEgd2F5IHRvIGF2b2lkIHRo
aXM/ICBFdmVuIGlmIHdlIHdyaXRlIHRoZSBvbiB2YWx1ZSB0d2ljZSwgaXQgd2lsbCBmbGFzaCBm
b3IgNTAwbXMgYXQgbGVhc3Qgb25jZeKApg0KDQpJIHRyaWVkIHNldHRpbmcgdGhlIHRyaWdnZXIg
dG8gbm9uZSwgYnV0IG9mIGNvdXJzZSB0aGlzIGRpc2FibGVkIHRoZSBkaXNwbGF5IHNldHRpbmdz
IGFuZCBzZXR0aW5nIHRoZSB0cmlnZ2VyIHRvIHRpbWVyIGVuZHMgdXAgZmxhc2hpbmcgYXQgdGhl
IGRlZmF1bHQgcmF0ZSwgd2hpY2ggaXMgYWxzbyB3aGF0IHdlIGRvbuKAmXQgd2FudC4NCg0KPiAN
Cj4gMCwgMCBzaW1wbHkgbWVhbnMgInVzZSBkZWZhdWx0cyIsIGZvciBoYXJkd2FyZSBhbmQgc29m
dHdhcmUuIEl0cyBvbGQNCj4gQVBJLCBzbyB5b3UnbGwgaGF2ZSB0byBsaXZlIHdpdGggaXQuDQoN
Ck9rLg0KDQo+IA0KPiAJCQkJCQkJCVBhdmVsDQo+IC0tIA0KPiBodHRwczovL2xpbmtwcm90ZWN0
LmN1ZGFzdmMuY29tL3VybD9hPWh0dHAlM2ElMmYlMmZ3d3cubGl2ZWpvdXJuYWwuY29tJTJmfnBh
dmVsbWFjaGVrJmM9RSwxLExIZzh5UDZSNmoyM1pDaWROeWlzMmxPR2hWZVFaUHktMHpUMC1LVDJy
UTdsUzNnM0dXaG1VTXBZQjcybURud180RGFVTFRNa1cwZGIwaWJqMUJTVzFNUjQ2NkRPNURacWNI
Ylp3elE2JnR5cG89MQ0KPiANCj4gDQoNCg==
