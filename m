Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 127423A8D58
	for <lists+linux-leds@lfdr.de>; Wed, 16 Jun 2021 02:21:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230265AbhFPAXe (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 15 Jun 2021 20:23:34 -0400
Received: from mail1.protonmail.ch ([185.70.40.18]:30156 "EHLO
        mail1.protonmail.ch" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230244AbhFPAXe (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 15 Jun 2021 20:23:34 -0400
Date:   Wed, 16 Jun 2021 00:21:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
        s=protonmail; t=1623802887;
        bh=pSyWmLIOcXJ8i2rAAktfXJsXA1AzxHdy8PFAuI8/dXM=;
        h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
        b=QNlG4YxhE1ceYQzBxXpAeFe6I6CFy+0SURpOyHd72HisQ3JcBgFSn2T4Bb+QboxF/
         Pzxrh9DxEzLsFI2sxob6YCMNumFTkcDef2IWHDDuzKAkiJqVOIH3teSwipDbvHDgEb
         3c6wFqcH81poQ2mzxP9irkW6RDi/7Nen53OUL0ao=
To:     leo60228 <leo@60228.dev>
From:   =?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Platform Driver <platform-driver-x86@vger.kernel.org>,
        "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>,
        Pavel Machek <pavel@ucw.cz>
Reply-To: =?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>
Subject: Re: [PATCH] platform/x86: add support for Acer Predator LEDs
Message-ID: <3f55eOZ-dLlO0h_YujLrKA1nb5Eg7ztJv6xAse-hRh4_KB8FnidmSGpbkq6KbfpWWAKgG2iU1oziplZWlnPJzAd_on96IFXR6SpuTzPlG9A=@protonmail.com>
In-Reply-To: <CAPRrO0xZunTfYYSOg-Gvk18FMHPufAURZ=fWjQN1bmP=RuuzGA@mail.gmail.com>
References: <20210615221931.18148-1-leo@60228.dev> <YqTP_mhFNQj00M90V9BqAinqDdpQt3Wuu7i6OmgckNDSo0l7htySl7jVBDbA4pHJ5DEH_SGAEGCHgBN1ubghTAcc7ct9AOfD8Nd-KLZFeyc=@protonmail.com> <CAPRrO0xZunTfYYSOg-Gvk18FMHPufAURZ=fWjQN1bmP=RuuzGA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.2 required=10.0 tests=ALL_TRUSTED,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM shortcircuit=no
        autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on
        mailout.protonmail.ch
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hi

please use "reply-all" in the future when replying so that all participants
receive the email.


2021. j=C3=BAnius 16., szerda 1:40 keltez=C3=A9ssel, leo60228 =C3=ADrta:

> Thanks for the feedback, I'll start working on a V2. I have a few
> questions, though.
>
> > There are multicolor leds (see Documentation/leds/leds-class-multicolor=
), maybe that would be a better fit instead of creating 4x3 LED devices?
>
> I could definitely be incorrect here, but my understanding is that
> multicolor LEDs were an abstraction automatically created from
> separate red, green, and blue LEDs.

I'm not entirely sure what you mean. I'm not aware that LED multicolor clas=
s
devices would be instantiated from 3 ordinary LED devices - although it's p=
ossible
I have missed it.


>
> > This is not an appropriate LED class device name. Please see Documentat=
ion/leds/leds-class for details.
>
> I was worried I misunderstood something, but I thought this was
> correct. "white:status" is given as an example of a correct name, and
> this paragraph from the leds-class docs made me think that appending
> -N was the correct format for multiple LEDs with the same function:
>

Ahh, you're right. My bad. The "devicename" part is indeed optional.


> > It is possible that more than one LED with the same color and function =
will be required for given platform, differing only with an ordinal number.=
 In this case it is preferable to just concatenate the predefined LED_FUNCT=
ION_* name with required =E2=80=9C-N=E2=80=9D suffix in the driver. fwnode =
based drivers can use function-enumerator property for that and then the co=
ncatenation will be handled automatically by the LED core upon LED class de=
vice registration.


Regards,
Barnab=C3=A1s P=C5=91cze
