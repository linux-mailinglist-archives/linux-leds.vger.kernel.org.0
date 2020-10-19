Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C1780292918
	for <lists+linux-leds@lfdr.de>; Mon, 19 Oct 2020 16:16:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728877AbgJSOQu (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 19 Oct 2020 10:16:50 -0400
Received: from outbound-ip24a.ess.barracuda.com ([209.222.82.206]:39218 "EHLO
        outbound-ip24a.ess.barracuda.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728311AbgJSOQt (ORCPT
        <rfc822;linux-leds@vger.kernel.org>);
        Mon, 19 Oct 2020 10:16:49 -0400
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11lp2173.outbound.protection.outlook.com [104.47.56.173]) by mx6.us-east-2a.ess.aws.cudaops.com (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO); Mon, 19 Oct 2020 14:16:27 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GypWAhCHHmvfx51z/frCqNi+6ySpTObfXDtyb9JRqX9fZJeAhMQ3bdnptXArglneo21mooHRiQ3X8Hku+4KktgX5EEur7Led7Gss7hTLKyzFv382B9/pQbh6qxie3XiNV56pMZVbj8OJmvGoACGT/9Jms/ucckrbC6SwMBth8npkpyQWyI7wKTst5TSo3f/gk/h4HV7LuUCzfmhtrppSKg/v5xrRJTHvD/ahnSEYUZk8oa51Jy1ize9ZdZehpURoqxkpMUfI22F5joz7i/EqpF+1p+vCtAghuV+KMkFISglXWIcOxR415zEDb6pkTyLU549We6mE+OHpqHthfIsRfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZBpbItCvZUStzlmffBpIMAgsiMvZvwN2m0lNy6N7lWs=;
 b=nU3qzY48SgFgot9Pc9GSynLDyt289lmv+wxm8uL0uRi0Ax+QP47qvrAbXaObEImtbSdp+5LQXAEobFHjm52Vn6z2j0wsgFujToWXpDbdOh2FDwSZM9y1FMmSqYyK2ZgR0SK+nhnztj8bq5mh079v60ueWwg+fXge+XhngT1hEWKMNrt3gQsGpqww3mRe8PL9zIO4x7ekZiGcHpoWqeXGANynQrcCibsfxhKbESIB3rKYYV+nq0pqtDFTmggnkmyk7RJxPboyXvk3hTSajJbUf5WwCxxEwm4SblPthLXIGmpBmfr4YYcVcn8x2HroD17aGHDYDe0r0rumv/zzdlz+CA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 66.77.174.16) smtp.rcpttodomain=ucw.cz smtp.mailfrom=digi.com; dmarc=fail
 (p=reject sp=reject pct=100) action=oreject header.from=digi.com; dkim=none
 (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=digi.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZBpbItCvZUStzlmffBpIMAgsiMvZvwN2m0lNy6N7lWs=;
 b=bXupCjt6j9Is1ZmF43MQmxZwI9m9i7Xp24MhgDbLAi33zVjAgf8F6Y9d952a08W2YIc8P2+Hgg8ANkV7uPiXyiIFQ8WwZBpv6y3FRrZ0QQkaMUNFsMywDNVSUSaTDh5phqqMLrofkddNI38zyfqCuzbYvhNRvFn+ZqUby9jQZGA=
Received: from BN6PR07CA0002.namprd07.prod.outlook.com (2603:10b6:404:8c::12)
 by CH2PR10MB3848.namprd10.prod.outlook.com (2603:10b6:610:3::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.22; Mon, 19 Oct
 2020 14:16:26 +0000
Received: from BN7NAM10FT056.eop-nam10.prod.protection.outlook.com
 (2603:10b6:404:8c:cafe::d6) by BN6PR07CA0002.outlook.office365.com
 (2603:10b6:404:8c::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.20 via Frontend
 Transport; Mon, 19 Oct 2020 14:16:26 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 66.77.174.16)
 smtp.mailfrom=digi.com; ucw.cz; dkim=none (message not signed)
 header.d=none;ucw.cz; dmarc=fail action=oreject header.from=digi.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 digi.com discourages use of 66.77.174.16 as permitted sender)
Received: from MCL-VMS-XCH01.digi.com (66.77.174.16) by
 BN7NAM10FT056.mail.protection.outlook.com (10.13.156.149) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.3477.21 via Frontend Transport; Mon, 19 Oct 2020 14:16:25 +0000
Received: from MTK-SMS-XCH01.digi.com ([fe80::cca7:5299:c88e:1c40]) by
 MCL-VMS-XCH01.digi.com ([fe80::5587:821d:f8e4:6578%13]) with mapi id
 14.03.0487.000; Mon, 19 Oct 2020 09:16:24 -0500
From:   "Bollinger, Seth" <Seth.Bollinger@digi.com>
To:     Pavel Machek <pavel@ucw.cz>
CC:     "Bollinger, Seth" <Seth.Bollinger@digi.com>,
        "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>,
        Dan Murphy <dmurphy@ti.com>,
        Seth Bollinger <seth.boll@gmail.com>
Subject: Re: Strange timer LED behavior
Thread-Topic: Strange timer LED behavior
Thread-Index: AQHWpiEO4JOa0xb3bESM7pkNxmLF0qmfTGOA
Date:   Mon, 19 Oct 2020 14:16:22 +0000
Message-ID: <3D108EE8-F4B6-490B-9B97-59B8E008F63B@digi.com>
References: <A2C38AF0-0CE8-4312-8329-54B7E9653223@digi.com>
 <20201019140617.GA25480@duo.ucw.cz>
In-Reply-To: <20201019140617.GA25480@duo.ucw.cz>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.27.1.86]
Content-Type: text/plain; charset="utf-8"
Content-ID: <0AA7F1B29E3B9D4E8EDDFC01F6CCC8A2@digi.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: df538a63-7d1e-4b9f-459f-08d87439904b
X-MS-TrafficTypeDiagnostic: CH2PR10MB3848:
X-Microsoft-Antispam-PRVS: <CH2PR10MB38489CA2ED05B7E7F71366F1E81E0@CH2PR10MB3848.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: J2d1VTZ83rqIsCrLLrAW7nk+JR+8s5eYpyF2sLwZ4cUHcrNw8dCnb9MmBIbRzvX6XEuyJ5LiPR8xY2qFU1F7cnYH/5CkjhrOCYrelKIzZ9LkBHZ9e4geL8wRMp/tuhfiD5HEuSYPjCIVPE6mtVpXWWb12nUNvVAlqr4h2rkhwEGmHupA2Bf0q2jrrQg4liFGWaJk6OSo/NE5+uOoZfD3XCNu568IfLdfIf2iWjT0Dpv+asGf0cAEOh2pvIUpwsFwGNrejo+j6FTdoFcw7QGuOP4K6EOOPZE0DIQlACmrq9M2yAeqWHjOXludWE6wLsec4dpq1F8xac8a954FmaAWU1lm+0HKKQLi3yJgHT0e+hQKtq+ZEFVtNF2pwLsjSQyGsjQ/zHThGE2ixN3byHTQ0Wd7IIS83OYwalVQ3qkY7Cip5++Gl3zb7SgQFiw2rolL
X-Forefront-Antispam-Report: CIP:66.77.174.16;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:MCL-VMS-XCH01.digi.com;PTR:owa.digi.com;CAT:NONE;SFS:(4636009)(39850400004)(396003)(346002)(376002)(136003)(46966005)(82310400003)(36906005)(54906003)(33310700002)(356005)(70586007)(2906002)(316002)(47076004)(3480700007)(4326008)(336012)(6916009)(7636003)(83380400001)(82740400003)(5660300002)(186003)(26005)(8936002)(478600001)(8676002)(7696005)(33656002)(2616005)(70206006)(426003)(86362001)(36756003);DIR:OUT;SFP:1102;
X-OriginatorOrg: digi.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2020 14:16:25.2866
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: df538a63-7d1e-4b9f-459f-08d87439904b
X-MS-Exchange-CrossTenant-Id: abb4cdb7-1b7e-483e-a143-7ebfd1184b9e
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=abb4cdb7-1b7e-483e-a143-7ebfd1184b9e;Ip=[66.77.174.16];Helo=[MCL-VMS-XCH01.digi.com]
X-MS-Exchange-CrossTenant-AuthSource: BN7NAM10FT056.eop-nam10.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR10MB3848
X-BESS-ID: 1603116987-893010-6937-12558-1
X-BESS-VER: 2019.1_20201016.1851
X-BESS-Apparent-Source-IP: 104.47.56.173
X-BESS-Outbound-Spam-Score: 0.00
X-BESS-Outbound-Spam-Report: Code version 3.2, rules version 3.2.2.227652 [from 
        cloudscan12-0.us-east-2a.ess.aws.cudaops.com]
        Rule breakdown below
         pts rule name              description
        ---- ---------------------- --------------------------------
        0.00 BSF_BESS_OUTBOUND      META: BESS Outbound 
