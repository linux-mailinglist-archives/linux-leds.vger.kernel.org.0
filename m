Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 762FD295D71
	for <lists+linux-leds@lfdr.de>; Thu, 22 Oct 2020 13:35:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2444338AbgJVLfi (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 22 Oct 2020 07:35:38 -0400
Received: from outbound-ip24a.ess.barracuda.com ([209.222.82.206]:58232 "EHLO
        outbound-ip24a.ess.barracuda.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2444308AbgJVLfh (ORCPT
        <rfc822;linux-leds@vger.kernel.org>);
        Thu, 22 Oct 2020 07:35:37 -0400
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2176.outbound.protection.outlook.com [104.47.55.176]) by mx10.us-east-2a.ess.aws.cudaops.com (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO); Thu, 22 Oct 2020 11:35:31 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jkwOb6cLf6sIibwwx33KadxwbYmMHcdoxmxWkRSeLtIDn6PCr9NZe+WKi+slj0CcvaVkupw8lN3tIeID330mEPsmbFmTcW2R2LiJrdYps9F4arq/25dvsYXDOhg5SyNJ/F/R9aarqTEwPCBbuJb0GndeS+sgSXZzoTz7aDozk2dd+dbpxYJvuKgWSatjz+fuS8Oa4YmPOWKsDEck1Ayoc9zyjXvHqqt1jim80qEm3dnOUrShQI/my8G6B/Vu1VDzxCpN8/figUaqsVeHhZOPx/E4HUEEnH7cbPdVL/hNcdiNHGawExyw7pGCozTsADBLSx1BhioCaD/w83rfRhfEsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DxGe9vEGD5Jv36Mu6FeSI8LIajxgzNzq+1KxVvCn9Pc=;
 b=NOoHSD+Jqw3aH7C7c4rijsumkxbJ89M6pcCC8Ae5P1U9Th0TqYksHw0ZuZXQP9DortIMAk8SQGMZdjxKGyx2LfFWVsO9WXIyTbykLfqj7/6Gl5T39cFwd8WS/UdKKmQK8MVrl7eQlDo0lQ491/lTNb5MCk/Wdlv2L5z+MQEvE6yG1fYtn+VDdhrIcFPNzHh+Asbq/45zyYs4ldLRetlraluhiFFSDdFjhRTepcsL+MhzYFnFuSpJs6RD7Dew/Cnsc3NS8RafhAu8wPOmCX5fPZwN6cP2VRf5BzcR6IciJWA5rrQ8+jL/8Bu3SIuV/gwzw1xXkhjdglc62pBuDuCbgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 198.51.192.230) smtp.rcpttodomain=gmail.com smtp.mailfrom=digi.com;
 dmarc=fail (p=reject sp=reject pct=100) action=oreject header.from=digi.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=digi.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DxGe9vEGD5Jv36Mu6FeSI8LIajxgzNzq+1KxVvCn9Pc=;
 b=S/S+FcLSXocu+7bWXNwhQL/xg1mwihINffIHiPtqe2jUxZwUcqjv8klQ+2ZLjchR8xCyWVQ8sweVdrm6+44ayymAs7qlbgN9SCQ25ZiPu1ZejCsQo414aSg7QEHFaQvgyXElHpOq5/J9SEJb1e1xJcJdP4wvSh3z5a6+Qo7RlSU=
Received: from BN6PR1701CA0002.namprd17.prod.outlook.com
 (2603:10b6:405:15::12) by CY4PR10MB1399.namprd10.prod.outlook.com
 (2603:10b6:903:29::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.24; Thu, 22 Oct
 2020 11:35:29 +0000
Received: from BN7NAM10FT009.eop-nam10.prod.protection.outlook.com
 (2603:10b6:405:15:cafe::a8) by BN6PR1701CA0002.outlook.office365.com
 (2603:10b6:405:15::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.18 via Frontend
 Transport; Thu, 22 Oct 2020 11:35:28 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is
 198.51.192.230) smtp.mailfrom=digi.com; gmail.com; dkim=none (message not
 signed) header.d=none;gmail.com; dmarc=fail action=oreject
 header.from=digi.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 digi.com discourages use of 198.51.192.230 as permitted sender)
Received: from MTK-SMS-XCH03.digi.com (198.51.192.230) by
 BN7NAM10FT009.mail.protection.outlook.com (10.13.156.248) with Microsoft SMTP
 Server (version=TLS1_0, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA) id
 15.20.3499.18 via Frontend Transport; Thu, 22 Oct 2020 11:35:27 +0000
Received: from MTK-SMS-XCH01.digi.com ([fe80::cca7:5299:c88e:1c40]) by
 MTK-SMS-XCH03.digi.com ([fe80::484d:c326:e7f1:a9fd%16]) with mapi id
 14.03.0487.000; Thu, 22 Oct 2020 06:35:27 -0500
