Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DC26D30ED67
	for <lists+linux-leds@lfdr.de>; Thu,  4 Feb 2021 08:33:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232882AbhBDHdZ (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 4 Feb 2021 02:33:25 -0500
Received: from mail-eopbgr50098.outbound.protection.outlook.com ([40.107.5.98]:39511
        "EHLO EUR03-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S232727AbhBDHdY (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Thu, 4 Feb 2021 02:33:24 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RbWrs3KZAdn1uJ9Ahx25E1jGCL+njH0J6ByKDDLXqIzNpQup8UBO8IqxtC60Q0IGk8pLPA+I4bEI5YYK8vllkRW4cBc8Pk3RhQ5whAfwjWE5hbu589nedWunFbOTs3PaCWMFYtoN5YIdIzLrsKbM5UkQ5ZQHZ8j/QeJwCNkARDSIuRAByMbCavYZ3M8Y//Dv1xPgaReZbsrlA1j/RjbXk6dQ3mQ5wJkPUYgsK6LTv9bTTFHgD6Bk8NbdMw+IueNcVGgy1QH8vTkWNwNDjDOcct10fE8fWTMInihnSO5kqpIx9ixUqYPGO56/PP/pFi7RYxBMfua+Ski7ZsNDzUHKLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rwAoorqV/cnqZcVdg/64/eaYDC85VXH5B3e1n2kUjBk=;
 b=MWdqilBB+c4Qy7bxd5b3QbqYI78Dt2KMe2wmBL4XKRfGbN5jKXAZUSjFbXBEjK6oGXEsDrWR7WL5s2EVQCoeGhMbIqhno27MfPvbpfzTKC+7fkOVn2MucNkyylBNQb2zy9nVLo8KC/CrCJJLzQ5lhyi7ksOOlI7V66Gu4uex6d1b/FWeXaWgrgdpcgQfycZm1L9S7RFFG6zAwdmp57G2HCkJWjDfDk8kDTIqHNbtSGGOMulETQf7c+b+I8EqZHXB8b5t0ljSCRdvYRnaFdd5Q4YGgFfW77Id5gdzGdZoUlB5IwXQ4EFznWy1HaNLaVOirvMNjkxRVb8ISdiXwuSEgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=schleissheimer.de; dmarc=pass action=none
 header.from=schleissheimer.de; dkim=pass header.d=schleissheimer.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=schleissheimer.onmicrosoft.com; s=selector1-schleissheimer-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rwAoorqV/cnqZcVdg/64/eaYDC85VXH5B3e1n2kUjBk=;
 b=aTooIWF4xTzzM8/e6QSNsYpeMXmeLTPC+siPGzgvsuYrkjtSD7qdCQcQAsyXAKUHF7V+Aw6HTEFbzTosyKUy+9mp06GPCfTA1r6Yu70Jmr2Z2aiC5qevZ8Pt86e6LfYAt6xUsL3EtfwqtSTlm/ouYh6OTB6rVEa3NXNQGFJd/28=
Received: from DB8P190MB0634.EURP190.PROD.OUTLOOK.COM (2603:10a6:10:12d::21)
 by DB6P190MB0503.EURP190.PROD.OUTLOOK.COM (2603:10a6:6:33::33) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3805.26; Thu, 4 Feb 2021 07:32:35 +0000
Received: from DB8P190MB0634.EURP190.PROD.OUTLOOK.COM
 ([fe80::fc76:b821:1966:db40]) by DB8P190MB0634.EURP190.PROD.OUTLOOK.COM
 ([fe80::fc76:b821:1966:db40%9]) with mapi id 15.20.3805.027; Thu, 4 Feb 2021
 07:32:35 +0000
From:   Sven Schuchmann <schuchmann@schleissheimer.de>
To:     Pavel Machek <pavel@ucw.cz>
CC:     Dan Murphy <dmurphy@ti.com>, Rob Herring <robh+dt@kernel.org>,
        "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: AW: [PATCH v1] leds: lp50xx: add setting of default intensity from DT
Thread-Topic: [PATCH v1] leds: lp50xx: add setting of default intensity from
 DT
Thread-Index: AQHW7lFOn/1Jlt56EkOy+ZVk/3cx2qpGlWAAgAAP4bCAABNlgIAABpCggAAHMACAAOx+cA==
Date:   Thu, 4 Feb 2021 07:32:35 +0000
Message-ID: <DB8P190MB0634E7E9EBC92CA6DF7D32E6D9B39@DB8P190MB0634.EURP190.PROD.OUTLOOK.COM>
References: <20210119105312.2636-1-schuchmann@schleissheimer.de>
 <20210203142940.GB12369@duo.ucw.cz>
 <DB8P190MB06348FC85033135BFC3EF5C4D9B49@DB8P190MB0634.EURP190.PROD.OUTLOOK.COM>
 <20210203163555.GA23019@duo.ucw.cz>
 <DB8P190MB0634880713B530F51F95CEE0D9B49@DB8P190MB0634.EURP190.PROD.OUTLOOK.COM>
 <20210203172508.GC23019@duo.ucw.cz>
In-Reply-To: <20210203172508.GC23019@duo.ucw.cz>
Accept-Language: de-DE, en-US
Content-Language: de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: ucw.cz; dkim=none (message not signed)
 header.d=none;ucw.cz; dmarc=none action=none header.from=schleissheimer.de;
x-originating-ip: [62.153.209.162]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 4144fc5d-3533-40a4-8496-08d8c8df0a69
x-ms-traffictypediagnostic: DB6P190MB0503:
x-microsoft-antispam-prvs: <DB6P190MB05033878F1A524670ABBE062D9B39@DB6P190MB0503.EURP190.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 47zbyxrn6vFc5HtguVIcfXc6tPuCb+rwL2ALFrZdzJvTnCaCKSWsc2d5PHhYXCYWvJACaEXiIvFQDPUgjxa3b133t+MDRSNtnpjXewcW+n2pwJzvOM05OtE4DRRld+y8nVPPWSLvCPt4ieVB1i/w3cRFRKwpUDtMlMJ/001TTtF8sog/f2DlS0CljE7QOYcN3R0GDy2KAZ+nFdSnwTqXSOZA08XJfi8YwbajrSzXr2c84bBKqEeHTBS35TCOH+97X1Oksw9UidSKlovXQNuh1cPZk9RNY64lFbwiPBx4jNMVoUaMP0xyfw7DD/kwJ+LXtc02GSvVBHfxmcTSJn7G6X67XRrGHpftQxfCR1DKB2oGe5CW9SC5PlxPDMVgReyXPLIAXGj1WmnICogJVhnSALURO69PHYAIeYm/LevNhG1qO9KyyUftwhRHYnFgThyiljr2tg3MN4JOi8WF4cxZlw4ms5Ckeyna470TynSG3fiBgw7/6pwhlrLyi9r0cdn1KNqI+Li6Q5RRWtc06qb3Aw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8P190MB0634.EURP190.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(346002)(376002)(136003)(396003)(39830400003)(366004)(66476007)(316002)(54906003)(66556008)(8676002)(4326008)(6916009)(9686003)(5660300002)(2906002)(76116006)(8936002)(186003)(7696005)(52536014)(6506007)(26005)(478600001)(33656002)(66446008)(86362001)(71200400001)(83380400001)(66946007)(64756008)(55016002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?cZjU1o58cS0SknpccjblKYgXFKevu7avEeYAihxtD/P1ALnQcLnM70jci3bx?=
 =?us-ascii?Q?vQRkjipv1/q+MBrCifXy2wkuU/xybuan0u9YmSw454GVUEVpqRwOn4CwpWuY?=
 =?us-ascii?Q?acCCS3rijFqvqDaX1iPagl1a8Ix10E4grCUV+yLmVgxQujqgb9ceiptOxJQV?=
 =?us-ascii?Q?DZ1G6fmr7xPtN3unKmzYQR9w6YCZjwo3pHT/ab8L6eOiqu2v5eWuUhR4ze+j?=
 =?us-ascii?Q?9wt4YMBliRuULIYSMj5N7w6NxVQ31IFQk9+9isPo3peGMF23vohC3pGIa+vQ?=
 =?us-ascii?Q?b94fnxuUnwMFU+5eBSpksM7Cf1cwoys5WH8GPuMLUo+8PkbCrKAMcenY7wKY?=
 =?us-ascii?Q?MyuB86DGqZlgoD0ikEMIT/FbO5vrBCkAt4qCgmZKns+cGCIzjuYk5mJoBs2X?=
 =?us-ascii?Q?YZ4UASrJMXqM7jROzYoLFAizMdTUCKqaPz52QvIWt9To3Rql7VswRQp2JScx?=
 =?us-ascii?Q?N7RJOvnOt0cx5RK1W1rYXm4GhQKHy+bg+a0cM+dqSjvldr5B3GsBWcJEg+of?=
 =?us-ascii?Q?rMYcgpfKepxJX4kWnS+faMX0+sWoWU+JL+yp/MLUy/gqPaQd3OHwuIVU45WR?=
 =?us-ascii?Q?HpFLOnTKTF7lioq2RndZzdNrB69mQSUHyzjbQ28z78idwoHlzfLiZMuBPcNC?=
 =?us-ascii?Q?8NETwPTYaqYXy1IDJsa6A0Ku1PGFixKZqw16dw6lc98QKAZ1OlGtDAfhc715?=
 =?us-ascii?Q?2qL7xBXy3ywbsgVZh9QrcnXkrrp9OB4gWDJQEtpLxplpt/XNaSzJczNunK82?=
 =?us-ascii?Q?c2GNtbpLKs/lnLUcgfrWl/P2xvpr8Tdfaq8jed2h1IuXNp1aJGv+ppRDgpME?=
 =?us-ascii?Q?Qlp/croGmUboz9iaUumfhyTF5RNrY6AqxSPvrxRsXM6CFLOXyUwS5CH3uDMw?=
 =?us-ascii?Q?41KswREO04QMh17MN/1ZRrP84Nn4I33TVZPes+g4bExEvdAl6M2BpbxZDpOv?=
 =?us-ascii?Q?0XaV+j7pLiqz3qMzNGTR5WLGjToQPS1B2lHtahWp8lx2+IgP5aznA3JRm/Hr?=
 =?us-ascii?Q?q4le6Z861sYW7QdXwlg7wOqFYGGaS5o4kEuM6K8r1kNeaEvPvlVSyRyKS5zi?=
 =?us-ascii?Q?nLQCt3KFkAYo6LuUyyJzAINW/3VSAvyQT+aphYmUZ7RhWAAtfWfc+vQQ4J3h?=
 =?us-ascii?Q?f00Kwv3aM8n5kNZKsgru5toBKgMTbLdHTQ7C6ABS/+HomCx0mBarpTwYyr8t?=
 =?us-ascii?Q?/ZXTdf2vbWxxfxBXXarQW7+4InUIt7l4BfpbCWZBjYF4eiikGntHoTEyOZ2B?=
 =?us-ascii?Q?6XB2/XiR/muJ49nig2rLGvS5BYX+RM1mZnkhO6687A+lbk447gEdpHJf7UWU?=
 =?us-ascii?Q?BOcUNNavUn4LrIUCkV8IMaJ+?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: schleissheimer.de
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB8P190MB0634.EURP190.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 4144fc5d-3533-40a4-8496-08d8c8df0a69
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Feb 2021 07:32:35.0237
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: ba05321a-a007-44df-8805-c7e62d5887b5
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7rQ/Effehgq0rafZ3jq8xI13NTVPhYPd6CqbjngLNyyBClbe8QaKTBMhIT9MMyFXtQY347xq6H6HQGKf9tXzxhyjxAzbZYujURIyNJtIDMA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6P190MB0503
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Helo Pavel,

> > > Yes, sounds reasonable. Could we get default intensity of 100% on all
> > > channels if nothing else is specified?
> > >
> > > Or maybe simply "if intensity is not specified, start with 100%, and
> > > use explicit =3D0 if other color is expected".
> > >
> > Mh, if someone is already using the led driver and updates to a newer k=
ernel
> > we would then turn on all leds per default to the maximum intensity dur=
ing boot
> > until they are set the way they should be from userspace. I don't know =
if this
> > is what we want? If yes, sure, we could set them to maximum per
> > default.
>=20
> Not really. If they don't have trigger configured, nothing will happen.

Oops, you are right, my fault.

>=20
> > Also if we want to use Percentage Values (%) for setting the intensity
> > I think this should also be done for the userspace interfaces and
> > not only from DT.
>=20
> We don't want to use percentages in the API (but let me still use
> percentages in discussion).

No Problem.

Best Regards,

   Sven
