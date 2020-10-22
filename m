Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 67AE3295D6E
	for <lists+linux-leds@lfdr.de>; Thu, 22 Oct 2020 13:34:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2897354AbgJVLet (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 22 Oct 2020 07:34:49 -0400
Received: from outbound-ip23a.ess.barracuda.com ([209.222.82.205]:42174 "EHLO
        outbound-ip23a.ess.barracuda.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2897324AbgJVLer (ORCPT
        <rfc822;linux-leds@vger.kernel.org>);
        Thu, 22 Oct 2020 07:34:47 -0400
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2106.outbound.protection.outlook.com [104.47.58.106]) by mx5.us-east-2a.ess.aws.cudaops.com (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO); Thu, 22 Oct 2020 11:34:39 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ifpfO5esWPyg15MMUI6vKEYEZ0SCIq7Hd8naxN75HGZshrK/8UlgKjun+pwjW0qu4Sp/LIJltwA9s83pErGjgti8g3sG09TH0cCYl/Z8VM9MFhb5uuJOzkqtKbFdP8WNYbjP3fNET9ApzW+tR4gD/pTleBlBfuXy6flH35yYHqfXPWogHxm0O1vDUcjwEM7Sbeumlzw5ZaqU554x8tP+RJX1R061ltz5/1TfCpuHzh1ZgAqQsknCXvtzYLy4YEx5iRbp4hgxLCzhoZ73JWEEMoOckZzrCNpQcc+BWY5iAjRZhw279qYgv5TINCEXAxhgV3iDkhl4JDPQLSJ1yIRGqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g1dLAFs932Wa3fjgzZ0WymjmDA49VOm5adgIRV4vM8g=;
 b=oG822FZe68yy78BE+G7b4Sw5wr+TJKTlE8RaPMqnmR+syHe1UtsvwK5Rz8Q0IcDj5JK9xQkKrvXF/p23C1hz/mpBn9J1II+DW8YQ91BhqSjpCzLbG50TELuYYluGfaHsZfTeIx3XAQLmq5X360VMQeGFvJhqMbIosVPtNAmN49GHXR1j9xlFTZdiCbNpqjDG+reGSu7rF071Rzu01EnH6veYCW3aK+JXeVM45inIudE+CpIj8c04E45X3dbcKe38+xLFNgKXc7+P7oC3uMig1EdppqJXPsXfo/Cd19BpufRGixh8KQCphax2ErnDJRHelY8IoC6M8/Lt0qxgQlFiLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 198.51.192.230) smtp.rcpttodomain=ucw.cz smtp.mailfrom=digi.com;
 dmarc=fail (p=reject sp=reject pct=100) action=oreject header.from=digi.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=digi.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g1dLAFs932Wa3fjgzZ0WymjmDA49VOm5adgIRV4vM8g=;
 b=dqobj7towK1FyHBxtaP2EwiS0RD5FNHzVuOYkVxU8qC82loK+mYdlbktW3lapN8JZ8vPIPmTgoXoqB06ZfQSFv+BhbQIur9x4fch0OpK379NuzW722r7FM/03zNrMnWf06m/IWbC405BfFk+F42lZYOldv6N38/kOeHKRsZlc3Q=
Received: from BN6PR04CA0098.namprd04.prod.outlook.com (2603:10b6:404:c9::24)
 by SJ0PR10MB4528.namprd10.prod.outlook.com (2603:10b6:a03:2d4::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.20; Thu, 22 Oct
 2020 11:34:38 +0000
Received: from BN7NAM10FT005.eop-nam10.prod.protection.outlook.com
 (2603:10b6:404:c9:cafe::a4) by BN6PR04CA0098.outlook.office365.com
 (2603:10b6:404:c9::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.18 via Frontend
 Transport; Thu, 22 Oct 2020 11:34:37 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is
 198.51.192.230) smtp.mailfrom=digi.com; ucw.cz; dkim=none (message not
 signed) header.d=none;ucw.cz; dmarc=fail action=oreject header.from=digi.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 digi.com discourages use of 198.51.192.230 as permitted sender)
Received: from MTK-SMS-XCH02.digi.com (198.51.192.230) by
 BN7NAM10FT005.mail.protection.outlook.com (10.13.157.174) with Microsoft SMTP
 Server (version=TLS1_0, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA) id
 15.20.3499.18 via Frontend Transport; Thu, 22 Oct 2020 11:34:35 +0000
Received: from MTK-SMS-XCH01.digi.com ([fe80::cca7:5299:c88e:1c40]) by
 MTK-SMS-XCH02.digi.com ([fe80::4960:cfbf:ad5e:3cdb%20]) with mapi id
 14.03.0487.000; Thu, 22 Oct 2020 06:34:34 -0500
