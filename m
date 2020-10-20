Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8D8DB29422E
	for <lists+linux-leds@lfdr.de>; Tue, 20 Oct 2020 20:35:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390638AbgJTSfZ (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 20 Oct 2020 14:35:25 -0400
Received: from outbound-ip24b.ess.barracuda.com ([209.222.82.221]:41850 "EHLO
        outbound-ip24b.ess.barracuda.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2437458AbgJTSfZ (ORCPT
        <rfc822;linux-leds@vger.kernel.org>);
        Tue, 20 Oct 2020 14:35:25 -0400
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11lp2174.outbound.protection.outlook.com [104.47.56.174]) by mx11.us-east-2b.ess.aws.cudaops.com (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO); Tue, 20 Oct 2020 18:35:18 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VUYlTGSImxNJHHh7n/KZChM8nXoP2QE0PoHsE4JMnZo533CCGgsqjqCmnc4QJaofi3Y9NhShkoNjphzNaTrmThJoeNubivRyGUL3GC9MHGCV448b9aG5kPYXLiqSziDVMyueE7Kqhyfvn65l6GS6TESoIsY12j9M4n8ZcQKmRqt9uwZ6ly8bofmX3Sbv07TwWEM1+hU0Jx+8yzp6Gm0lnIWk3ZgMIJVNqbu9N2pCg5O0y4IcPNdkRcfumo/mynxFf7Y8LZqHr3coMRAcpyvQHq1NmlWFQGWOTkhnZUEHE0yJ1NYVW7OYiLDCYLD8bDHKgOuT+m5G2mLQj6MLQNx6JA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QxdOoN48gk5nHj2szoLdnwmykRcUgwmLeO+WCb9gcd8=;
 b=aMI1DSpQ8adATdILWGD9lDsJu+frgfJoeJKajvW+IzpHUmsmaRCbJhd+Up+8ZyV2wG8ctUaOEklSCU2LHR7+vwHMsEK2wAFzQXTY2XA3gaAa3S8+pvNfbacH9cuDjfPmOJi4IfP7sbaX0Sm+SJodFATxUCidrDdJPeRxhUJZmL7C/VLbf7pGVXoYWWNGX/aKDyehuVkBkWcu+ypXLn6/YbX+sJ8KyLYP4XNcem+JkvkFthPxnMClafG1H/YUd9USF4zpHXrANcv76nTIMo+gK2aVmLRnejVybNQLRvJ5y+Ob0ghuakYyaEqrk2n33NjnmU3eDB+o6Ard6RjaKDxO5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 198.51.192.230) smtp.rcpttodomain=ucw.cz smtp.mailfrom=digi.com;
 dmarc=fail (p=reject sp=reject pct=100) action=oreject header.from=digi.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=digi.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QxdOoN48gk5nHj2szoLdnwmykRcUgwmLeO+WCb9gcd8=;
 b=BuUFvG6UPVFEvD+3IrxPYX+8SRmQXHz1XSUtGAtOMChpF6nNPiAvqKCONF23ZRm5QLJXVyN4G80TcH7oVrGLRgjgYq+2JNlcejMUdU6UGwrvJDYRRKpqu2c3OsQd/R1T0+m9COsi5FKvXfFvKfCXkHQhYt2SfQPdG9idD60N8xQ=
Received: from BN4PR10CA0023.namprd10.prod.outlook.com (2603:10b6:403::33) by
 SN6PR10MB2575.namprd10.prod.outlook.com (2603:10b6:805:45::19) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3499.18; Tue, 20 Oct 2020 18:35:15 +0000
Received: from BN7NAM10FT025.eop-nam10.prod.protection.outlook.com
 (2603:10b6:403:0:cafe::5a) by BN4PR10CA0023.outlook.office365.com
 (2603:10b6:403::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.18 via Frontend
 Transport; Tue, 20 Oct 2020 18:35:15 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is
 198.51.192.230) smtp.mailfrom=digi.com; ucw.cz; dkim=none (message not
 signed) header.d=none;ucw.cz; dmarc=fail action=oreject header.from=digi.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 digi.com discourages use of 198.51.192.230 as permitted sender)
Received: from MTK-SMS-XCH05.digi.com (198.51.192.230) by
 BN7NAM10FT025.mail.protection.outlook.com (10.13.156.100) with Microsoft SMTP
 Server (version=TLS1_0, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA) id
 15.20.3477.21 via Frontend Transport; Tue, 20 Oct 2020 18:35:13 +0000
Received: from MTK-SMS-XCH01.digi.com ([fe80::cca7:5299:c88e:1c40]) by
 MTK-SMS-XCH05.digi.com ([fe80::a576:56af:8463:b976%15]) with mapi id
 14.03.0468.000; Tue, 20 Oct 2020 13:35:13 -0500
