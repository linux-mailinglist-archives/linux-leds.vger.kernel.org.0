Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4E2AE30BC58
	for <lists+linux-leds@lfdr.de>; Tue,  2 Feb 2021 11:50:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229537AbhBBKtd (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 2 Feb 2021 05:49:33 -0500
Received: from mail-eopbgr20096.outbound.protection.outlook.com ([40.107.2.96]:31214
        "EHLO EUR02-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229462AbhBBKta (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Tue, 2 Feb 2021 05:49:30 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gje6fgEcqqnS/VO8705ivE8CgccJWrA6piUZijD2TjHLEyi0R4rOE6LtFT719q0HZAFQRCKE3DFBI2gYDXKDN/5+Qe94xCgJxVKQyqXVuBFoqJHxQEw0BjF/W+6UomitDiJYTlma3e68j6iOExHP6WDKvZvH6h9fMzN/oNjmL8W/Zcepa2SP390gb0kAFRaLbcaOIBhjsgv5crlUCP5ORb0DkndLRuf8QWUqG9Y8YqkqUl/KnF322NVilgY7KMBKofZ6hAxI/6RR2eo3+dKL/kOoH8vErwwZXvMFeqeVI0NUcRa8V8sWRjK9yvI1TjcPWSAWJV7dgosAaDuz6yTNng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OdIuLAmOUOMgy7dDZm8XJo5U+qyhJtC3mfd/O12KG/k=;
 b=L9kJ/oAsTLsKYw1Xjw2LlWLUXS0vmlC65GZ/d3ei3DLr9MhzA1IEJOIhWnviF8TuZCmlGnFIXKVZMHn4CSUeQoiyk/Uh4H8IL6kiqS0T4z1l/qGJJuC5wqpar7Hr0cVOwvuqjV4AI27ry5UiiNTGcpHBlQEeVzYNEvSN9MGMF0SY8v5k/tm48j2a+lVvxlHFlJv7cL0ey3hWvH6M26Bmz0MhcSYy13V1CNXG/ro03ahfKAnLZIANs/ESp4XD/uC3GIO1brH18hnLUtpm2M7N7z3qrbNhYBsbPi7rQgMsoqGEIernTA35dkKOblCVbbiFajAXzro0FmoNSTtzMUSkJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=schleissheimer.de; dmarc=pass action=none
 header.from=schleissheimer.de; dkim=pass header.d=schleissheimer.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=schleissheimer.onmicrosoft.com; s=selector1-schleissheimer-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OdIuLAmOUOMgy7dDZm8XJo5U+qyhJtC3mfd/O12KG/k=;
 b=klao5RfFU36l+t3C7TsOhlz8tpHoAz5nHwpfB/MmTFezIE0gVvdGmd96p2+Whbr2xoBcmDExm8D/2Qh8RIMn/gBy+qxEZ7vgetm1vR8X9+gqb4flgEsi+63IA6P8yJqKi8PVLzQ7iwpvT9J0Fg9QRDZFy7xmzSEQuYHy0pYjNU0=
Received: from DB8P190MB0634.EURP190.PROD.OUTLOOK.COM (2603:10a6:10:12d::21)
 by DB6P190MB0151.EURP190.PROD.OUTLOOK.COM (2603:10a6:4:88::21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3805.16; Tue, 2 Feb 2021 10:48:38 +0000
Received: from DB8P190MB0634.EURP190.PROD.OUTLOOK.COM
 ([fe80::fc76:b821:1966:db40]) by DB8P190MB0634.EURP190.PROD.OUTLOOK.COM
 ([fe80::fc76:b821:1966:db40%9]) with mapi id 15.20.3805.027; Tue, 2 Feb 2021
 10:48:38 +0000
From:   Sven Schuchmann <schuchmann@schleissheimer.de>
To:     Sven Schuchmann <schuchmann@schleissheimer.de>
CC:     Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        Rob Herring <robh+dt@kernel.org>,
        "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: AW: [PATCH v1] leds: lp50xx: add setting of default intensity from DT
Thread-Topic: [PATCH v1] leds: lp50xx: add setting of default intensity from
 DT
Thread-Index: AQHW7lFOn/1Jlt56EkOy+ZVk/3cx2qpExM+Q
Date:   Tue, 2 Feb 2021 10:48:38 +0000
Message-ID: <DB8P190MB063495B7F6E0D2749A009561D9B59@DB8P190MB0634.EURP190.PROD.OUTLOOK.COM>
References: <20210119105312.2636-1-schuchmann@schleissheimer.de>
In-Reply-To: <20210119105312.2636-1-schuchmann@schleissheimer.de>
Accept-Language: de-DE, en-US
Content-Language: de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: schleissheimer.de; dkim=none (message not signed)
 header.d=none;schleissheimer.de; dmarc=none action=none
 header.from=schleissheimer.de;
x-originating-ip: [62.153.209.162]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d563ef37-030d-490f-4b4b-08d8c7681926
x-ms-traffictypediagnostic: DB6P190MB0151:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DB6P190MB0151572BC83CA8E66A080FB6D9B59@DB6P190MB0151.EURP190.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: QaIVdGdUSzRICHLIMJFsRAH6bNG8Pb1vKyP6IdlQWufFYR+aNfDD7NMrtXYH4DdN7wm1w9ymE7VBKp/XYX8RmYAhhmJD9r8/qBVFTcdW5D/oCBY/sUeFimZawgxnG+0HvC4D7mUL6yHe3FPIWNDaVZN8i9+hcXkKiOPzK7wsrzBUCoU302BZNzW7XcZQn1y6wugnwBJDfKR2YeQ1A2FjgBBEQGP12xHA1Eb+hLIml24KqkYkqjoknKX0kkQoGCFNVhf/c74887w9NWTHHXdQViNQoxRaxRKc1QzoAD8O93h+j0j1vrFtxJCngonYFmB4m06tEQGbrmH/HI9PclPjgFINweaGBLiGkElWNrl0t6j56GIEupWlvGPLPHpVGhpCQJmX6TU/yGnq6cejpye6IpW33yChlpmY37bMWY74wYdwQ+7SdrfBd1m7wJ/da8INTLoYxhRL5MMOYrY+5ovxCBD+4/dBmryZIlxxnGWu4Ip9W/9iMPV9vSwa1xB9+LLZxjDSIYkURay+LEZFS8uEjw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8P190MB0634.EURP190.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(366004)(39830400003)(346002)(376002)(136003)(396003)(8676002)(6200100001)(9686003)(54906003)(66476007)(66574015)(33656002)(66556008)(66446008)(7696005)(64756008)(86362001)(83380400001)(6506007)(52536014)(5660300002)(76116006)(2906002)(4326008)(316002)(26005)(478600001)(66946007)(6862004)(71200400001)(55016002)(8936002)(186003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: =?iso-8859-1?Q?+8uyxhenb9d4bY7SPQd5/KQV3+jx0Z/zKbp/qE96F7OV1SH8vl9M1My3GT?=
 =?iso-8859-1?Q?Fs54M1cv9Uq99g1sedLZJHDvyrza6FtUk0rQ3NXOMoGCtqBAJwkV/VjbT5?=
 =?iso-8859-1?Q?BgBd6KRaLfAXyV+g+D9Lo3ZmLRqc5SJjiVnzG6q91EuSfH6jfD3Gbva1Q1?=
 =?iso-8859-1?Q?cNLRCJffh3uHCMbSuH50W03hpM+eCZwb8uKqSuvxPq6cgUVLXFYI2C11jn?=
 =?iso-8859-1?Q?jI6QpeGQb92UJOduKNLpe5TNl4JAa1PooM+hHFb8r5u3K8mcGKaiO0AztP?=
 =?iso-8859-1?Q?NxG18wA+s6IwI5BG2X4pz3Z/VnzQqWEjic9IIUW1al9dbSGmBQsva5Zh5Y?=
 =?iso-8859-1?Q?SVtAlPHLd8Q5E4FjbQlw4Ap+bTf9RDAh2nQ1D/4mDFzNvNiP8ew3oESWf5?=
 =?iso-8859-1?Q?Ir0S/LrCn7hXOb14YbaTZEvDK7YiaHZNjtDSxyWdLx6jjRExkDTzW/wXUg?=
 =?iso-8859-1?Q?ThWIHoWJO82fGCFU/+g9uDktyp1SwrpyX7t4HPizb/chqqk9zinNGTEFUj?=
 =?iso-8859-1?Q?/G0ek34M5i499S3HXdyiDQzcTbAnZ2zIwCP0znWe1mWd5SkG7dMrJ1NZqB?=
 =?iso-8859-1?Q?BQfVp2QoBOIofy6yBB0uv56+Qh0P39R7xuwb4ZicnA1ZxLy8EkJuzFRO+W?=
 =?iso-8859-1?Q?u+RdSOTSIxdAET+p0sAQfF0DXYxPKmNwzorY0OX+RPly44c7x8yAB47mMi?=
 =?iso-8859-1?Q?gpqkp1RkF1ZqzDul1g7eWCSlpEJX2TevR0BMq8fb2KsmsIeq8eGwEYhB+G?=
 =?iso-8859-1?Q?h+1j1PnaFAQYWXRDv6yKnRSBPPAz3BiCT1WfFMM5P57xs08VQajlPHvvsh?=
 =?iso-8859-1?Q?v/Hfn4J3qb58mU/DpIPnGkh29MguTST3dhi8wVwvAVy4OofptlEFHbkOBj?=
 =?iso-8859-1?Q?kkxAYMRmp3YI6o7EmZ4bjYeSeiW9OpdNbkyf65dbIwJ6oYp+REcX8kyylb?=
 =?iso-8859-1?Q?rPZyTntqr323jrDSljp150vdmfD9lEoJTVz6mDl5iase3DpLPFRUDOctqC?=
 =?iso-8859-1?Q?HLfPIsoW84wtfr82zDuaJWGR3QPPhwkhle2aFknw0EtNBNWQG1h8wpihPq?=
 =?iso-8859-1?Q?zbS4Hi/LQh2DFovWYAQhBHLamZU3hiyZJbANbk28QI5i?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: schleissheimer.de
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB8P190MB0634.EURP190.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: d563ef37-030d-490f-4b4b-08d8c7681926
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Feb 2021 10:48:38.4465
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: ba05321a-a007-44df-8805-c7e62d5887b5
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6e0r8IF/UgkvH3u1Nwm1rrqQcRDnJujvvZkINinJMAO4L6u8x7EvETcHPvOFSJ0k8+PAQ8qgfKbpdMyDONVeC2AoxiDO3EwhqlfSOoQiWF0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6P190MB0151
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hi,
sorry to ask but was someone able to look at this? Any thoughts?

Best Regards,

   Sven

> -----Urspr=FCngliche Nachricht-----
> Von: Sven Schuchmann <schuchmann@schleissheimer.de>
> Gesendet: Dienstag, 19. Januar 2021 11:53
> An: Sven Schuchmann <schuchmann@schleissheimer.de>
> Cc: Pavel Machek <pavel@ucw.cz>; Dan Murphy <dmurphy@ti.com>; Rob Herring=
 <robh+dt@kernel.org>; linux-
> leds@vger.kernel.org; devicetree@vger.kernel.org; linux-kernel@vger.kerne=
l.org
> Betreff: [PATCH v1] leds: lp50xx: add setting of default intensity from D=
T
>=20
> In order to use a multicolor-led together with a trigger
> from DT the led needs to have an intensity set to see something.
> The trigger changes the brightness of the led but if there
> is no intensity we actually see nothing.
>=20
> This patch adds the ability to set the default intensity
> of each led so that it is turned on from DT.
>=20
> Signed-off-by: Sven Schuchmann <schuchmann@schleissheimer.de>
> ---
>  Documentation/devicetree/bindings/leds/leds-lp50xx.yaml | 8 +++++++-
>  drivers/leds/leds-lp50xx.c                              | 4 ++++
>  2 files changed, 11 insertions(+), 1 deletion(-)
>=20
> diff --git a/Documentation/devicetree/bindings/leds/leds-lp50xx.yaml b/Do=
cumentation/devicetree/bindings/leds/leds-lp50xx.yaml
> index c192b5feadc7..5ad2a0c3c052 100644
> --- a/Documentation/devicetree/bindings/leds/leds-lp50xx.yaml
> +++ b/Documentation/devicetree/bindings/leds/leds-lp50xx.yaml
> @@ -69,7 +69,12 @@ patternProperties:
>      patternProperties:
>        "(^led-[0-9a-f]$|led)":
>          type: object
> -        $ref: common.yaml#
> +        allOf:
> +          - $ref: common.yaml#
> +        properties:
> +          default-intensity:
> +            maxItems: 1
> +            description: The intensity the LED gets initialised with.
>=20
>  required:
>    - compatible
> @@ -102,6 +107,7 @@ examples:
>=20
>                 led-0 {
>                     color =3D <LED_COLOR_ID_RED>;
> +                   default-intensity =3D <100>;
>                 };
>=20
>                 led-1 {
> diff --git a/drivers/leds/leds-lp50xx.c b/drivers/leds/leds-lp50xx.c
> index f13117eed976..ba760fa33bdc 100644
> --- a/drivers/leds/leds-lp50xx.c
> +++ b/drivers/leds/leds-lp50xx.c
> @@ -501,6 +501,10 @@ static int lp50xx_probe_dt(struct lp50xx *priv)
>  			}
>=20
>  			mc_led_info[num_colors].color_index =3D color_id;
> +
> +			fwnode_property_read_u32(led_node, "default-intensity",
> +						 &mc_led_info[num_colors].intensity);
> +
>  			num_colors++;
>  		}
>=20
> --
> 2.17.1

