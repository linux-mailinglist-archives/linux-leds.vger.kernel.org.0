Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 99C89294278
	for <lists+linux-leds@lfdr.de>; Tue, 20 Oct 2020 20:51:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2437745AbgJTSv2 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 20 Oct 2020 14:51:28 -0400
Received: from outbound-ip24b.ess.barracuda.com ([209.222.82.221]:56242 "EHLO
        outbound-ip24b.ess.barracuda.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2437731AbgJTSv1 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>);
        Tue, 20 Oct 2020 14:51:27 -0400
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2175.outbound.protection.outlook.com [104.47.58.175]) by mx12.us-east-2b.ess.aws.cudaops.com (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO); Tue, 20 Oct 2020 18:51:17 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CvP6OgvGnvTAinKYiY2tgRQeyQHUtBDj45DYo9RXrUjmjLU49ujdTOV924fvYWkjmuDGpbvGvQ8uEgD7C7eMM3orKZ0jB3fniOReAT94u+3Sfpz5dp9nX5qlp5f2CG4eJxVDBFAqY2f4i0Og3Eyv4aIJ6ahPIPdFIBpO6dYp1hoAuLen94wQ0mpdOHIVZxqSQGgLnnZXk056PIRsoscRKzM/U31k9Tyq+kVLbUIoRoklPADFxKGg4MQMcn+QywWLqxXfFS1lHZdU9qTDX5820DqhLseZzc2y5y50ZuWyPoBJdQFOSido2aVQ1cLd4/pThrndC/XvVPuNkaSFnTGg1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oJxx2vcKFUC8Ct+5iKgMzGQZorhBtv7IRIA/V54A7j0=;
 b=MO/hkPEsdM+HVgpqG8pcTILcHRh6r+da3WQrF262u1J6Cl9y/qrYz92tM2luBnMq8RXW3VLMUQNrCoGDaxGt3/wfusYX1TebBV2VcfJ/xDc/1sROWcOK+WE6vC/Z8gMgVjnCFHadmJs8QELc6KXRcYgg363rT1g/VuYYU3FihmAC4VRlE2XloJkekDRkS8VrDW6twpOT5ACSErKBHlDzGD0otn14YMGPzO7Y2zVA4ng0ptvxOgCOZnm9uHb/t2l0LZS12qVwGWg5t+fZSp4H8SZzvxIv0pnZZzoxJQVR7EK1DmE7iOKHOc/84C9tp1vQRpL3KAehHgkPBdUlXBgiBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 198.51.192.230) smtp.rcpttodomain=ucw.cz smtp.mailfrom=digi.com;
 dmarc=fail (p=reject sp=reject pct=100) action=oreject header.from=digi.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=digi.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oJxx2vcKFUC8Ct+5iKgMzGQZorhBtv7IRIA/V54A7j0=;
 b=hNwNnx96GeJ/b1gx44wcXbmPVMTi5I41l9CCP7NVDios7NddJOrOJRjbS/2C+r9Mc1Ip6itQOkJwGhspAjBnVT2KUVjHdI60UIso2FQzTpJRwc+TAQ/VQG1X0plx70skN1lWT1TGpDAe5xxWhOS4LBoYXhg1yIxakNDKquskqdk=
Received: from BN8PR15CA0067.namprd15.prod.outlook.com (2603:10b6:408:80::44)
 by BYAPR10MB2838.namprd10.prod.outlook.com (2603:10b6:a03:8f::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.21; Tue, 20 Oct
 2020 18:51:15 +0000
Received: from BN7NAM10FT022.eop-nam10.prod.protection.outlook.com
 (2603:10b6:408:80:cafe::b) by BN8PR15CA0067.outlook.office365.com
 (2603:10b6:408:80::44) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.21 via Frontend
 Transport; Tue, 20 Oct 2020 18:51:14 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is
 198.51.192.230) smtp.mailfrom=digi.com; ucw.cz; dkim=none (message not
 signed) header.d=none;ucw.cz; dmarc=fail action=oreject header.from=digi.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 digi.com discourages use of 198.51.192.230 as permitted sender)
Received: from MTK-SMS-XCH03.digi.com (198.51.192.230) by
 BN7NAM10FT022.mail.protection.outlook.com (10.13.156.63) with Microsoft SMTP
 Server (version=TLS1_0, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA) id
 15.20.3477.21 via Frontend Transport; Tue, 20 Oct 2020 18:51:13 +0000
Received: from MTK-SMS-XCH01.digi.com ([fe80::cca7:5299:c88e:1c40]) by
 MTK-SMS-XCH03.digi.com ([fe80::484d:c326:e7f1:a9fd%16]) with mapi id
 14.03.0487.000; Tue, 20 Oct 2020 13:51:12 -0500
From:   "Bollinger, Seth" <Seth.Bollinger@digi.com>
To:     Pavel Machek <pavel@ucw.cz>
CC:     "Bollinger, Seth" <Seth.Bollinger@digi.com>,
        "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>,
        Dan Murphy <dmurphy@ti.com>,
        Seth Bollinger <seth.boll@gmail.com>
