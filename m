Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DFE683108A9
	for <lists+linux-leds@lfdr.de>; Fri,  5 Feb 2021 11:06:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230043AbhBEKFU (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 5 Feb 2021 05:05:20 -0500
Received: from mail-db8eur05on2101.outbound.protection.outlook.com ([40.107.20.101]:43905
        "EHLO EUR05-DB8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S230073AbhBEKB3 (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Fri, 5 Feb 2021 05:01:29 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cOSXQnzYWG3iQRnsnRqK6zBunkLyuByBYiN/dlmOBgAR6zXTmWQn+gfQLKUncmK3Nny/+KerFl6A0R5YPOL6e8eg2i9ejgG87ulMJfYsJAsz2uIqxjf5putOtxtRQUQV48ysL03UK1XA4l2W3t5j0zHpDUkLwQjNRDl1uxsGLQ2/0e/nJcVfExR1uAzUKCNxmkZI9rrQrmYhB8ANQaoQhC0WkkQah1gJTyKiZsgcgkkG4uGNZLiPAdSciCAoUEBBfWr4XWcL+TKL5g5i2CSD5rqcYXWQL4C46R+aurDpzLN2ID7oAHwDdSzxULySSOvMutL2B3VJFXdRFaHiFIQzEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aEkZnEBAD7m7Y4YjOYLnzQ7KAtvHBUoIdXbKj/j5nBs=;
 b=AGn5dyB7DNs5qDMHYlRAIhEd2v7IH9LLqz0uNxkIrSS6QaXwlWaFKxFR2x/HuN+rgdNBBT0TvzoUxBIjb5GbuazeGzZM+MPXnvW/rz0TJpKKrN8Q3ufuMPCWVh5HY70sAd1fBoaZEGW7ukey7IwrOIFta3Q92c0aRYibQG6s04bD71PWCrx43mVFsHkD0VJFd0EKu7ONXo/Ysxe54sd6I/GJ6tkVNiUK883/0D4PG/0rC9K7UCx5VYs7sZ84BQaRQGABMo0Zs8EJ3v52j/qcuiBeUgcrFZIvmY7wakpM3CS6dCShxNU/EhBffz2duzyllk0F46zK2NRaskdDe2PITw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=schleissheimer.de; dmarc=pass action=none
 header.from=schleissheimer.de; dkim=pass header.d=schleissheimer.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=schleissheimer.onmicrosoft.com; s=selector1-schleissheimer-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aEkZnEBAD7m7Y4YjOYLnzQ7KAtvHBUoIdXbKj/j5nBs=;
 b=HYrnm4mBlnY4GebxFdMpRN/DQe7QU99zvzaIoj250iVMBp6NiaDer8XzGoBrf4hZVI4fU0Dwaq8MlRufkDK1+Zp/TPyDv35iSnu1eUFol8vbXH3fAsUrce9lbI/9TIbefQy3o7n9cb3+QY4QXyzIcHoh7eIKTQ9/2dBWXCLFo08=
Received: from DB8P190MB0634.EURP190.PROD.OUTLOOK.COM (2603:10a6:10:12d::21)
 by DB9P190MB1307.EURP190.PROD.OUTLOOK.COM (2603:10a6:10:22d::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3805.17; Fri, 5 Feb
 2021 10:00:35 +0000
Received: from DB8P190MB0634.EURP190.PROD.OUTLOOK.COM
 ([fe80::fc76:b821:1966:db40]) by DB8P190MB0634.EURP190.PROD.OUTLOOK.COM
 ([fe80::fc76:b821:1966:db40%9]) with mapi id 15.20.3825.024; Fri, 5 Feb 2021
 10:00:35 +0000
From:   Sven Schuchmann <schuchmann@schleissheimer.de>
To:     Pavel Machek <pavel@ucw.cz>
CC:     Dan Murphy <dmurphy@ti.com>,
        "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: AW: [PATCH v2 4/4] leds: lp50xx: add setting of default intensity
 from DT
Thread-Topic: [PATCH v2 4/4] leds: lp50xx: add setting of default intensity
 from DT
Thread-Index: AQHW+wNbGhw7Auv8fEqi7FbRWHmBVqpIFWiAgAE/vAA=
Date:   Fri, 5 Feb 2021 10:00:35 +0000
Message-ID: <DB8P190MB0634FB8662069F4055407615D9B29@DB8P190MB0634.EURP190.PROD.OUTLOOK.COM>
References: <20210204143803.28140-1-schuchmann@schleissheimer.de>
 <20210204145503.GD14305@duo.ucw.cz>
In-Reply-To: <20210204145503.GD14305@duo.ucw.cz>
Accept-Language: de-DE, en-US
Content-Language: de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: ucw.cz; dkim=none (message not signed)
 header.d=none;ucw.cz; dmarc=none action=none header.from=schleissheimer.de;
x-originating-ip: [62.153.209.162]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0168b12f-d9ca-49fd-881a-08d8c9bce231
x-ms-traffictypediagnostic: DB9P190MB1307:
x-microsoft-antispam-prvs: <DB9P190MB1307BC94ED8435C76957A993D9B29@DB9P190MB1307.EURP190.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:901;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: nqw1UjcGYs5MGroq/YcSl7EL5wIbc++qEhZwSW8hy9ZiyfTpD/3+mAU2hpu0ZEMm3tv8xd6NkX8ZMpoyFF5KNd1VOLiEYoxeCWAdS6JlpcEv3ad+1iq73+fbXDPSsWSTG0JcOqNYYfEFz97vxmg4ILFts8XWGEU+yNa6byx98p9WtVx6LDpwgAIiC/o29qGAujAu4l4gN94iv0TJtPY1k/qMjniaSs7VNds7LLoMr76/R1PRXlUvwCjeQQNPtTYn+xEqPMlAWF1Tgz11CIBNQXCfX77gVLvnmMOR/hiHl0s0HpW5mou/8AuY2tiYVRiK+xR2bUmBx1xSQNNkdH0yvY3iYb+0ZSKSQxF9L0HOPfVi7T6So+DYxmOWhi05RFVhij/JQEsNe8YFI2pMyaciWDw4wsvys4KKw6069b16Bqfl8VzeNcjZq/sFBPFHKyr5PrWQbCd0Cm6HXqSgKaX/l/QDZZf6fO/j4KCsyLMW39Z7hr8MXgr4azurqs79g/5lfkrMSGCqFf5/7MO/3jZcFA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8P190MB0634.EURP190.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(136003)(366004)(376002)(39830400003)(396003)(346002)(316002)(71200400001)(9686003)(76116006)(478600001)(66556008)(54906003)(8936002)(86362001)(7696005)(55016002)(8676002)(26005)(186003)(6916009)(66946007)(4744005)(5660300002)(2906002)(6506007)(66476007)(64756008)(66446008)(33656002)(4326008)(52536014);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?hG4HtjRc+5Jd9bYx1gGmCgCIWxlmGr0wnXB3vzXEQvqdVpO75kU1jZmtBHqb?=
 =?us-ascii?Q?7JP/asmD2cT7v+cgxjWSBdpXG4tl+vQwQkMKzlzWUB29r5N7AEK6RQ9TAq4t?=
 =?us-ascii?Q?pNNCaXWcLLowb2Pg7CN88WCI+bQiwO5v9B5A+bB5Uzf8FpWttwjJ94tzzdY6?=
 =?us-ascii?Q?CyqcqhDmyLG6zWrKUM2G9IFzmmh4Cg8MwUSRQueBxRCmoIOzgiDmmT2wjX9Q?=
 =?us-ascii?Q?szRU8+vchravO5QlPrw8WdaOgXEzcxryPONNpONiI5oMILDNBZESuewfwO0p?=
 =?us-ascii?Q?XEbEXF4+rC5fZf0Enq7ztnbV+W9V2GmfGNVj/W5+WHHEP1uZsjLFJkevdGv9?=
 =?us-ascii?Q?zc6zTXcRq3l28zyK7v04yZyRcYUsw9sOQPktQmZW7WerrAr6JVLKTLXeen7u?=
 =?us-ascii?Q?OBZpZQRZ0hM07Rda67goK4BominqpQ3e76caWCiIdbH3TCA79PX9UeewGwo9?=
 =?us-ascii?Q?oXcUpIyCLny5oi3q9Zm1X/XWQ2SFl+RbHvyK+cW6RLkO4Pqud4kRAQBWlnFu?=
 =?us-ascii?Q?YKhQl60Ps9GcubBLBdznh/BMlfjNfGwbxHC9bSPj5UHDbIFJ9qCxhsI8NmZA?=
 =?us-ascii?Q?ZbZANiXVpMdg5+FPokfXXCvHrMf/X2FHtTUOAPTNV9N0dJrkMNN2PoeA9mJ4?=
 =?us-ascii?Q?tvV6h+MXt49HYmGo+fI5FDtvlx8IA750KVL44E2Ptbp6B+EZWGM1k/o58qYd?=
 =?us-ascii?Q?PWj7PCMeBCn8yn1OUnnF5CYTodI3wR+ntnQykXTg80JGwbXzs/FQEfzzeeTd?=
 =?us-ascii?Q?BMUZSna5rEk+HSirGMi0vBOmFt3+i1NpleaxtL9GCvnz7ZIMoPn4AE37p5pA?=
 =?us-ascii?Q?2hqKi6lquqtnlV/UZREDWsMTiGzfUBmfClIxxaFBXIjw7z9AmQ8JuQ2lJZ+o?=
 =?us-ascii?Q?AElGu3iOkYxiBFHTR60ooawEbJx224XRgW2xhZ1i8DSty8p8Aueu3nXGKHXg?=
 =?us-ascii?Q?F1r0wPxG0Y4BvnivevqCIMpN3GVqEy6gibhO+6okmznSBRxpNW/0ZY8dTW28?=
 =?us-ascii?Q?aoqA5/ZW543PQb07VqrGYTLDdNsGxYrempS3PKeLJ59V2ekXof2X3K7euL+p?=
 =?us-ascii?Q?gftLN/eCZc8eeUKtIrNCrkT9zAfj7tksKF8tQt4elibIq3DKVdPJ4OlJhyKX?=
 =?us-ascii?Q?nnYH31JWORqcSOHTeOH2CwwdleF/o3MkDwCIjVCh+xX4wM1RnmamO59PaLwt?=
 =?us-ascii?Q?y7mA9GM4/diGWB65ZUV1mXArXVEr1X0dTdo3y6tt/YsqweCEQWo4Oa++VoOE?=
 =?us-ascii?Q?co8Npfkit3BRABxU4Z40ZL0lSVTkuejGnHz3wRyClzuVMhoZ6wO+80KerHy5?=
 =?us-ascii?Q?LUxWhodgHtETmXSuLwzRYE0t?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: schleissheimer.de
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB8P190MB0634.EURP190.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 0168b12f-d9ca-49fd-881a-08d8c9bce231
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Feb 2021 10:00:35.8498
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: ba05321a-a007-44df-8805-c7e62d5887b5
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JGGC/Y23MDYfieEur5xYQEYS1kW6Yacc6NCxabzW7ZL0BeoazxRjOO/TVVEWVkBmCuVTck6x8y9wfVafInqaSXaUa7Rz4n3LywjrEHFReI0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9P190MB1307
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hello Pavel,
>=20
> > Signed-off-by: Sven Schuchmann <schuchmann@schleissheimer.de>
>=20
> Check your email headers, empty To: is strange.
>=20
> > diff --git a/drivers/leds/leds-lp50xx.c b/drivers/leds/leds-lp50xx.c
> > index 79bc071c31fb..e8aa36c7e963 100644
> > --- a/drivers/leds/leds-lp50xx.c
> > +++ b/drivers/leds/leds-lp50xx.c
> > @@ -504,6 +504,24 @@ static int lp50xx_probe_dt(struct lp50xx *priv)
> >  			num_colors++;
> >  		}
> >
> > +		if (fwnode_property_count_u32(child, "default-intensity")
> > +			=3D=3D num_colors) {
> > +
> > +			int j, def_int[LP50XX_LEDS_PER_MODULE];
>=20
> No need for empty line?

Using "git send-email", maybe I am doing something wrong here, will check.


> > +			ret =3D fwnode_property_read_u32_array(child,
> > +				"default-intensity", def_int, num_colors);
> > +			if (ret) {
> > +				dev_err(&priv->client->dev,
> > +					"Cannot read default-intensity: %d\n",
> > +					ret);
> > +				goto child_out;
> > +			}
>=20
> Just ignore such error?

Yes, I will ignore in the next version

Best Regards,

   Sven
