Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1E53B6A6D4C
	for <lists+linux-leds@lfdr.de>; Wed,  1 Mar 2023 14:44:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229795AbjCANoN (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 1 Mar 2023 08:44:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37276 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229786AbjCANoM (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 1 Mar 2023 08:44:12 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 55A6B2B619;
        Wed,  1 Mar 2023 05:44:11 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id E57D1612F5;
        Wed,  1 Mar 2023 13:44:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 51C5CC4339C;
        Wed,  1 Mar 2023 13:44:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1677678250;
        bh=RqVBtEdPDqkkqJ8gBXXv6kvdV3IoTzke1yumkttulxA=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=Ni5USCQ20r4mczq0MacF8m8enO0u8H7psZ0/MQy8RCM5D/OSf4GiijHs79cmm0MqU
         uPkUtW8xcnB55jZ7nYqK1vlyofZRNoDFVvHJwP0bJOQ22IKtPvHgnNHG2yibF8xGWT
         cnU1ul8T1Bgk6bcRx2Fy9W/F5HS5a311gKLoWp4HwZ5/NzlOab9lZJUcIo63skjTw+
         VCqIk8+QISxieEL4zvxg5xYcV7+DfZME2Wca1ngnsXvLkLNizLtPPbcJULyYBijh0t
         pxOed4lskdoMqBDUvmch+WGb+KA9LE8X7EvfWt6CEg7RnFPAymmV6/XzvpAIFT+TE0
         pu/s2RgLNTSFg==
Received: by mail-vs1-f41.google.com with SMTP id m10so19124479vso.4;
        Wed, 01 Mar 2023 05:44:10 -0800 (PST)
X-Gm-Message-State: AO0yUKXqktSJuJaqTjbnoCDZtfeEGh8tCQGFEx63mPtRbBqVQhrp/81e
        fQCkW7gUbUnRZGcQPd0B4aGMlRzCiPyJJ9oAWw==
X-Google-Smtp-Source: AK7set/+kePH77bSyBUVYmle7TJkriXSnvkYJj+VgmEmxkpJ17FZ4L81qeY2mSauNJWbQRMR0gFiAyIOOKaAd7TSJAw=
X-Received: by 2002:a05:6102:2148:b0:402:9b84:1be4 with SMTP id
 h8-20020a056102214800b004029b841be4mr4240433vsg.6.1677678249174; Wed, 01 Mar
 2023 05:44:09 -0800 (PST)
MIME-Version: 1.0
References: <20230228144933.22614-1-zajec5@gmail.com> <20230301000236.GA20893-robh@kernel.org>
 <e3b20703-f2d4-76b8-ccfb-11cf42d459fd@gmail.com>
In-Reply-To: <e3b20703-f2d4-76b8-ccfb-11cf42d459fd@gmail.com>
From:   Rob Herring <robh@kernel.org>
Date:   Wed, 1 Mar 2023 07:43:57 -0600
X-Gmail-Original-Message-ID: <CAL_JsqJzrgS1PH77RkAiqAs=QqXPGG04sCG3X_i-GKWSqPORSQ@mail.gmail.com>
Message-ID: <CAL_JsqJzrgS1PH77RkAiqAs=QqXPGG04sCG3X_i-GKWSqPORSQ@mail.gmail.com>
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

On Wed, Mar 1, 2023 at 1:27=E2=80=AFAM Rafa=C5=82 Mi=C5=82ecki <zajec5@gmai=
l.com> wrote:
>
> On 1.03.2023 01:02, Rob Herring wrote:
> > On Tue, Feb 28, 2023 at 03:49:33PM +0100, Rafa=C5=82 Mi=C5=82ecki wrote=
:
> >> From: Rafa=C5=82 Mi=C5=82ecki <rafal@milecki.pl>
> >>
> >> It's a trigger used on many home routers that have LEDs to indicate
> >> specific USB port state.
> >>
> >> Signed-off-by: Rafa=C5=82 Mi=C5=82ecki <rafal@milecki.pl>
> >> ---
> >>   Documentation/devicetree/bindings/leds/common.yaml | 1 +
> >>   1 file changed, 1 insertion(+)
> >>
> >> diff --git a/Documentation/devicetree/bindings/leds/common.yaml b/Docu=
mentation/devicetree/bindings/leds/common.yaml
> >> index 15e3f6645682..95b316ee3146 100644
> >> --- a/Documentation/devicetree/bindings/leds/common.yaml
> >> +++ b/Documentation/devicetree/bindings/leds/common.yaml
> >> @@ -99,6 +99,7 @@ properties:
> >>             - pattern
> >>             - usb-gadget
> >>             - usb-host
> >> +          - usbport
> >
> > Can we stop adding entries which are clearly likely to have multiple
> > instances. We have a better binding to map the trigger source...
>
> I'm sorry, I really don't understand this.
> I'm not sure what do you mean by multuple "usbport" instances.
> Could you point me to that better place, please?

Suppose I have a device with 4 USB ports and 4 LEDs for each one. How
would one define the connection of LEDs to USB ports? Extend this to
usbport[0-9]? No.

> This is probably something obvious but I really can't figure it out
> since yesterday.

"trigger-sources"

Rob