X-BESS-Outbound-Spam-Status: SCORE=0.00 using account:ESS112744 scores of KILL_LEVEL=7.0 tests=BSF_BESS_OUTBOUND
X-BESS-BRTS-Status: 1
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

PiANCj4gSGkhDQo+IA0KPj4gV2UgdXNlIHRoZSBzeXNmcyB0aW1lciB0cmlnZ2VyIG9mIHRoZSBs
ZWQgc3Vic3lzdGVtIHRvIGNvbnRyb2wgb3VyIGxlZHMgKHR1cm4gb24sIHR1cm4gb2ZmLCBhbmQg
YmxpbmspLiAgV2hpbGUgZG9pbmcgdGhpcyB3ZSBmb3VuZCBhIHN0cmFuZ2UgYmVoYXZpb3IuICBJ
ZiB0aGUgdmFsdWVzIG9mIGRlbGF5X29uIGFuZCBkZWxheV9vZmYgYXJlIGV2ZXIgYm90aCB6ZXJv
LCB0aGUgbGVkIHN1YnN5c3RlbSB3aWxsIG1ha2UgdGhlIGRlY2lzaW9uIHRvIGJsaW5rIGF0IGEg
NTAwbXMgb24gYW5kIDUwMG1zIG9mZiByYXRlLg0KPj4gDQo+PiAjIGNkIC9zeXMvY2xhc3MvbGVk
cy9nMDENCj4+ICMgY2F0IGRlbGF5X29uDQo+PiAwDQo+PiAjIGNhdCBkZWxheV9vZmYNCj4+IDg2
NDAwDQo+PiAjIGVjaG8gMCA+IGRlbGF5X29mZg0KPj4gIyBjYXQgZGVsYXlfb24NCj4+IDUwMA0K
Pj4gIyBjYXQgZGVsYXlfb2ZmDQo+PiA1MDANCj4+IA0KPj4gZHJpdmVycy9sZWQvbGVkLWNvcmUu
YzoxODQNCj4+ICAgIC8qIGJsaW5rIHdpdGggMSBIeiBhcyBkZWZhdWx0IGlmIG5vdGhpbmcgc3Bl
Y2lmaWVkICovDQo+PiAgICBpZiAoISpkZWxheV9vbiAmJiAhKmRlbGF5X29mZikNCj4+ICAgICAg
ICAqZGVsYXlfb24gPSAqZGVsYXlfb2ZmID0gNTAwOw0KPj4gDQo+PiBJcyB0aGVyZSBhIHJlYXNv
biB0aGF0IHRoZSBrZXJuZWwgd291bGQgZGVjaWRlIHRvIGJsaW5rIGF0IHRoaXMgZGVmYXVsdCBy
YXRlIGluc3RlYWQgb2YgbGVhdmluZyB0aGUgdGltZXIgZGlzYWJsZWQ/DQo+PiANCj4gDQo+IFll
cC4gSXQgYWxsb3dzIGhhcmR3YXJlIHRvIHByb3ZpZGUgZGlmZmVyZW50IHZhbHVlcyBpZiBpdCBj
YW4gb25seQ0KPiBibGluayBhdCBmaXhlZCByYXRlLg0KDQpPaywgSSB1bmRlcnN0YW5kIGhvdyBo
YXJkd2FyZSBtaWdodCBtYWtlIGEgZGlmZmVyZW50IGNob2ljZSwgYnV0IGluIHRoaXMgc2NlbmFy
aW8gd2XigJlyZSB1c2luZyBzb2Z0d2FyZSB0byBibGluaywgc28gZXZlcnl0aGluZyBpcyBoYW5k
bGVkIGJ5IHRoZSBrZXJuZWwuICBBbHNvLCBpZiB0aGUgaW50ZXJmYWNlIGlzIGhhcmR3YXJlIGVu
YWJsZWQsIGlzbuKAmXQgdGhlIHBhdGggYXQgbGluZSAxNzcgdXNlZCAod2hpY2ggcmV0dXJucyBi
ZWZvcmUgdGhlIGRlZmF1bHQgaXMgc2V0KT8NCg0KU2V0aA0KDQoNCg==
