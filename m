Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9184F311D62
	for <lists+linux-leds@lfdr.de>; Sat,  6 Feb 2021 14:16:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230027AbhBFNP0 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sat, 6 Feb 2021 08:15:26 -0500
Received: from mail-eopbgr20090.outbound.protection.outlook.com ([40.107.2.90]:43983
        "EHLO EUR02-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229719AbhBFNPY (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Sat, 6 Feb 2021 08:15:24 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lRv5Lzxj10tV8uTZMcmTHsKbbdzFhPDJmK+U8Uy3qS/cmN0dsyPDRu4H362/Bk/YAITchD/HdTQy7m0sKMqe+Lb0OtbgYQwc8w8ELNHDoVwDUdL+W7hsVvwjqePOoRGYqkPA+ba/zU4gEE4HD6jLniD77zHVmsCew1baO0Bbyv8o6MN/SKJs/m03j96LKwVquPVd2qiMX962GqTDSrSrRQGUZAiqBsT4nQOAsIqiwIOfMu8kkFxs06N4JCZ+llr+7WnluiczKH2TXHGmtLvUQobhMJpIhMcqaQe79asHF2IInKH2rQfaWh+pZoTbEKrqvAwh8l40bHN63/LCr/sxow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FfayinYV9nJxgxsTjDMlTvFFIDjCnzQaaUya76SpkCQ=;
 b=CG0FVSKy7SiEwn9CuGscLkPW4GLQ/e/8CQ8g5r9YdoHiuwtHoUP7LDi7BX02QbAl8ea69tHkak7RVdJqWDXK1BsC5DReUSOlO4CKCAL+8eMaafb/xBQieJWSqy/dUeb/Z3cJP3sGnxt7EFBWNjyykroN0bELMKRXhCuPNuHxTfefcaFWIKPTOYvHXBFeRTrZ0wDQ6Pvn7VBgM0jVVEZirMCWewKrmbtC5xFASEN83LYAX5gN72ptrafl1PHCt8s/tpZaF7UjFzL+pfgaDPXdpE4cngccQKz0zNoxY1fdTzY/yhfIddyxLH0W2bdQNTiY7PS6nV/rGfq37sDoOUl0Aw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=schleissheimer.de; dmarc=pass action=none
 header.from=schleissheimer.de; dkim=pass header.d=schleissheimer.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=schleissheimer.onmicrosoft.com; s=selector1-schleissheimer-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FfayinYV9nJxgxsTjDMlTvFFIDjCnzQaaUya76SpkCQ=;
 b=A5bHtkMoFiHs8dVRN+PCHmi+/Guf5iJ1NQxxj75+biPgozj9h0vtL3QSwLItmLNFRYZbON0en6028vTNk72mJVv4deg6lT2bIVCY96hL4PNW1KXbyl8MFqAFkt9jnnhAelaInbSGXm0rkwV9DMryFS6yklRoGal6dLRMALKL/dM=
Received: from DB8P190MB0634.EURP190.PROD.OUTLOOK.COM (2603:10a6:10:12d::21)
 by DB6P190MB0086.EURP190.PROD.OUTLOOK.COM (2603:10a6:4:8a::10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3825.27; Sat, 6 Feb 2021 13:14:33 +0000
Received: from DB8P190MB0634.EURP190.PROD.OUTLOOK.COM
 ([fe80::fc76:b821:1966:db40]) by DB8P190MB0634.EURP190.PROD.OUTLOOK.COM
 ([fe80::fc76:b821:1966:db40%9]) with mapi id 15.20.3825.025; Sat, 6 Feb 2021
 13:14:33 +0000
From:   Sven Schuchmann <schuchmann@schleissheimer.de>
To:     Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>
CC:     Dan Murphy <dmurphy@ti.com>, Rob Herring <robh+dt@kernel.org>,
        "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: AW: [PATCH v2 1/4] leds: lp50xx: add setting of default intensity
 from DT
Thread-Topic: [PATCH v2 1/4] leds: lp50xx: add setting of default intensity
 from DT
Thread-Index: AQHW+wNFjslKsenf3karGguwydAae6pIFI+AgAEq5dCAABx0AIAAifoAgAE0EVA=
Date:   Sat, 6 Feb 2021 13:14:33 +0000
Message-ID: <DB8P190MB06344FAD6492E56D28A4E916D9B19@DB8P190MB0634.EURP190.PROD.OUTLOOK.COM>
References: <20210204143726.27977-1-schuchmann@schleissheimer.de>
 <20210204145201.GB14305@duo.ucw.cz>
 <DB8P190MB063482D8E38C0529AD16A4D5D9B29@DB8P190MB0634.EURP190.PROD.OUTLOOK.COM>
 <20210205102338.GA27854@amd> <c107d3b9-2141-7cad-837a-f8ef107df61c@gmail.com>
In-Reply-To: <c107d3b9-2141-7cad-837a-f8ef107df61c@gmail.com>
Accept-Language: de-DE, en-US
Content-Language: de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none
 header.from=schleissheimer.de;
x-originating-ip: [62.153.209.162]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: eea10882-cde3-4085-8ce8-08d8caa1254f
x-ms-traffictypediagnostic: DB6P190MB0086:
x-microsoft-antispam-prvs: <DB6P190MB008671BEA3C22008F7A2C2B3D9B19@DB6P190MB0086.EURP190.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: rMuSnh4al7vyAGBLR4bd9D10tLLgB7jb6zqVEEkE3nfEvF/M2PQ4+Ii4Ci0sJu1xyTSpDLLxhhFFPdoJBAVsw6ibgrn7WfUSmv7QwSQRIq/dIGGnoNmd2HDGLatHw+Y+wlawKf3CeQJM725X47BAdbwunz+fzzo21O4VbvaJ2dIcWSrG6qbg8PvI/O1ZoutSbl1eHyN8pWrD6wUZJsX2y5kZpMR1ZMyX5gcWBtbEQvK3Ow35993kwxOsmfQ73CWcbSsOKkmcA7SfyTT8J3H+ph06eiTIVsWqePYDQz5TeTLp6hLM15uy+P2Kdaa1oMaiEbkTJSFWk3qBWSkyQWxB+gXB2ZKkdYF/3sGSZUJREM3pi33XAVBxyhcG2YLmK38Ih28C0DKwD1nDHjqN5vSKpUI2iWE8OgDkaCnoXj4wgKih8TtuplI2WNHTcUaoqPHbYk+vafLqTp37Cjff6CfwUCraYjNy61md+n7Q6swMcCyF/chB2Q6FVaSICPUj+QjEjFNcfBzuTBfr+Xl0gt0F1Q==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8P190MB0634.EURP190.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(376002)(366004)(39830400003)(136003)(396003)(346002)(7696005)(8676002)(66946007)(26005)(71200400001)(186003)(55016002)(2906002)(8936002)(33656002)(478600001)(66476007)(66556008)(86362001)(83380400001)(4326008)(52536014)(64756008)(66446008)(316002)(76116006)(5660300002)(53546011)(6506007)(9686003)(110136005)(54906003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?4FyzVM2rnTOJ7bx+XX3h1o9KWr19aI6dUetOjJKMxUli22ZLsFDvQa+FIkch?=
 =?us-ascii?Q?gM3VwEcYME/k5rWNeiz0p5vCQmTYJBgQzJTRvZU31Sd8UBhopTKm0jfTtnXm?=
 =?us-ascii?Q?s0c6DyLBz1EAqyszf8eQWgbRfAGFpQ2MbbwqQThPxaDb655/kQC38JrAupMR?=
 =?us-ascii?Q?iLu8td5h7VWDGg3sOYcCVwTRDUoxodpM953IdGH9kggYRjvoYZK15ITORsea?=
 =?us-ascii?Q?8XQ+cZ6Z4PZOMzykubHCdQoU+HkOuCVHcNUm9JaUpX2nQScjMQobmlVZsG40?=
 =?us-ascii?Q?5yfsHnnbjW2iNghhNZUHXeqTTnSFv0g/SC3Dz/HjMbfCCvPXfEKu0iykiJd+?=
 =?us-ascii?Q?IefCsbxSfk7/m8wLFfEL5hdpJLzmqtA5QHxUZd8qMYjckdlOchOB2qP/hScX?=
 =?us-ascii?Q?YQlJlJW5KdFav9iBkpPJhFm4HNx0RijgfVZUu1Ip8CQrifMs4BxPC/Kp8hB1?=
 =?us-ascii?Q?o7LRc1CqT1+cbTIBCLrztQ9kAcqL78t59l0rOpyUEX7rcB26ZSj38rwQ32mD?=
 =?us-ascii?Q?WkjoqvApgnlSy8iL6c5sg1JsPCmzJNm5LNwZirxd/dBxieRA8uVEfP2Ul0+w?=
 =?us-ascii?Q?JtOAN75NzEJAVsn0gFlCGXJbeDnQJPkF3RIVR24jETDnAPJnY/R7F43BDmP0?=
 =?us-ascii?Q?/xvLbfzXwMQC8qqLLOOuqlVO1PiTgyFq7hMz9a9bk1UPj1MHZ2iCo+gpUNxJ?=
 =?us-ascii?Q?CXdwefywxhmAW+eeTMf4uqYbfpoewqdHSiGpPepfHQ2KIBqj2iEvxuY/n21r?=
 =?us-ascii?Q?JZB7N9ejhBrhWTmgfGmYBaptGiO7tSMjbocUuGchfCyLaiNrGJ/tBzHHv4HT?=
 =?us-ascii?Q?/jan9YU0++diVqkmCtk3dgDHVf9hC1m9n73k0WiJQvN3z0NceAXQHGBMztrD?=
 =?us-ascii?Q?b9KbE86+ON2lFMluaLsQYTf0NeUZe0wjBUPt0K4cJMO1+d1DXcRv6g2XaQWM?=
 =?us-ascii?Q?cLkgKw9g1CauiqLz0XQ8PEfjOp1scfgrNQiQCDHOqzhDsvoNC56dC8KKf5mC?=
 =?us-ascii?Q?jSgMCfWZPb1uHmQDS4kqXxrhRooWdzqOtamV3Hms4ww57NZHO3KXTVQeA7Z3?=
 =?us-ascii?Q?QcJCb93NQY7vApabNyHUVcRk/hVkSlwjeLnkl4FqsZm2WRXozDGcDauG/XME?=
 =?us-ascii?Q?S9TnSd7RCMNnAqBl+jAhk+xgDNCBINfZB88V0jj+LYEUL19o/OgbvVYgC6X9?=
 =?us-ascii?Q?ih6NVybMTTqQ266Fk/xBUqSoQ/7qbRwDq8msmf7CbRIswokdMbAMhwVSiovC?=
 =?us-ascii?Q?wg/Ha7+/ZbGqls5ZOIY4MI9A9oy0NqnNh7kPifAKTx+3whN35ZdZOP+lU7a4?=
 =?us-ascii?Q?kBGRf+E3vurLLIBRxFFOIc+P?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: schleissheimer.de
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB8P190MB0634.EURP190.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: eea10882-cde3-4085-8ce8-08d8caa1254f
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Feb 2021 13:14:33.5907
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: ba05321a-a007-44df-8805-c7e62d5887b5
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: MW427SsD9GzfJlWqwJkdMhfyDAVSaE5zrwi2fYgTk6Gy0G+cNYuYpkhp90dPossBJXWX9VimK8Fq6CW11X0GdydAYzAefhC4fKdoLKOkNyM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6P190MB0086
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hello Dan,

> Von: Jacek Anaszewski <jacek.anaszewski@gmail.com>
> Gesendet: Freitag, 5. Februar 2021 19:37
> Hi Pavel,
>=20
> On 2/5/21 11:23 AM, Pavel Machek wrote:
> > Hi!
> >
> >>>>       patternProperties:
> >>>>         "(^led-[0-9a-f]$|led)":
> >>>> @@ -99,6 +104,7 @@ examples:
> >>>>                  reg =3D <0x1>;
> >>>>                  color =3D <LED_COLOR_ID_RGB>;
> >>>>                  function =3D LED_FUNCTION_CHARGING;
> >>>> +               default-intensity =3D <100 0 0>;
>=20
> How will you know which array position is for which child LED?
> I presume DT child nodes are not guaranteed to be parsed in the order
> of declaration?

I tried to fiddle this out, but it seems Jacek is right over here.
The multi-led definition looks like this (from the documentation leds-lp50x=
x.yaml)

        multi-led@1 {
               #address-cells =3D <1>;
               #size-cells =3D <0>;
               reg =3D <0x1>;
               color =3D <LED_COLOR_ID_RGB>;
               function =3D LED_FUNCTION_CHARGING;

               led-0 {
                   color =3D <LED_COLOR_ID_RED>;
               };

               led-1 {
                   color =3D <LED_COLOR_ID_GREEN>;
               };

               led-2 {
                   color =3D <LED_COLOR_ID_BLUE>;
               };
          };

But it seems that the color definition of each led is ignored.
By ignored I mean the driver does not take care which color
is at which position. So if I change led-0 to be LED_COLOR_ID_BLUE
and led-2 to be LED_COLOR_ID_RED nothing will change if I write
from userspace. Could you help to clarify?
Then it is even hard to know which led to set with default-intensity.

Also it seems that the enumeration of the multi-leds should
start with multi-led@0 (and not 1 as in the documentation).

Best Regards,

   Sven