From:   "Bollinger, Seth" <Seth.Bollinger@digi.com>
To:     Pavel Machek <pavel@ucw.cz>
CC:     "Bollinger, Seth" <Seth.Bollinger@digi.com>,
        "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>,
        Dan Murphy <dmurphy@ti.com>,
        Seth Bollinger <seth.boll@gmail.com>
Subject: Re: Strange timer LED behavior
Thread-Topic: Strange timer LED behavior
Thread-Index: AQHWpiEO4JOa0xb3bESM7pkNxmLF0qmfTGOAgAFtfgCAAATZgIAAAp0AgABeK4CAAAWuAIAAAT8AgAAAnICAAAGZAIAAAt8AgAKSJQCAABiIAA==
Date:   Thu, 22 Oct 2020 11:34:34 +0000
Message-ID: <6C8DDBC1-FCAF-411A-AA38-108CEE58EC9C@digi.com>
References: <3D108EE8-F4B6-490B-9B97-59B8E008F63B@digi.com>
 <2A80CF0E-1022-4673-86E8-12BF0696708E@digi.com>
 <20201020122149.GA19856@duo.ucw.cz>
 <DF67F732-7B99-4C32-A7E9-4595E2B1E82A@digi.com>
 <20201020180813.GA25906@duo.ucw.cz>
 <CF36FC5F-6FA9-4797-A6D6-6533D795DAD1@digi.com>
 <20201020183300.GB25906@duo.ucw.cz>
 <78785807-3DB7-4A70-B135-2B20A260EA57@digi.com>
 <20201020184054.GC25906@duo.ucw.cz>
 <31E37AC2-589B-41F0-B7AA-9E520160F8A6@digi.com>
 <20201022100646.GA26350@duo.ucw.cz>
In-Reply-To: <20201022100646.GA26350@duo.ucw.cz>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.27.1.169]
Content-Type: text/plain; charset="utf-8"
Content-ID: <80EF6A84D197DE4D91193B1AAAA06397@digi.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d5ccd079-f0ec-487f-1771-08d8767e741e
X-MS-TrafficTypeDiagnostic: SJ0PR10MB4528:
X-Microsoft-Antispam-PRVS: <SJ0PR10MB452801860EB40BA7B21188E8E81D0@SJ0PR10MB4528.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4502;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2we+nkDIbT/a3AeDRQCHJAZulOKQh9iHavz2wpLpFepvJq3vMiKYuR7nz9mNRU9D6qgyZzJY/ObOzsunyqOgCzIlt9obPHYFUJX0yxkPKefIH37cctMXLEiWfjUtcKN/jDU5PjK1/7uZLDXgHUp57C8vGPrtvoGBYbqV/+FspcOZY2E1lle3OuaWEPGObaW49T1ZM0RQf0grf+MGElu975KdKLaW7LavUaZZELCMiYdP3YOrBcFRpUknsvpo+0NgpFqBoVNM7YAltzTRFeSVuyqI+2EFIA/KXlUx19YXhl+QMykNfEwAPmR1cFvIJsy/mbrr2JJ872zPlyB1tJkeH9OX4cMbuAAdU2mxYUXevEpUmHuQJcFsXZmpJ4CzI+FyNaPGHTU/HGarcdQZWJcjZ10nX4fAOZCMBzJWJlFCmPA=
X-Forefront-Antispam-Report: CIP:198.51.192.230;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:MTK-SMS-XCH02.digi.com;PTR:ErrorRetry;CAT:NONE;SFS:(4636009)(396003)(136003)(376002)(39850400004)(346002)(46966005)(36906005)(316002)(8936002)(426003)(3480700007)(54906003)(2616005)(336012)(186003)(26005)(47076004)(7696005)(70206006)(70586007)(2906002)(81166007)(86362001)(82740400003)(82310400003)(5660300002)(33310700002)(8676002)(33656002)(4326008)(478600001)(6916009)(36756003)(356005)(83380400001);DIR:OUT;SFP:1102;
X-OriginatorOrg: digi.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Oct 2020 11:34:35.6172
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d5ccd079-f0ec-487f-1771-08d8767e741e
X-MS-Exchange-CrossTenant-Id: abb4cdb7-1b7e-483e-a143-7ebfd1184b9e
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=abb4cdb7-1b7e-483e-a143-7ebfd1184b9e;Ip=[198.51.192.230];Helo=[MTK-SMS-XCH02.digi.com]
X-MS-Exchange-CrossTenant-AuthSource: BN7NAM10FT005.eop-nam10.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB4528
X-BESS-ID: 1603366479-893008-20250-52704-1
X-BESS-VER: 2019.1_20201021.2259
X-BESS-Apparent-Source-IP: 104.47.58.106
X-BESS-Outbound-Spam-Score: 0.00
X-BESS-Outbound-Spam-Report: Code version 3.2, rules version 3.2.2.227712 [from 
        cloudscan20-4.us-east-2b.ess.aws.cudaops.com]
        Rule breakdown below
         pts rule name              description
        ---- ---------------------- --------------------------------
        0.00 BSF_BESS_OUTBOUND      META: BESS Outbound 
