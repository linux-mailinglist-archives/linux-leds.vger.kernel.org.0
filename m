Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 544046AFB6A
	for <lists+linux-leds@lfdr.de>; Wed,  8 Mar 2023 01:41:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229922AbjCHAly (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 7 Mar 2023 19:41:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41108 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230106AbjCHAlh (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 7 Mar 2023 19:41:37 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2C50725957;
        Tue,  7 Mar 2023 16:41:09 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 62FD3615EA;
        Wed,  8 Mar 2023 00:41:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C8533C433A1;
        Wed,  8 Mar 2023 00:41:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1678236068;
        bh=o6oymGlNZn9vDlwDU5TMp4b7cedwP3h4tMfW8EXhk2o=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=ZQPsUcbkLcyEXTXfq+Nao3GpaXmXnIPvAGeNgirhDyYI56iqcnt343/NHoHyaD+Qs
         zEJrMhLU+arKs/rVgV7Jnobo5mXwVJiAmckFtSfzGVX3aDkSmYVcsm3QEjPFbCwG4G
         Y9MHqu6OI42lnWx0+7vIah/Dz0ymoZp8FmPO8rMk8hO+ny1rHcidSgH8sBaizPYxy3
         ZzqWRn+etpruOgVb+9QFG5sx5itoG5FsqJbGBzL/RhVtkJzJauYTe+W0rjqW1gNn39
         hQ7+9uvUAHI8zXG1f144KJ0Sj0jQXxIx5OtuKRf2cqm9C90C0u4QEN0y6WZomUfWYE
         pQ1ePcfA8Mg4A==
Received: by mail-ua1-f54.google.com with SMTP id n4so10159026ual.13;
        Tue, 07 Mar 2023 16:41:08 -0800 (PST)
X-Gm-Message-State: AO0yUKUOF1jweinMK/PcCeagWLBBw+Ekibx4VoovmGJT1grpUCcD0+Gf
        THp/mOaM8OsWAc8TXmWERqvvAxN0e+BZ4nVtcQ==
X-Google-Smtp-Source: AK7set9RI8+fXQrMZpu1a+zBN6uy8yor6esY2D86sYIG43cMSpIAPTyJ3NJ1TroFDWRrpuB8sEBTOPFe88V5ct9AJ8A=
X-Received: by 2002:a9f:3102:0:b0:6cd:2038:4911 with SMTP id
 m2-20020a9f3102000000b006cd20384911mr11052030uab.1.1678236067609; Tue, 07 Mar
 2023 16:41:07 -0800 (PST)
MIME-Version: 1.0
References: <20230228144933.22614-1-zajec5@gmail.com> <20230301000236.GA20893-robh@kernel.org>
 <e3b20703-f2d4-76b8-ccfb-11cf42d459fd@gmail.com> <CAL_JsqJzrgS1PH77RkAiqAs=QqXPGG04sCG3X_i-GKWSqPORSQ@mail.gmail.com>
 <6426345d-783e-007d-79db-2b376bcea12d@gmail.com>
In-Reply-To: <6426345d-783e-007d-79db-2b376bcea12d@gmail.com>
From:   Rob Herring <robh@kernel.org>
Date:   Tue, 7 Mar 2023 18:40:56 -0600
X-Gmail-Original-Message-ID: <CAL_JsqJkpGhaWxv9b8D2DtiE1YUWUdDE67k4=JE_EsTh4754NQ@mail.gmail.com>
Message-ID: <CAL_JsqJkpGhaWxv9b8D2DtiE1YUWUdDE67k4=JE_EsTh4754NQ@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: leds: add "usbport" trigger
To:     =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Florian Fainelli <f.fainelli@gmail.com>,
        devicetree@vger.kernel.org, linux-leds@vger.kernel.org,
        =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Wed, Mar 1, 2023 at 7:52=E2=80=AFAM Rafa=C5=82 Mi=C5=82ecki <zajec5@gmai=
l.com> wrote:
>
> On 1.03.2023 14:43, Rob Herring wrote:
> > On Wed, Mar 1, 2023 at 1:27=E2=80=AFAM Rafa=C5=82 Mi=C5=82ecki <zajec5@=
gmail.com> wrote:
> >>
> >> On 1.03.2023 01:02, Rob Herring wrote:
> >>> On Tue, Feb 28, 2023 at 03:49:33PM +0100, Rafa=C5=82 Mi=C5=82ecki wro=
te:
> >>>> From: Rafa=C5=82 Mi=C5=82ecki <rafal@milecki.pl>
> >>>>
> >>>> It's a trigger used on many home routers that have LEDs to indicate
> >>>> specific USB port state.
> >>>>
> >>>> Signed-off-by: Rafa=C5=82 Mi=C5=82ecki <rafal@milecki.pl>
> >>>> ---
> >>>>    Documentation/devicetree/bindings/leds/common.yaml | 1 +
> >>>>    1 file changed, 1 insertion(+)
> >>>>
> >>>> diff --git a/Documentation/devicetree/bindings/leds/common.yaml b/Do=
cumentation/devicetree/bindings/leds/common.yaml
> >>>> index 15e3f6645682..95b316ee3146 100644
> >>>> --- a/Documentation/devicetree/bindings/leds/common.yaml
> >>>> +++ b/Documentation/devicetree/bindings/leds/common.yaml
> >>>> @@ -99,6 +99,7 @@ properties:
> >>>>              - pattern
> >>>>              - usb-gadget
> >>>>              - usb-host
> >>>> +          - usbport
> >>>
> >>> Can we stop adding entries which are clearly likely to have multiple
> >>> instances. We have a better binding to map the trigger source...
> >>
> >> I'm sorry, I really don't understand this.
> >> I'm not sure what do you mean by multuple "usbport" instances.
> >> Could you point me to that better place, please?
> >
> > Suppose I have a device with 4 USB ports and 4 LEDs for each one. How
> > would one define the connection of LEDs to USB ports? Extend this to
> > usbport[0-9]? No.
> >
> >> This is probably something obvious but I really can't figure it out
> >> since yesterday.
> >
> > "trigger-sources"
>
> Ah, I suppose that "usbport" LED trigger in Linux can be confusing.
>
> So: no matter how many USB ports you have, Linux *doesn't* create one
> trigger per USB port. There is only one trigger. It's called exactly
> "usbport".
>
> Once you choose "usbport" trigger in Linux, you can choose which ports
> should it "monitor". That can be done using procfs (ABI). The default
> set of ports to monitor can be specified using "trigger-sources".
>
> For decision details behind this see 0f247626cbbf ("usb: core: Introduce
> a USB port LED trigger").
>
> So Linux on home routers needs both:
> 1. linux,default-trigger (for selecting default trigger)
> 2. trigger-sources (for providing default set of ports to monitor)

I still don't understand why defining a trigger source doesn't also
set the default. It is after all just the default. The DT should have
how the LEDs are intended to be used by the design, not what a user
wants. A user should change that from userspace.

In any case, just make the commit message clear this is not a new
trigger, but one that has been in use for some time.

Rob