From:   "Bollinger, Seth" <Seth.Bollinger@digi.com>
To:     Pavel Machek <pavel@ucw.cz>
CC:     "Bollinger, Seth" <Seth.Bollinger@digi.com>,
        "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>,
        Dan Murphy <dmurphy@ti.com>,
        Seth Bollinger <seth.boll@gmail.com>
Subject: Re: Strange timer LED behavior
Thread-Topic: Strange timer LED behavior
Thread-Index: AQHWpiEO4JOa0xb3bESM7pkNxmLF0qmfTGOAgAFtfgCAAATZgIAAAp0AgABeK4CAAAWuAIAAAT8AgAAAnIA=
Date:   Tue, 20 Oct 2020 18:35:13 +0000
Message-ID: <78785807-3DB7-4A70-B135-2B20A260EA57@digi.com>
References: <A2C38AF0-0CE8-4312-8329-54B7E9653223@digi.com>
 <20201019140617.GA25480@duo.ucw.cz>
 <3D108EE8-F4B6-490B-9B97-59B8E008F63B@digi.com>
 <2A80CF0E-1022-4673-86E8-12BF0696708E@digi.com>
 <20201020122149.GA19856@duo.ucw.cz>
 <DF67F732-7B99-4C32-A7E9-4595E2B1E82A@digi.com>
 <20201020180813.GA25906@duo.ucw.cz>
 <CF36FC5F-6FA9-4797-A6D6-6533D795DAD1@digi.com>
 <20201020183300.GB25906@duo.ucw.cz>
In-Reply-To: <20201020183300.GB25906@duo.ucw.cz>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.27.1.17]
Content-Type: text/plain; charset="utf-8"
Content-ID: <7F552F0180E28840AA304BCACB5BE387@digi.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 28018e82-d6e3-46f5-79df-08d87526e289
X-MS-TrafficTypeDiagnostic: SN6PR10MB2575:
X-Microsoft-Antispam-PRVS: <SN6PR10MB2575C6D1E06DDBBB123AE7FBE81F0@SN6PR10MB2575.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: x1exccfu6SYlMie3BQSQ2fP83WPv2t3Tmf2iyyGwOCuYZtwdLi1NW2E93gmJmR48PpJy5ezGiz/QXOJKEaKNeTSMsQmwj1IplNCgE7FyfVMNL9vP18PBpoA0YIqeKvW9suUSSEMawko4esHuIO04xvjNjOzJjmZrJK+RbER/hQ736e3Uo27sQSlyjqryKTc+Bt53h0XwKQsqRuMt5hYr7k7JGYQtyREVTAqlOeomRMTjP3uZuP2H/2bG+JcyMMp4O0fTdjus25T2EJ/OdNj0Bp23kRUO9qGG1qu5n7NtK7S0Ey1Sc02ogDfEnCzV1SI+QUvHsk6v9NoemErJpDTYv9h1gw9LufnRCygDLlpZumF/zN34IHOvoVgerAfY76djy/hdsuMmrDHnUQJhJ9jnKxK/ljCEAXqM/Andl36NRlc=
X-Forefront-Antispam-Report: CIP:198.51.192.230;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:MTK-SMS-XCH05.digi.com;PTR:ErrorRetry;CAT:NONE;SFS:(4636009)(396003)(346002)(39840400004)(376002)(136003)(46966005)(2906002)(4326008)(36756003)(7696005)(70206006)(70586007)(426003)(336012)(86362001)(5660300002)(316002)(83380400001)(82310400003)(6916009)(2616005)(478600001)(26005)(54906003)(8676002)(3480700007)(356005)(33656002)(33310700002)(36906005)(47076004)(81166007)(186003)(8936002);DIR:OUT;SFP:1102;
X-OriginatorOrg: digi.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2020 18:35:13.9814
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 28018e82-d6e3-46f5-79df-08d87526e289
X-MS-Exchange-CrossTenant-Id: abb4cdb7-1b7e-483e-a143-7ebfd1184b9e
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=abb4cdb7-1b7e-483e-a143-7ebfd1184b9e;Ip=[198.51.192.230];Helo=[MTK-SMS-XCH05.digi.com]
X-MS-Exchange-CrossTenant-AuthSource: BN7NAM10FT025.eop-nam10.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR10MB2575
X-BESS-ID: 1603218917-893021-15836-775-1
X-BESS-VER: 2019.1_20201020.1810
X-BESS-Apparent-Source-IP: 104.47.56.174
X-BESS-Outbound-Spam-Score: 0.00
X-BESS-Outbound-Spam-Report: Code version 3.2, rules version 3.2.2.227672 [from 
        cloudscan14-211.us-east-2a.ess.aws.cudaops.com]
        Rule breakdown below
         pts rule name              description
        ---- ---------------------- --------------------------------
        0.00 BSF_BESS_OUTBOUND      META: BESS Outbound 