X-BESS-Outbound-Spam-Status: SCORE=0.00 using account:ESS112744 scores of KILL_LEVEL=7.0 tests=BSF_BESS_OUTBOUND
X-BESS-BRTS-Status: 1
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

DQo+Pj4gWWVhaC4gRG9uJ3QgZG8gdGhhdCEgOi0pLiBGb3Igc29saWQgb24vc29saWQgb2ZmLCBq
dXN0IHR1cm4gdGhlDQo+Pj4gdHJpZ2dlciBvZmYuIEZvciBibGlua2luZywgdXNlIHRpbWVyIHRy
aWdnZXIuDQo+PiANCj4+IElmIEkgd2FudCB0byBnbyBmcm9tIG9uIG9yIG9mZiB0byBmbGFzaGlu
ZywgSSBuZWVkIHRvIHNldCB0aGUgdGltZXIgdHJpZ2dlciwgd2hpY2ggcmVzdWx0cyBpbiBhIDUw
MCBtcyBmbGFzaCByYXRlIHVudGlsIHRoZSByZWFsIHJhdGVzIGFyZSBzZXQuICBUaGlzIHJlc3Vs
dHMgaW4gYSBub3RpY2VhYmx5IGRpZmZlcmVudCBmaXJzdCBibGluay4gIEkgZ3Vlc3Mgd2XigJly
ZSBsb29raW5nIGZvciBzbW9vdGggY29udHJvbCBvZiB0aGUgTEVELg0KPj4gDQo+IA0KPiBPa2F5
LCB0aGF0J3MgZmFpciByZXF1aXJlbWVudCwgSSBndWVzcy4NCj4gDQo+IElmIHlvdSBoYXZlIHBy
b3Bvc2FscyBob3cgdG8gc29sdmUgdGhpcyBpbiBhIG5pY2Ugd2F5LCBnbyBhaGVhZC4NCj4gDQo+
IEFzIGEgaGFjay4uLg0KPiANCj4gSSBiZWxpZXZlIHlvdSBjYW4gZ28gZnJvbSBvbiB0byBvZmYg
bGlrZSB0aGlzOg0KPiANCj4gb246OTk5OSxvZmY6MCAtPiBvbjo5OTk5LG9mZjoxIC0+IG9uOjEs
b2ZmOjk5OTkgLT4gb246MCxvZmY6OTk5OS4NCj4gDQo+IChBbmQgSSBiZWxpZXZlIHdlIHNob3Vs
ZCBkb2N1bWVudCB0aGlzIHNvbWV3aGVyZSkuDQoNCg0KSSBoYXRlIHRvIHJlc3BvbmQgdG8gdGhp
cywgYmVjYXVzZSBpdCBtYWtlcyBtZSBsb29rIHN0dXBpZCwgYnV04oCmICA6KQ0KDQpUaGUgcHJv
YmxlbSB0dXJuZWQgb3V0IHRvIGJlIHRoYXQgdGhlIG9yaWdpbmFsIGF1dGhvciB3YXMgdXNpbmcg
YnVmZmVyZWQgSU8gdG8gZG8gdGhlIHN5c2ZzIHdyaXRlcyAod2hpY2ggSSBkaWRu4oCZdCBub3Rp
Y2UgdW50aWwgeWVzdGVyZGF5KS4gIFdoZW4gSSBzd2l0Y2hlZCB0byBhIGRpZmZlcmVudCBtZXRo
b2QsIHRoZSB3cml0ZXMgd2VyZSBvcmRlcmVkIGNvcnJlY3RseSBhbmQgZGlkbuKAmXQgZ2xpdGNo
Lg0KDQpBcG9sb2dpZXMgZm9yIGJvdGhlcmluZyB5b3UgYWxsLCBhbmQgZ3JlYXQgdGhhbmtzIGZv
ciB5b3VyIGFzc2lzdGFuY2UhDQoNClRoYW5rcyBhZ2FpbiENCg0KU2V0aA==
