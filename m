Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 61E853108A6
	for <lists+linux-leds@lfdr.de>; Fri,  5 Feb 2021 11:05:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229703AbhBEKEF (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 5 Feb 2021 05:04:05 -0500
Received: from mail-vi1eur05on2091.outbound.protection.outlook.com ([40.107.21.91]:4801
        "EHLO EUR05-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S230450AbhBEKBB (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Fri, 5 Feb 2021 05:01:01 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bngIfmZe4+2X7IwbvE4hf4XUSJ5dQr21gwS7x+3VDAuiELxc/C/M0OsDuG1Kh6XxRqBI6jBaKfNHEtOTQUB5Ji8gWkr/hjGY3M4uFtFqjNvef75BK3eFOYCFEDaiPOkIvwHENHiV5IoG4cmW5c4Jo06btfKmGbD98G0qhbRn4GOf+oNTYOQGtE2rOAVYmXjV0AcWS+4NAgVdr+3Bts55CL2t7HGuAJPj8VbdWjmL44JSoP36DYaBK6vfk5EJM7/TyevHiPFlXdsw+k1plAai1Pw22a04BJf8ddHGnv2ceeEIU4PEToJ0oS6vuKV/QVmZluWaSu9vMHjNXXwOwf8Phw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fsQFuORlmwnmkorROq68sLcRST30SOmSH3UZnYKDNFA=;
 b=IDotKYmbZLYXz2mycvD/gvN2Ym/TBqZ15Bss/FtLz25pAOAPmzQUpwTma4Zdc2PDVRT43zneNoNC7msatkDzT9SFeAvfPyyB04tFelgiclMI5hEOUnA2iy7SyWpaatzG2/9sY7WgxSy1FSJlM2FjEJJcImKy6AHsLBpo2U9WYXdzU7fAO4dwTn0T7jTv46ZFO00VQtmqyXt+AldwFfTOSG6gGXI5YmFFEXXMEZ8EAVv5NxsS3KHJUwmqYs0xyErJUpztKAqL+oRol45UsXnEBA2sc/s6unOAX/4EI5xRttqOFqU/hG8Qsfr7b0JcxKfqhgZ2y/ty61XfM5oKtj5hQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=schleissheimer.de; dmarc=pass action=none
 header.from=schleissheimer.de; dkim=pass header.d=schleissheimer.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=schleissheimer.onmicrosoft.com; s=selector1-schleissheimer-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fsQFuORlmwnmkorROq68sLcRST30SOmSH3UZnYKDNFA=;
 b=KMPvO+I6I5eF23trqMt2pPnimhtWFV2WJU6VPfk3ILwWP4sGniLRaCfLDkA7d9G8Gk4EJ33hUezS+5NsYAdfn90qndxZO9xxoM6sKT4r7NYXNrPDeGymH8W0sTDhuddMuQ++AbGuVzJgds2zqC8uVknepq/CE53YFm8uVylOTlA=
Received: from DB8P190MB0634.EURP190.PROD.OUTLOOK.COM (2603:10a6:10:12d::21)
 by DBAP190MB0839.EURP190.PROD.OUTLOOK.COM (2603:10a6:10:1a0::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3825.19; Fri, 5 Feb
 2021 09:59:19 +0000
Received: from DB8P190MB0634.EURP190.PROD.OUTLOOK.COM
 ([fe80::fc76:b821:1966:db40]) by DB8P190MB0634.EURP190.PROD.OUTLOOK.COM
 ([fe80::fc76:b821:1966:db40%9]) with mapi id 15.20.3825.024; Fri, 5 Feb 2021
 09:59:19 +0000
From:   Sven Schuchmann <schuchmann@schleissheimer.de>
To:     Pavel Machek <pavel@ucw.cz>
CC:     Dan Murphy <dmurphy@ti.com>,
        "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: AW: [PATCH v2 2/4] leds: lp50xx: add setting of default intensity
 from DT
Thread-Topic: [PATCH v2 2/4] leds: lp50xx: add setting of default intensity
 from DT
Thread-Index: AQHW+wNMX/Qkt5m5zEyD/i/lN5kehqpIFN8AgAE/3tA=
Date:   Fri, 5 Feb 2021 09:59:19 +0000
Message-ID: <DB8P190MB0634587826F57667BB3BBB6CD9B29@DB8P190MB0634.EURP190.PROD.OUTLOOK.COM>
References: <20210204143738.28036-1-schuchmann@schleissheimer.de>
 <20210204145308.GC14305@duo.ucw.cz>
In-Reply-To: <20210204145308.GC14305@duo.ucw.cz>
Accept-Language: de-DE, en-US
Content-Language: de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: ucw.cz; dkim=none (message not signed)
 header.d=none;ucw.cz; dmarc=none action=none header.from=schleissheimer.de;
x-originating-ip: [62.153.209.162]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 024b64fb-3d4e-424e-877c-08d8c9bcb4ae
x-ms-traffictypediagnostic: DBAP190MB0839:
x-microsoft-antispam-prvs: <DBAP190MB083933781FCE84464FC095D7D9B29@DBAP190MB0839.EURP190.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:6790;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: NA0FOzEIwFcoiT+LLDplbVj6DblkUug3oUa5UkdwqLw8/K53ykpLhfHCcg23kGjmMKhVeGHWL9oeuPSRt/nocYCYGSUsJgMa9bySjXLorLU+E8yhEn6rRqWV3jaDwaOT/SvJYrUDU/Vkctpv7fQ+ivWbhtyzfLWOM9PHmKas/25Y/qK0NGED7suBMa2lUouCbEFUCVdYZoBtVEu6vxFofJvVZhVXCZNSCFov9D9OPynsGBYS6uZwyTEFwG+DyJAYtJ4ZkTWZe9LQMGnKNwuaBer8+tKWLM5PI8DLnNSw+9Lwxamy+4yHWKTMM2SPilZnjV3btYUWMTGJ0NuMPfJrBNTUGyYWcQKsvRHZfLHUXd2ncsAj929Sm/HlOYo2S+Q/U2wTlAWA4+xPuPQds0TwmGIV5l0ADaFgbbh6qiJciyjVmNdRTPYODh3zZjyrB8BD5BVAfKq+e3quf8lSy6ELNU1lpNYt/B0kV0gPMHLAbQVWm+UP1yDYQRXvP/AWJRp6diOUDIu9fkX2nmkPynV3/w==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8P190MB0634.EURP190.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(136003)(366004)(39830400003)(376002)(346002)(396003)(33656002)(9686003)(5660300002)(6506007)(8676002)(7696005)(71200400001)(86362001)(4744005)(2906002)(55016002)(66476007)(478600001)(52536014)(4326008)(6916009)(8936002)(26005)(54906003)(316002)(64756008)(186003)(66446008)(66556008)(76116006)(66946007)(83380400001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?tDmcc9/LxqrQOHSWSVPZ/9772Dmso/gif9NIn+cGsUMow1cWDH2gAq0HjOYf?=
 =?us-ascii?Q?27guoMGDYDg76N/yS1Tc7p6Jt6c+iAndxKRFziQShk7BkWIcN/txkFONl6H3?=
 =?us-ascii?Q?4+DxDvAqyLfoMHu5rGvqF4UcY6lYfXbB9RQlyztpGLiJly7aWcDHLQD6nAOX?=
 =?us-ascii?Q?9puz0GWqoD3Oko3jNlCWjjwOS1nGdBbE5mVJKQdSg/3RxnC7G8MQncZJKHi8?=
 =?us-ascii?Q?P3+nJ9wQ+H8l04DO17+8VfwdmdMalY91iqdb+RQ+AfzXvIobWa8Dc2Ir4sxG?=
 =?us-ascii?Q?Fh3KXG8FykGELRa3DfWkPMxhLmIyHhPuqD7N0rJOO4VztUrpOEU8w2or61te?=
 =?us-ascii?Q?WcNJDzvIp5KV3xAkowO78d5RnUKccUnTjlXmHmg0+IM5oiXM1+xhG0rtIoll?=
 =?us-ascii?Q?2yuGUEJu24gX663LylMv/PRflY7Z0o+C/ER9dxNIEc59STLKBtexcvNoe6WU?=
 =?us-ascii?Q?JpxELyrfun7IDkIwbMITDLqM10qAxudIZmJjeduE+Xht3WV88q9/ZBvlhjTC?=
 =?us-ascii?Q?L4GXteqCeSxy6vbtRGuRbD+K+4YF3yMDavykLg8JUVnwMxocjfex41sw4kk4?=
 =?us-ascii?Q?8Qgbp2Zi4xtLXIGzS0uvhVRHyn9we7Xi11BPqWpVQ3fIa0YICpYVcoOGJ14k?=
 =?us-ascii?Q?sX1KcR3ZHAkAIe9/Dytu7QHSZgPiHoVp9Pe1SL+oVKXlECTTmErn7qG2wk9M?=
 =?us-ascii?Q?YQ+k8NCsIlgsk7u17/8Ve0cAdR8kRh8DaGQxZ0VYNr7iK94QlY4PGBpF1g3M?=
 =?us-ascii?Q?Zyla82+HhJroBkx62dbUmYUr0oedzbBOmUU30ERvt5tFzuWaefnvwphDucoj?=
 =?us-ascii?Q?MXOCqjh4z177DoeolP7D2mLN27CZ8W+vmzalr/a0ak6DKJRieG3iO4JtVtTw?=
 =?us-ascii?Q?E/wDgbzq7cZljt+5kkhx9Krt/FmbW/LjphVSAD4zpfMkZXefQF5GNZ2MMyLg?=
 =?us-ascii?Q?q80hDGU/ugaQHjWSY0Hg2m4SLK53XTuMl+KH6PpNydWcq6I2Tpj32orsn1K6?=
 =?us-ascii?Q?+6fLvqZiEnT6CytKvjXkfn0CU/hoyh/Yi8gAZyq9xamGzAlAi5l1Jl4kk8Xc?=
 =?us-ascii?Q?yT7dwgylfueWX/M1Dv/jOSAC2xsqJl8SL/h7bmDvoaGE8crBY2twImtKgL+P?=
 =?us-ascii?Q?VOmY9/9DE9YxJm61iSyOK+9x6PSQCLd228FUhoeYIjm3yDTKBCbwcg3qNT3F?=
 =?us-ascii?Q?hVRWZ2/pMR9nJRJAsqGQriqnfAoeIyh+8bvYaZh1DTaTP8cEOAH3WRm7ofay?=
 =?us-ascii?Q?QYnuo1090fRrTKzQx/4koJg6TT8gEbSnptr1fpcf+rd9oYNGLQN4yjBabRHI?=
 =?us-ascii?Q?h26RduAD1mNem6DD+wI/hhMy?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: schleissheimer.de
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB8P190MB0634.EURP190.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 024b64fb-3d4e-424e-877c-08d8c9bcb4ae
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Feb 2021 09:59:19.4450
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: ba05321a-a007-44df-8805-c7e62d5887b5
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +hZugH89qJsZoxnyLqjPkiB3lkqQ8VhNUXKzzRgpUWJ1IWs8diWavbDjyIkEpaR2Z3mbVFR7FIdgtLeIHHcRIpkTgIM3xGtuBsKeeZVjkSs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAP190MB0839
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hello Pavel,

> > diff --git a/drivers/leds/leds-lp50xx.c b/drivers/leds/leds-lp50xx.c
> > index f13117eed976..4b40bf66483c 100644
> > --- a/drivers/leds/leds-lp50xx.c
> > +++ b/drivers/leds/leds-lp50xx.c
> > @@ -267,7 +267,6 @@ struct lp50xx_led {
> >  	struct led_classdev_mc mc_cdev;
> >  	struct lp50xx *priv;
> >  	unsigned long bank_modules;
> > -	int led_intensity[LP50XX_LEDS_PER_MODULE];
> >  	u8 ctrl_bank_enabled;
> >  	int led_number;
> >  };
>=20
> ? Does not make sense and changelog does not help.

This is an unused variable which is in the driver
(same as the regulator). Should I provide a patch on its own for that
or just describe in the changelog?

Best Regards,

   Sven
