Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0E35552BC66
	for <lists+linux-leds@lfdr.de>; Wed, 18 May 2022 16:16:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238459AbiEROGe (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 18 May 2022 10:06:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38094 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238492AbiEROGb (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 18 May 2022 10:06:31 -0400
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (mail-eopbgr80137.outbound.protection.outlook.com [40.107.8.137])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B022412A83
        for <linux-leds@vger.kernel.org>; Wed, 18 May 2022 07:06:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=G1Li+f90zHQgApzxRmYEImF5VkuHxcFxZplzbSCO8DWvnRH+DUw6gCMe5aJLZWKfpHxesHXNCh4mutlWidNFbYreGHuNrdb5+NYsuMzAA5PxPBRNQ09MlH6SbBWOyeq9zNHro1yi5u3IdEKBWUHZ5JGOocTjGNmKr5NtOO1blCYcu0FMV7WVPdbztsKTSus/c7v0sfj21RULcJE6Gxnew3nBkH/lWzwiG2F5O0pRYTmQdcAOxnaULyIq7hZB6bJqXdRmrJJJULSA1sAsrp8IFVzTcAU9vwks+dM5OcMSNV8JYMwHg5uJhLJAIpv6QgEujMUtnRBkhMyyaktBgiWbSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+j++VbHsY8VDHAPyybRqx9az1TzW9T5ddNbDiXdX32Q=;
 b=KCAQ05yOM9VwqQU6zfbXY6Cy/2X6GdDiTAYA7UdZmXbHiO51eCwowURRCEaaK3035hZRVwsiBT9lG9KCrEtJzsSEAvkYvTX/ZAzqehKqzQCgNoSEon/zl/ETiC8iuumEf52ZYjr/eS7VLjntcrU3F6RNnILSXdMRELlgeeFRWU5QRbNR3R7/4NQO6/cpjpIZB7i1mgxH9vqXZEXQWcVqYwvHFvndFqS2VJNJknQcDmuKd+qFQzp4eaXPDTt2yAU1wm0QSSVornLBvPI59ZQ6FzI/D9of50AvLAR1WmGlLaunBagzipFBl3GRxKNHWIE8Zk40ICxLj8newRFkxPQGWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=schleissheimer.de; dmarc=pass action=none
 header.from=schleissheimer.de; dkim=pass header.d=schleissheimer.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=schleissheimer.onmicrosoft.com; s=selector1-schleissheimer-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+j++VbHsY8VDHAPyybRqx9az1TzW9T5ddNbDiXdX32Q=;
 b=F4nTLRyIjyXZGQ3suKOzKZ0F8csAfzswR0JzeGmHC+lHKxkgPWjd6OITIK5PMW9z8+qoFkKBipKghm/M3nk1xFKkUcoZM5OYdwnNM99XBhr/G1B+bUeFGgsUTOutVQL0ZLXoNVfeaHRljzQYAdMr1lIxKExf6rl4J70eUyVWfmY=
Received: from GVXP190MB1917.EURP190.PROD.OUTLOOK.COM (2603:10a6:150:6c::18)
 by DB6P190MB0200.EURP190.PROD.OUTLOOK.COM (2603:10a6:4:89::16) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5250.18; Wed, 18 May 2022 14:06:23 +0000
Received: from GVXP190MB1917.EURP190.PROD.OUTLOOK.COM
 ([fe80::d51:5e16:ae67:ccac]) by GVXP190MB1917.EURP190.PROD.OUTLOOK.COM
 ([fe80::d51:5e16:ae67:ccac%5]) with mapi id 15.20.5250.018; Wed, 18 May 2022
 14:06:23 +0000
From:   Sven Schuchmann <schuchmann@schleissheimer.de>
To:     Sven Schwermer <sven@svenschwermer.de>,
        "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>
CC:     Sven Schwermer <sven.schwermer@disruptive-technologies.com>,
        "jacek.anaszewski@gmail.com" <jacek.anaszewski@gmail.com>,
        "pavel@ucw.cz" <pavel@ucw.cz>
Subject: AW: [PATCH] led: multicolor: Don't set brightness when blinking
Thread-Topic: [PATCH] led: multicolor: Don't set brightness when blinking
Thread-Index: AQHYapBnIsUMtbKb8kiIEkKbXcq8/60kq3pg
Date:   Wed, 18 May 2022 14:06:22 +0000
Message-ID: <GVXP190MB1917FD350EB6BF056D57D621D9D19@GVXP190MB1917.EURP190.PROD.OUTLOOK.COM>
References: <4f672091-07da-8815-a00f-659f5a478b0e@gmail.com>
 <20220518082216.160413-1-sven@svenschwermer.de>
In-Reply-To: <20220518082216.160413-1-sven@svenschwermer.de>
Accept-Language: de-DE, en-US
Content-Language: de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=schleissheimer.de;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 4f57a35b-3fda-4eb2-ecb1-08da38d7971a
x-ms-traffictypediagnostic: DB6P190MB0200:EE_
x-microsoft-antispam-prvs: <DB6P190MB0200B8E2F2192582F618129ED9D19@DB6P190MB0200.EURP190.PROD.OUTLOOK.COM>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: D83QzNlci5mNDurqllvfFln9QMjDm9TvffM6ozqesa2BvdH6GyAxnzsf0FnWrCF0DQ8k5PV3ZltI6Ueh5ym9z3yufJHv+Fs7b6C9wXT5DC1xixXzTeObLiDFNNH7qLVdfGuNzXWUROjvxJsAl39lpXWLZii9QW/pGmo/O2mtJqzgCop4KaSaVaRexblwIxRIL4Daav5YcsWE8hvhnot1s/cuRxyKWtHIaEeZna3yBIWbiJCT8DfEVLZutFBqC5l1dkxCqvyFTjxsXv9j7sMtUFiH9MwKGEqMpgYs/hybSETwI5+OKsfLNWbwtw8N6yx2Pn/8CUG78Ba8ZCMOsT00NWAZva3ehAu9BMb/baQ6ZAs6tpodYgIiKPBc+ox51JlOYzaaVMpBBEpB6wPkWLYzJqGUefWR9Qgf0uePSksuZlNI4GUypVU3et4ex8nFrUUisYyWhfpjidHm65MWxlM+B3H2Cf+3OTn1LgKCF0goqdPeDMSJFDclfpgJ/ASajh2Bp8aO4VO64SIjzD1C605MCx5s2EzoESfSwis7ER1gKw8xj5+TFOHyiKOSUoBaRlxHVhnZfV9k77j/anfisVm77XCxko4+clSmcv26A7ol70w0ZRJQ7FoakClAvQ+DwhHQ1NZNQisZsqc+ll8qnYzJrzR3auWKdXJpLRLVQKZuT06/+75YE/4asW/W4tUCEmB7Dh1fbyB7Ll98g9p5DOedJA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXP190MB1917.EURP190.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230001)(4636009)(396003)(376002)(346002)(366004)(39830400003)(136003)(508600001)(38070700005)(38100700002)(71200400001)(66574015)(6506007)(186003)(110136005)(66446008)(83380400001)(9686003)(26005)(7696005)(86362001)(316002)(54906003)(122000001)(8936002)(66556008)(2906002)(52536014)(4326008)(8676002)(64756008)(66946007)(66476007)(41300700001)(76116006)(33656002)(5660300002)(55016003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?iY3Y4zKIrdtiTBURgBdLrwmTG7AUstQEg58wo8wv7fiykqMyzPhcrd/y65?=
 =?iso-8859-1?Q?98od8aFokMmqG2PRAqML1PdJfciQA8d9uchPy1zJeQXl/+Zvd9xtYMEx7c?=
 =?iso-8859-1?Q?pJg4/MiJK+7liPtzP8qxHeeCqDov3pufr3C2eC1okzbCfrl1NwrdwMwSw9?=
 =?iso-8859-1?Q?/QGZuzSit9JolvDvOBP8Uhrfoq0Ax+cOFvOjmVqXiaHDGKceUm4mqcTC4J?=
 =?iso-8859-1?Q?/lKeRTOnXdWAwkI+HJ8ecWT1CthXd6c1wjskHloC51rfoFyPgNjuVupf2v?=
 =?iso-8859-1?Q?zgBXLkd4gEJQ9h9lBzJsg+PWMf8hBWINAgmqTuIuGY6TQrA7fyf1sS58Pq?=
 =?iso-8859-1?Q?s2GnKzTg+kavHGsAFvb1aaw5TrBQJSvNJB1e7c9mgBYjvvFkK7Us5hurH1?=
 =?iso-8859-1?Q?gVRyGDWPIyk5HZlx9dGOHfC+2iiJy6uX2eAGreIn5teYGFqywlVuXjpeYK?=
 =?iso-8859-1?Q?R2F/PHKx3vtYJWRS1iRdMhLRE+Wr6sKT2vb972un2uFtMaozck93Bz2rWr?=
 =?iso-8859-1?Q?ba/o8ZHiL1ucc17yve3v7nzJKO0bAatvMt2UDnK6jXY1MZpDOEtso8bwUA?=
 =?iso-8859-1?Q?+QhtGRx91ng/D0WzZtqUAtG7GKwUys7mBa2C1Pc0wBK49cekkIC5ro+Sac?=
 =?iso-8859-1?Q?2lzuegJ/hi96hmuvGwr1oBatFctqK/ecDq6ZD/Fs8EXwAJEDCG94nB35/P?=
 =?iso-8859-1?Q?Om05eRVYd9OCXyRo8OFRw5HN7mDvGzhKdw6TIiH42JSSssZ8DnlxWOgQxu?=
 =?iso-8859-1?Q?rKRq5lXQErXPWQTF2L8COs/nBoPDvTiWTXG4IQ3KI0wgf/Pson2ljh01jn?=
 =?iso-8859-1?Q?GSYbU5B9dT9rivhr0y3L/oN+JMQOQbYAG/08JaKxwNoH72Y8Ruv+4BXTYr?=
 =?iso-8859-1?Q?TyXIY5N1iXNJZxCaH1WZktuJsuM6jDzuMs+Tr5Icg6bLsGdR8P85eJKqh+?=
 =?iso-8859-1?Q?XO9hdSlDR2PkbEs23wVfmqmJTeBTnrZRNvlfvjnGiZgZAvBk9BB4mCuWuH?=
 =?iso-8859-1?Q?ExdkqkuCbHBdww9OnaxBg8YOBXJz7bYFxuXpLPQwjFCeLCETjAkr9VkyKI?=
 =?iso-8859-1?Q?DrB83C0tok0o7qeNrEDwwKMXqkU25rhiLH0b59pDGhs0RhN8VTVjGsXej8?=
 =?iso-8859-1?Q?NOjiri/4pn0LwUKWG0LHMwGubqoMtTCaEqOA3oP6yzsB+p+DteP/A5JBAg?=
 =?iso-8859-1?Q?zUKRaZL7ynT9ZKfToAcrd7xtvgK/Fro7589iEUsHR4WiuUyo19Uw23m9Yh?=
 =?iso-8859-1?Q?7igUIFwDwpKaXjwtxUTH01VoYtrrpPg2nX2WhosmHdSr58/TAS8iBK8eZj?=
 =?iso-8859-1?Q?sckWPD719H+eq1FVIpDmGr6kN8zjJ3cestxT9c7aulCT6fDmACcyC5mwdx?=
 =?iso-8859-1?Q?xk8cUSY51JIwHAh6pux6TV8xN32Cdp+57neR4Gl/JrJ+vOyqzARiqyEna4?=
 =?iso-8859-1?Q?dMSZIjSihTh9G8A9cn+dx/T0nN2JPPp9GQbPCKfjGGqHoSYxB9DEs9P8ud?=
 =?iso-8859-1?Q?gCkMTLXltwRpjmQFZVFkeu+GKksPLbFnoYPs9Cme55iUuXZjhruDAe5uBC?=
 =?iso-8859-1?Q?RVP3U7X/lOXd2y1Mu4PkioZfwCvz+GzgptRQqKD/YZ+bE/Tu2zcq4vgamm?=
 =?iso-8859-1?Q?ZuezS2epYv06lHbYeBBZNH9d+FoJ6VM7qEIYseafi6/bcn6lwCyxg4QsU4?=
 =?iso-8859-1?Q?NyBcO8/NQ1qYuBYYKdkQHTRQW2OZAgykCHKIO9m4s35RDpOk57B9FiyIsz?=
 =?iso-8859-1?Q?Vc4nN/87TJrAI8Mm7dv3ld2XQPT4JrmUY/TXBTHRHIxHssh0Z8VXZo4grj?=
 =?iso-8859-1?Q?qA0rcVaCXvNL8sL+kRdFsuPPDwNwyrU=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: schleissheimer.de
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GVXP190MB1917.EURP190.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f57a35b-3fda-4eb2-ecb1-08da38d7971a
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 May 2022 14:06:22.9969
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: ba05321a-a007-44df-8805-c7e62d5887b5
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: d/E8qfgfJllhVYZkucTTJYrBh/VVlNpOA7/lce/IWGiyq3LDA3UXkfEt2Ue7HfNdUb3KIyC7VbRZOJFeuDh/Sy0lGjyQGJIE/fy7AbtGbaY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6P190MB0200
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hi Sven,

For the patch: tested-by Sven Schuchmann <schuchmann@schleissheimer.de>

Changing the intensity or brightness is possible in on and off state.

Sven

> -----Urspr=FCngliche Nachricht-----
> Von: Sven Schwermer <sven@svenschwermer.de>
> Gesendet: Mittwoch, 18. Mai 2022 10:22
> An: linux-leds@vger.kernel.org
> Cc: Sven Schwermer <sven.schwermer@disruptive-technologies.com>;
> jacek.anaszewski@gmail.com; Sven Schuchmann <schuchmann@schleissheimer.de=
>; pavel@ucw.cz
> Betreff: [PATCH] led: multicolor: Don't set brightness when blinking
>=20
> From: Sven Schwermer <sven.schwermer@disruptive-technologies.com>
>=20
> When writing to the multi_intensity file, don't unconditionally call
> led_set_brightness. By only doing this if blinking is inactive we
> prevent blinking from stopping if the blinking is in its off phase while
> the file is written.
>=20
> Instead, if blinking is active, the changed intensity values are applied
> upon the next blink. This is consistent with changing the brightness on
> monochrome LEDs with active blinking.
>=20
> Suggested-by: Jacek Anaszewski <jacek.anaszewski@gmail.com>
> Signed-off-by: Sven Schwermer <sven.schwermer@disruptive-technologies.com=
>
> ---
>  drivers/leds/led-class-multicolor.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/leds/led-class-multicolor.c b/drivers/leds/led-class=
-multicolor.c
> index e317408583df..5b1479b5d32c 100644
> --- a/drivers/leds/led-class-multicolor.c
> +++ b/drivers/leds/led-class-multicolor.c
> @@ -59,7 +59,8 @@ static ssize_t multi_intensity_store(struct device *dev=
,
>  	for (i =3D 0; i < mcled_cdev->num_colors; i++)
>  		mcled_cdev->subled_info[i].intensity =3D intensity_value[i];
>=20
> -	led_set_brightness(led_cdev, led_cdev->brightness);
> +	if (!test_bit(LED_BLINK_SW, &led_cdev->work_flags))
> +		led_set_brightness(led_cdev, led_cdev->brightness);
>  	ret =3D size;
>  err_out:
>  	mutex_unlock(&led_cdev->led_access);
>=20
> base-commit: 210e04ff768142b96452030c4c2627512b30ad95
> --
> 2.36.1