X-BESS-Outbound-Spam-Status: SCORE=0.00 using account:ESS112744 scores of KILL_LEVEL=7.0 tests=BSF_BESS_OUTBOUND
X-BESS-BRTS-Status: 1
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

DQo+PiANCj4+IEluIHRoaXMgY2FzZSB3ZeKAmXJlIHN3aXRjaGluZyBmcm9tIG9uOjg2NDAwLCBv
ZmY6MCAtPiBvbjowLCBvZmY6ODY0MDAuICBXZSB3cml0ZSBvZmYgZmlyc3QsIHRoZW4gb24gdXNp
bmcgZndyaXRlKCkgdG8gYSBmaWxlLiAgRnJvbSB0aGUgdHJhY2UsIGl0IGxvb2tzIGxpa2Ugb24g
aXMgYWx3YXlzIHN0b3JlZCBmaXJzdC4gIFNvLCB0aGUgZmlyc3Qgc3RvcmUgaXMgb246MCwgb2Zm
OjAgZm9yIGEgYnJpZWYgcGVyaW9kIChlbm91Z2ggdG8gdHJpZ2dlciB0aGUgZGVmYXVsdCksIGFu
ZCB0aGVuIG9mZiBpcyBzdG9yZWQuICBXZeKAmXJlIGFscmVhZHkgdHJ5aW5nIHRvIG5vdCBoYXZl
IHRoZW0gbm90IGJvdGggYmUgemVybyBhdCB0aGUgc2FtZSB0aW1lLiAgSSB0cmllZCBwdXR0aW5n
IGZmbHVzaCgpIGJldHdlZW4gdGhlbSwgYnV0IHRoYXQgZGlkbuKAmXQgaGVscC4gIEkgc3VwcG9z
ZSB3ZSBjb3VsZCB0cnkgdG8gc2xlZXAgc29tZSBwZXJpb2Qgb2YgdGltZSwgYnV0IHRoaXMgc2Vl
bXMgYmFkIGFzIHdlbGwuICBNYXliZSB3cml0ZSBhbmQgcmVhZCB0byB2ZXJpZnkgdGhlIHZhbHVl
IGlzIGNvcnJlY3RseSBzdG9yZWQ/DQo+PiANCj4gDQo+IEkgZG9uJ3QgdW5kZXJzdGFuZC4gV2h5
IHdvdWxkIHlvdSB1c2UgYmxpbmsgd2l0aCBvbjo4NjQwMCwgb2ZmOjA/DQoNCkluIHRoaXMgY2Fz
ZSB3ZeKAmXJlIHVzaW5nIHRoZSBhcGkgdG8gdHVybiB0aGUgTEVEIG9uIGFuZCBvZmYsIHdpdGhv
dXQgYmxpbmtpbmcgKGluIHRoaXMgY2FzZSBvbmx5KS4NCg0KPiANCj4+PiBJZiB0aGVyZSdzIG5v
IHJlYXNvbmFibGUgdmFsdWUgdG8gY2hhbmdlIHRoZSBmcmVxdWVuY3ksIHdlJ2xsIG5lZWQgdG8N
Cj4+PiBmaXggdGhhdC4NCj4+IA0KPj4gSSB0aGluayBpZiB3ZSBjb3VsZCBjb250cm9sIHRoZSBk
ZWxheXMgd2l0aCB0cmlnZ2VyIHNldCB0byBub25lLCB0aGVuIHdlIGNvdWxkIHNldCB0aGUgZGVs
YXlzIGFuZCBlbmFibGUgdGhlIHRpbWVyIHRyaWdnZXIgZm9yIGEgbm8gZ2xpdGNoIG9wZXJhdGlv
bi4gIEkgc3VwcG9zZSBpZiB0aGVyZSB3YXMgYSB0aW1lci1vZmYgdHJpZ2dlciwgdGhhdCB3b3Vs
ZCB3b3JrIGFzIHdlbGwsIGJ1dCBzZWVtcyBraW5kIG9mIHNpbGx5Lg0KPj4gDQo+IA0KPiBZb3Ug
bWF5IHdhbnQgdG8gbG9vayBhdCBsZWR0cmlnLXRyYW5zaWVudCBhbmQgbGVkdHJpZy1vbmVzaG90
Li4uPw0KDQpPaywgSeKAmWxsIHRha2UgYSBsb29rLiAgVGhhbmtzIQ0KDQpTZXRoDQoNCg==
