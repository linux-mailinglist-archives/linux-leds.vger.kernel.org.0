Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 127DC65CEBC
	for <lists+linux-leds@lfdr.de>; Wed,  4 Jan 2023 09:50:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233699AbjADIt1 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 4 Jan 2023 03:49:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44222 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238967AbjADIsr (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 4 Jan 2023 03:48:47 -0500
Received: from DEU01-BE0-obe.outbound.protection.outlook.com (mail-be0deu01on2124.outbound.protection.outlook.com [40.107.127.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4B4261DF19
        for <linux-leds@vger.kernel.org>; Wed,  4 Jan 2023 00:47:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ty0PsPeJ5AqH38XWCTu7V9ydjvBJ3b+Q1P3+WUFVgDszkiRwPk4fZz30Ld67jgzJ+d26XiANxJ58qFnlm5eTOo9BkiDAn2u5WR0eN0Ci4FXbUQInY1C1yJ9o0gFata73JoF2/eI4r5bKVlQg1Pa2EYvOvsETqpqEflUjIoFUJUIJSWU7qRyugwcPQCxuuMufo+XEKaELl+SCVEHGjJdMCYmVsNBGLhkbW2w4JKUJC7MIP3oiHJlDkhub6DwGDftxJroYpocoH0+9ZCIglZXjbkXrBLXiO7wJKzy+e94bOUcg1cZRlZ49f2yELgrNpMR4MPxHMsezD3vfjTWRQc9I4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q3MYE+7rxTX/U9NloGKSqJc9yoTOgA30YpSjFphBLlw=;
 b=GPxf8vKb9jm69x2bTQwqdljWYU2AO4y40gqC4fl0BoV0zu1W9yKeIQ5/KGhzEZgxhDrLcfOowpzQbVcxlnqWVUftvN3yzCN036T1xobeXbrBq5BJI10IbfNcSN7ExT1MjmOQ2L3FGcVn5jwncyt8bkFs7MIW5V70xNxEtAst1hOCWKm2sm0XnhMJbbIGf8/GQGHqbfGAr0T+E/z3P22goWhnOArel4TvOKMnuhFKsnsi7TaCUrhdFpvXgQ/YApz5AQnNcT5Qc4TMnZ0HjEkEHBvoKKafB+R5L/D7wGmE0HZF3rjV1zuAcuNg+QJOZkDXKYFfYmnSBl5F8i6YOnNJ+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=schleissheimer.de; dmarc=pass action=none
 header.from=schleissheimer.de; dkim=pass header.d=schleissheimer.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=schleissheimer.onmicrosoft.com; s=selector1-schleissheimer-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q3MYE+7rxTX/U9NloGKSqJc9yoTOgA30YpSjFphBLlw=;
 b=g5/O91Ueh/Njvqr+RZ0K5ldgu1vTABlXFvhhD1nKNMrhTDfrjj6a7XCMr4stBoweGgCIhE1jclolSICLlFJtt+RJE2/pnFPqIFHYwalC3z1JVegIbUVUHLhxHpGgT4Yzmh1gA635s9ExihRWZ9xWQXtAKpQSL3KLfHTjT9IE1OI=
Received: from FR3P281MB1552.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:6d::6) by
 FR3P281MB2909.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:5c::10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5944.19; Wed, 4 Jan 2023 08:46:58 +0000
Received: from FR3P281MB1552.DEUP281.PROD.OUTLOOK.COM
 ([fe80::97c2:eeb3:3a72:31f6]) by FR3P281MB1552.DEUP281.PROD.OUTLOOK.COM
 ([fe80::97c2:eeb3:3a72:31f6%7]) with mapi id 15.20.5944.019; Wed, 4 Jan 2023
 08:46:58 +0000
From:   Sven Schuchmann <schuchmann@schleissheimer.de>
To:     Sven Schwermer <sven@svenschwermer.de>,
        "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>
CC:     Sven Schwermer <sven.schwermer@disruptive-technologies.com>,
        "jacek.anaszewski@gmail.com" <jacek.anaszewski@gmail.com>,
        "pavel@ucw.cz" <pavel@ucw.cz>
Subject: AW: [PATCH RESEND v2] led: multicolor: Fix intensity setting while SW
 blinking
Thread-Topic: [PATCH RESEND v2] led: multicolor: Fix intensity setting while
 SW blinking
Thread-Index: AQHYiio5cUIAH34jdkeAO6gdFehVp66PHYCA
Date:   Wed, 4 Jan 2023 08:46:58 +0000
Message-ID: <FR3P281MB155254EF0B8D7644BE287BB0D9F59@FR3P281MB1552.DEUP281.PROD.OUTLOOK.COM>
References: <20220627133110.271455-1-sven@svenschwermer.de>
In-Reply-To: <20220627133110.271455-1-sven@svenschwermer.de>
Accept-Language: de-DE, en-US
Content-Language: de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=schleissheimer.de;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: FR3P281MB1552:EE_|FR3P281MB2909:EE_
x-ms-office365-filtering-correlation-id: 74586434-4500-400e-e044-08daee303d50
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 2bCKc0xVqyyuAFWsWfWBM4pJv43zypCLxUBFo6fSOhuU4agm6+791wR4lG7+xaKLDyckfaeAr7xVrMuJXlzc7g+5yb+3NcBsyDTXKbXj1r/5Fxvv/Ld10nk5lw/1VuoSDIQCAIIYBI3Flv51vThgMbzRNuEBiH7W8FLlJWnksYaUbcbxg+k4HSY0F7J5girHkf7XImzzSZZuxukH/AzR9hYRr7siY+plvZZ0bFNNYfJ2tjsFeCtJJ94iK0ilkp87G7kyAs1ErGJBkgF+dnaoiOr6Bb8TiCGzzC+YpQJPbCs56q7mEvf+OAHBxTf0W4oAmI7LIw/zae2jRrh6ZLf4LKMyewev0HUHGT6yC3S0uY6hZHVM2wkqfilY1UvsqWIbqudqD6vuVsYPmV2de74mLGKoFFyfEnHNBUWmZlz6RxYgdCHXrEB0HzfzaujLeo3ap5iCK/DebsnCrndb+lDCMtcbS6A0P3nlE8WbEu5oUD3UTKnXD/oCgGVMCUaCMk2PKLnzQNblTcRzM2HY1ka74wlRpqDJMiMXSKMafqmmnxgysdMAQNaGsSsCH4h9EV+iavB8+1t4fhUSdNYvq97FQHvIsMfxwNGloXTZ5CTg3OKTSE3BMAY6IAif4Xg9SnImiM/D5WcLI7PgCTB58SC2F7TZ2Gp9SaigIoULNH5+ksv3IfakiRWdl9Y9REUSjUcjyLrHLE0hD0hVQ8WfGFFjzQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:FR3P281MB1552.DEUP281.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230022)(4636009)(39840400004)(136003)(346002)(366004)(376002)(396003)(451199015)(33656002)(38070700005)(8936002)(8676002)(4326008)(66556008)(64756008)(66446008)(52536014)(76116006)(66476007)(66946007)(5660300002)(2906002)(38100700002)(83380400001)(122000001)(86362001)(478600001)(316002)(71200400001)(7696005)(54906003)(110136005)(55016003)(41300700001)(66574015)(9686003)(26005)(186003)(6506007);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?DYdpKLmFlkYsLCq+UbJfRjY/8PjMt0BX6us6kwaf+mx9x9ts6/3qywrrqf?=
 =?iso-8859-1?Q?tyzckR8PeosXtZku+81GmR47eYVABcVh4Bx+o59bgtLBI2srIee6oJKUtH?=
 =?iso-8859-1?Q?oKaZkFM1uIC8HkMuwB/hPsQaNgXxA7uvRcXMokdSVkOMcgsMtzLoS10r61?=
 =?iso-8859-1?Q?LgYUYvOVxPs7co+SCzDrdEtKOqW+4XrbIQDtk0ztkJOXxeuosLCxQA6QLi?=
 =?iso-8859-1?Q?2Fs5wa92lQ5iOIyzO6ZbtwoS/bVhUGTHx5hEo73AfcP0I8diGS6o57hrZa?=
 =?iso-8859-1?Q?mF3c6G0XN0fvvGsWdDx542fU+QJi3fn0iN9oDb710LOWnjjnGzw4yr6g0s?=
 =?iso-8859-1?Q?mZOKzs3+OlGyyhW7dZKzRSTNviAOJbuTrEAQNxqICHER8HeX6RbAxAwflu?=
 =?iso-8859-1?Q?Z3BEajxk5R78lltqxgU/nWPPEqNBTPPeLdyGPbpdGIOghTyEXc3ccYRW6v?=
 =?iso-8859-1?Q?aPbs7xCCuW+9ZhrdjRoJOE4+DvSQm/0zab5gnoZsGMNBCGFIuXcCypv6lI?=
 =?iso-8859-1?Q?oI9XYT7OmPyIahxF4c0PVFrkx7CSp0+YPf1t8XrmDohP2vVMpe9/uHeqN8?=
 =?iso-8859-1?Q?Ru1kaQ9XQI+NJjYtjs+E3Hi4sUVkJ/GkTnKIqfwYCAOAumrAc6jDJNnSE4?=
 =?iso-8859-1?Q?ePLtplYg760fg7gHIkGnvCbOQ7wU9GhXEGTBQGyJCbNj/5jehhI3ets2vZ?=
 =?iso-8859-1?Q?vQbKLelRcFBPSicwHQx3tRwTYyauHp2QAbYx42hKK8StHLKLEZ9cVxd/nb?=
 =?iso-8859-1?Q?qVvZsK0DKtsE/5T6jBmrF7L7++BBv+/QERHmkIg66bDskkB1BL5PZHxyJ5?=
 =?iso-8859-1?Q?xzXIT1elYQrGu1i1L0NfmdNSMR6Wr3dhQrVSyOslGRiIiR/pzCbH4REOQT?=
 =?iso-8859-1?Q?6EFvrUBOeNKKgoSAA2Iz3cJ1Z2LGZuN5KeVDcZfW4JqFoSACHapAX3wCBv?=
 =?iso-8859-1?Q?WM+HEM+h1znwjg4sbfIj8P2jy+fSWQ0RrdN2COTDSVy2H36RyYKqdbUfdB?=
 =?iso-8859-1?Q?m/YlhrTzZr4FxV8mQ5DlxtbY7ZGJ5+eySu/wwDcIBHx29KLLRtJitTmori?=
 =?iso-8859-1?Q?mk0Iz9GTPz1UA5MoBJE7aKyoGa/l+bYpS2dsiMc671lGcsZlh2hW6X/ESU?=
 =?iso-8859-1?Q?PYzsBH/O8u848qBffwrktl0CNvbEM29dg1p+Xl6vMCUm0QznW7n2lZ6URI?=
 =?iso-8859-1?Q?nygu6WivUzRFSRFVhSJl5/B6uuJkvlskR4NwkmP1ij+jx8D+uNgmKVpKKY?=
 =?iso-8859-1?Q?J+2MtRu9T9R4OMd3EYBfO9MTQ+zBGukuC/W79RowrJPyb52UM16UmTrR7c?=
 =?iso-8859-1?Q?NxftLDTmulNxTUi47oeOeuAOzlHKLTLbzt7lYKpcH463YS1jNFWH8PNFfs?=
 =?iso-8859-1?Q?E1ZXqWmB7aGGTalJUwk1cqoWv42mKvK5UYs/dcq35kKz/Bq98XuYgAK5kV?=
 =?iso-8859-1?Q?FCrIS3mbgNthM0StKkVL/+zE+YplN4PTp0msTyUY+39XppnVQ1V/nkzk9E?=
 =?iso-8859-1?Q?zXs5kNpjjatUlvdIz92k6O/f/tvywurmAKNBdC4b2hjZnoD2FjLk57KAKE?=
 =?iso-8859-1?Q?4ddSAMmkquQ7k2o4soior2bEPDINauesrtchnhLmOihlB+xrr6hQiSQxs2?=
 =?iso-8859-1?Q?wiYooHZWJ94FmFMjTzVobB5CZF5T35+0lFwDrv8dfVdQwwwQmY0a/mlw?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: schleissheimer.de
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: FR3P281MB1552.DEUP281.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 74586434-4500-400e-e044-08daee303d50
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Jan 2023 08:46:58.0429
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: ba05321a-a007-44df-8805-c7e62d5887b5
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: w1SigITamj1JpgM8NWikjUZ+hYuNerFLEgk/i6KtJIrPmfbm2R1yN2sEbpYsDmXc551Xu6TtS4ZE/xo85LEpJRQAubt5/tp3BVwflz7Qe0k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: FR3P281MB2909
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hi,
can someone have a look at this patch.
I think it did not get accepted.
Any complains about this?

Regards,

   Sven

> -----Urspr=FCngliche Nachricht-----
> Von: Sven Schwermer <sven@svenschwermer.de>
> Gesendet: Montag, 27. Juni 2022 15:31
> An: linux-leds@vger.kernel.org
> Cc: Sven Schwermer <sven.schwermer@disruptive-technologies.com>;
> jacek.anaszewski@gmail.com; Sven Schuchmann <schuchmann@schleissheimer.de=
>; pavel@ucw.cz
> Betreff: [PATCH RESEND v2] led: multicolor: Fix intensity setting while S=
W blinking
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
> Tested-by: Sven Schuchmann <schuchmann@schleissheimer.de>
> Acked-by: Jacek Anaszewski <jacek.anaszewski@gmail.com>
> Signed-off-by: Sven Schwermer <sven.schwermer@disruptive-technologies.com=
>
> ---
>=20
> Notes:
>     V1->V2: Change title, add tags
>=20
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