From:   "Bollinger, Seth" <Seth.Bollinger@digi.com>
To:     Jacek Anaszewski <jacek.anaszewski@gmail.com>
CC:     "Bollinger, Seth" <Seth.Bollinger@digi.com>,
        Pavel Machek <pavel@ucw.cz>,
        "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>,
        Dan Murphy <dmurphy@ti.com>,
        Seth Bollinger <seth.boll@gmail.com>
Subject: Re: Strange timer LED behavior
Thread-Topic: Strange timer LED behavior
Thread-Index: AQHWpiEO4JOa0xb3bESM7pkNxmLF0qmfTGOAgAFtfgCAAATZgIAAAp0AgABeK4CAAAWuAIAAAT8AgAAAnICAAbC0gIAA/q6A
Date:   Thu, 22 Oct 2020 11:35:26 +0000
Message-ID: <18D7166E-03DF-4577-885D-F2456DA68EEA@digi.com>
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
 <1a86fe05-d8a3-b4b9-4065-b31abce287e2@gmail.com>
In-Reply-To: <1a86fe05-d8a3-b4b9-4065-b31abce287e2@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.27.1.169]
Content-Type: text/plain; charset="us-ascii"
Content-ID: <6DAB9E195052B04C9226C945459EF752@digi.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 930fbafc-6d6b-4caa-0886-08d8767e92d5
X-MS-TrafficTypeDiagnostic: CY4PR10MB1399:
X-Microsoft-Antispam-PRVS: <CY4PR10MB13999B7485952FDD0E005BC6E81D0@CY4PR10MB1399.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1923;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: R3KUbnVgS5IKLtcMhOXgfoRTgJ9MCor0OQ12HJhEsbBcUgNHTeL8wQdt+1RPzc7vsagP/LIVpPGP9Go1wpoFAYSHBtCphG3Y3+aLbr3j5Bx+bWsV79E3s4KGpS/okxJFBCyZnoAd1shHvjhiDySEdBm60lGwHKiqeftwU3IDbVi2jNVumho/m42Gt0vbmiCXv4LGZCMv0AaCbUWxvssMjYaUm1Md+G89JVCy2vJZknjWcdqNPVIif06voZPBLAzCIkijazi9t4NMHQPiOJ2h7JgGLSgQv8IocivSSI4aRSSAB2KlCRBKnuTLc5Apk2k20/jj5ktA0eUonCVPTYppPXUfwMS909BbrwmzNBb7DfXzsxkT5dkruvwkvYUNGPFg//T+OINEACx6OSJuFjdUb4Y5MOplF7dq0lxXV4cskvkpsVPOGlQAHRUyrgjKuqRY
X-Forefront-Antispam-Report: CIP:198.51.192.230;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:MTK-SMS-XCH03.digi.com;PTR:ErrorRetry;CAT:NONE;SFS:(4636009)(376002)(39850400004)(136003)(396003)(346002)(46966005)(356005)(8936002)(33310700002)(86362001)(8676002)(70586007)(478600001)(82310400003)(33656002)(186003)(47076004)(70206006)(54906003)(82740400003)(6916009)(316002)(36906005)(336012)(7696005)(81166007)(26005)(36756003)(426003)(5660300002)(558084003)(3480700007)(2616005)(4326008)(2906002);DIR:OUT;SFP:1102;
X-OriginatorOrg: digi.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Oct 2020 11:35:27.1508
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 930fbafc-6d6b-4caa-0886-08d8767e92d5
X-MS-Exchange-CrossTenant-Id: abb4cdb7-1b7e-483e-a143-7ebfd1184b9e
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=abb4cdb7-1b7e-483e-a143-7ebfd1184b9e;Ip=[198.51.192.230];Helo=[MTK-SMS-XCH03.digi.com]
X-MS-Exchange-CrossTenant-AuthSource: BN7NAM10FT009.eop-nam10.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR10MB1399
X-BESS-ID: 1603366531-893018-7313-2018-1
X-BESS-VER: 2019.1_20201021.2259
X-BESS-Apparent-Source-IP: 104.47.55.176
X-BESS-Outbound-Spam-Score: 0.00
X-BESS-Outbound-Spam-Report: Code version 3.2, rules version 3.2.2.227712 [from 
        cloudscan15-119.us-east-2a.ess.aws.cudaops.com]
        Rule breakdown below
         pts rule name              description
        ---- ---------------------- --------------------------------
        0.00 BSF_BESS_OUTBOUND      META: BESS Outbound 
X-BESS-Outbound-Spam-Status: SCORE=0.00 using account:ESS112744 scores of KILL_LEVEL=7.0 tests=BSF_BESS_OUTBOUND
X-BESS-BRTS-Status: 1
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


>=20
> You might want to check also ledtrig-pattern and paragraph 2.
> of its documentation [0].
>=20
> [0] Documentation/devicetree/bindings/leds/leds-trigger-pattern.txt

Thank you!  I will check this out.

Seth

