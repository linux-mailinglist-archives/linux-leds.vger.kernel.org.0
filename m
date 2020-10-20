Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4126D29421B
	for <lists+linux-leds@lfdr.de>; Tue, 20 Oct 2020 20:28:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390164AbgJTS2o (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 20 Oct 2020 14:28:44 -0400
Received: from outbound-ip24a.ess.barracuda.com ([209.222.82.206]:54304 "EHLO
        outbound-ip24a.ess.barracuda.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2390121AbgJTS2o (ORCPT
        <rfc822;linux-leds@vger.kernel.org>);
        Tue, 20 Oct 2020 14:28:44 -0400
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (mail-sn1nam02lp2054.outbound.protection.outlook.com [104.47.36.54]) by mx5.us-east-2a.ess.aws.cudaops.com (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO); Tue, 20 Oct 2020 18:28:37 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Kvu0ohjPPEmhWUweaNDDv7JtCh/gMOxAVVJ0kISkwEQ1gFHfGkspiZXnAPvl2h9V+TLyldwi1el/lg6KsxTpBjfqQoCPxAPFthrhOx7fYT1jS4XdmUesS8lG5y5P7+VIVIle7Hn7DMyphvXpJzn5H7JmqCyNjhVr+3/aeC3SdvKs+Sxvj1dLxmvXV9Ch55Joo2RkhcgH/LVpwLRGigSpjq1fB1tcI3QnWY3q5oGJhmgjQSmdSv/2wqEl1uQRhsv6WnG8NLmlgvyymZDBE1mnUw11+8BWNZ/vKJvBUS/6vkpwDSKcyjA5syVHCmI1GkPDkD+LE5/QFWMyX/FnZ8oERQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S9P79pUCarFpZNBkMVHg9fICnyzoZeoL0wEtSZZ/pXg=;
 b=VjYbbm7sCtZH3gkCPwCUvIzmH5dl8KR8RwP5XM2Plc6B+RWaDbvXHOaCp29Jp0QpdsJFRyRbAX3oNljGwOVSLbDPkftNgAgsx6NtvIoU5zDulnMSfDR0/O6E3iHFn5jtIsbFF6WEF5GEOSAt91APytwosIJuYsDlu0vIz6NyFBQCnDjixVoubwb83t2Pnl9KnJOkaF8/NV0P5wCBWGvRCglJDZ8pVrgBiHsRKGXQg08SL3wbBY7yW8aJMNO4Od1wH+vv8JIbYEtcfmXNqOz2wVFagR+3Q+pJMs/NTO6Z/q64D7aO9Z+fbGqvKqiEKyTJNgaUlv/p69Hi7w4uABbHlQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=temperror (sender ip
 is 198.51.192.230) smtp.rcpttodomain=ucw.cz smtp.mailfrom=digi.com;
 dmarc=temperror action=none header.from=digi.com; dkim=none (message not
 signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=digi.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S9P79pUCarFpZNBkMVHg9fICnyzoZeoL0wEtSZZ/pXg=;
 b=LI4/WY0JwrxBF6qDcv1++lcolpAv7W2eBeramvDi6m0lNRdPTlgVF920R+Lq7Xd5LRUmCWbN7n/mfQfMVrcLaPBFhHNZlLDUA4s0NfaHYC2ypTzEp9+JDuKxIJnnPQ+qdnYme/+Cr+e/T5b0gGc6dobhhJDLluRDbmmmrNSLdYY=
Received: from DM5PR08CA0055.namprd08.prod.outlook.com (2603:10b6:4:60::44) by
 BYAPR10MB3685.namprd10.prod.outlook.com (2603:10b6:a03:124::33) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.20; Tue, 20 Oct
 2020 18:28:35 +0000
Received: from DM6NAM10FT011.eop-nam10.prod.protection.outlook.com
 (2603:10b6:4:60:cafe::5f) by DM5PR08CA0055.outlook.office365.com
 (2603:10b6:4:60::44) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.21 via Frontend
 Transport; Tue, 20 Oct 2020 18:28:35 +0000
X-MS-Exchange-Authentication-Results: spf=temperror (sender IP is
 198.51.192.230) smtp.mailfrom=digi.com; ucw.cz; dkim=none (message not
 signed) header.d=none;ucw.cz; dmarc=temperror action=none
 header.from=digi.com;
Received-SPF: TempError (protection.outlook.com: error in processing during
 lookup of digi.com: DNS Timeout)
Received: from MTK-SMS-XCH03.digi.com (198.51.192.230) by
 DM6NAM10FT011.mail.protection.outlook.com (10.13.152.178) with Microsoft SMTP
 Server (version=TLS1_0, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA) id
 15.20.3477.21 via Frontend Transport; Tue, 20 Oct 2020 18:28:34 +0000
Received: from MTK-SMS-XCH01.digi.com ([fe80::cca7:5299:c88e:1c40]) by
 MTK-SMS-XCH03.digi.com ([fe80::484d:c326:e7f1:a9fd%16]) with mapi id
 14.03.0487.000; Tue, 20 Oct 2020 13:28:34 -0500
From:   "Bollinger, Seth" <Seth.Bollinger@digi.com>
To:     Pavel Machek <pavel@ucw.cz>
CC:     "Bollinger, Seth" <Seth.Bollinger@digi.com>,
        "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>,
        Dan Murphy <dmurphy@ti.com>,
        Seth Bollinger <seth.boll@gmail.com>
Subject: Re: Strange timer LED behavior
Thread-Topic: Strange timer LED behavior
Thread-Index: AQHWpiEO4JOa0xb3bESM7pkNxmLF0qmfTGOAgAFtfgCAAATZgIAAAp0AgABeK4CAAAWuAA==
Date:   Tue, 20 Oct 2020 18:28:33 +0000
Message-ID: <CF36FC5F-6FA9-4797-A6D6-6533D795DAD1@digi.com>
References: <A2C38AF0-0CE8-4312-8329-54B7E9653223@digi.com>
 <20201019140617.GA25480@duo.ucw.cz>
 <3D108EE8-F4B6-490B-9B97-59B8E008F63B@digi.com>
 <2A80CF0E-1022-4673-86E8-12BF0696708E@digi.com>
 <20201020122149.GA19856@duo.ucw.cz>
 <DF67F732-7B99-4C32-A7E9-4595E2B1E82A@digi.com>
 <20201020180813.GA25906@duo.ucw.cz>
In-Reply-To: <20201020180813.GA25906@duo.ucw.cz>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.27.1.17]
Content-Type: text/plain; charset="utf-8"
Content-ID: <965B7AE167DF1B4EA6BCB5D0D6E8E1D8@digi.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 02da8f39-2749-4f6d-658a-08d87525f417
X-MS-TrafficTypeDiagnostic: BYAPR10MB3685:
X-Microsoft-Antispam-PRVS: <BYAPR10MB36852EBBE1C06FA91B912104E81F0@BYAPR10MB3685.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: lUh55YvI1gcSBRnRRaDnrp9fHBBOmUKZVDSFZdrGDWSrV8QZ9otKshJ9KRcc9mlznTuPHslJyb1lMjbw1LWhxZGK/jdCTOTwTGA8hTD39fU211CgJoHmsHbCIbmkajr41eJmu1teGbto27gxPBc6MF30AOV4om3tjQJGqHE1BjxkCTDjno4svtCyNGm31V4WciQhocZCTbA5oBpXiaeMKOzEnQaSr1iuKWKQqda+U5HONNcZXQ5ldr1E3Huqwr9B7l351CIQ7rxlqfMnf18WpvJM7QQ/Nc18fmdZ2ykyprUR5TbTlVX4T0Vmoxck5dWUFLIQCFQ2x9OPA3qwG2VPmRG09WZvZ5mp/uaTZbWdgkSw9dzo4OUphtSg6WRfS6daxRHxnPyE2ZOebsU5szXjTg5vZIFpQL2GI+40eCJ4/G/08KRHiiWLzDWy49pvplLc
X-Forefront-Antispam-Report: CIP:198.51.192.230;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:MTK-SMS-XCH03.digi.com;PTR:ErrorRetry;CAT:NONE;SFS:(4636009)(396003)(136003)(346002)(39850400004)(376002)(46966005)(83380400001)(33656002)(4326008)(8936002)(70586007)(70206006)(36756003)(8676002)(81166007)(6916009)(47076004)(186003)(336012)(26005)(82740400003)(86362001)(54906003)(5660300002)(7696005)(478600001)(3480700007)(36906005)(33310700002)(2906002)(356005)(2616005)(426003)(82310400003)(63370400001)(63350400001)(316002);DIR:OUT;SFP:1102;
X-OriginatorOrg: digi.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2020 18:28:34.1899
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 02da8f39-2749-4f6d-658a-08d87525f417
X-MS-Exchange-CrossTenant-Id: abb4cdb7-1b7e-483e-a143-7ebfd1184b9e
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=abb4cdb7-1b7e-483e-a143-7ebfd1184b9e;Ip=[198.51.192.230];Helo=[MTK-SMS-XCH03.digi.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM10FT011.eop-nam10.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR10MB3685
X-BESS-ID: 1603218517-893008-12333-128-1
X-BESS-VER: 2019.1_20201020.1810
X-BESS-Apparent-Source-IP: 104.47.36.54
X-BESS-Outbound-Spam-Score: 0.00
X-BESS-Outbound-Spam-Report: Code version 3.2, rules version 3.2.2.227672 [from 
        cloudscan15-28.us-east-2a.ess.aws.cudaops.com]
        Rule breakdown below
         pts rule name              description
        ---- ---------------------- --------------------------------
        0.00 BSF_BESS_OUTBOUND      META: BESS Outbound 
X-BESS-Outbound-Spam-Status: SCORE=0.00 using account:ESS112744 scores of KILL_LEVEL=7.0 tests=BSF_BESS_OUTBOUND
X-BESS-BRTS-Status: 1
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

DQo+IA0KPj4gSXMgdGhlcmUgYSB3YXkgdG8gYXZvaWQgdGhpcz8gIEV2ZW4gaWYgd2Ugd3JpdGUg
dGhlIG9uIHZhbHVlIHR3aWNlLA0KPj4gaXQgd2lsbCBmbGFzaCBmb3IgNTAwbXMgYXQgbGVhc3Qg
b25jZeKApg0KPiANCj4gVGhlcmUgc2hvdWxkIGJlLiBDYW4geW91IHNpbXBseSB3cml0ZSBuZXcg
dmFsdWVzIHRvIG9uIGFuZCBvZmYsDQo+IHdpdGhvdXQgd3JpdGluZyB6ZXJvcyB0aGVyZT8NCg0K
SW4gdGhpcyBjYXNlIHdl4oCZcmUgc3dpdGNoaW5nIGZyb20gb246ODY0MDAsIG9mZjowIC0+IG9u
OjAsIG9mZjo4NjQwMC4gIFdlIHdyaXRlIG9mZiBmaXJzdCwgdGhlbiBvbiB1c2luZyBmd3JpdGUo
KSB0byBhIGZpbGUuICBGcm9tIHRoZSB0cmFjZSwgaXQgbG9va3MgbGlrZSBvbiBpcyBhbHdheXMg
c3RvcmVkIGZpcnN0LiAgU28sIHRoZSBmaXJzdCBzdG9yZSBpcyBvbjowLCBvZmY6MCBmb3IgYSBi
cmllZiBwZXJpb2QgKGVub3VnaCB0byB0cmlnZ2VyIHRoZSBkZWZhdWx0KSwgYW5kIHRoZW4gb2Zm
IGlzIHN0b3JlZC4gIFdl4oCZcmUgYWxyZWFkeSB0cnlpbmcgdG8gbm90IGhhdmUgdGhlbSBub3Qg
Ym90aCBiZSB6ZXJvIGF0IHRoZSBzYW1lIHRpbWUuICBJIHRyaWVkIHB1dHRpbmcgZmZsdXNoKCkg
YmV0d2VlbiB0aGVtLCBidXQgdGhhdCBkaWRu4oCZdCBoZWxwLiAgSSBzdXBwb3NlIHdlIGNvdWxk
IHRyeSB0byBzbGVlcCBzb21lIHBlcmlvZCBvZiB0aW1lLCBidXQgdGhpcyBzZWVtcyBiYWQgYXMg
d2VsbC4gIE1heWJlIHdyaXRlIGFuZCByZWFkIHRvIHZlcmlmeSB0aGUgdmFsdWUgaXMgY29ycmVj
dGx5IHN0b3JlZD8NCg0KPiANCj4gSWYgbm90LCBjYW4geW91IHVzZSAxIGluc3RlYWQgb2YgemVy
bz8NCg0KSSBoYXZlIG5vdCBtZWFzdXJlZCB0aGUgZmxhc2gsIGJ1dCBpZiBvbiBpcyAxbXMsIGl0
4oCZcyBvbiBmb3IgYSBwcmV0dHkgZ29vZCBjaHVuayB0aW1lIChvdXIgTEVEIGNvbnRyb2xsZXIg
aXMgb3ZlciBpMmMpLiAgSXTigJlzIGEgdmVyeSBub3RpY2VhYmxlIGZsYXNoLg0KDQo+IA0KPj4g
DQo+PiBJIHRyaWVkIHNldHRpbmcgdGhlIHRyaWdnZXIgdG8gbm9uZSwgYnV0IG9mIGNvdXJzZSB0
aGlzIGRpc2FibGVkIHRoZSBkaXNwbGF5IHNldHRpbmdzIGFuZCBzZXR0aW5nIHRoZSB0cmlnZ2Vy
IHRvIHRpbWVyIGVuZHMgdXAgZmxhc2hpbmcgYXQgdGhlIGRlZmF1bHQgcmF0ZSwgd2hpY2ggaXMg
YWxzbyB3aGF0IHdlIGRvbuKAmXQgd2FudC4NCj4+IA0KPiANCj4gSWYgdGhlcmUncyBubyByZWFz
b25hYmxlIHZhbHVlIHRvIGNoYW5nZSB0aGUgZnJlcXVlbmN5LCB3ZSdsbCBuZWVkIHRvDQo+IGZp
eCB0aGF0Lg0KDQpJIHRoaW5rIGlmIHdlIGNvdWxkIGNvbnRyb2wgdGhlIGRlbGF5cyB3aXRoIHRy
aWdnZXIgc2V0IHRvIG5vbmUsIHRoZW4gd2UgY291bGQgc2V0IHRoZSBkZWxheXMgYW5kIGVuYWJs
ZSB0aGUgdGltZXIgdHJpZ2dlciBmb3IgYSBubyBnbGl0Y2ggb3BlcmF0aW9uLiAgSSBzdXBwb3Nl
IGlmIHRoZXJlIHdhcyBhIHRpbWVyLW9mZiB0cmlnZ2VyLCB0aGF0IHdvdWxkIHdvcmsgYXMgd2Vs
bCwgYnV0IHNlZW1zIGtpbmQgb2Ygc2lsbHkuDQoNCg0KU2V0aA0KDQo=