Subject: Re: Strange timer LED behavior
Thread-Topic: Strange timer LED behavior
Thread-Index: AQHWpiEO4JOa0xb3bESM7pkNxmLF0qmfTGOAgAFtfgCAAATZgIAAAp0AgABeK4CAAAWuAIAAAT8AgAAAnICAAAGZAIAAAt8A
Date:   Tue, 20 Oct 2020 18:51:11 +0000
Message-ID: <31E37AC2-589B-41F0-B7AA-9E520160F8A6@digi.com>
References: <A2C38AF0-0CE8-4312-8329-54B7E9653223@digi.com>
 <20201019140617.GA25480@duo.ucw.cz>
 <3D108EE8-F4B6-490B-9B97-59B8E008F63B@digi.com>
 <2A80CF0E-1022-4673-86E8-12BF0696708E@digi.com>
 <20201020122149.GA19856@duo.ucw.cz>
 <DF67F732-7B99-4C32-A7E9-4595E2B1E82A@digi.com>
 <20201020180813.GA25906@duo.ucw.cz>
 <CF36FC5F-6FA9-4797-A6D6-6533D795DAD1@digi.com>
 <20201020183300.GB25906@duo.ucw.cz>
 <78785807-3DB7-4A70-B135-2B20A260EA57@digi.com>
 <20201020184054.GC25906@duo.ucw.cz>
In-Reply-To: <20201020184054.GC25906@duo.ucw.cz>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.27.1.17]
Content-Type: text/plain; charset="utf-8"
Content-ID: <3E112C350088E04489088EF98D3D4DD5@digi.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ab1a824e-add7-467f-be7b-08d875291e44
X-MS-TrafficTypeDiagnostic: BYAPR10MB2838:
X-Microsoft-Antispam-PRVS: <BYAPR10MB2838F5C4E04F72C4F6DCE528E81F0@BYAPR10MB2838.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: YGVMt4o74dSM6rKZWYMvJjdOwtQLcnylDCB07tmpDgJkdb7HtRsmapwv/Feq+ZIc+xIPvQpXeyfK4TDZtAwj4a8Q1ex1D3c9GwOLcaxqzwk2zClCT/PGDP3As6gquSZoeYtJuhLKEIH/as/8GmrW+H6pPzvvRsflHh1JM8DBg9UyYty66M9Zc1H5QOIlZ6WsCioDyrX+B27mHUMcF4rxs3l2Sk95wje5OHNpQadtHF+rJE3cshTRTp3UrgRjwH7uQERz6o/5HLAAG173JshzqDQktLPixMvKmjxFIAeI3BHwO968OsQID3ASS+F17QWuqLkMpjMSAwJzYUfFnOm9imMIeXL6vQbvTQ4q/bq6NZpFZQUVbh0vmuTZ0pWWWCI07z78Lijw70asl4tn0GLi5yiUNdQIO/LWXvkTNbUXGDjcSscWOBI/DuaSYXb6zqd6
X-Forefront-Antispam-Report: CIP:198.51.192.230;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:MTK-SMS-XCH03.digi.com;PTR:ErrorRetry;CAT:NONE;SFS:(4636009)(396003)(39850400004)(136003)(376002)(346002)(46966005)(7696005)(4744005)(70586007)(70206006)(426003)(336012)(36756003)(8936002)(356005)(82740400003)(81166007)(47076004)(5660300002)(33310700002)(2906002)(8676002)(54906003)(316002)(6916009)(83380400001)(3480700007)(4326008)(2616005)(82310400003)(186003)(33656002)(478600001)(86362001)(36906005)(26005);DIR:OUT;SFP:1102;
X-OriginatorOrg: digi.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2020 18:51:13.2087
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ab1a824e-add7-467f-be7b-08d875291e44
X-MS-Exchange-CrossTenant-Id: abb4cdb7-1b7e-483e-a143-7ebfd1184b9e
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=abb4cdb7-1b7e-483e-a143-7ebfd1184b9e;Ip=[198.51.192.230];Helo=[MTK-SMS-XCH03.digi.com]
X-MS-Exchange-CrossTenant-AuthSource: BN7NAM10FT022.eop-nam10.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR10MB2838
X-BESS-ID: 1603219877-893023-20085-1730-1
X-BESS-VER: 2019.1_20201020.1810
X-BESS-Apparent-Source-IP: 104.47.58.175
X-BESS-Outbound-Spam-Score: 0.00
X-BESS-Outbound-Spam-Report: Code version 3.2, rules version 3.2.2.227672 [from 
        cloudscan12-128.us-east-2a.ess.aws.cudaops.com]
        Rule breakdown below
         pts rule name              description
        ---- ---------------------- --------------------------------
        0.00 BSF_BESS_OUTBOUND      META: BESS Outbound 
X-BESS-Outbound-Spam-Status: SCORE=0.00 using account:ESS112744 scores of KILL_LEVEL=7.0 tests=BSF_BESS_OUTBOUND
X-BESS-BRTS-Status: 1
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

PiANCj4gWWVhaC4gRG9uJ3QgZG8gdGhhdCEgOi0pLiBGb3Igc29saWQgb24vc29saWQgb2ZmLCBq
dXN0IHR1cm4gdGhlDQo+IHRyaWdnZXIgb2ZmLiBGb3IgYmxpbmtpbmcsIHVzZSB0aW1lciB0cmln
Z2VyLg0KDQpJZiBJIHdhbnQgdG8gZ28gZnJvbSBvbiBvciBvZmYgdG8gZmxhc2hpbmcsIEkgbmVl
ZCB0byBzZXQgdGhlIHRpbWVyIHRyaWdnZXIsIHdoaWNoIHJlc3VsdHMgaW4gYSA1MDAgbXMgZmxh
c2ggcmF0ZSB1bnRpbCB0aGUgcmVhbCByYXRlcyBhcmUgc2V0LiAgVGhpcyByZXN1bHRzIGluIGEg
bm90aWNlYWJseSBkaWZmZXJlbnQgZmlyc3QgYmxpbmsuICBJIGd1ZXNzIHdl4oCZcmUgbG9va2lu
ZyBmb3Igc21vb3RoIGNvbnRyb2wgb2YgdGhlIExFRC4NCg0KU2V0aA==
