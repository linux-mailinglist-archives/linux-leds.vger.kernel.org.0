Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 12E5C6A7CE8
	for <lists+linux-leds@lfdr.de>; Thu,  2 Mar 2023 09:37:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229613AbjCBIhw (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 2 Mar 2023 03:37:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45452 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229775AbjCBIht (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 2 Mar 2023 03:37:49 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 359533B237
        for <linux-leds@vger.kernel.org>; Thu,  2 Mar 2023 00:36:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1677746211;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=HdapkjpDoBw6uY9nNsxcFSbOgHJLzCrit/91e8sQYuc=;
        b=SHvMCJvGdCR4XE73m5FHjKDYEUfzxkD5xYoCFqqUF8uxkRzm18R1cjl7sBQ7CK2tOSFcnx
        sWakM3eMEkPAvZ2ZlrKYIu2paw2O+ZdAdTMrx2mXutv21/pqxWvWGVZZ1k80uk2G3ounjt
        QzvfEXd1ZXlUa3Gza4/cplgsQA3byj0=
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com
 [209.85.215.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-468-BIIaSxfAOQuZgrik3yKdog-1; Thu, 02 Mar 2023 03:36:49 -0500
X-MC-Unique: BIIaSxfAOQuZgrik3yKdog-1
Received: by mail-pg1-f200.google.com with SMTP id d18-20020a63f252000000b00502f11fb2fcso5295635pgk.6
        for <linux-leds@vger.kernel.org>; Thu, 02 Mar 2023 00:36:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HdapkjpDoBw6uY9nNsxcFSbOgHJLzCrit/91e8sQYuc=;
        b=bTewSmeX0QO/o/ke1lvxA+zlOVsi9O7CVDyvXN3M6Blz9kMzTIBlvmYRu0YJKyw9FO
         3l5XkZsDDhE0tbH0PWxKhA1JqXIlbhR7GLaN13QKtIwIlQI1pArATKQcWVIUWPTj2QFU
         YqbNeNcHQhdOJA6+EZVaToz/1SwDInohvM+gkoRW0orlUairNx2N2AGoe4qtm5Rcy7Bh
         yA0F6jFqFaA53+gq5rwzHINJNDvrhUutYh5TxL4Q9lj3mszazO0rFw0EbXpZWNvqM30W
         AsxETcy0QInXdFDSpL5Nrr2LyDMhd+N2rnVfDq/Crs1s8toN94wIQaYCXasaMFC433LL
         IGmg==
X-Gm-Message-State: AO0yUKXtIHfk0osQBLq0cVZTTkWg4yv7LY73Q1KxAZhmNZ7PK8tm1/ET
        awFl16q0+Axfi4ZW+vMp0wypHwOYtHVBsh8loe5wfqzXmjKqcrNvuAuHGSr6RNnzsfzji/t8jRj
        C7fTNJuKKlq6AzFRYmqhEYq3k7WeOEgA6fXzU3A==
X-Received: by 2002:a05:6a00:212b:b0:5d9:27a5:6125 with SMTP id n11-20020a056a00212b00b005d927a56125mr3547213pfj.6.1677746207905;
        Thu, 02 Mar 2023 00:36:47 -0800 (PST)
X-Google-Smtp-Source: AK7set9zZZ1h9MsSH9swnlX040ejbyFr5lx7EICWq9igddDdulOEGvEMQ5btQqq3C0S7c8DCzCbOJ4lIXSc8ukKHbzw=
X-Received: by 2002:a05:6a00:212b:b0:5d9:27a5:6125 with SMTP id
 n11-20020a056a00212b00b005d927a56125mr3547194pfj.6.1677746207209; Thu, 02 Mar
 2023 00:36:47 -0800 (PST)
MIME-Version: 1.0
References: <20230213124520.1635257-1-hpa@redhat.com> <20230213124520.1635257-4-hpa@redhat.com>
 <2a0f7d36-ef0c-1c29-5f01-6115275e78dd@redhat.com> <91a754b4-6bfb-e0a4-7cd1-0a58b3df0ce3@ideasonboard.com>
 <b2781b9e-208f-07be-e618-d1c6f6f9abec@redhat.com>
In-Reply-To: <b2781b9e-208f-07be-e618-d1c6f6f9abec@redhat.com>
From:   Kate Hsuan <hpa@redhat.com>
Date:   Thu, 2 Mar 2023 16:36:36 +0800
Message-ID: <CAEth8oGaC7767ytdbCpvJYPVEre-NOH_P7_AcA76orVg-7ZX3g@mail.gmail.com>
Subject: Re: [RESEND PATCH 3/3] leds: tps68470: Add LED control for tps68470
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Dan Scally <dan.scally@ideasonboard.com>,
        Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>,
        linux-leds@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        Daniel Scally <djrscally@gmail.com>,
        Mark Gross <markgross@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Wed, Mar 1, 2023 at 8:37=E2=80=AFPM Hans de Goede <hdegoede@redhat.com> =
wrote:
>
> Hi,
>
> On 2/24/23 16:14, Dan Scally wrote:
> > On 22/02/2023 16:53, Hans de Goede wrote:
>
> <snip>
>
> >>> +
> >>> +static enum led_brightness tps68470_brightness_get(struct led_classd=
ev *led_cdev)
> >>> +{
> >>> +    struct tps68470_led_data *data =3D container_of(led_cdev,
> >>> +                              struct tps68470_led_data,
> >>> +                              ledb_cdev);
> >>
> >> This container_of only works for led_b not for led_a.
> >>
> >>> +
> >>> +    if (!strncmp(led_cdev->name, "tps68470-ileda", 14))
> >>> +        return data->brightness_a;
> >>> +    else if (!strncmp(led_cdev->name, "tps68470-iledb", 14))
> >>> +        return data->brightness_b;
> >>> +
> >>> +    return -EINVAL;
> >>> +}
> >>
> >> Instead of this strcmp magic, please just use 2 separate
> >> brightness_get functions (thus also solving the container_of
> >> problem above). And please also do the same for brightness_set.
> >
> > I don't mind the single function so much but I don't particularly like =
the strcmp. I'm actually working on this at the moment too trying (but so f=
ar mostly failing) to get the WLED that drives the Surface Go's IR LED work=
ing properly (I can drive it...for a maximum of 13 seconds); I had modeled =
the problem as an array of structs for the LEDs and reference them with IDs=
:
> >
> > #define lcdev_to_led(lcdev) \
> >     container_of(lcdev, struct tps68470_led, lcdev);
> >
> > #define led_to_tps68470(led, index) \
> >     container_of(led, struct tps68470_device, leds[index])
> >
> > enum tps68470_led_ids {
> >     TPS68470_ILED_A,
> >     TPS68470_ILED_B,
> >     TPS68470_WLED,
> >     TPS68470_NUM_LEDS
> > };
> >
> > static const char *tps68470_led_names[] =3D {
> >     [TPS68470_ILED_A] =3D "tps68470-iled_a",
> >     [TPS68470_ILED_B] =3D "tps68470-iled_b",
> >     [TPS68470_WLED] =3D "tps68470-wled",
> > };
> >
> > struct tps68470_led {
> >     unsigned int led_id;
> >     struct led_classdev lcdev;
> > };
> >
> > struct tps68470_device {
> >     struct device *dev;
> >     struct regmap *regmap;
> >     struct tps68470_led leds[TPS68470_NUM_LEDS];
> > };
> >
> > int tps68470_led_brightness_set(...)
> > {
> >     struct tps68470_led *led =3D lcdev_to_led(lcdev);
> >     struct tps68470_device *tps68470 =3D led_to_tps68470(led, led->inde=
x);
>
> I assume led->index should be led->led_id here ?
>
> >
> >     switch (led->led_id) {
> >     case TPS68470_ILED_A:
> >         return regmap_update_bits(...);
> >     case TPS68470_ILED_B:
> >         ...
> >
> >     }
>
> But since the indices into the register are not simple a function of
> led->led_id, you still need this switch-case here and then a separate
> implementation for each LED.
>
> At which point IMHO just having a single set / get function per LED
> is much simpler then adding the complications with the struct wrapping
> struct led_class_dev to add an index to it.
>
> Anyways there is an easy solution here: Kate you get to choose between
> 1 set + get function per LED or Dan's solution, but please drop
> the strcmp() calls since neither Dan nor I like those.

Thank you for the comments.
Okay, let me think between both solutions and I'll remove strcmp() for sure=
.

>
> <snip>
>
> > Regardless of how it ends up being done; I think you need the LED_FUNCT=
ION_INDICATOR part in lcdev->name to match the "devicename:color:function" =
that the LED subsystem seems to want.
>
> Agreed, Kate please switch to this, e.g.:
>
> tps68470_led->leda_cdev.name =3D "tps68470::" LED_FUNCTION_INDICATOR;
>
> LED names should always be in the format of "devicename:color:function"
> I missed you were not using that before. And since we don't know the
> color we just leave it empty (this is allowed).

OK. I have checked the document for the naming format. I'll correct this.

>
> Note LED_FUNCTION_INDICATOR is defined in include/dt-bindings/leds/common=
.h .

Thank you for noting this.

>
> Regards,
>
> Hans
>
>
>
>


--=20
BR,
Kate

