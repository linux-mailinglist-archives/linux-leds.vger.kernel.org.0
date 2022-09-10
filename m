Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4BA645B47F5
	for <lists+linux-leds@lfdr.de>; Sat, 10 Sep 2022 20:44:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229531AbiIJSoi (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sat, 10 Sep 2022 14:44:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51406 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229451AbiIJSoh (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sat, 10 Sep 2022 14:44:37 -0400
Received: from mail-4316.protonmail.ch (mail-4316.protonmail.ch [185.70.43.16])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AAD3E640D
        for <linux-leds@vger.kernel.org>; Sat, 10 Sep 2022 11:44:31 -0700 (PDT)
Date:   Sat, 10 Sep 2022 18:44:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
        s=protonmail; t=1662835470; x=1663094670;
        bh=O2QKcmdu/xyGaThFOptyM/tFmu6133W6ygGgmNLA1PY=;
        h=Date:To:From:Cc:Reply-To:Subject:Message-ID:In-Reply-To:
         References:Feedback-ID:From:To:Cc:Date:Subject:Reply-To:
         Feedback-ID:Message-ID;
        b=dOriX8TOqOfSCOwJiCtve/B73xQ36DpEBsRxyOhVh72eaxc6gZ9IMWJakaV4vfJ+l
         TqOPlHt+2cXprmdy9tOzDRG4nh0HA9BTGypozDYvHJdBzTs8gexzOAM5uYE0yPWsnY
         uEAXZTQo/wAE1hjlJbG6+o85AV+nTn6yCrYBqkV9jhgAut7vYJQH3k4aSeChK9MLmB
         jO/qvnOH8xM25qrHz4yOPKhhYM1yItxWxF2wYBFZts8IaqGyE3wcMcwPLt+IGVqFTN
         b/sc7iA5BZH8AatfJ1b5lw8JB+YRAWXrNLPlnq5Ws3jlIMYyc8G1bliiX8LZ9XokU7
         g4gUR4UvuBy3A==
To:     Pavel Machek <pavel@ucw.cz>
From:   Joseph Strauss <jstrauss16@proton.me>
Cc:     linux-leds@vger.kernel.org
Reply-To: Joseph Strauss <jstrauss16@proton.me>
Subject: Re: Implementing missing BlinkM LED features
Message-ID: <20220910184418.jnczij5jz6b6l4hk@libretux>
In-Reply-To: <20220822103540.GA26317@duo.ucw.cz>
References: <20220820230337.wp7gaxzzz4qi56eb@libretux> <20220821115628.GA7663@duo.ucw.cz> <20220821224442.dyip3dig3g2isqmi@libretux> <20220822103540.GA26317@duo.ucw.cz>
Feedback-ID: 52406082:user:proton
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hello,

I have begun look at the source code for the BlinkM driver and the pattern =
trigger to get an idea of the best way to implement an RGB-aware pattern tr=
igger. I was thinking that instead of sending patterns of brightness values=
 and time intervals, the user of the trigger could send RGB hex values and =
time intervals. Let me know if there is some other way that would make more=
 sense.

The main roadblock I ran into was the way RGB is done in the subsystem curr=
ently. From what I gather, each color has its own sysfs class and there is =
a seperate pattern trigger for each. For an RGB-aware pattern trigger, I as=
sume there would need to be a more general sysfs class. But again, struct l=
ed_classdev doesn't have a property for colors.

Additionally, in the current pattern trigger source code, after performing =
all of the necessary computations, it hands the brightness value off to the=
 LED core with the led_set_brightness() function. Even if the pattern trigg=
er computed RGB values from its input, they would have no place to go, sinc=
e the LED subsystem has no interface for setting colors, only brightness. T=
herefore, do you have any suggestions on what would be the best way for the=
 trigger to read RGB values and send those values to the device? Or did you=
 mean that I should work on adding RGB support to the subsystem as a whole?=
 I see that there have been some attempts at it before, but I'm not sure wh=
y those were never merged.

Best Regards,
Joe

On 22/08/22 12:35PM, Pavel Machek wrote:
> Hi!
>
> Please cc lists on communications.
>
> > Thank you. This would be my first time contributing to the kernel, so t=
here are just a few things I wanted to clarify :)
> >
>
> Hmm, good luck.
>
> > I looked into the pattern trigger you mentioned, and from what I found =
in the sources and mailing list, it seems like an alternative to manually s=
ending a stream of BlinkM script bytes. That is, the user instead sets a br=
ightness and delay and then turns the LED on and off at whatever interval t=
hey choose. So it is preferable for the user to send their lighting sequenc=
e to the pattern trigger file, rather than with some other file/interface I=
 create?
> >
>
> Yes, please. Use existing interface.
>
> > You also mentioned an RGB-aware pattern trigger, which would be necessa=
ry for implementing this driver feature. Did you mean I should first patch =
the existing ledtrig-pattern.c to support changing RGB values, or is that s=
omething I would implement within the BlinkM driver?
> >
>
> You should patch ledtrig-pattern.c first.
>
> Best regards,
> =09=09=09=09=09=09=09=09=09=09Pavel
> --
> People of Russia, stop Putin before his war on Ukraine escalates.



