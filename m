Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 021EF33EE01
	for <lists+linux-leds@lfdr.de>; Wed, 17 Mar 2021 11:05:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229973AbhCQKFD (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 17 Mar 2021 06:05:03 -0400
Received: from us-smtp-delivery-115.mimecast.com ([63.128.21.115]:21092 "EHLO
        us-smtp-delivery-115.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229549AbhCQKEs (ORCPT
        <rfc822;linux-leds@vger.kernel.org>);
        Wed, 17 Mar 2021 06:04:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=maxlinear.com;
        s=selector; t=1615975485;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:  references:references;
        bh=hYdad6yIyjVntj8I03s8wHO+ah5JLBI9Vi6Q4xHKRW0=;
        b=B11004iJMRxNPfvg+wWjUPDBEsAhZM5VraTMT+r9wLqpfBSIlszC3mubv/mmSIh770wabo
        vCHHV39MO7E8h4NBisOsj1KyRgA/WaBIUTKxgJZn/zFDc0Qkr1y4RCTQSwo6CXxefBzGF8
        DgBQ8KKC64IFpTVvqeZ5h+7rBDBmRKQ=
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10lp2108.outbound.protection.outlook.com [104.47.55.108])
 (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-138-tRJT4T_TPrqUgaGnGF7Ipw-1; Wed, 17 Mar 2021 06:04:43 -0400
X-MC-Unique: tRJT4T_TPrqUgaGnGF7Ipw-1
Received: from MN2PR19MB3693.namprd19.prod.outlook.com (2603:10b6:208:18a::19)
 by BLAPR19MB4532.namprd19.prod.outlook.com (2603:10b6:208:293::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.18; Wed, 17 Mar
 2021 10:04:40 +0000
Received: from MN2PR19MB3693.namprd19.prod.outlook.com
 ([fe80::1cd9:22:e5ef:6d10]) by MN2PR19MB3693.namprd19.prod.outlook.com
 ([fe80::1cd9:22:e5ef:6d10%7]) with mapi id 15.20.3933.032; Wed, 17 Mar 2021
 10:04:40 +0000
From:   Rahul Tanwar <rtanwar@maxlinear.com>
To:     Pavel Machek <pavel@ucw.cz>
CC:     Arnd Bergmann <arnd@kernel.org>,
        "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Adam Borowski <kilobyte@angband.pl>,
        "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
        John Crispin <john@phrozen.org>,
        Hauke Mehrtens <hmehrtens@maxlinear.com>,
        Cheol Yong Kim <ckim@maxlinear.com>,
        Qiming Wu <qwu@maxlinear.com>,
        Rahul Tanwar <rtanwar@maxlinear.com>
Subject: [PATCH 0/1] leds: lgm: Address review concerns
Thread-Topic: [PATCH 0/1] leds: lgm: Address review concerns
Thread-Index: AQHXGwlDIANXSMUgZ0q5998fcjs+eQ==
Date:   Wed, 17 Mar 2021 10:04:40 +0000
Message-ID: <MN2PR19MB3693AE23FBEA2F394933CE99B16A9@MN2PR19MB3693.namprd19.prod.outlook.com>
References: <cover.1615969806.git.rtanwar@maxlinear.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [222.164.90.248]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: fdd92ad9-5beb-4f84-d470-08d8e92c1497
x-ms-traffictypediagnostic: BLAPR19MB4532:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BLAPR19MB4532E6C3DA3E13AC81E84439B16A9@BLAPR19MB4532.namprd19.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4941
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0
x-microsoft-antispam-message-info: fR8qRFbTy0//dplR6MOEPzv7FTMA865TEM/p3DbOyScS/p+5je3bxZ5sb9J7LRth/dI8RxiI8xpOCoWX+EXLTIhWRo4SIaG8ZTX/dEqSprbMxVu5nmaXekdM1dK65zsIppTjLjs3BDoC1RrIXrV24Mh6wCOTZ5Vxo926gjltTHWv/g16R+T3TM5tuixyg9b8okMfNE9qT8rg0/OgjeZYGo0TYS2E2kJBPTaNWVEzbftPSZdmwpVpHxXX9IUXrnqavhc6XwGq8PpIrhLs73/pHpu5DLBZvZ7Us3Z6M2x5TXKIItxS3XjGPoGCdRqSgDR0M0p5vszYRYM6Set48x3v43RdqvaSYfEz4MTyauxWz2BsZ3ffYlsvm6Q6LP+r3yW+1aei4jSB1w561WcX7nKBYeFWTtmLK49YV8+qamzQaA/lzn0Vd/tkfoIyt4Y4fIEkjR6jI69PsQASkNhGdqMZWM3xDhfTuu9V3Olydg9rWbkdmOKcpfIefnzwG/pbC+z7EeEQzOYK/YYgPB6VqKXny8Lgjuf24kpyNx4Bw8y0cQReYYnM5NbVwfSKTzfjtHqk
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN2PR19MB3693.namprd19.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39850400004)(136003)(376002)(396003)(346002)(366004)(478600001)(71200400001)(7696005)(55016002)(86362001)(26005)(66556008)(66476007)(6506007)(64756008)(66446008)(66946007)(9686003)(5660300002)(186003)(91956017)(8936002)(107886003)(54906003)(8676002)(316002)(33656002)(4744005)(2906002)(6916009)(83380400001)(52536014)(4326008)(76116006);DIR:OUT;SFP:1102
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?70XE/In5COku/WmOFTc1RZ+jY6Ao6HFJqgng77vQmSOxq/MSLXJXiquOKsRF?=
 =?us-ascii?Q?mcGmoAuq+FjP6VVGHK1f9rvdMVbpiz5j0XSwxxDxVzLdTv8cf0HPKH+3YItH?=
 =?us-ascii?Q?3mbsqFwp5fJ/NfXCpC1QnlG/D4ogItP223+etafW4af0Lcq9QLsPiD0ZZqG6?=
 =?us-ascii?Q?x8eHzSzz3ErwDTDJa9Gxm4Gg+6J57T6uYwjZUoivKNFCvshCRXyrRzgVO2J6?=
 =?us-ascii?Q?JR3QvbKS84ybEhdrtnmYf3mbC3oscEpBZ/S92ulsdfx3o79OHZvIuGmCduEB?=
 =?us-ascii?Q?mnkSa8FjcOvqOTkxdlbnN3RSrDK9cslHyRJGus+DYbwr7X1Bq5CnHfFuxDJa?=
 =?us-ascii?Q?Qjho7ti72oSDMnJVXfta4UEoKQFwXctAI3TWZUFoeD3x6Y5bOxzSRHYvH00R?=
 =?us-ascii?Q?Y2v0mtXCBdFf+62WnRisxGGMcDTLbr+xSG36QQwvJFkMdVBSnL5efRA5oGIu?=
 =?us-ascii?Q?4KaNnrCt/99jS8j2GwOipsRGA0LJvOAXAB/ot5gRQWK3TQldb2DB8IO5qT5B?=
 =?us-ascii?Q?L4uCabIB34HFl9zJDxgY4rjAtUGBs4updrOSA4mzlsgK6EqP1etwc9sxg7R5?=
 =?us-ascii?Q?p6a/LGHPPByySrol0nA96fu0hyC1O0NMKLAJxeIF6KvRtfkP/O82xlDbUVk6?=
 =?us-ascii?Q?Jd0zqgRyuoXh8PtPCoxjpqh+dTsvPO4N1KUVm5d70vPYafCDbWIVsTJsy8U9?=
 =?us-ascii?Q?mOK30w43rO/Tr40BKe3mmZgeR9WaCQE39MR3IALF3PKbfMvq7GU543r/6J+V?=
 =?us-ascii?Q?lzJQuBRj6i083FpdXayxtz47D6/2aYGrLfhYNmaueuITwB6OAIPOptBdqBDp?=
 =?us-ascii?Q?g20YpMvGZv6d//mNPoctD4io2vjiIhlPipLvc7nJ47cNeFiiE58xgswKWQ7C?=
 =?us-ascii?Q?ba7LRhceoCCHF34WDB5zorzm2ISQ10QdhEs1f/wEl1/EnQ+2rCqbwbM/SDOp?=
 =?us-ascii?Q?SKKnv5kO+8PPxUM4FKzPtltikKiKUyRGOIf7vHv5Qr5iPfSoJ3mBgM74Mq8s?=
 =?us-ascii?Q?SKw2S07Mk7cKY9NQJLPF1+bfvi+XJVXW6KRH893Hjo11sf8sFz0V+l5r+0ur?=
 =?us-ascii?Q?3PZ25XcYbUZY6Iu4AsB+V5WGXryeFPm6wY9F+A3BdwrF4hzHdKGgUPEhFZRf?=
 =?us-ascii?Q?LuQR/TD+es523NF+3UkARnRMzKhxZuBdF9CtkSN2VthJalAZ/uaAqxO4PuCV?=
 =?us-ascii?Q?x6Br3nZyeGsiDqF05robPDCrnWUTOh+bTqJpoD1MjdIgUkw8T6fR7EqteTNF?=
 =?us-ascii?Q?fH+NwjGwoD0DrcXQRsa45CpzvYKKT7uvhqRAU6uoaJ4vBvFjyiFLdqrjovib?=
 =?us-ascii?Q?W2J0qTsU8Jzmm6Fug8FujO9R?=
MIME-Version: 1.0
X-OriginatorOrg: maxlinear.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN2PR19MB3693.namprd19.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fdd92ad9-5beb-4f84-d470-08d8e92c1497
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Mar 2021 10:04:40.4193
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: dac28005-13e0-41b8-8280-7663835f2b1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: GvlA/um7sRthcp1xw/f1Zr+KYtI2LF4+5VYBG0ZrM9rtomVD2MyjfgQk/bS9hXadKDuVTq5ib0SrxODWMllN/Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR19MB4532
Authentication-Results: relay.mimecast.com;
        auth=pass smtp.auth=CUSA115A51 smtp.mailfrom=rtanwar@maxlinear.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: maxlinear.com
Content-Language: en-US
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Address below review concerns from Pavel:=0A1. Remove LEDS_BLINK Kconfig sy=
mbol.=0A2. Provide useful Kconfig help text for the driver.=0A=0AThis patch=
 is based on "for-next" branch of kernel from below git tree:=0Agit git://g=
it.kernel.org/pub/scm/linux/kernel/git/pavel/linux-leds.git=20=0Afor-next=
=0A=0ARahul Tanwar (1):=0A   leds: lgm: Improve Kconfig help=0A=0A  drivers=
/leds/Kconfig              |  5 ++---=0A  drivers/leds/Makefile            =
 |  2 +-=0A  drivers/leds/blink/Kconfig        | 28 +++++++++++++----------=
-----=0A  drivers/leds/blink/Makefile       |  2 +-=0A  drivers/leds/blink/=
leds-lgm-sso.c |  4 ++--=0A  5 files changed, 19 insertions(+), 22 deletion=
s(-)=0A=0A--=0A2.17.1=0A

