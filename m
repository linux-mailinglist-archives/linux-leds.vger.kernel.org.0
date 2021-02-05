Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B0565311712
	for <lists+linux-leds@lfdr.de>; Sat,  6 Feb 2021 00:30:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229927AbhBEXY3 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 5 Feb 2021 18:24:29 -0500
Received: from mail-eopbgr30105.outbound.protection.outlook.com ([40.107.3.105]:45841
        "EHLO EUR03-AM5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S230186AbhBEJ6h (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Fri, 5 Feb 2021 04:58:37 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Rs7f0dgDy3dFu6AA9QStcK+/019JhdsG8AyX54SX7pHePPwRgMyHI3434i3naCmrxkd8vuKlyLg7qeQ45Xrwzi3OWT9U591sN7WObbcPjQolkG7mWStfNqgln6MxbvWTwmvWJX3WD9jzik8CEcFO2qsJbRKd9hQjL7kOIG8XXTkqNsMwUYx4wq1b29hlC79OjsJ37wRsDpphTGcs2hmKBT7R2j5P9/oa/sxRVtN3MV8C/f4ll0LtXiaNGr7h0JfuXpQMK7/QodaAXhQXVraZf1rVKgFXqs1NkSPv5hb8mAUbmBZuNeqBAAPd5hiVnTcgz7yssLa7VTHzEB5W1FbsKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tkoJo2rxjqJB+4r6QKn8sIQa8R7Sdan1uR07NPouEB0=;
 b=cXolW0XkUoLSpzyS49PW2//OgpfNv5WFXvIhj2IlTyCUQvEOPozMXUXSkbQzepuB6xv8iXyfl9RJ22LWa/GfiDyeEuW3cE4BN3I6+m6HFMjZrldv9kp57OHk4kal1V9EWOFmpQkCaWcY8i5BXnH+qWtBMMdHpc+bK5sT4Xd82KSPjZaY8O7t8rSaaH4bCEeo9iAzqw/28XmUXX9h8E9ktkqGk+NIaOJ418Qda6atjMrkUz7biMCAhSin8lCWpK10kQCJkgc+IxJ1cKuigvUX8+AMdUl+Ha0fokDBmkdEBNiX+f91/fN/engwaOwI1ynXbnISAGraFhP42JVnymJKUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=schleissheimer.de; dmarc=pass action=none
 header.from=schleissheimer.de; dkim=pass header.d=schleissheimer.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=schleissheimer.onmicrosoft.com; s=selector1-schleissheimer-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tkoJo2rxjqJB+4r6QKn8sIQa8R7Sdan1uR07NPouEB0=;
 b=U+L0xtbRpCEndpOngkqhERuirnzhkcCxbbJHP+gmtt0dFlx5LN90DjnpbsGYvk0UdWV+VEbozfRQlPWNqMVfNzAdPeXwKLI7p0Q5PyD+e8xKbKNA3lr8UyXmWOi5ASGbyoDnfE6Y7J7pIT5v7mQt1t2qSAonxOAC45zooJhLbp8=
Received: from DB8P190MB0634.EURP190.PROD.OUTLOOK.COM (2603:10a6:10:12d::21)
 by DBAP190MB0839.EURP190.PROD.OUTLOOK.COM (2603:10a6:10:1a0::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3825.19; Fri, 5 Feb
 2021 09:57:44 +0000
Received: from DB8P190MB0634.EURP190.PROD.OUTLOOK.COM
 ([fe80::fc76:b821:1966:db40]) by DB8P190MB0634.EURP190.PROD.OUTLOOK.COM
 ([fe80::fc76:b821:1966:db40%9]) with mapi id 15.20.3825.024; Fri, 5 Feb 2021
 09:57:44 +0000
From:   Sven Schuchmann <schuchmann@schleissheimer.de>
To:     Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>
CC:     Rob Herring <robh+dt@kernel.org>,
        "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: AW: [PATCH v2 1/4] leds: lp50xx: add setting of default intensity
 from DT
Thread-Topic: [PATCH v2 1/4] leds: lp50xx: add setting of default intensity
 from DT
Thread-Index: AQHW+wNFjslKsenf3karGguwydAae6pIFI+AgAEq5dA=
Date:   Fri, 5 Feb 2021 09:57:44 +0000
Message-ID: <DB8P190MB063482D8E38C0529AD16A4D5D9B29@DB8P190MB0634.EURP190.PROD.OUTLOOK.COM>
References: <20210204143726.27977-1-schuchmann@schleissheimer.de>
 <20210204145201.GB14305@duo.ucw.cz>
In-Reply-To: <20210204145201.GB14305@duo.ucw.cz>
Accept-Language: de-DE, en-US
Content-Language: de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: ucw.cz; dkim=none (message not signed)
 header.d=none;ucw.cz; dmarc=none action=none header.from=schleissheimer.de;
x-originating-ip: [62.153.209.162]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 67c8e130-47a7-42be-9ed5-08d8c9bc7c49
x-ms-traffictypediagnostic: DBAP190MB0839:
x-microsoft-antispam-prvs: <DBAP190MB083919F1256FE7E7304A2B19D9B29@DBAP190MB0839.EURP190.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:6790;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: pYobXSxCEfm43VhUdW0HtozxGOSd8RKipTXGD9viiF3I6AmegEdX1+u9+X/DAarh7oxPKHZ1ZtMLiOTXUSoqWzvnM+bCK1Bb2BwDn24as2e62azwMERQ9zP17zr7x3K0DoQBOs73hFJwwpfVd48tQcXJOpGvXPjhTia4VzKFd51vayS0fg07dF+kBoVAtVj4r8uIt2gJ72t8/LxEk23YMVa92PSTjp5QmDCa5L5WE4YvhsHCS9iEs1go3gFmEm4spx0HiUEJ+XOstzBIwnqFkQKHu6H9d0O8n57D4l6PciGXxGQqFoO1t7iNaF4sJswchm6L+xVOXa2an6sS9iXl+MnuWObZuMUsGjTS0mf20A8GEKd5tJHSsHyBAoDFmVSGSAhxLE7jCilOXXN9i6UxXqCCGwyGwjYiONjKcu5JrqTYqWNv1VkAgwTY/MRhVmUyQQ3EyKcIlFrTQDvlhimcw7tK+cTIYxXjKDzATWTQ0Jcgm7lzk/mHL0XMkfMclU0/bV5FFDSaPvSbRtJ4S/Ag9w==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8P190MB0634.EURP190.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(136003)(366004)(39830400003)(376002)(346002)(396003)(33656002)(9686003)(5660300002)(6506007)(8676002)(7696005)(71200400001)(86362001)(2906002)(55016002)(66476007)(478600001)(52536014)(4326008)(8936002)(26005)(54906003)(110136005)(316002)(64756008)(186003)(66446008)(66556008)(76116006)(66946007)(83380400001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?p7UpXHBz3LibM0WR/RbwHYik8OyQLb13PdeQQEAxA7bNp5DvIRJi8st1tGQa?=
 =?us-ascii?Q?9cegq3mWQ8bjWTXCP3oG8WTCSlozGvZV7n945cLs/d6aTlfwThj7ChjbT99n?=
 =?us-ascii?Q?DNxd8lwUR+5b78Pj9xfdwhfWQcD8b/i/WKDB6jc+Pc8QUCvuGsCs0tl+rpzZ?=
 =?us-ascii?Q?9WwwthniIK/kmLFk4/U+xkDkgedlMAyyYT2l4rYZKgGmKNyRtqBbykICoXTV?=
 =?us-ascii?Q?9Vyt3tCt80/SwjcLMl9ErveGBelb32BmeLlih4xKKJ6XrOyPJ6vHtziIyxUR?=
 =?us-ascii?Q?tC0smtBAvU8wE4PqWicpWfx207E8PvNuH1gcPIkXxR++jfSkTnmRFHeBPlu8?=
 =?us-ascii?Q?VJdL1BI3uUQjGgwnZgBJE03eWaKRMEAAvntSS6bd1TaaMPlCUMrA9xFoD9Si?=
 =?us-ascii?Q?kt4KQYGg/qJaTR/nvi8a9JVfoJsl6dYD3F+/x3Y3tZg7sM7X2knynGXpmIgk?=
 =?us-ascii?Q?dSxWqBMyUNMs9hpAD8UxnCi0mgqcohjjhTtr5Z3cmH60tSYK/rvU60ysgm+9?=
 =?us-ascii?Q?GlPwa9BTKgDlJRYlgLTrpsbqgSpvWy4/ySgX9kHgpIx66XFzItoMOjYod04W?=
 =?us-ascii?Q?B9lSQyhBwLwkcG5AK90HOTl5/ZPxwbCjHjrz5GXMBSh8j+3Aa7EmlsEusxcx?=
 =?us-ascii?Q?VQbPNugAClQ3zjJ0rtOUOFJWWJSUam1TS6NtUO6BldaW+t7WwJmIleuLKI24?=
 =?us-ascii?Q?1D99UH7fS2zeC6Fm6J8ILNPmd1GGlbXgS37be2JTpx4OwjdLGlLTKA/N9mXN?=
 =?us-ascii?Q?AXdS1ZLvg0j6tCNkvbIFZSXnT+5Tu0VFpdwIkvVC88qFfTDrfOpLhstg9ktm?=
 =?us-ascii?Q?wOJqNJv18+W1NS8kr8hTax4DkPnuuBtstDfChvexcjt/U8a7GaXEH/eNXUqM?=
 =?us-ascii?Q?QjxIcs7ye3oQP4K56D5lUWBdKuhUXO3TxxqkNll+PCynhJFVntqiqVnDY1kl?=
 =?us-ascii?Q?7sGJjcOhqbMp40M33D/+Djlh/dHTztmeM/RA2msy0zgvAtwxQw9WIRo/enbm?=
 =?us-ascii?Q?KpR9OsWbxbmJkgA78sPA+3FWVtKxT71EC92r+v9XZmxwGeGvzM3BZRj4k1LW?=
 =?us-ascii?Q?r4XGaNu7KfjUPHken8+geWsbJOldy7Q9jV+iLxWlSPvimvoD888a52wke87Z?=
 =?us-ascii?Q?HhoJmaMgtXyVgL4zYQne9ggW3icMN/hn+ZD3RJaY9081Gc7cmknU5PPWVBZY?=
 =?us-ascii?Q?2ctZWDnbeBPSSCybF6J5C2PXzwoRdWOqnIRA6tGaZmBK/g94tkU3hQljO32L?=
 =?us-ascii?Q?2NllilkOwjfqLwb//V2E4rsXD8o6QomzkP+4Ks1xQYPLhaZv9eYQFUNPvrMA?=
 =?us-ascii?Q?shV1nLB2/EAA3c1PZ+kWbE1p?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: schleissheimer.de
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB8P190MB0634.EURP190.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 67c8e130-47a7-42be-9ed5-08d8c9bc7c49
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Feb 2021 09:57:44.8133
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: ba05321a-a007-44df-8805-c7e62d5887b5
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: msKR+Bdn3EPcQdBv85uU/d7siSLH1SYGmHrvW/ThCkqwOcQqF96LYViZ2dAsj5Az9lZFWfH1XbGkVPtzU4jjbRjY4o0YcW8agQoHZpAeRNU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAP190MB0839
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hello Pavel, hello Dan,

> > diff --git a/Documentation/devicetree/bindings/leds/leds-lp50xx.yaml b/=
Documentation/devicetree/bindings/leds/leds-
> lp50xx.yaml
> > index c192b5feadc7..2bc25b2fc94d 100644
> > --- a/Documentation/devicetree/bindings/leds/leds-lp50xx.yaml
> > +++ b/Documentation/devicetree/bindings/leds/leds-lp50xx.yaml
> > @@ -65,6 +65,11 @@ patternProperties:
> >            This property denotes the LED module number(s) that is used =
on the
> >            for the child node.  The LED modules can either be used stan=
d alone
> >            or grouped into a module bank.
> > +      default-intensity:
> > +        minItems: 1
> > +        maxItems: 3
> > +        description:
>=20
> Do we need more than three for RGBW and similar?

AFAIK the lp50xx supports only RGB. So I would go for that.


> >      patternProperties:
> >        "(^led-[0-9a-f]$|led)":
> > @@ -99,6 +104,7 @@ examples:
> >                 reg =3D <0x1>;
> >                 color =3D <LED_COLOR_ID_RGB>;
> >                 function =3D LED_FUNCTION_CHARGING;
> > +               default-intensity =3D <100 0 0>;
> >
> >                 led-0 {
> >                     color =3D <LED_COLOR_ID_RED>;
>=20
> Should this go to leds-class-multicolor.yaml ?=20

I think then all drivers should support it,  but I cannot change all driver=
s.=20
So I would only leave it in there.


> Can you make example
> <255 120 0> or something like that, so make it clear it is not
> percent?

Sure

Best Regards,

   Sven



